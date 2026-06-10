import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/helpers/debounce_transformer.dart';
import 'package:shopping_app/core/network_project/api_calls.dart';
import 'package:shopping_app/core/services/storage_services/realm_storage/realm_storage.dart';
import 'package:shopping_app/core/services/storage_services/secure_storage.dart';
import 'package:shopping_app/features/home_page/bloc/home_event.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';
import 'package:shopping_app/core/network_project/api_exception.dart';
import 'package:shopping_app/features/main_screen/model/user_data_model.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc():super(HomeState.initial()){
    on<LoadProductListEvent>(_loadProductList);
    on<LoadCategoryListEvent>(_loadCategoryList);
    on<ToggleFavoriteIDEvent>(_toggleFavoriteID);
    on<ChangeProductCartCountEvent>(_changeProductCartCount);
    on<LoadProductDataEvent>(_loadProductData);
    on<LoadUserDataEvent>(_loadUserData);
    on<SearchProductEvent>(_searchProductEvent,
    transformer: debounce(const Duration(milliseconds: 500)));
  }
  Future<void> _loadProductList(LoadProductListEvent event,emit)async{
    emit(state.copyWith(isProductListLoading: true,isBannerLoading: true));
    try{
      List<ProductModel> products=await ApiCalls.getAllProductsList(skip: 0);
      ApiCalls.getCurrentUser();
      // ApiCalls.getCurrentUser();
      // ApiCalls.getCurrentUser();
      // ApiCalls.getCurrentUser();

      log(products.toString());
      emit(state.copyWith(
        products: products,
        isProductListLoading: false,
        isBannerLoading: false,
        filteredProducts: event.skip==0?products :null
      ));
      RealmDBStorage.saveProducts(products);
      log("products saved");
    } on DioException catch(e){
      if(e.type == DioExceptionType.connectionError){
        List<ProductModel> products= RealmDBStorage.getProductList();
        log("products from storage");
        log(products.toString());
        emit(state.copyWith(
            products: products,
            isProductListLoading: false,
            isBannerLoading: false,
            filteredProducts: event.skip==0?products :null
        ));
        emit(state.copyWith(errorMessage: "You're offline. Some information may not be up to date.",isProductListLoading: false));
      }
    } catch(e){
      emit(state.copyWith(errorMessage: "Unknown Error - Failed to load products",isProductListLoadingFailed: true,isProductListLoading: false));
      log(e.toString());
    }
  }
  Future<void> _loadCategoryList(LoadCategoryListEvent event,emit)async{
    emit(state.copyWith(isCategoryListLoading: true));
    try{
      List<String> categoryList =await ApiCalls.getCategoryList();
      log(categoryList.toString());
      emit(state.copyWith(categories: categoryList,isCategoryListLoading: false));

    }
    on ApiException catch(e){
      emit(state.copyWith(errorMessage: e.message,isCategoryListLoadingFailed: true));
    } catch(e){
      emit(state.copyWith(errorMessage: "Unknown Error - Failed to load categories",isCategoryListLoadingFailed: true));
      log(e.toString());
    }
  }
  void _toggleFavoriteID(ToggleFavoriteIDEvent event,emit){
    List<int> favoriteProductIds= List.from(state.favoriteProductIds);
    if(state.favoriteProductIds.contains(event.id)){
      favoriteProductIds.remove(event.id);
    }else{
      favoriteProductIds.add(event.id);
    }
    emit(state.copyWith(favoriteProductIds: favoriteProductIds));
  }

  void _changeProductCartCount(ChangeProductCartCountEvent event,emit){
    Map<int,int> productCartCount=Map.from(state.productCartCount);
    int count=productCartCount[event.id]??0;
    log(count.toString());
    if(event.desc){
      productCartCount[event.id]=--count;
      if(count<1){
        productCartCount.remove(event.id);
      }
    }else{
      productCartCount[event.id]=++count;
    }
    emit(state.copyWith(productCartCount: productCartCount));

  }
  void _loadProductData(LoadProductDataEvent event,emit)async{
    log("in the _loadProductData");
    try{
      emit(state.copyWith(isCurrentProductDataLoading:true));
      ProductModel product =await ApiCalls.getProductData(event.id);
      log(product.toString());
      emit(state.copyWith(currentProduct: product,isCurrentProductDataLoading:false));
    }
    on ApiException catch(e){
      log(e.message);
      emit(state.copyWith(errorMessage: e.message));
    } catch(e){
      emit(state.copyWith(errorMessage: "Unknown Error - Failed To Load"));
      log(e.toString());
    }
  }

  void _loadUserData(LoadUserDataEvent event,emit) async{
    emit(state.copyWith(isUserDataLoading: true));
    UserDataModel userData =await SecureStorage.getUserData();
    emit(state.copyWith(isUserDataLoading: false,userData: userData));
  }

  void _searchProductEvent(SearchProductEvent event, emit){
    String actualSearchText=event.searchText.substring(0,(event.searchText.length~/3)*3);
    if(actualSearchText.isEmpty){
      emit(state.copyWith(filteredProducts: state.products,searchText:""));
    }else{
      log("actual actualSearchText: $actualSearchText");
      if(actualSearchText==state.searchText)return;
      log("searched for ${event.searchText}");
      List<ProductModel> filteredProduct= state.products.where((ProductModel product){
        List<String> words =actualSearchText.split(" ");
        log("words: $words");
        return (words.every((word){
          return (product.title?.toLowerCase().contains(word)??false) ||  (product.brand?.toLowerCase().contains(word)??false);
        })) ;
      }).toList();
      emit(state.copyWith(filteredProducts: filteredProduct,searchText:actualSearchText));
    }
  }
}











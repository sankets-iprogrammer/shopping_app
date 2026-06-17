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
    on<LoadProductDataEvent>(_loadProductData);
    on<LoadUserDataEvent>(_loadUserData);
    on<SearchProductEvent>(_searchProductEvent,
    transformer: debounce(const Duration(milliseconds: 500)));
  }
  Future<void> _loadProductList(LoadProductListEvent event,emit)async{
    emit(state.copyWith(isProductListLoading: true,isBannerLoading: true,products:event.firstTime?[]:null, filteredProducts:event.firstTime?[]:null,skip: 0));
    try{
      int skip=state.skip;
      List<ProductModel> newProducts=await ApiCalls.getAllProductsList(skip: skip);
      List<ProductModel> allProducts= List.from(state.products);
      allProducts.addAll(newProducts);
      log("current products are : ${allProducts.length}");
      emit(state.copyWith(
        products: skip==0?newProducts:allProducts,
        isProductListLoading: false,
        isBannerLoading: false,
        filteredProducts:  allProducts,
        searchText: '',
        skip: skip+10
      ));
      RealmDBStorage.saveProducts(newProducts);
      log("products saved");
    } on DioException catch(e){
      if(e.type == DioExceptionType.connectionError){
        List<ProductModel> products= RealmDBStorage.getProductList();
        log("products from storage");
        log(products.toString());
        emit(state.copyWith(
            products: products,
            filteredProducts: products,
            isProductListLoading: false,
            isBannerLoading: false,
            errorMessage: "You're offline. Some information may not be up to date.",
            skip: 0
        ));
      }else{
        if(e.error is ApiException){
          emit(state.copyWith(
            isProductListLoadingFailed: true,
              isProductListLoading: false,
              isBannerLoading: false,
              errorMessage: (e as ApiException).message,
          ));
        }else{
          emit(state.copyWith(
            isProductListLoadingFailed: true,
            isProductListLoading: false,
            isBannerLoading: false,
            errorMessage: "Unknown error - Failed to load products",
          ));
        }
      }
    } catch(e){
      emit(state.copyWith(errorMessage: "Unknown error - Failed to load products",isProductListLoadingFailed: true,isProductListLoading: false,isBannerLoading: false,));
      log(e.toString());
    }
  }

  void _loadProductData(LoadProductDataEvent event,emit)async{
    log("in the _loadProductData");
    try{
      emit(state.copyWith(isCurrentProductDataLoading:true));
      ProductModel product =await ApiCalls.getProductData(event.id);
      log(product.toString());
      emit(state.copyWith(currentProduct: product,isCurrentProductDataLoading:false));
      RealmDBStorage.saveProducts([product]);
    }
    on DioException catch(e){
      if (e.type == DioExceptionType.connectionError) {
        ProductModel? product = RealmDBStorage.getProduct(event.id);
        log("product from storage");
        log(product.toString());
        emit(state.copyWith(currentProduct: product,isCurrentProductDataLoading:false,errorMessage: "You're offline. Some information may not be up to date."));
      }
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











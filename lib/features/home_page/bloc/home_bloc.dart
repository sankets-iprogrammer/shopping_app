import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/services/storage_services/realm_storage/realm_storage.dart';
import 'package:shopping_app/features/home_page/bloc/home_event.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';
import 'package:shopping_app/network/api_call.dart';
import 'package:shopping_app/network/api_exception.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc():super(HomeState.initial()){
    on<LoadProductListEvent>(_loadProductList);
    on<LoadCategoryListEvent>(_loadCategoryList);
    on<ToggleFavoriteIDEvent>(_toggleFavoriteID);
    on<ChangeProductCartCountEvent>(_changeProductCartCount);
    on<LoadProductDataEvent>(_loadProductData);
  }
  Future<void> _loadProductList(LoadProductListEvent event,emit)async{
    emit(state.copyWith(isProductListLoading: true,isBannerLoading: true));
    try{
      List<ProductModel> products=await ApiCall.getAllProductsList(skip: 0);
      log(products.toString());
      emit(state.copyWith(
        products: products,
        isProductListLoading: false,
        isBannerLoading: false
      ));
      RealmDBStorage.saveProducts(products);
      log("products saved");
    } on ApiException catch(e){
      emit(state.copyWith(errorMessage: e.message,isProductListLoadingFailed: true,isProductListLoading: false));
    } catch(e){
      emit(state.copyWith(errorMessage: "Unknown Error - Failed to load products",isProductListLoadingFailed: true,isProductListLoading: false));
      log(e.toString());
    }
  }
  Future<void> _loadCategoryList(LoadCategoryListEvent event,emit)async{
    emit(state.copyWith(isCategoryListLoading: true));
    try{
      List<String> categoryList =await ApiCall.getCategoryList();
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
      ProductModel product =await ApiCall.getProductData(event.id);
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
}
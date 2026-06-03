import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/home_page/bloc/home_event.dart';
import 'package:shopping_app/features/home_page/bloc/home_state.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';
import 'package:shopping_app/network/api_call.dart';
import 'package:shopping_app/network/api_exception.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc():super(HomeState.initial()){
    on<LoadProductListEvent>(_loadProductListData);
    on<LoadCategoryListEvent>(_loadCategoryList);
    on<ToggleFavoriteIDEvent>(_toggleFavoriteID);
    on<ChangeProductCartCountEvent>(_changeProductCartCount);
  }
  Future<void> _loadProductListData(LoadProductListEvent event,emit)async{
    emit(state.copyWith(isProductLoading: true,isBannerLoading: true));
    try{
      List<ProductModel> products=await ApiCall.getAllProductsList(skip: 0);
      log(products.toString());
      emit(state.copyWith(
        products: products,
        isProductLoading: false,
        isBannerLoading: false
      ));
    } on ApiException catch(e){
      emit(state.copyWith(errorMessage: e.message,isProductLoadingFailed: true,isProductLoading: false));
    } catch(e){
      emit(state.copyWith(errorMessage: "Unknown Error - Failed to load products",isProductLoadingFailed: true,isProductLoading: false));
      log(e.toString());
    }
  }
  Future<void> _loadCategoryList(LoadCategoryListEvent event,emit)async{
    emit(state.copyWith(isCategoryLoading: true));
    try{
      List<String> categoryList =await ApiCall.getCategoryList();
      log(categoryList.toString());
      emit(state.copyWith(categories: categoryList,isCategoryLoading: false));

    }
    on ApiException catch(e){
      emit(state.copyWith(errorMessage: e.message,isCategoryLoadingFailed: true));
    } catch(e){
      emit(state.copyWith(errorMessage: "Unknown Error - Failed to load categories",isCategoryLoadingFailed: true));
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
}
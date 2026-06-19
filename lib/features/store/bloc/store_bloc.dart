import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network_project/api_calls.dart';
import 'package:shopping_app/core/network_project/api_exception.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/store/bloc/store_event.dart';
import 'package:shopping_app/features/store/bloc/store_state.dart';

import '../../../core/helpers/debounce_transformer.dart';

class StoreBloc extends Bloc<StoreEvent,StoreState> {
  StoreBloc():super(StoreState.initial()){
    on<GetCategoryProductsEvent>(_getCategoryProductsEvent);
    on<GetCategoriesEvent>(_getCategoriesEvent);
    on<SearchStoreProductEvent>(_searchProductEvent,
        transformer: debounce(const Duration(milliseconds: 500)));
  }

  void _getCategoriesEvent(GetCategoriesEvent event,emit)async{
    emit(state.copyWith(categoryProductsLoadingStatus: LoadingStatus.loading));
    try{
      List<String> categories= await ApiCalls.getCategoryList();
      emit(state.copyWith(
        categories: categories,
        categoriesLoadingStatus: LoadingStatus.success,
      ));
    }on DioException catch(e){
      if(e is ApiException){
        emit(state.copyWith(categoriesLoadingStatus: LoadingStatus.error,categoriesErrorMessage: (e as ApiException).message));
      }else{
        emit(state.copyWith(categoriesLoadingStatus: LoadingStatus.error,categoriesErrorMessage: e.message));
      }
    }catch (e){
      emit(state.copyWith(categoriesLoadingStatus: LoadingStatus.error,categoriesErrorMessage: "Unknown error"));
    }
  }

  void _getCategoryProductsEvent(GetCategoryProductsEvent event,emit)async{
    emit(state.copyWith(categoryProductsLoadingStatus: LoadingStatus.loading,currentCategory: event.category));
    try{
      List<ProductModel> categoryProducts= await ApiCalls.getCategoryProductsList(
          category: event.category,
        skip: 0
      );
      emit(state.copyWith(
        filteredProducts: categoryProducts,
        categoryProducts: categoryProducts,
        categoryProductsLoadingStatus: LoadingStatus.success,
      ));
    }on DioException catch(e){
      if(e is ApiException){
        emit(state.copyWith(categoryProductsLoadingStatus: LoadingStatus.error,categoryProductsErrorMessage: (e as ApiException).message));
      }else{
        emit(state.copyWith(categoryProductsLoadingStatus: LoadingStatus.error,categoryProductsErrorMessage: e.message));
      }
    }catch (e){
      emit(state.copyWith(categoryProductsLoadingStatus: LoadingStatus.error,categoryProductsErrorMessage: "Unknown error"));
    }
  }

  void _searchProductEvent(SearchStoreProductEvent event, emit){
    String actualSearchText=event.searchText.substring(0,(event.searchText.length~/3)*3);
    if(actualSearchText.isEmpty){
      emit(state.copyWith(filteredProducts: state.categoryProducts,searchText:""));
    }else{
      log("actual actualSearchText: $actualSearchText");
      if(actualSearchText==state.searchText)return;
      log("searched for ${event.searchText}");
      List<ProductModel> filteredProduct= state.categoryProducts.where((ProductModel product){
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
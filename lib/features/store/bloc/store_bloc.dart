import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/network_project/api_calls.dart';
import 'package:shopping_app/core/network_project/api_exception.dart';
import 'package:shopping_app/features/home_page/model/product_model.dart';
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';
import 'package:shopping_app/features/store/bloc/store_event.dart';
import 'package:shopping_app/features/store/bloc/store_state.dart';

class StoreBloc extends Bloc<StoreEvent,StoreState> {
  StoreBloc():super(StoreState.initial()){
    on<GetCategoryProductsEvent>(_getCategoryProductsEvent);
    on<GetCategoriesEvent>(_getCategoriesEvent);
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
}
import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';

import '../../home_page/model/product_model.dart';

class StoreState {
  final String? currentCategory;
  final List<ProductModel> categoryProducts;
  final List<ProductModel> filteredProducts;
  final LoadingStatus categoryProductsLoadingStatus;
  final List<String> categories;
  final LoadingStatus categoriesLoadingStatus;
  final String? categoriesErrorMessage;
  final String? categoryProductsErrorMessage;
  final String searchText;
 const StoreState({
   required this.searchText,
   required this.filteredProducts,
   required this.categoriesErrorMessage,
   required this.categoryProductsErrorMessage,
   required this.currentCategory,
   required this.categoryProducts,
   required this.categoryProductsLoadingStatus,
   required this.categories,
   required this.categoriesLoadingStatus
});
  StoreState copyWith({
    String? searchText,
    List<ProductModel>? filteredProducts,
    String? categoriesErrorMessage,
    String? categoryProductsErrorMessage,
    String? currentCategory,
    List<ProductModel>? categoryProducts,
   LoadingStatus? categoryProductsLoadingStatus,
   List<String>? categories,
   LoadingStatus? categoriesLoadingStatus
 }){return StoreState(
    searchText: searchText??this.searchText,
    filteredProducts: filteredProducts??this.filteredProducts ,
    categoriesErrorMessage: categoriesErrorMessage??this.categoriesErrorMessage,
      categoryProductsErrorMessage: categoryProductsErrorMessage??this.categoryProductsErrorMessage,
      currentCategory: currentCategory??this.currentCategory,
       categoryProducts: categoryProducts??this.categoryProducts,
       categoryProductsLoadingStatus: categoryProductsLoadingStatus??this.categoryProductsLoadingStatus,
       categories: categories??this.categories,
       categoriesLoadingStatus: categoriesLoadingStatus??this.categoriesLoadingStatus);
 }

 factory StoreState.initial(){
   return StoreState(
     searchText: '',
     filteredProducts: [],
     categoriesErrorMessage: null,
       categoryProductsErrorMessage: null,
       currentCategory: null,
       categoryProducts: [],
       categoryProductsLoadingStatus: LoadingStatus.ready,
       categories: [],
       categoriesLoadingStatus: LoadingStatus.ready);
 }
}
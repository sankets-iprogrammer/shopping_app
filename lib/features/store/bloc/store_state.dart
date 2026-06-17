import 'package:shopping_app/features/profile/helpers/editing_status_enum.dart';

import '../../home_page/model/product_model.dart';

class StoreState {
  final String? currentCategory;
  final List<ProductModel> categoryProducts;
  final LoadingStatus categoryProductsLoadingStatus;
  final List<String> categories;
  final LoadingStatus categoriesLoadingStatus;
  final String? categoriesErrorMessage;
  final String? categoryProductsErrorMessage;
 const StoreState({
   required this.categoriesErrorMessage,
   required this.categoryProductsErrorMessage,
   required this.currentCategory,
   required this.categoryProducts,
   required this.categoryProductsLoadingStatus,
   required this.categories,
   required this.categoriesLoadingStatus
});
  copyWith({
    String? categoriesErrorMessage,
    String? categoryProductsErrorMessage,
    String? currentCategory,
    List<ProductModel>? categoryProducts,
   LoadingStatus? categoryProductsLoadingStatus,
   List<String>? categories,
   LoadingStatus? categoriesLoadingStatus
 }){return StoreState(
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
     categoriesErrorMessage: null,
       categoryProductsErrorMessage: null,
       currentCategory: null,
       categoryProducts: [],
       categoryProductsLoadingStatus: LoadingStatus.ready,
       categories: [],
       categoriesLoadingStatus: LoadingStatus.ready);
 }
}
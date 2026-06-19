abstract class StoreEvent {}

class GetCategoriesEvent extends StoreEvent{}

class GetCategoryProductsEvent extends StoreEvent{
  final String category;
  GetCategoryProductsEvent({required this.category});
}

class SearchStoreProductEvent extends StoreEvent{
  String searchText;
  SearchStoreProductEvent({required this.searchText});
}


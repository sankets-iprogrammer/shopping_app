abstract class StoreEvent {}

class GetCategoriesEvent extends StoreEvent{}

class GetCategoryProductsEvent extends StoreEvent{
  final String category;
  GetCategoryProductsEvent({required this.category});
}



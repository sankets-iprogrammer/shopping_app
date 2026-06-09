abstract class HomeEvent {}

class LoadProductListEvent extends HomeEvent{
  int skip;
  LoadProductListEvent({required this.skip});
}
class LoadCategoryListEvent extends HomeEvent{}
class ToggleFavoriteIDEvent extends HomeEvent{
  final int id;
  ToggleFavoriteIDEvent({required this.id});
}
class ChangeProductCartCountEvent extends HomeEvent{
  final int id;
  final bool desc;
  ChangeProductCartCountEvent({required this.id,this.desc=false});
}

class LoadProductDataEvent extends HomeEvent{
  final int id;
  LoadProductDataEvent({required this.id});
}

class LoadUserDataEvent extends HomeEvent{}

class SearchProductEvent extends HomeEvent{
  String searchText;
  SearchProductEvent({required this.searchText});
}

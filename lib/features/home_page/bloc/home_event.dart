abstract class HomeEvent {}

class LoadProductListEvent extends HomeEvent{}
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

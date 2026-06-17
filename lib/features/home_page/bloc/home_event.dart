abstract class HomeEvent {}

class LoadProductListEvent extends HomeEvent{
  bool firstTime;
  LoadProductListEvent({this.firstTime=false});
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

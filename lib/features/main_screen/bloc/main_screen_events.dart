abstract class MainScreenEvents {}
class SetPageIndexEvent extends MainScreenEvents{
  int index;
  SetPageIndexEvent({required this.index});
}

class LogoutEvent extends MainScreenEvents{
}



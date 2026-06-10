

class MainScreenActiveState{
  final int currentPageIndex;
  final bool logoutState;
  MainScreenActiveState({
    required this.currentPageIndex,
    required this.logoutState
  });

  MainScreenActiveState copyWith({
    int? currentPageIndex,
    bool logoutState=false,
}) {
    return MainScreenActiveState(
        currentPageIndex: currentPageIndex??this.currentPageIndex,
        logoutState:logoutState
    );
  }
  factory MainScreenActiveState.initial(){
    return MainScreenActiveState(currentPageIndex: 0, logoutState: false);
  }
}




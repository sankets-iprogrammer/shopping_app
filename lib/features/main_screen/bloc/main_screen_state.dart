class MainScreenState {
  final int currentPageIndex;
  final bool showRefreshError;
  final bool showNavigateToLogin;
  MainScreenState({
    required this.currentPageIndex,
    required this.showNavigateToLogin,
    required this.showRefreshError
  });

  MainScreenState copyWith({
    int? currentPageIndex,
    bool? showRefreshError,
    bool? showNavigateToLogin
}) {
    return MainScreenState(currentPageIndex: currentPageIndex??this.currentPageIndex,
        showNavigateToLogin: showNavigateToLogin??this.showNavigateToLogin,
        showRefreshError: showRefreshError??this.showRefreshError);
  }
  factory MainScreenState.initial(){
    return MainScreenState(currentPageIndex: 0, showNavigateToLogin: false, showRefreshError: false);
  }
}



abstract class NavigationBarState {}

class NavigationBarInitialState extends NavigationBarState {}

class NavigationBarDestinationChangedState extends NavigationBarState {
  int index;
  NavigationBarDestinationChangedState(this.index);
}

abstract class NavigationBarEvent {}

class NavigationBarDestinationChangeEvent extends NavigationBarEvent {
  int index = 0;
  NavigationBarDestinationChangeEvent(this.index);
}

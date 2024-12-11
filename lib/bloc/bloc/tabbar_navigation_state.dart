part of 'tabbar_navigation_bloc.dart';

class TabbarNavigationState extends Equatable {
  const TabbarNavigationState(this.currentIndex);

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}


part of 'tabbar_navigation_bloc.dart';


sealed class TabbarNavigationEvent extends Equatable {
  const TabbarNavigationEvent(this.index);

  final int index;

  @override
  List<Object> get props => [];
}


class TabbarNavigationStarted extends TabbarNavigationEvent {
  const TabbarNavigationStarted(int index) : super(index);
}

class TabbarNavigationChangeRequested extends TabbarNavigationEvent {
  const TabbarNavigationChangeRequested(int index) : super(index);
}


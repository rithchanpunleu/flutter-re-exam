import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabbar_navigation_event.dart';
part 'tabbar_navigation_state.dart';

class TabbarNavigationBloc
    extends Bloc<TabbarNavigationEvent, TabbarNavigationState> {
  TabbarNavigationBloc() : super(const TabbarNavigationState(0)) {
    on<TabbarNavigationStarted>(_onTabBarNavigationStarted);
    on<TabbarNavigationChangeRequested>(_onTabBarNavigationRequestChanged);
  }
  void _onTabBarNavigationStarted(
      TabbarNavigationStarted event, Emitter<TabbarNavigationState> emit) {
    emit(TabbarNavigationState(event.index));
  }

  void _onTabBarNavigationRequestChanged(TabbarNavigationChangeRequested event,
      Emitter<TabbarNavigationState> emit) {
    emit(TabbarNavigationState(event.index));
  }
}

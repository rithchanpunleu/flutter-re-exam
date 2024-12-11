import 'dart:math';

import 'package:flutter/material.dart';
import 'package:setect/bloc/bloc/tabbar_navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setect/view/home_screen.dart';

class TabbarNavigation extends StatefulWidget {
  const TabbarNavigation({super.key});

  @override
  State<TabbarNavigation> createState() => _TabbarNavigationState();
}

class _TabbarNavigationState extends State<TabbarNavigation> {
  late PageController _pageController;
  int _currentPageIndex = 0;

  TabbarNavigationBloc get _bloc => context.read<TabbarNavigationBloc>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
    _bloc.add(TabbarNavigationStarted(_currentPageIndex));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          _bloc.add(TabbarNavigationChangeRequested(index));
          _currentPageIndex = index;
          print(index);
        },
        children: [
          const HomeScreen(),
          Container(),
          Container(),
          Container(),
        ],
      ),
      bottomNavigationBar:
          BlocSelector<TabbarNavigationBloc, TabbarNavigationState, int>(
        selector: (state) {
          return state.currentIndex;
        },
        builder: (BuildContext context, currentIndex) {
          return _buildBottomNavigationBar(currentIndex);
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar(int currentIndex) {
    final textStyle = TextStyle(fontSize: 14);
    const unselectedColor = Colors.grey;

    const selectedColor = Color.fromRGBO(0, 92, 148, 1);
    final iconPadding = EdgeInsets.symmetric(vertical: 5);

    List<BottomNavigationBarItem> items = [
      BottomNavigationBarItem(
        label: 'Home',
        icon: Padding(
          padding: iconPadding,
          child: const Icon(Icons.home),
        ),
      ),
      BottomNavigationBarItem(
        label: 'Calendar',
        icon: Padding(
          padding: iconPadding,
          child: Icon(Icons.calendar_month),
        ),
      ),
      BottomNavigationBarItem(
        label: 'Favorite',
        icon: Padding(
          padding: iconPadding,
          child: Icon(Icons.favorite),
        ),
      ),
      BottomNavigationBarItem(
        label: 'Account',
        icon: Padding(
          padding: iconPadding,
          child: const Icon(Icons.person),
        ),
      ),
    ];

    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: items,
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      unselectedItemColor: unselectedColor,
      selectedItemColor: selectedColor,
      unselectedLabelStyle: textStyle.copyWith(color: unselectedColor),
      selectedLabelStyle: textStyle.copyWith(color: selectedColor),
      enableFeedback: false,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        _selectPage(index);
      },
    );
  }

  void _selectPage(int index) {
    if (_currentPageIndex == index) {
    } else {
      _bloc.add(TabbarNavigationChangeRequested(index));
      _pageController.jumpToPage(index);
      _currentPageIndex = index;
    }
  }
}

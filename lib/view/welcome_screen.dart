import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:setect/component/text_styles.dart';
import 'package:setect/view/home_screen.dart';
import 'package:setect/view/tabbar_navigation.dart';

import '../bloc/bloc/tabbar_navigation_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Container(
            height: height * 0.7,
            color: Colors.white,
            child: Container(
              height: height * 0.6,
              decoration: const BoxDecoration(
                color:  Color(0xFF83D5E6),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Center(child: Image.network("https://i.pinimg.com/originals/43/6b/4b/436b4b9176d1fe762cae1be8140eda23.gif"),),
            ),
          ),
          Expanded(
            child: Container(
              color:  Color(0xFF83D5E6),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      50,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Learning is Everything',
                        style: mediumn.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Text(
                          'Learning with professional programmer, Whatever you want.',
                          style: mediumn.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (context) => TabbarNavigationBloc(),
                                child: const TabbarNavigation(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: height * 0.07),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: width * 0.2,
                            ),
                            child: Text(
                              "Get Started",
                              style: mediumn.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

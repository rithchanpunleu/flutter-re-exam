import 'package:flutter/material.dart';
import 'package:setect/component/text_styles.dart';
import 'package:setect/view/CoursesScreen/flutter.dart';
import 'package:setect/view/CoursesScreen/net.dart';
import 'package:setect/view/CoursesScreen/python.dart';
import 'package:setect/view/CoursesScreen/react.dart';
import 'package:setect/view/list_view_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: height * 0.22,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.border_all,
                        color: Colors.white,
                        size: 30,
                      ),
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  Text(
                    'Hi, Programmer',
                    style: mediumn.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      hintText: "Search here",
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.2,
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (height / 10) / (height * 0.07),
              ),
              itemBuilder: (context, index) {
                var data = items[index];
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: data.color,
                      child: data.icon,
                    ),
                    Text(data.text)
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Courses',
                      style: mediumn.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See All',
                      style: mediumn.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.7,
                  child: GridView.builder(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: item.length,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      childAspectRatio: (height / 10) / (height * 0.15),
                    ),
                    itemBuilder: (context, index) {
                      var data = item[index];

                      // Map each item to a different screen
                      Widget nextScreen;
                      if (index == 0) {
                        nextScreen = FlutterScreen();
                      } else if (index == 1) {
                        nextScreen = ReactScreen();
                      } else if(index == 2) {
                        nextScreen =
                            PythonScreen(); // A default screen for other cases
                      } else {
                        nextScreen = NetScreen();
                      }

                      return GestureDetector(
                        onTap: () {
                          // Navigate to the dynamically determined screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => nextScreen),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: height * 0.3,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.withOpacity(0.2),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.network(
                                    data.imageURL,
                                    height: height * 0.2,
                                    width: height * 0.2,
                                  ),
                                  Text(data.imageTitle),
                                  Text(data.desc),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Items {
  final Icon icon;
  final String text;
  final Color color;

  Items({required this.icon, required this.text, required this.color});
}

List<Items> items = [
  Items(
    icon: const Icon(Icons.category),
    text: 'Category',
    color: Colors.yellow,
  ),
  Items(
    icon: const Icon(Icons.video_file),
    text: 'Classes',
    color: Colors.green,
  ),
  Items(
      icon: const Icon(Icons.file_copy),
      text: 'Free Courses',
      color: Colors.blue),
  Items(
    icon: const Icon(Icons.store),
    text: 'Book Store',
    color: Colors.green,
  ),
  Items(
    icon: const Icon(Icons.play_circle_filled),
    text: 'Live Courses',
    color: Colors.blue,
  ),
  Items(
    icon: const Icon(Icons.nature),
    text: 'Leader Record',
    color: Colors.orange,
  ),
];

class CourseItem {
  final String imageURL;
  final String imageTitle;
  final String desc;

  CourseItem(
      {required this.imageURL, required this.imageTitle, required this.desc});
}

List<CourseItem> item = [
  CourseItem(
    imageURL: 'https://juststickers.in/wp-content/uploads/2019/01/flutter.png',
    imageTitle: 'Flutter',
    desc: '5 videos',
  ),
  CourseItem(
    imageURL:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlGmKtrnxElpqw3AExKXPWWBulcwjlvDJa1Q&s',
    imageTitle: 'React Native',
    desc: '5 videos',
  ),
  CourseItem(
    imageURL:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzI2CGffZkR0zjVnRLxhU6GweU-nV9sK3Iuw&s',
    imageTitle: 'Python',
    desc: '5 videos',
  ),
  CourseItem(
    imageURL:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNirRQ4CqAeJlbSpJa-wxOUo257LfYrYymHg&s',
    imageTitle: 'C##',
    desc: '5 videos',
  ),
];

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_crops/app/widget/app_bar.dart';
import 'package:healthy_crops/app/widget/drawer.dart';
import 'package:healthy_crops/util/const.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: myAppBar,
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AboutDetails(
              name: 'Hemel Sharker Akash',
              image: 'assets/images/akash1.jpg',
              id: '170116'),
          AboutDetails(
              name: 'Minhazul Islam Minhaz',
              image: 'assets/images/minhaz.jpg',
              id: '180123'),
          AboutDetails(
              name: 'Shahadot Hossain Nil',
              image: 'assets/images/shahadat.jpg',
              id: '180109')
        ],
      ),
    );
  }
}

class AboutDetails extends StatelessWidget {
  final String name;
  final String image;
  final String id;
  const AboutDetails(
      {super.key, required this.name, required this.image, required this.id});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: 200,
          width: 180,
          child: Image.asset(image),
        ),
        Container(
          width: 220,
          height: 200,
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20.sp, fontFamily: 'Lato'),
              ),
              Text('Student ID: $id'),
              const Text('4th Year 1st Semester'),
              const Text('Department of CSE'),
              const Text('Pabna University of Science and Technology')
            ],
          ),
        )
      ],
    );
  }
}

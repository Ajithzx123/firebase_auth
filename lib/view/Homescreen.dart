import 'package:firebase/view/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Home();
              } else {
                return LoginPage();
              }
            }),
      )),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 5.h,
        ),
        CircleAvatar(
          radius: 70,
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(
            Icons.person,
            size: 50,
            color: Colors.blue,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          "Name",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 22.sp,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 4.h,
        ),
        HomeRow(
          title: 'Email',
          subtitle: FirebaseAuth.instance.currentUser!.email!,
        ),
        SizedBox(
          height: 1.h,
        ),
        Divider(),
        SizedBox(
          height: 1.h,
        ),
        HomeRow(
          title: 'Phone No.',
          subtitle: "",
        ),
        SizedBox(
          height: 1.h,
        ),
        Divider(),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Icon(
                  Icons.logout,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        const Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('Version 1.0.0')),
          ),
        ),
      ],
    );
  }
}

class HomeRow extends StatelessWidget {
  final String title;
  final String subtitle;
  const HomeRow({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.blue),
          )
        ],
      ),
    );
  }
}

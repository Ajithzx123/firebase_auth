import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:firebase/view/custom.dart';
import 'package:firebase/view/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numbeerController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: SizedBox(
              height: 100.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "immence",
                    style: TextStyle(
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 33, 37, 243)),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "Name",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 1.h),
                  CustomText(
                      validator: (value) {},
                      textinputaction: TextInputAction.next,
                      textinputtype: TextInputType.name,
                      obscure: false,
                      controller: nameController,
                      hinttext: "Enter your Name",
                      labeltext: ""),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Email Address",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 1.h),
                  CustomText(
                      validator: (value) {},
                      textinputaction: TextInputAction.next,
                      textinputtype: TextInputType.emailAddress,
                      obscure: false,
                      controller: emailController,
                      hinttext: "Enter your Email",
                      labeltext: ""),
                  SizedBox(height: 2.h),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 1.h),
                  CustomText(
                      validator: (value) {},
                      textinputaction: TextInputAction.next,
                      textinputtype: TextInputType.number,
                      obscure: false,
                      controller: numbeerController,
                      hinttext: "Enter your Number",
                      labeltext: ""),
                  SizedBox(height: 2.h),
                  Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 1.h),
                  CustomText(
                      validator: (passwordvalue) {
                        if (passwordvalue.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (passwordvalue.length < 6) {
                            return ' password Must be more than 6 charater';
                          }
                      },
                      textinputaction: TextInputAction.done,
                      textinputtype: TextInputType.name,
                      obscure: true,
                      controller: passwordController,
                      hinttext: "Enter your password",
                      labeltext: ""),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      Text(
                        "Remeber me",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 2.h),
                  SizedBox(
                    height: 5.5.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      onPressed: () {
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
                        // print('email added');
                        // FirebaseFirestore.instance.collection('user').add({
                        //   'name': nameController.text.trim(),
                        //   'phone_number': numbeerController.text.trim(),
                        // });
                        // print('number  added');

                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        //   return LoginPage();
                        // }));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Color(0xFFEFEFEF),
                          fontSize: 16.sp,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 70.w,
                        child: EasyRichText(
                          'Already have an account ? Login',
                          textAlign: TextAlign.center,
                          defaultStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w100),
                          patternList: [
                            EasyRichTextPattern(
                                targetString: 'Login',
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: ((context) {
                                      return LoginPage();
                                    })));
                                  }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

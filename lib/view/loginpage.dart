import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:firebase/view/custom.dart';
import 'package:firebase/view/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController PasswordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: SizedBox(
              height: 100.h,
              width: 100.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: Text(
                    "immence",
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 33, 37, 243)),
                  )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Hi, Welcome back!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Email ",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomText(
                      validator: ((mailvalue) {
                        if (mailvalue != null) {
                          if (mailvalue.length > 5 &&
                              mailvalue.contains('@') &&
                              mailvalue.endsWith('.com')) {
                            return null;
                          }
                          return 'Enter a Valid Email Address';
                        }
                      }),
                      textinputaction: TextInputAction.next,
                      textinputtype: TextInputType.emailAddress,
                      obscure: false,
                      controller: emailController,
                      hinttext: "Enter your Email",
                      labeltext: "ff"),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CustomText(
                    validator: ((passwordvalue) {
                      if (passwordvalue.isEmpty) {
                        return 'Please enter password';
                      }
                      if (passwordvalue.length < 5) {
                        return ' password Must be more than 4 charater';
                      }
                    }),
                    textinputaction: TextInputAction.done,
                    textinputtype: TextInputType.name,
                    obscure: true,
                    controller: PasswordController,
                    hinttext: "Password",
                    labeltext: 'Password',
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
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
                  SizedBox(
                    height: 2.h,
                  ),
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
                       
                     setState(() {
                        signIn(context);
                     });
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xFFEFEFEF),
                          fontSize: 16.sp,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 70.w,
                        child: EasyRichText(
                          'Dont have an account ? SignUp',
                          textAlign: TextAlign.center,
                          defaultStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w400),
                          patternList: [
                            EasyRichTextPattern(
                                targetString: 'SignUp',
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: ((context) {
                                      return RegisterPage();
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

    Future signIn(BuildContext context) async {
   
    try {
      
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: PasswordController.text.trim(),
        
      );
         
    } on FirebaseAuthException catch (e) {
     print(e);
     
      
    }
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390,844),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            home: Scaffold(
              body: SingleChildScrollView(
                  child: Container(
                    width: ScreenUtil().setWidth(390),
                    height: ScreenUtil().setHeight(844),
                    color: Colors.white,
                    child: GlassContainer.frostedGlass(
                      width: ScreenUtil().setWidth(390),
                      height: ScreenUtil().setHeight(844),
                      blur: 20,
                      gradient: LinearGradient(
                          colors: [
                            Colors.green.withOpacity(0.90),
                            Colors.yellow.withOpacity(0.90),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: const [0.0,1.0]
                      ),
                      padding: EdgeInsets.fromLTRB(5.w, 120.h, 5.w, 0.h),
                      child: Column(
                        children: <Widget>[
                          Text("Hello Again!",
                            style: TextStyle(fontSize: 38.sp, fontFamily: GoogleFonts.lexend().fontFamily),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Welcome back\n you've been missed!",
                            style: TextStyle(fontSize:24.sp, fontFamily: GoogleFonts.lexend().fontFamily, color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 80.h,),
                          CustomTextField(controller: usernameController, hintText: "Enter username", obscureText: false),
                          SizedBox(height: 25.h,),
                          CustomTextField(controller: passwordController, hintText: "Enter password", obscureText: true),
                          SizedBox(height: 40.h,),
                          ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                  fixedSize: Size(200.w, 50.h),
                                  backgroundColor: const Color(0xFFA52FF3),
                                  elevation: 8
                              ),
                              child: Text("Register",
                                style: TextStyle(fontSize: 22.sp, fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.bold, color: Colors.white),
                              )
                          ),
                          SizedBox(height: 50.h,),
                          Container(
                            height: 180.h,
                            width: 300.w,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Divider(thickness: 1, color: Colors.grey,),
                                    ),
                                    SizedBox(width: 15.w,),
                                    Text("Or continue with",
                                      style: TextStyle(fontSize: 16.sp, fontFamily: GoogleFonts.robotoFlex().fontFamily,
                                      ),
                                    ),
                                    SizedBox(width: 15.w,),
                                    const Expanded(
                                      child: Divider(thickness: 1, color: Colors.grey,),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        width: 75.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(9),
                                          border: Border.all(color: Colors.white, width: 2)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.h),
                                          child: Image.asset('images/google_logo.png'),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        width: 75.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(9),
                                            border: Border.all(color: Colors.white, width: 2)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(1.h),
                                          child: Image.asset('images/facebook_logo.png', fit: BoxFit.cover,),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){},
                                      child: Container(
                                        width: 75.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(9),
                                            border: Border.all(color: Colors.white, width: 2)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.h),
                                          child: Image.asset('images/apple_logo.png'),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Not a member? ",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: GoogleFonts.aBeeZee().fontFamily,
                                    color: Colors.black87,
                                  ),
                                ),
                                TextSpan(
                                  text: "SignUp",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: GoogleFonts.aBeeZee().fontFamily,
                                    color: Colors.red,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(
                                  text: " now",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: GoogleFonts.aBeeZee().fontFamily,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ),
          );
        }
    );
  }
}

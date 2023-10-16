import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_task/custom_elevated_button.dart';
import 'package:gdsc_task/custom_text_field.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
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
                          Text("Hello there!",
                            style: TextStyle(fontSize: 38.sp, fontFamily: GoogleFonts.lexend().fontFamily),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Welcome\nlet's sign you up ",
                            style: TextStyle(fontSize:24.sp, fontFamily: GoogleFonts.lexend().fontFamily, color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 80.h,),
                          CustomTextField(controller: usernameController, hintText: "Enter username", obscureText: false),
                          SizedBox(height: 25.h,),
                          CustomTextField(controller: passwordController, hintText: "Enter password", obscureText: true),
                          SizedBox(height: 25.h,),
                          CustomTextField(controller: rePasswordController, hintText: "Re-enter password", obscureText: true),
                          SizedBox(height: 40.h,),
                          ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(200.w, 50.h),
                                backgroundColor: Colors.orange,
                                elevation: 8
                              ),
                              child: Text("Register",
                              style: TextStyle(fontSize: 22.sp, fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.bold, color: Colors.white),
                              )
                          ),
                          SizedBox(height: 145.h,),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already a member? ",
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: GoogleFonts.aBeeZee().fontFamily,
                                    color: Colors.black87,
                                  ),
                                ),
                                TextSpan(
                                  text: "SignIn",
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

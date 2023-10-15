import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glass_kit/glass_kit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            useMaterial3: true,
          ),
          home: Scaffold(
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                  child: Container(
                    width: ScreenUtil().setWidth(390),
                    height: ScreenUtil().setHeight(789),
                    color: Colors.white,
                    child: GlassContainer.frostedGlass(
                      width: ScreenUtil().setWidth(390),
                      height: ScreenUtil().setHeight(789),
                      blur: 20,
                      gradient: LinearGradient(
                        colors: [
                          Colors.red.withOpacity(0.90),
                          Colors.blue.withOpacity(0.90),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      ),
                      padding: EdgeInsets.fromLTRB(5.w, 6.h, 5.w, 0.h),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: ScreenUtil().setHeight(230),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(ScreenUtil().setSp(15)),
                                image: const DecorationImage(
                                    image: AssetImage('images/gdscbg.png'),
                                    fit: BoxFit.fill)),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(70),),
                          Text(
                            "Hello There!",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(50.sp),
                                fontFamily: GoogleFonts.bodoniModa().fontFamily,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(30),),
                          Text(
                            "Welcome to GDSC VITB",
                            style: TextStyle(
                              fontSize: 26.sp,
                              fontFamily: GoogleFonts.lexend().fontFamily,
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(20),),
                          Text(
                            "We are open to any student, ranging from novice developers who are just starting, to advanced developers who want to further enhance their skills.",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontFamily: GoogleFonts.lexend().fontFamily,
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.clip,
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(180),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                  Card(
                                    elevation: 8,
                                    shape: const RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.white,
                                      ),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: SizedBox(
                                      height: ScreenUtil().setHeight(55),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          ElevatedButton(onPressed: (){
                                              setState(() {
                                                isClicked = !isClicked;
                                              });
                                            },
                                              style: ElevatedButton.styleFrom(
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(12))
                                                  ),
                                                  fixedSize: Size(ScreenUtil().setWidth(186),ScreenUtil().setHeight(55)),
                                                  backgroundColor: isClicked ? Colors.red : Colors.white
                                              ),
                                              child: Text("Register",
                                                style: TextStyle(
                                                  fontSize: ScreenUtil().setSp(24),
                                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                                  fontWeight: FontWeight.bold,
                                                  color: isClicked ? Colors.white : Colors.black
                                                ),) ),
                                          ElevatedButton(onPressed: (){
                                            setState(() {
                                              isClicked = !isClicked;
                                            });
                                          },
                                              style: ElevatedButton.styleFrom(
                                                shape: const RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(12))
                                                ),
                                                fixedSize: Size(ScreenUtil().setWidth(186),ScreenUtil().setHeight(55)),
                                                  backgroundColor: isClicked ? Colors.white : Colors.blue
                                              ),
                                              child: Text("Sign In",
                                                style: TextStyle(
                                                    fontSize: ScreenUtil().setSp(24),
                                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                                    fontWeight: FontWeight.bold,
                                                    color: isClicked ? Colors.black : Colors.white
                                                ),)),
                                        ],
                                      ),
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
          ),
        );
      },
    );
  }
}



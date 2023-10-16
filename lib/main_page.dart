import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_task/register.dart';
import 'package:gdsc_task/signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:provider/provider.dart';

import 'custom_elevated_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<MainPage> {

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
            body:  SingleChildScrollView(
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
                          Colors.red.withOpacity(0.90),
                          Colors.blue.withOpacity(0.90),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                          stops: const [0.0,1.0],
                      ),
                      padding: EdgeInsets.fromLTRB(5.w, 60.h, 5.w, 0.h),
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
                          ChangeNotifierProvider(
                            create: (context)=> ColorBool(),
                            child: SizedBox(
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
                                            CustomElevatedButton( buttonText: "Register", onClick: (){
                                              Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => const RegistrationPage()));
                                            }, buttonColor: Colors.blue,),
                                            CustomElevatedButton( buttonText: "Sign in", onClick: (){
                                              Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => const SignInPage()));
                                            }, buttonColor: Colors.red,),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
          ),
        );
      },
    );
  }
}
class ColorBool extends ChangeNotifier{
  bool _isClicked1 = true;
  bool _isClicked2 = false;
  bool getValue(String whom){
    if(whom=="Sign in"){
      return _isClicked2;
    }
    return _isClicked1;
  }
  void setValue(bool alreadyClicked){
    if(!alreadyClicked) {
      _isClicked1 = !_isClicked1;
      _isClicked2 = !_isClicked2;
    }
    notifyListeners();
  }
}



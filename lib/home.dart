import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gdsc_task/auth.dart';
import 'package:gdsc_task/main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child){
        return MaterialApp(
          theme: ThemeData(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ElevatedButton(onPressed: (){
                      Auth().signOut();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const MainPage()));
                    }, child: const Text("Log out"))
                  ],
                ),
              ),
            )
          ),
        );
      },
    );
  }
}

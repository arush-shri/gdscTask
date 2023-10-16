import 'package:flutter/material.dart';
import 'package:gdsc_task/auth.dart';
import 'package:gdsc_task/main_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Auth().signOut();
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => const MainPage()));
      }, child: const Text("click"));
  }
}

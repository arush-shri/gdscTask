import 'package:flutter/material.dart';
import 'package:gdsc_task/main_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomElevatedButton extends StatefulWidget {

  final String buttonText;
  final VoidCallback onClick;
  final Color buttonColor;
  const CustomElevatedButton(
      {super.key,
      required this.buttonText,
      required this.onClick,
      required this.buttonColor});

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  String _buttonText = "";
  VoidCallback _onClick = () {};

  @override
  void initState() {
    super.initState();
    _buttonText = widget.buttonText;
    _onClick = widget.onClick;
  }

  @override
  Widget build(BuildContext context) {
    final colorChange = Provider.of<ColorBool>(context, listen: true);
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return ElevatedButton(
            onPressed: () {
              colorChange.setValue(colorChange.getValue(_buttonText));
              _onClick;
            },
            style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                fixedSize: Size(
                    ScreenUtil().setWidth(185), ScreenUtil().setHeight(55)),
                backgroundColor: colorChange.getValue(_buttonText)? widget.buttonColor : Colors.white),
            child: Text(
              _buttonText,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  color: colorChange.getValue(_buttonText)? Colors.white : Colors.black),
            ));
      },
    );
  }
}

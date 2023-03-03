import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils{


  static Color brandColor1 = const Color(0xffCE1567);
  static Color brandColor2 = const Color(0xff38106A);

  static Color textHeaderColor = const Color(0xffFEBF60);
  static Color titleColor = const Color(0xff292D34);
  static Color subTitleColor = const Color(0xff82858A);
  static Color lightTextColor = const Color(0xffFFFFFF);

  static Color successColor = const Color(0xff219653);

  static Color warningColor = const Color(0xffFF8C00);

  static Color errorColor = const Color(0xffED5050);

  static Color bg1Color = const Color(0xff1377AE);

  static Color bg2Color = const Color(0xffF9F9F9);

  static Color bg3Color = const Color(0xffF3F3F3);

  static Color iconColor = const Color(0xff82858A);

  static Color iconColor2 = const Color(0xffFFFFF);




  static flushBarMessage(context, text, bgColor,){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$text',
        style: const TextStyle(
          color: Color(0xFFFFEFFF),
        ),),
      backgroundColor: bgColor,
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      behavior: SnackBarBehavior.floating,
    ),
    );
  }

  static void topFlushBarMessage(String message, context, bgColor)async {
    showFlushbar(context: context,
      flushbar: Flushbar(
        forwardAnimationCurve:Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        // padding: const EdgeInsets.all(12),
        message: message,
        duration: const Duration(seconds: 6),
        borderRadius: BorderRadius.circular(5),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: bgColor,
        reverseAnimationCurve: Curves.bounceInOut,
        flushbarStyle: FlushbarStyle.FLOATING,
        positionOffset: 20,
        icon: const Icon(Icons.error , size: 28 , color: Colors.white,),
      )..show(context),
    );
  }

  static onNextFocus(context, FocusNode currentFocus, FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static TextStyle headlineTextStyle = const TextStyle(
    fontSize: 18,
    color: Color(0xffCE1567),
    fontWeight: FontWeight.bold,
  );
  static TextStyle bigStyle = const TextStyle(
    fontSize: 42,
    color: Color(0xffCE1567),
    fontWeight: FontWeight.bold,
  );
  static TextStyle boldTextStyle = const TextStyle(
    fontSize: 26,
    color: Color(0xff38106A),
    fontWeight: FontWeight.bold,
  );
  static TextStyle boldHome = const TextStyle(
    fontSize: 16,
    color: Color(0xff38106A),
    fontWeight: FontWeight.bold,
  );
  static TextStyle itemCount = const TextStyle(
    fontSize: 19,
    color: Color(0xff38106A),
    fontWeight: FontWeight.bold,
  );
  static TextStyle simpleText = const TextStyle(
    fontSize: 16,
    color: Color(0xff38106A),
    fontWeight: FontWeight.normal,
  );
  static TextStyle orderListName = const TextStyle(
    fontSize: 19,
    color: Color(0xff38106A),
    fontWeight: FontWeight.bold,
  );
  static TextStyle blackBoldStyle = const TextStyle(
    fontSize: 26,
    color: Color(0xff292929),
    fontWeight: FontWeight.bold,
  );
  static TextStyle blackHome = const TextStyle(
    fontSize: 19,
    color: Color(0xff292929),
    fontWeight: FontWeight.bold,
  );
  static TextStyle blackSimple = const TextStyle(
    fontSize: 26,
    color: Color(0xff292929),
    fontWeight: FontWeight.normal,
  );
  static TextStyle appBarStyle = const TextStyle(
    fontSize: 21,
    color: Color(0xff292929),
    fontWeight: FontWeight.normal,
  );
  static TextStyle masterCard = const TextStyle(
    fontSize: 18,
    color: Color(0xff292929),
    fontWeight: FontWeight.normal,
  );
  static TextStyle subtitle = const TextStyle(
    fontSize: 15,
    color: Color(0xff82858A),
    fontWeight: FontWeight.normal,
  );
  static TextStyle textSubtitle = const TextStyle(
    fontSize: 14,
    color: Color(0xff595757),
    fontWeight: FontWeight.normal,
  );
  static TextStyle coloredTextStyle = const TextStyle(
    fontSize: 15,
    color: Color(0xffCE1567),
    fontWeight: FontWeight.normal,
  );
  static TextStyle simpleTitleStyle = const TextStyle(
    fontSize: 15,
    color: Color(0xff292929),
    fontWeight: FontWeight.normal,
  );
  static TextStyle buttonTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xffFFFFFF),
    fontWeight: FontWeight.normal,
  );
}
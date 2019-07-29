import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


//Using classes
/*class myColor {                 //To be tested
  static Color themeColor() {
    return Color(0xFFFF0000);
  }
  //we can call this method from anywhere using
  //myColor.themeColor();

}*/

Color themeColor() {
  return Color(0xFF000000);       //light blue as in quincus app
}

Color drawerHeaderColor() {
  return themeColor();
}

Color appBarColor() {
  return themeColor();
}

Color buttonColor() {
  return boxBorder();
}

Color editTextColor(){
  return Color(0xFFFFFFFF);
}

Color hintColor(){
  return Color(0xFFD2D4D3);
}

Color boxBorder(){
  return Color(0xFF3EA7DC);
}

Color white(){
  return Color(0xFFFFFFFF);
}

Color greenColor(){
  return Color(0xFF2CA260);
}

Color pageBackground(){
  return Color(0xFF1D1D1D);
}

Color transparent(){
  return Color(0x16FFFFFF);
}

Color transparentBlack60(){
  return Color(0xA6000000);
}

Color transparentBlack80(){
  return Color(0x73000000);
}

double sdp(double pocoDp){
  return ScreenUtil().setSp(pocoDp*2.75);       //Here 2.75 is the devicePixelRatio (MediaQuery.of(context).devicePixelRatio)
}

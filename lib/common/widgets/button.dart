import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/values.dart';

/// 扁平圆角按钮
Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(TextStyle(
          fontSize: 16.sp,
        )),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused) &&
                !states.contains(MaterialState.pressed)) {
              return Colors.blue;
            } else if (states.contains(MaterialState.pressed)) {
              return Colors.deepPurple;
            }
            return fontColor;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue[200];
          }
          return gbColor;
        }),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        )),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
          height: 1,
        ),
      ),
    ),
  );
}

/// 第三方按钮
Widget btnFlatButtonBorderOnlyWidget({
  required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  required String iconFileName,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: TextButton(
      style: ButtonStyle(
        // textStyle: MaterialStateProperty.all(TextStyle(
        //   fontSize: 16.sp,
        // )),
        // foregroundColor: MaterialStateProperty.resolveWith(
        //   (states) {
        //     if (states.contains(MaterialState.focused) &&
        //         !states.contains(MaterialState.pressed)) {
        //       return Colors.blue;
        //     } else if (states.contains(MaterialState.pressed)) {
        //       return Colors.deepPurple;
        //     }
        //     return AppColors.primaryElementText;
        //   },
        // ),
        // backgroundColor: MaterialStateProperty.resolveWith((states) {
        //   if (states.contains(MaterialState.pressed)) {
        //     return Colors.blue[200];
        //   }
        //   return AppColors.primaryElement;
        // }),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        )),
      ),
      onPressed: onPressed,
      child: Image.asset(
        "assets/images/icons-$iconFileName.png",
      ),
    ),
  );
}

Widget itemCircleTextButton(String text, VoidCallback onPressed) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      padding:const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(color: const Color(0xff555555), fontSize: 12.sp),
      ),
    ),
  );
}
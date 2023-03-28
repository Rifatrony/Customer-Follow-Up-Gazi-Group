import 'package:flutter/widgets.dart';
import 'package:follow_up_customer/res/Colors/appColor.dart';

class AppText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;

  const AppText({
    super.key,
    required this.title,
    this.fontSize = 16,
    this.textColor = AppColor.secondaryTextColor,
    this.fontWeight = FontWeight.normal
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
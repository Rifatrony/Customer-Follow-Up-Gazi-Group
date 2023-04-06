import 'package:flutter/material.dart';
import 'package:follow_up_customer/res/Colors/appColor.dart';

class RoundButton extends StatelessWidget {

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  const RoundButton({
    super.key,
    this.loading = false,
    required this.title,
    this.height = 50.0,
    this.width = double.infinity,
    required this.onPress,
    this.textColor = AppColor.primaryTextColor,
    this.buttonColor = AppColor.primaryButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
    
        ),
        child: loading 
        ? Center(child: CircularProgressIndicator(color: Colors.black,)) 
        : Center(child: Text(title, style: TextStyle(color: textColor),),),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.buttonTitleColor,
    required this.buttonColor,
    required this.onPressed,
  });
  final String title;
  final Color buttonTitleColor, buttonColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 45),
      ),
      child: Text(
        title,
        style: AppTextStyle.semiBold24.copyWith(color: buttonTitleColor),
      ),
    );
  }
}

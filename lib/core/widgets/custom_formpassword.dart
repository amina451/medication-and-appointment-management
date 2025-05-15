import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/helper_functions/validation.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/cusom_text_form_field.dart';

class CustomFiledPassword extends StatefulWidget {
  const CustomFiledPassword({super.key, this.onSaved, required this.controller});

  final void Function(String?)? onSaved;
 final TextEditingController controller;

  @override
  State<CustomFiledPassword> createState() => _CustomFiledPasswordState();
}

class _CustomFiledPasswordState extends State<CustomFiledPassword> {
  bool obsecureText = true;

  _CustomFiledPasswordState();
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: Valid.validatePassword,
      controller: widget.controller,
      obscureText: obsecureText,
      onSaved: widget.onSaved,
      suffixIcon: GestureDetector(
        onTap: () {
          obsecureText = !obsecureText;
          setState(() {});
        },
        child:
            obsecureText
                ? const Icon(Icons.remove_red_eye, color: Color(0xFFC9CECF))
                : const Icon(
                  Icons.visibility_off_outlined,
                  color: Color(0xFFC9CECF),
                ),
      ),
      keyboardType: TextInputType.visiblePassword,
      hint: 'Mot de passe ',
    );
  }
}
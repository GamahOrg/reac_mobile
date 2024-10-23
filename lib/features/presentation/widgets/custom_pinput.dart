import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
class CustomPinput extends StatelessWidget {
  const CustomPinput({
    super.key,
    required this.pinController,
    required this.defaultPinTheme,
    this.validator
  });

  final TextEditingController pinController;
  final PinTheme defaultPinTheme;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length:4,
      validator: validator,
      controller:pinController,
      focusedPinTheme: defaultPinTheme.copyWith(decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff002F56)),borderRadius: BorderRadius.circular(10)
      )),
      submittedPinTheme:defaultPinTheme.copyWith(decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff002F56)),borderRadius: BorderRadius.circular(10)
      )) ,
      defaultPinTheme: defaultPinTheme,
    );
  }
}

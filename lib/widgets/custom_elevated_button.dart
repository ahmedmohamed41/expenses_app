import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPressed,
    this.text,
  });
  final void Function()? onPressed;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed

      ,
      child: Text(
        text!,
   
        style: TextStyle(
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
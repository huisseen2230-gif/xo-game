import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String hint ;
  TextEditingController controller ;
 CustomTextField ({required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller:controller ,
      decoration: InputDecoration(
        fillColor: Colors.white ,
        filled: true,
        hintText:hint ,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                color: Colors.white,
                width: 0
            )
        ),
        focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                color: Colors.white,
                width: 0
            )
        ),
      ),
    );
  }
}

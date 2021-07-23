import 'package:flutter/material.dart';
import 'package:slinkshot/core/constants/app_constants.dart';

class BottomSheetTextField extends StatelessWidget {
  final String hintText;

  BottomSheetTextField({this.hintText = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45 * screenWidthFactorRatio(context),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Color(0xffBABABA),
              fontSize: 13 * screenWidthFactorRatio(context)),
          border: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
              borderSide: BorderSide.none
              //borderSide: const BorderSide(),
              ),
          //),
          //border: InputBorder.none,
          contentPadding: EdgeInsets.only(
              bottom: (35 / 2) * screenWidthFactorRatio(context),
              left: 16 * screenWidthFactorRatio(context)),
        ),
      ),
    );
  }
}

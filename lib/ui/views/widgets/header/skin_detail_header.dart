import 'package:flutter/material.dart';
import 'package:slinkshot/core/constants/app_constants.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';

class SkinDetailHeader extends StatelessWidget {
  
  final String skinLabel;
  SkinDetailHeader(this.skinLabel);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          alignment: Alignment.center,
          width: width(context),
          height: 50,
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          decoration: BoxDecoration(
            color: bunkerBlack,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(15, 0, 0, 0),
                  blurRadius: 10.0,
                  spreadRadius: 12.0,
                  offset: Offset(0.0, 1.0))
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, color: Colors.white)),
              ),
              Flexible(
                flex: 9,
                child: Text(skinLabel,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    )),
              ),
              Flexible(flex: 1, child: Container())
            ],
          )),
    );
  }
}

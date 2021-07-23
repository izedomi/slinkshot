import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';

import '../../../core/constants/app_constants.dart';



class LoadingBackground extends StatefulWidget {
  @override
  _LoadingBackgroundState createState() => _LoadingBackgroundState();
}

class _LoadingBackgroundState extends State<LoadingBackground> {
  

  Timer timer;
  double _opacity = 1;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds:700), (Timer t){
      _opacity == 1 ? setState(() => _opacity = 0) :  setState(() => _opacity = 1);
     
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: bunkerBlack,
      //color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //CupertinoActivityIndicator(radius: 20),
          SizedBox(height: 3.0,),
          AnimatedOpacity(
              duration: Duration(milliseconds: 1000),
              opacity: _opacity,
              curve: Curves.easeInOut,
              child: Column(             
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/slinkshot.png"),
                    width: 120 * screenWidthFactorRatio(context),
                    height: 120 * screenWidthFactorRatio(context),
                  ),
                  SizedBox(height: 3.0,),
                ],
              ),
          )
        ],
      ),
    );
    
  }
}
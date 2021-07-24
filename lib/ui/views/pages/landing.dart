import 'package:flutter/material.dart';
import 'package:slinkshot/core/constants/app_constants.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';
import 'package:slinkshot/ui/views/pages/bottom_nav.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  double _opacity = 0;
  double _titleOpacity = 0;

  @override
  void initState() {

    Future.delayed(
        Duration(seconds: 2),
        () => setState(() {
              _titleOpacity = 1;
            }));
    Future.delayed(Duration(seconds: 6), () =>
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNav()),
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width(context),
            height: height(context),
            child: Image.asset(
              "assets/images/background.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 100 * screenWidthFactorRatio(context),
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedOpacity(
                  opacity: _titleOpacity,
                  duration: Duration(milliseconds: 1500),
                  child: Text(
                    "Slinkshot",
                    style: TextStyle(
                        color: baliGrey,
                        fontSize: 45 * screenWidthFactorRatio(context),
                        fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(height: 3),
              ]),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:slinkshot/core/constants/app_constants.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';

class ProfileHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        alignment: Alignment.center,
        width: width(context),
        height: 50,
        padding: EdgeInsets.only(left: 24, right: 24,),
        decoration: BoxDecoration(
          color: bunkerBlack,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromARGB(15, 0, 0, 0),
                blurRadius: 10.0,
                spreadRadius: 12.0,
                offset: Offset(0.0, 1.0)
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.settings, color: galleryGrey,),
                SizedBox(width: 8),
                Image.asset(
                  'assets/images/slinkshot.png',
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Text(
              "Profile",  
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              )
            ),
            Row(
              children: [
                Icon(Icons.share, color: galleryGrey,),
                SizedBox(width: 8),
                Image.asset(
                  'assets/images/mask.PNG',
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ],
        )
      ),
    );
  }


}
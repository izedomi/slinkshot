import 'package:flutter/material.dart';
import 'package:slinkshot/core/constants/app_constants.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';
import 'package:slinkshot/ui/views/pages/bottom_nav/skin_market.dart';

class SkinMarketHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        alignment: Alignment.center,
        width: width(context),
        height: 50,
        padding: EdgeInsets.only(left: 12),
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
          children: [
             Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Image.asset(
                     'assets/images/ace.PNG',
                     height: 35,
                     fit: BoxFit.cover,
                   ),
                   SizedBox(width: 6),
                   Image.asset(
                     'assets/images/slinkshot.png',
                     height: 35,
                     fit: BoxFit.cover,
                   ),
                 ],
               ),
             ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(right: 60 * screenWidthFactorRatio(context)),
              child: Text(
                "Skin Market",  
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                )
              ),
            ),
            IconButton(
            icon: Icon(Icons.search, color: dustyGrey,),
            onPressed: () {
            showSearch(context: context, delegate: SkinSearch());
            })
          ],
        )
      ),
    );
  }


}
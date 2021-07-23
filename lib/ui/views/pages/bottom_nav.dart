import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot/core/viewmodel/bottom_nav_model.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';
import 'package:slinkshot/ui/views/widgets/items/bottom_nav_items.dart';

import '../../../core/constants/app_constants.dart';


class BottomNav extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _BottomNav();
  }
}

class _BottomNav extends State<BottomNav> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Consumer<BottomNavModel>(
        builder: (context, model, child) => 
        Scaffold(
          backgroundColor: bunkerBlack,
          body: model.children[model.currentIndex],  //IndexedStack(index: model.currentIndex, children: model.children),
          bottomNavigationBar: BottomNavigationBar(
                onTap: (index) =>  model.updateIndex(index),
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                selectedFontSize: width(context) / 35,
                unselectedFontSize: width(context) / 35,
                backgroundColor: bunkerBlack,
                selectedLabelStyle: TextStyle(
                  fontFamily: 'TTNorms-Heavy',
                  //fontSize: width(context) / 27,
                  fontWeight: FontWeight.w700,),
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'TTNorms-Thin',
                  fontWeight: FontWeight.w400,),
                selectedItemColor: Colors.white,
                unselectedItemColor: baliGrey,
                currentIndex: model.currentIndex,
                items: userBottomTabItems(context)),
          floatingActionButton: Container(
            
            margin: EdgeInsets.only(
              top: 60 * screenWidthFactorRatio(context),
            ),
            height: 50 * screenWidthFactorRatio(context),
            width: 50 * screenWidthFactorRatio(context),
           
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                      25 * screenWidthFactorRatio(context)),
              //color: Colors.red,
              gradient: new LinearGradient(
                colors: [
                  Color(0xffdd6a47),
                  Color(0xff6a69ac),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                ),
          

            ),
            child: Icon(Icons.add, color: Colors.white, size: 28),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,

          
        ),
      ),
    );

  }













}



import 'package:flutter/material.dart';
import 'package:slinkshot/ui/views/pages/bottom_nav/profile.dart';
import 'package:slinkshot/ui/views/pages/bottom_nav/search.dart';
import 'package:slinkshot/ui/views/pages/bottom_nav/skin_market.dart';
import 'package:slinkshot/ui/views/pages/bottom_nav/home.dart';



class BottomNavModel extends ChangeNotifier{

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<Widget>  _children = [
    Home(),
    Search(),
    SkinMarket(),
    Profile()
  ];

  List<Widget> get children => _children;

  updateIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

}
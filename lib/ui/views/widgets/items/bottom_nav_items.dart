import 'package:flutter/material.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';
import 'package:slinkshot/ui/views/widgets/circular_avatar.dart';
import '../../../../core/constants/app_constants.dart';

///bottom nav items
userBottomTabItems(BuildContext context){
  return [
    new BottomNavigationBarItem(
      activeIcon: Image.asset(
        'assets/images/home_active.PNG',
        height: 35,
      ),
      icon: Image.asset(
        'assets/images/home.png',
        height: 35,
      ),
      label: "",
    ),
    new BottomNavigationBarItem(
      activeIcon: Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Image.asset(
          'assets/images/search.png',
          height: width(context) / 12,
          color: Colors.white,
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.only(right: 30.0),
        child: Image.asset(
          'assets/images/search.png',
          height: width(context) / 12,
          color: baliGrey,
        ),
      ),
      label: "",
    ),
    new BottomNavigationBarItem(
      activeIcon: Padding(
         padding: const EdgeInsets.only(left: 30.0),
        child: Image.asset(
          'assets/images/mask_active.PNG',
          height: 35,
        ),
      ),
      icon: Padding(
         padding: const EdgeInsets.only(left: 30.0),
        child: Image.asset(
          'assets/images/mask.PNG',
          height: 35,
        ),
      ),
      label: "",
     ),
    new BottomNavigationBarItem(
      activeIcon: CircularAvatar(
        imageHeight: 40,
        imageWidth: 40,
        imageUrl: "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      ),
      icon: CircularAvatar(
        imageHeight: 40,
        imageWidth: 40,
        imageUrl: "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      ),
      label: "",
    ),
  ];
}
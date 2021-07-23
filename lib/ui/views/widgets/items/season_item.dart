import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slinkshot/core/constants/app_constants.dart';
import 'package:slinkshot/core/models/season.dart';
import 'package:slinkshot/core/models/skin.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';
import 'package:slinkshot/ui/shared/styles.dart';
import 'package:slinkshot/ui/views/pages/skin_details.dart';
import 'package:slinkshot/ui/views/widgets/circular_avatar.dart';
import 'package:slinkshot/ui/views/widgets/items/skin_item.dart';

class SeasonItem extends StatelessWidget {
  final Season season;   
  SeasonItem(this.season);
  

  @override
  Widget build(BuildContext context) {
    

    return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          skinItemHeader(season.title),
          GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: season.skins.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 3,
                  childAspectRatio: aspectRatio(context) * 1.5),
              itemBuilder: (BuildContext context, int index) {
                Skin skin = season.skins[index];
                return SkinItem(skin);
              })
        ],
      ),
    );
  }

  Widget skinItemHeader(String seasonTitle) {
    return Text(seasonTitle,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            letterSpacing: -1));
  }

  Widget skinItemContent(Skin skin, BuildContext context) {

    int colorIndex = Random().nextInt(borderGradients.length - 1);

    final kGradientBoxDecoration = gradientBoxDecoration(borderRadius: 140, colorIndex: colorIndex);
    final kInnerDecoration = innerDecoration();
    
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SkinDetails(skin)),
      ),
      child: Container(
        //width: width(context),
        width: double.infinity,
        child: Column(
          children: [
            Text(skin.title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    letterSpacing: -1)),
            SizedBox(height: 2),
            Container(
              height: 150,
              width: 150,
              padding: EdgeInsets.all(12),
              decoration: kGradientBoxDecoration,
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(140),
                child: Container(
                    decoration: kInnerDecoration,
                    padding: EdgeInsets.all(6),
                    child: Hero(
                      tag: skin.id,
                      child: CircularAvatar(
                        imageHeight: 140,
                        imageWidth: 140,
                        imageUrl: skin.image,
                      ),
                    )),
              ),
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/price.PNG',
                  height: 24,
                  fit: BoxFit.cover,
                ),
                Text(skin.price.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        letterSpacing: -1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

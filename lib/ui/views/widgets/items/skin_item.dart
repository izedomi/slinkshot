import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';
import 'package:slinkshot/ui/shared/styles.dart';
import 'package:slinkshot/ui/views/pages/skin_details.dart';
import 'package:slinkshot/ui/views/widgets/circular_avatar.dart';

class SkinItem extends StatelessWidget {
  final skin;
  SkinItem(this.skin);
  final int colorIndex = Random().nextInt(borderGradients.length - 1);

  @override
  Widget build(BuildContext context) {
    //int colorIndex = Random().nextInt(borderGradients.length - 1);

    final kGradientBoxDecoration =
        gradientBoxDecoration(borderRadius: 140, colorIndex: colorIndex);
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

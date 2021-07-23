import 'package:flutter/material.dart';
import 'package:slinkshot/core/constants/app_constants.dart';
import 'package:slinkshot/core/models/skin.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';
import 'package:slinkshot/ui/views/widgets/circular_avatar.dart';
import 'package:slinkshot/ui/views/widgets/header/skin_detail_header.dart';

class SkinDetails extends StatefulWidget {
  final Skin skin;
  SkinDetails(this.skin);

  @override
  _SkinDetailsState createState() => _SkinDetailsState();
}

class _SkinDetailsState extends State<SkinDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width(context),
        height: height(context),
        decoration: BoxDecoration(color: bunkerBlack),
        child: Column(
          children: [
            SkinDetailHeader(widget.skin.title),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: width(context),
                  padding:
                      EdgeInsets.only(
                        top: 16, 
                        bottom: 16, 
                        left: 55, 
                        right: 55
                  ),
                  child: Column(
                    children: [
                      horizontalDivider(),
                      SizedBox(height: 36),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Hero(
                            tag: widget.skin.id,
                            child: CircularAvatar(
                                imageHeight: 140,
                                imageWidth: 140,
                                imageUrl: widget.skin.image),
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(widget.skin.price.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      )),
                                  SizedBox(width: 3),
                                  Image.asset(
                                    'assets/images/price_alt.PNG',
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 3),
                                decoration: BoxDecoration(
                                    color: Colors.lightGreenAccent,
                                    gradient: new LinearGradient(
                                      colors: [
                                        Color(0xff93af49),
                                        Color(0xffb59705),
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Text("Buy Now",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 36),
                      horizontalDivider(),
                      SizedBox(height: 36),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description:",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                              )),
                          SizedBox(height: 3),
                          Text(
                              widget.skin.description + widget.skin.description,
                              style: TextStyle(
                                color: galleryGrey,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget horizontalDivider() {
    return Container(
      height: 12,
      width: width(context),
      decoration: BoxDecoration(
          color: Colors.lightGreenAccent,
          gradient: LinearGradient(
            colors: [
              Color(0xff93af49),
              Color(0xffb59705),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(15)),
    );
  }

  Widget buildProfileButton({String title, IconData icon}) {
    return InkWell(
      onTap: () {
        title == null ? print(title) : print("send icon pressed");
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        //margin: EdgeInsets.only(right: 6, left: 6),
        decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(24)),
        child: title != null
            ? Text(
                title,
                style:
                    TextStyle(color: galleryGrey, fontWeight: FontWeight.bold),
              )
            : Icon(
                icon,
                size: 28,
                color: galleryGrey,
              ),
      ),
    );
  }
}

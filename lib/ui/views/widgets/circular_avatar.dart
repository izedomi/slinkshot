import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final String imageUrl;

  const CircularAvatar({Key key, this.imageHeight, this.imageWidth, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageHeight,
      width: imageWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(imageHeight),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageHeight),
        child: CachedNetworkImage(
          imageUrl: "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(),
          /*Center(
            child: CircularProgressIndicator(
              */ /*valueColor: new AlwaysStoppedAnimation<Color>(ebonyClay),*/ /*
            )),*/
          errorWidget: (context, url, error) =>
          ClipRRect(
            borderRadius: BorderRadius.circular(imageHeight),
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(imageHeight),
                  image: DecorationImage(
                      image: AssetImage("assets/images/home_bg.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
        ),
      )
    );
  }
}

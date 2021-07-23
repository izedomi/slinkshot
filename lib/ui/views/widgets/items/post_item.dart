import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slinkshot/core/constants/app_constants.dart';
import 'package:slinkshot/core/models/post.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';
import 'package:slinkshot/ui/shared/styles.dart';
import 'package:slinkshot/ui/views/widgets/circular_avatar.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PostItem extends StatefulWidget {
  final Post post;
  PostItem(this.post);

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  Post post;
  VideoPlayerController _controller;
  var _rand = new Random();

  // @override
  // void initState() {
  //   post = widget.post;
  //   super.initState();
  //   // _controller = VideoPlayerController.asset('assets/bbb.mp4')
  //   //   ..initialize().then((_) {
  //   //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //   //     setState(() {});
  //   //   });
  //    _controller = VideoPlayerController.network(
  //       'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
  //     ..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  Future<void> _initializeVideoPlayerFuture;
  BoxDecoration kGradientBoxDecoration;
  BoxDecoration kInnerDecoration;
  int colorIndex;

  @override
  void initState() {
    post = widget.post;

    colorIndex = _rand.nextInt(borderGradients.length - 1);

    kGradientBoxDecoration =
        gradientBoxDecoration(borderRadius: 16, colorIndex: colorIndex);
    kInnerDecoration = innerDecoration(borderRadius: 16);

    if (post.format.type.toLowerCase() != "photo") {
      _controller = VideoPlayerController.network(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
      //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
      _controller.setVolume(1.0);
      // _controller.play();
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // int colorIndex = _rand.nextInt(borderGradients.length - 1);

    // final kGradientBoxDecoration =
    //     gradientBoxDecoration(borderRadius: 16, colorIndex: colorIndex);
    // final kInnerDecoration = innerDecoration(borderRadius: 16);

    return VisibilityDetector(
      key: Key(post.id.toString()),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        debugPrint(
            'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
      },
      child: Container(
        width: width(context),
        height: height(context) - 200,
        decoration: kGradientBoxDecoration,
        margin: EdgeInsets.symmetric(horizontal: 12),
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Container(
              decoration: kInnerDecoration,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child: post.format.type.toLowerCase() == "photo"
                          ? CachedNetworkImage(
                              imageUrl: post.contentUrl,
                              width: width(context),
                              height: double.infinity,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(),
                              /*Center(
                      child: CircularProgressIndicator(
                        */ /*valueColor: new AlwaysStoppedAnimation<Color>(ebonyClay),*/ /*
                      )),*/
                              errorWidget: (context, url, error) => Container(
                                height: 190 * screenWidthFactorRatio(context),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/home_bg.png"),
                                        fit: BoxFit.cover)),
                              ),
                            )
                          : FutureBuilder(
                              future: _initializeVideoPlayerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (_controller.value.isPlaying) {
                                          _controller.pause();
                                        } else {
                                          _controller.play();
                                        }
                                      });
                                    },
                                    child: Center(
                                      child: AspectRatio(
                                        aspectRatio:
                                            _controller.value.aspectRatio,
                                        child: VideoPlayer(_controller),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                    ),
                  ),
                  Positioned(
                    left: 6,
                    top: 6,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircularAvatar(
                          imageWidth: 65,
                          imageHeight: 65,
                        ),
                        SizedBox(width: 8),
                        Text(
                          post.user.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        // SizedBox(width: 24),
                        // Icon(
                        //   Icons.rate_review,
                        //   color: carrotOrange,
                        //   size: 20,
                        // ),
                        // SizedBox(width: 6),
                        // Icon(
                        //   Icons.data_usage,
                        //   color: Colors.white,
                        //   size: 20,
                        // )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width(context) - 28,
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                post.gameTitle ?? "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.googleWallet,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.warning_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    FontAwesomeIcons.expand,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          child: Container(
                            width: width(context) - 23,
                            padding: EdgeInsets.only(
                                left: 8, right: 8, top: 16, bottom: 16),
                            decoration: BoxDecoration(
                              //color: Colors.transparent,
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    borderGradients[colorIndex]
                                        .first
                                        .withOpacity(0.5),
                                    Colors.black87,
                                  ]),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        post.title ?? "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        post.description ?? "",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style: TextStyle(
                                          color: galleryGrey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Flexible(
                                    flex: 1,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              post.views.toString() ?? "",
                                              style: TextStyle(
                                                color: galleryGrey,
                                                fontWeight: FontWeight.w800,
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Icon(
                                              Icons.visibility,
                                              color: galleryGrey,
                                              size: 16,
                                            )
                                          ],
                                        ),
                                        Icon(
                                          Icons.favorite_border,
                                          color: post.likes > 0
                                              ? carrotOrange
                                              : baliGrey,
                                          size: 30,
                                        ),
                                        Text(
                                          post.likes.toString() ?? "",
                                          style: TextStyle(
                                            color: galleryGrey,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Icon(
                                          FontAwesomeIcons.comment,
                                          color: galleryGrey,
                                          size: 30,
                                        ),
                                        Text(
                                          post.comments.length.toString() ?? "",
                                          style: TextStyle(
                                            color: galleryGrey,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

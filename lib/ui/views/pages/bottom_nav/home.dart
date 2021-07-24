import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot/core/constants/app_constants.dart';
import 'package:slinkshot/core/models/post.dart';
import 'package:slinkshot/core/viewmodel/post_view_model.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';
import 'package:slinkshot/ui/views/widgets/loading_background.dart';
import 'package:slinkshot/ui/views/widgets/items/post_item.dart';

class Home extends StatefulWidget {
  const Home({key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedTitle = "All";
  bool isLoading = true;
  double _opacity = 0;

  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 3),
        () => setState(() {
              isLoading = false;
            }));
    Future.delayed(
        Duration(seconds: 4),
        () => setState(() {
              isLoading = false;
              _opacity = 1;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? LoadingBackground()
        : AnimatedOpacity(
            duration: Duration(milliseconds: 1000),
            opacity: _opacity,
            curve: Curves.easeInQuad,
            child: Consumer<PostViewModel>(
                builder: (context, postViewModel, child) => Container(
                      height: height(context),
                      width: width(context),
                      color: bunkerBlack,
                      child: Column(
                        children: [
                          //SafeArea(child: Text("data", style: TextStyle(color: Colors.white),))
                          SafeArea(
                            child: Container(
                              height: 60,
                              padding:
                                  EdgeInsets.only(top: 16, bottom: 16, left: 8),
                              width: width(context),
                              color: bunkerBlack,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    InkWell(
                                        child: buildSizeContainer(
                                            "All", postViewModel)),
                                    InkWell(
                                        child: buildSizeContainer(
                                            "Followed", postViewModel)),
                                    InkWell(
                                        child: buildSizeContainer(
                                            "Mortal Kombat", postViewModel)),
                                    InkWell(
                                        child: buildSizeContainer(
                                            "Apex Legends", postViewModel)),
                                  ]),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: postViewModel.tempList.length,
                              itemBuilder: (BuildContext context, int index) {
                                Post post = postViewModel.tempList[index];
                                return PostItem(post);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                    height:
                                        16 * screenWidthFactorRatio(context));
                              },
                            ),
                          )
                        ],
                      ),
                    )),
          );
  }

  Widget buildSizeContainer(String title, PostViewModel postViewModel) {
    return InkWell(
      onTap: () {
        setState(() => selectedTitle = title);
        postViewModel.filterPost(title);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 36),
        margin: EdgeInsets.only(right: 6, left: 6),
        decoration: BoxDecoration(
            color: selectedTitle == title ? carrotOrange : bunkerBlack,
            borderRadius: BorderRadius.circular(24),
            border: selectedTitle == title
                ? null
                : Border.all(color: galleryGrey, width: 1.3)),
        child: Text(
          title,
          style: TextStyle(color: galleryGrey, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:slinkshot/core/constants/app_constants.dart';
import 'package:slinkshot/core/utils/mock_data.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';
import 'package:slinkshot/ui/views/widgets/circular_avatar.dart';
import 'package:slinkshot/ui/views/widgets/loading_background.dart';
import 'package:slinkshot/ui/views/widgets/header/profile_header.dart';

class Profile extends StatefulWidget {
  const Profile({ Key key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  bool isLoading = true;
  double _opacity = 0;

  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 3), () => setState((){
            isLoading = false;
        }));
    Future.delayed(
        Duration(seconds: 4), () => setState((){
            isLoading = false;
            _opacity = 1;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? LoadingBackground() : AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: _opacity,
      curve: Curves.easeInQuad,
      child: Container(
        width: width(context),
        height: height(context),
        decoration: BoxDecoration(color: bunkerBlack),
        child: Column(
          children: [
            ProfileHeader(),
            Expanded(
              child: SingleChildScrollView(
                 child: Container(
                   width: width(context),
                   padding: EdgeInsets.only(top: 12, bottom: 16, left: 24, right: 24),
                   child: Column(
                      children: [
                        CircularAvatar(
                          imageHeight: 180,
                          imageWidth: 180,
                          imageUrl:
                              "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
                        ),
                        SizedBox(height: 30 * screenWidthFactorRatio(context)),
                        Text("Emmanuel (Amax)",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          )
                        ),
                        SizedBox(height: 8 * screenWidthFactorRatio(context)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildProfileButton(title: "Edit Profile", horizPadding: 24 * screenHeightFactorRatio(context)),
                            SizedBox(width: 8),
                            buildProfileButton(icon: Icons.send, horizPadding: 24 * screenHeightFactorRatio(context)),
                            SizedBox(width: 8,),
                            buildProfileButton(title: "BADGE", horizPadding: 12 * screenHeightFactorRatio(context))
                          ],
                        ),
                        SizedBox(height: 8),
                        InkWell(
                          onTap: () {
                            print("Create your first slinkshot");
                          },
                          child: Container(
                            // alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                            margin: EdgeInsets.only(right: 27, left: 27),
                            decoration: BoxDecoration(
                                gradient: new LinearGradient(
                                  colors: [
                                    Color(0xff973279),
                                    clayBlack,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(24)),
                               // border: Border.all(color: Colors.purple, width: 3)),
                                child: ClipRRect(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: bunkerBlack,
                                      borderRadius: BorderRadius.circular(24)
                                    ),
                                    child: Text(
                                      "Create your first slinkshot",
                                      style: TextStyle(
                                          color: galleryGrey, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: width(context),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildProfileStats("Followers", "0"),
                              buildProfileStats("Connections", "0"),
                              buildProfileStats("Slinkshots", "0")
                            ],
                          ),
                        ),
                        SizedBox(height: 3),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bio:",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              )
                            ),
                            SizedBox(height: 8),
                            Text(
                              descriptionText,
                              style: TextStyle(
                                color: galleryGrey,
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              )
                            ),
                          ],
                        )
                      ],
                   ),
                 ),
              )
            ),
          ],
        ),
      ),
    );

    //return Text("data");
  }

  Widget buildProfileButton({String title, IconData icon, double horizPadding}) {
    return InkWell(
      onTap: () {
        title == null ? print(title) : print("send icon pressed");
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: horizPadding, vertical: 12),
        decoration: BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Color(0xff973279),
                  clayBlack,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                ),
            borderRadius: BorderRadius.circular(24)),
        child: title != null
            ? Text(
                title,
                style:
                    TextStyle(
                      color: galleryGrey, 
                      fontWeight: FontWeight.bold,
                      fontSize: 12 * screenWidthFactorRatio(context)
                    ),
              )
            : Icon(
                icon,
                size: 20,
                color: galleryGrey,
              ),
      ),
    );
  }

  Widget buildProfileStats(String statTitle, String statCount) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(statCount,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            )),
        SizedBox(height: 1),
        Text(statTitle,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ))
      ],
    );
  }
}

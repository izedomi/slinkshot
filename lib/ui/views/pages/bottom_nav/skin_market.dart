import 'package:flutter/material.dart';
import 'package:slinkshot/core/constants/app_constants.dart';
import 'package:slinkshot/core/models/season.dart';
import 'package:slinkshot/core/models/skin.dart';
import 'package:slinkshot/core/utils/mock_data.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';
import 'package:slinkshot/ui/views/widgets/loading_background.dart';
import 'package:slinkshot/ui/views/widgets/items/season_item.dart';
import 'package:slinkshot/ui/views/widgets/items/skin_item.dart';
import 'package:slinkshot/ui/views/widgets/header/skin_market_header.dart';

class SkinMarket extends StatefulWidget {
  const SkinMarket({Key key}) : super(key: key);

  @override
  _SkinMarketState createState() => _SkinMarketState();
}

class _SkinMarketState extends State<SkinMarket> {
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
            child: Container(
              width: width(context),
              height: height(context),
              decoration: BoxDecoration(color: bunkerBlack),
              child: seasons.length > 0
                  ? Column(
                      children: [
                        SkinMarketHeader(),
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(children: children(seasons)),
                        )),
                        //Expanded(child: ListView(children: children(seasons))),
                      ],
                    )
                  : Center(
                      child: Text("No skins currently available"),
                    ),
            ),
          );
  }

  List<Widget> children(List<Season> seasonList) {
    List<Widget> content = [];
    seasonList = seasonList.reversed.toList();

    content.add(stats());

    for (int i = 0; i < seasonList.length; i++) {
      Season season = seasonList[i];
      content.add(SeasonItem(season));
      content.add(SizedBox(
        height: 16,
      ));
    }

    return content;
  }

  Widget stats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("700",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    letterSpacing: -1)),
            SizedBox(width: 3),
            Image.asset(
              'assets/images/price.PNG',
              height: 30,
              fit: BoxFit.cover,
            ),
          ],
        ),
        SizedBox(height: 3),
        Text("Owned slinkcoin",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: -1)),
        SizedBox(height: 42 * screenWidthFactorRatio(context)),
      ],
    );
  }
}

class SkinSearch extends SearchDelegate<Skin> {
  final TextStyle searchFieldStyle = TextStyle(color: baliGrey, fontSize: 14);
  final String searchFieldLabel = "Seach for skins";
  
  SkinSearch({searchFieldStyle, searchFieldLabel})
      : super(
            searchFieldStyle: searchFieldStyle,
            searchFieldLabel: searchFieldLabel);

  @override
  ThemeData appBarTheme(BuildContext context) {

    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: bunkerBlack,
        brightness: Brightness.dark,
        elevation: 0,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white, 
            fontSize: 18
          )
      ),
    ));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return query.isNotEmpty
        ? [
            IconButton(
                icon: Icon(Icons.clear, color: mercuryGrey,),
                onPressed: () {
                  query = "";
                })
          ]
        : null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back, color: mercuryGrey,),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final sortedSkins = query.isEmpty
        ? []
        : skins
            .where((skin) =>
                skin.title.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return sortedSkins.isEmpty
        ? Container(color: bunkerBlack)
        : Container(
            color: bunkerBlack,
            padding: EdgeInsets.symmetric(vertical: 12),
            child: ListView.separated(
              itemCount: sortedSkins.length,
              itemBuilder: (BuildContext context, int index) {
                Skin skin = sortedSkins[index];
                return SkinItem(skin);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: baliGrey,
                    height: 3,
                    indent: 8,
                    endIndent: 8,
                  ),
                );
              },
            ),
          );
  }
}

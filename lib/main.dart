import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:slinkshot/ui/shared/app_colors.dart';


import 'locator.dart';
import 'ui/views/pages/landing.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            // appBarTheme: Theme.of(context)
            //     .appBarTheme
            //     .copyWith(brightness: Brightness.dark),
          primarySwatch: Colors.grey,
          textTheme: TextTheme(
            headline6: TextStyle(color: galleryGrey, fontSize: 14)
          ),
          fontFamily: "TTNorms"
        ),
        home: Landing(),
      ),
    );
  }
}

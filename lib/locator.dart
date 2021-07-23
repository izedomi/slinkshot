
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:slinkshot/core/viewmodel/bottom_nav_model.dart';
import 'core/viewmodel/post_view_model.dart';





GetIt locator = GetIt.instance;

void setupLocator() {

/// register services
  //locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  //locator.registerLazySingleton<LocalNotificationService>(() => LocalNotificationService());

/// register models
  locator.registerFactory<BottomNavModel>(() => BottomNavModel());

}

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BottomNavModel()),
  ChangeNotifierProvider(create: (_) => PostViewModel()),
];
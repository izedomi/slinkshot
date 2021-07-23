import 'package:slinkshot/core/models/skin.dart';

class User {
  int id;
  String name;
  int slinkshots;
  Skin skin;
  int followers;
  int connections;

  User({
    this.id,
    this.name,
    this.slinkshots = 0,
    this.skin,
    this.followers = 0,
    this.connections = 0
  });

 
}

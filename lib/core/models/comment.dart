import 'package:slinkshot/core/models/user.dart';

class Comment {
  int id;
  String comment;
  User user;

  Comment({
      this.id,
      this.comment,
      this.user
  });
}

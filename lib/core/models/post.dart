import 'package:slinkshot/core/models/comment.dart';
import 'package:slinkshot/core/models/format.dart';
import 'package:slinkshot/core/models/user.dart';

class Post {
  int id;
  String title;
  String description;
  String contentUrl;
  String gameTitle;
  int views;
  int likes;
  List<Comment> comments;
  Format format;
  User user;

  Post(
      {this.id,
      this.title,
      this.description,
      this.contentUrl,
      this.gameTitle,
      this.views = 0,
      this.likes = 0,
      this.comments,
      this.format,
      this.user});
}

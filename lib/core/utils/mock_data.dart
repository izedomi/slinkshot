import 'package:slinkshot/core/models/comment.dart';
import 'package:slinkshot/core/models/format.dart';
import 'package:slinkshot/core/models/post.dart';
import 'package:slinkshot/core/models/skin.dart';
import 'package:slinkshot/core/models/season.dart';
import 'package:slinkshot/core/models/user.dart';


User currentUser = User(
    id: 2,
    name: "Nikita",
    slinkshots: 1,
    skin: skins[0],
    followers: 7,
    connections: 3
);

List<User> users = [
  User(
    id: 1,
    name: "AusTrok",
    skin: skins[0],
  ),
  User(
      id: 2,
      name: "Nikita",
      slinkshots: 1,
      skin: skins[0],
      followers: 7,
      connections: 3),
  User(
      id: 3,
      name: "Norky",
      slinkshots: 7,
      skin: skins[0],
      followers: 30,
      connections: 90),
];

List<Skin> skins = [
  Skin(
    id: 0,
    title: "Amax",
    price: 600,
    image:
        "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
    description: descriptionText
  ),
  Skin(
    id: 1,
    title: "Fiku96",
    price: 750,
    image:
        "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
    description: descriptionText
  ),
  Skin(
    id: 2,
    title: "Zkad",
    price: 1200,
    image:
        "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
    description: descriptionText
  ),
   Skin(
      id: 3,
      title: "Zed",
      price: 200,
      image:
          "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      description: descriptionText
    ),
    Skin(
      id: 4,
      title: "Fafa",
      price: 940,
      image:
          "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      description: descriptionText
    ),
    Skin(
      id: 5,
      title: "Zeus",
      price: 50,
      image:
          "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      description: descriptionText
    ),
];

List<Comment> comments = [
  Comment(id: 1, comment: "You rock bro", user: users[2]),
  Comment(id: 2, comment: "I'm king no doubt", user: users[0]),
  Comment(id: 3, comment: "You killing it....", user: users[1])
];

List<Format> formats = [
  Format(id: 1, type: "Video"),
  Format(id: 2, type: "Photo")
];

List<Season> seasons = [
  Season(id: 1, title: "Season 1", skins: [
    Skin(
      id: 0,
      title: "Amax",
      price: 600,
      image:
          "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      description: descriptionText
    ),
    Skin(
      id: 1,
      title: "Fiku96",
      price: 750,
      image:
          "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      description: descriptionText
    ),
    Skin(
      id: 2,
      title: "Zkad",
      price: 1200,
      image:
          "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      description: descriptionText
    ),
  ]),
  Season(id: 2, title: "Season 2", skins: [
    Skin(
      id: 3,
      title: "Zed",
      price: 200,
      image:
          "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      description: descriptionText
    ),
    Skin(
      id: 4,
      title: "Fafa",
      price: 940,
      image:
          "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      description: descriptionText
    ),
    Skin(
      id: 5,
      title: "Zeus",
      price: 50,
      image:
          "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      description: descriptionText
    ),
  ])
];

List<Post> posts = [
  Post(
      id: 0,
      title: "The king of the sentinel",
      description: "I deserve this crown. what do you think?",
      contentUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      gameTitle: "Mortal Kombat",
      views: 4,
      likes: 2,
      comments: comments,
      format: formats[0],
      user: users[2]),
  Post(
      id: 1,
      title: "The king of the sentinel",
      description: "I deserve this crown. what do you think?",
      contentUrl:
          "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      gameTitle: "Apex Legends",
      comments: comments,
      format: formats[1],
      user: users[0]),
  Post(
      id: 2,
      title: "Te Amo",
      description: "I deserve this crown. what do you think?",
      contentUrl: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      gameTitle: "Apex Legends",
      views: 41,
      likes: 29,
      comments: comments,
      format: formats[0],
      user: users[1]),
  Post(
      id: 3,
      title: "The king is here",
      description:
          "Undisputed champions rocking as never before. Gypsy king is back indeed",
      contentUrl:
          "https://resizing.flixster.com/AxFdO4BGadAbNf6YtVO6sZoJd0s=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/591658/591658_v9_bb.jpg",
      gameTitle: "Mortal Kombat",
      comments: comments,
      format: formats[1],
      user: users[0]),
];

String descriptionText =
    "I’m very passionate about what I do and constantly seek a challenging and exciting environment: an environment where I can learn, grow, add value and be a part of a team architecting innovative applications geared at solving clients’ challenges. The current job role and its responsibilities proposes such an exciting environment and I would love to be part of such an exciting team. The Slinkshot team fits into the ideal team I would love to be a part of- a team with values benchmarked on creating high-quality code – robust, scalable, and testable.";

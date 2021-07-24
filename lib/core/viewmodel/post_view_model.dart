import 'package:flutter/cupertino.dart';
import 'package:slinkshot/core/enums/viewstate.dart';
import 'package:slinkshot/core/models/post.dart';
import 'package:slinkshot/core/utils/mock_data.dart';

class PostViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Busy;
  List<Post> postList = posts;
  List<Post> tempList = posts;

  //getters
  ViewState get viewState => _viewState;

  //setters
  void setViewState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }

  void filterPost(String queryString) async {
    print(queryString);

    tempList = [];
    setViewState(ViewState.Busy);

    if (queryString.toLowerCase() == "all") {
      posts.forEach((post) {
        tempList.add(post);
      });
    } else {
      tempList = [];
      tempList = posts
          .where((post) =>
              post.gameTitle.toLowerCase() == queryString.toLowerCase())
          .toList();
      print("oeowoe");
    }
    setViewState(ViewState.Idle);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:using_provider/models/post.dart';

class HomePageProvider extends ChangeNotifier {
  bool _isProcessing = true;
  bool get isProcessing => _isProcessing;
  setIsProcessing(bool value) {
    _isProcessing = value;
    notifyListeners();
  }

  List<Post>? _postList = [];
  List<Post>? get postList => _postList;
  setPostList(List<Post>? post) {
    _postList = post;
    notifyListeners();
  }

  Post getPostByIndex(int index) => _postList![index];
}

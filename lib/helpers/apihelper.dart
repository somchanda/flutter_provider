import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:using_provider/models/httpresponse.dart';
import 'package:using_provider/models/post.dart';

class APIHelper {
  static Future<HTTPResponse<List<Post>>> getPosts(
      {int limit = 20, int page = 1}) async {
    String url =
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page';
    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        List<Post> postList = [];
        body.forEach((e) {
          Post post = Post.fromJson(e);
          postList.add(post);
        });
        return HTTPResponse(true, postList, responseCode: response.statusCode);
      } else {
        return HTTPResponse(false, null,
            message: "Invalid response from server please try again!");
      }
    } on SocketException {
      return HTTPResponse(false, null,
          message: 'Unable to reach the internet please wait a minut');
    } on FormatException {
      return HTTPResponse(false, null,
          message:
              "Invalid response from the server please try again in a minute or two");
    } catch (e) {
      return HTTPResponse(false, null,
          message: 'Something went wrong please try again' + e.toString());
    }
  }
}

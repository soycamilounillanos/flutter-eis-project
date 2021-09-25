import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:my_doggy/model/Comment.model.dart';
import 'package:my_doggy/model/ErrorResponse.model.dart';
import 'package:my_doggy/model/ListModel.model.dart';
import 'package:my_doggy/model/Post.model.dart';
import 'package:my_doggy/model/User.model.dart';
import 'package:my_doggy/model/UserProfile.model.dart';

class MyDoggy {
  final String _appID = "6145fd89872d3f7d8fbd4e31";
  final String _host = "dummyapi.io";
  final String _path = "/data/v1";

  Future<http.Response> _get(String path,
      [Map<String, dynamic>? queryParameters]) async {
    var endpoint = "$_path$path";
    var url = Uri.https(_host, endpoint,{"limit":"6"});
    var response = await http.get(url, headers: {"app-id": _appID});
    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}.');
      throw ErrorResponse(
          response.statusCode, endpoint, "Error request MyDoggy");
    }
    return response;
  }

  getUserProfile(String userId) async {
    var response = await _get("/user/$userId");
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var userProfile = UserProfile.fromJson(jsonResponse);
    return userProfile;
  }

  getUsersList() async {
    var response = await _get("/user");

    List<User> user = [];
    var list = _getList(response.body);
    list.data.forEach((value) => user.add(User.fromJson(value)));

    return user;
  }

  Future<List<Post>>getPostsList({int limit = 10, int page = 0}) async {
    var response = await _get("/post");

    List<Post> post = [];
    var list = _getList(response.body);
    list.data.forEach((value) => post.add(Post.fromJson(value)));

    return post;
  }

  getUserPost(String userId) async {
    var response =
        await _get("/user/$userId/post");

    List<Post> post = [];
    var list = _getList(response.body);
    list.data.forEach((value) => post.add(Post.fromJson(value)));

    return post;
  }

  getCommentsList(String postId) async {
    var response =
        await _get("/post/$postId/comment");

    List<Comment> comment = [];
    var list = _getList(response.body);
    list.data.forEach((value) => comment.add(Comment.fromJson(value)));

    return comment;
  }

  getTagList() async {
    var response = await _get("/tag");

    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    List<String> tags = jsonResponse['data'];

    return tags;
  }

  getPostbyTag(String tag) async {
    var response = await _get("/tag/$tag/post");

    List<Post> post = [];
    var list = _getList(response.body);
    list.data.forEach((value) => post.add(Post.fromJson(value)));

    return post;
  }

  ListModel _getList(String body) {
    var jsonResponse = convert.jsonDecode(body) as Map<String, dynamic>;
    ListModel list = ListModel.fromJson(jsonResponse);

    return list;
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vrg_rebbit/model/post_model.dart';

class PostProvider {
  Future<List<PostModel>> fetchPosts(String subreddit) async {
    final String url = 'https://www.reddit.com/$subreddit.json';

    final Uri ur = Uri.parse(url);
    final response = await http.get(ur);
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      final Posts posts = Posts.fromJson(decodeData);
      return posts.posts;
    } else {
      throw Exception('Posts could not be loaded');
    }
  }
}

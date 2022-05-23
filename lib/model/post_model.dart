import 'package:number_display/number_display.dart';
import 'package:vrg_rebbit/model/date_post.dart';

class Posts {
  List<PostModel> posts = [];
  Posts.fromJson(dynamic json) {
    json = json['data']['children'];
    if (json == null) return;
    for (var item in json) {
      final post = new PostModel.fromJsonMap(item['data']);
      posts.add(post);
    }
  }
}

class PostModel extends DatePost {
  PostModel.fromJsonMap(Map<String, dynamic> json) {
    title = json['title'];
    subreddit = json['subreddit_name_prefixed'];
    author = json['author'];
    ups = createDisplay(length: 4)(json['ups']);
    url = json['url'];
    numComments = createDisplay(length: 4)(json['num_comments']);

    if (isImage(json)) {
      imageUrl = json['url_overridden_by_dest'];
    } else {
      imageUrl =
          'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg';
    }
  }

  bool isImage(json) {
    final String url = json['url_overridden_by_dest'];
    if (url == null) return false;

    final List<String> list = url.split('.');
    final String fileType = list[list.length - 1];
    final validType = ['jpg', 'png', 'jpeg', 'gif', 'webp', 'bmp', 'wbmp'];

    for (var type in validType)
      if (type.toLowerCase() == fileType.toLowerCase()) return true;

    return false;
  }
}

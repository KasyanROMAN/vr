import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vrg_rebbit/model/post_model.dart';

import 'package:vrg_rebbit/providers/post_Provider.dart';
import 'package:vrg_rebbit/widgets/Post.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostProvider _postProvider = new PostProvider();
  late Future<List<PostModel>> _posts;
  late String subreddit;

  @override
  Widget build(BuildContext context) {
    _posts = _postProvider.fetchPosts(subreddit);

    return Scaffold(
      body: _getAllPosts(),
    );
  }

  Widget _appBar() {
    return AppBar(
      toolbarHeight: kToolbarHeight + 10.0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vrg',
            style: TextStyle(color: Colors.black87),
          ),
          Text(
            subreddit,
            style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
            overflow: TextOverflow.fade,
          )
        ],
      ),
      leading: Container(
        margin: EdgeInsets.all(3.0),
        child: Image(
          image: AssetImage('assets/img/logo.png'),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _getAllPosts() {
    return FutureBuilder(
      future: _posts,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          final posts = asyncSnapshot.data;
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Post(
                    post: posts.post,
                  );
                }),
          );
        } else {
          return SpinKitPulse(
            color: Colors.orange[900],
            size: 50.0,
          );
        }
      },
    );
  }

  Future<void> _refresh() async {
    List<PostModel> newPosts = await _postProvider.fetchPosts(subreddit);
    setState(() {
      _posts = Future.value(newPosts);
    });
  }
}

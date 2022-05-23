import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'package:vrg_rebbit/model/post_model.dart';

class Post extends StatelessWidget {
  final PostModel post;

  Post({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _header(),
              SizedBox(
                height: 10.0,
              ),
              _body(),
              _footer(),
            ],
          ),
        ));
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          post.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'Posted by ${post.author}',
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }

  Widget _body() {
    return Container(
      child: FadeInImage(
        image: NetworkImage(
          post.imageUrl,
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _footer() {
    return Row(
      children: <Widget>[
        OutlinedButton(
          child: Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.arrow_drop_up_sharp),
                Text(post.ups),
                Icon(Icons.arrow_drop_down_sharp)
              ],
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: null,
        ),
        SizedBox(
          width: 6.0,
        ),
        OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {},
            icon: Icon(Icons.mode_comment_sharp),
            label: Text(
              '${post.numComments}',
              overflow: TextOverflow.ellipsis,
            )),
        SizedBox(
          width: 6.0,
        ),
        OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () => Share.share(post.url),
            icon: Icon(Icons.share),
            label: Text('Share')),
      ],
    );
  }
}

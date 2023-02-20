import 'package:flutter/material.dart';
import 'package:flutter_blog/const/color.dart';
import 'package:flutter_blog/model/content.dart';

class ContentContainer extends StatelessWidget {
  final Post post;
  const ContentContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  final ts = const TextStyle(
    color: bgColor,
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: outSideColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title,
            style: ts,
          ),
          const SizedBox(height: 10.0),
          Wrap(
            children: [
              Text(
                post.content,
                style: ts.copyWith(fontSize: 13.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

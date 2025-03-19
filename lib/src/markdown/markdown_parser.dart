import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_editor_plus/markdown_editor_plus.dart';
import '../utils/format.dart';
import '../utils/functions.dart';

class MarkdownParser extends StatelessWidget {
  final String data;
  const MarkdownParser({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MarkdownParse(
      data: data,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      bulletBuilder: (parameters) {
        return const Icon(Icons.circle, size: 10);
      },
      onTapLink: (text, href, title) {
        launchURL(href!);
      },
      styleSheet: MarkdownStyleSheet(
        p: bodyStyle,
        listBullet: bodyStyle,
        h1: titleStyle,
        h2: headerStyle,
        h3: subheaderStyle,
      ),
    );
  }
}

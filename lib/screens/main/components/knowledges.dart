import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Knowledges extends StatelessWidget {
  const Knowledges({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding),
          child: Text(
            "Knowledges",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const KnowledgeText(text: "Solidworks, Autocad"),
        const KnowledgeText(text: "Keyshot, Blender, photoview 360"),
        const KnowledgeText(text: "Anykind operation with Python"),
        const KnowledgeText(text: "Selenium, Beautifullsoup, Appium"),
        const KnowledgeText(text: "OpenCv, Yolo"),
        const KnowledgeText(text: "Flutter, Dart"),
        const KnowledgeText(text: "GIT Knowledge"),
        const KnowledgeText(text: "Canva, Powerpoint, MS word, Excel"),

      ],
    );
  }
}

class KnowledgeText extends StatelessWidget {
  const KnowledgeText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/check.svg"),
          const SizedBox(width: defaultPadding / 2),
          Text(text),
        ],
      ),
    );
  }
}
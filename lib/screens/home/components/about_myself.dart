import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class AboutMyself extends StatelessWidget {
  const AboutMyself({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // About Me heading
        Text(
          "About Me",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: defaultPadding),
        // About Me content
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "As a dedicated and passionate professional in the fields of mechanical design and software development, "
            "I bring a unique blend of engineering and IT expertise to the table. I thrive on solving complex problems and driving innovation. "
            "With a strong foundation in mechanical engineering from Khulna University of Engineering and Technology (KUET) and a continuous drive for learning and development, I am always seeking new opportunities to collaborate and contribute to innovative projects. Let's connect and explore how we can advance technological solutions together.",
            style: TextStyle(color: bodyTextColor), textAlign: TextAlign.justify,

          ),
        ),
        const SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
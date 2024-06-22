import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_profile/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isMobile(context) ? 1.6 : 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/bg.jpg",
            fit: BoxFit.cover,
          ),
          Container(color: darkColor.withOpacity(0.66)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Discover my Amazing \nArt Space!",
                  style: Responsive.isDesktop(context)
                      ? Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )
                      : Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                const MyBuildAnimatedText(),
                const SizedBox(height: defaultPadding),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildButton(
                      context: context,
                      icon: CupertinoIcons.chat_bubble_fill,
                      label: "WhatsApp",
                      onPressed: () async {
                        var whatsappUrl = "https://wa.me/8801315669261";
                        if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                          await launchUrl(Uri.parse(whatsappUrl));
                        } else {
                          throw 'Could not launch $whatsappUrl';
                        }
                      },
                    ),
                    _buildButton(
                      context: context,
                      icon: CupertinoIcons.mail,
                      label: "Email",
                      onPressed: () async {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'gazi.faysal.jubayer@gmail.com',
                          query: encodeQueryParameters(<String, String>{
                            'subject': 'Subject of email',
                            'body': 'Body of email',
                          }),
                        );

                        if (await canLaunchUrl(emailLaunchUri)) {
                          await launchUrl(emailLaunchUri);
                        } else {
                          throw 'Could not launch $emailLaunchUri';
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    final bool isMobile = Responsive.isMobileLarge(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 12 : defaultPadding * 2,
          vertical: isMobile ? 12 : defaultPadding,
        ),
        backgroundColor: primaryColor,
        foregroundColor: darkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isMobile ? 20 : 8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: isMobile ? 24 : 20),
          if (!isMobile) ...[
            const SizedBox(width: 8),
            Text(label),
          ],
        ],
      ),
    );
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

class MyBuildAnimatedText extends StatefulWidget {
  const MyBuildAnimatedText({super.key});

  @override
  _MyBuildAnimatedTextState createState() => _MyBuildAnimatedTextState();
}

class _MyBuildAnimatedTextState extends State<MyBuildAnimatedText> {
  String currentText = "Solidworks";

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.subtitle1!,
      child: Row(
        children: [
          if (!Responsive.isMobileLarge(context))
            FlutterCodedText(text: currentText),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: defaultPadding / 2),
          const Text(""),
          Responsive.isMobile(context)
              ? Expanded(child: AnimatedText(onTextChanged: _updateCurrentText))
              : AnimatedText(onTextChanged: _updateCurrentText),
          if (!Responsive.isMobileLarge(context))
            const SizedBox(width: defaultPadding / 2),
          if (!Responsive.isMobileLarge(context))
            FlutterCodedText(text: currentText),
        ],
      ),
    );
  }

  void _updateCurrentText(String newText) {
    setState(() {
      switch (newText) {
        case "I make comprehensive 3D part, step & assembly designs.":
          currentText = "Autocad";
          break;
        case "I draft your plans into 2D and 3D design.":
          currentText = "Python";
          break;
        case "I scrap data from websites.":
          currentText = "OpenCV";
          break;
        case "I do interesting projects of Computer Vision.":
          currentText = "Solidworks";
          break;
        default:
          currentText = "Solidworks";
      }
    });
  }
}

class AnimatedText extends StatelessWidget {
  final Function(String) onTextChanged;

  const AnimatedText({
    super.key,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      onNext: (index, isLast) {
        String nextText = _getTextByIndex(index);
        onTextChanged(nextText);
      },
      animatedTexts: [
        TyperAnimatedText(
          "I make comprehensive 3D part, step & assembly designs.",
          speed: const Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "I draft your plans into 2D and 3D design.",
          speed: const Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "I scrap data from websites.",
          speed: const Duration(milliseconds: 60),
        ),
        TyperAnimatedText(
          "I do interesting projects of Computer Vision.",
          speed: const Duration(milliseconds: 60),
        ),
      ],
    );
  }

  String _getTextByIndex(int index) {
    switch (index) {
      case 0:
        return "I make comprehensive 3D part, step & assembly designs.";
      case 1:
        return "I draft your plans into 2D and 3D design.";
      case 2:
        return "I scrap data from websites.";
      case 3:
        return "I do interesting projects of Computer Vision.";
      default:
        return "";
    }
  }
}

class FlutterCodedText extends StatelessWidget {
  final String text;

  const FlutterCodedText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "<",
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(color: primaryColor),
          ),
          const TextSpan(text: ">"),
        ],
      ),
    );
  }
}

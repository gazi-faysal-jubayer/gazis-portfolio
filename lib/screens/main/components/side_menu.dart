import 'package:flutter/material.dart';
import 'package:portfolio_profile/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';

import 'area_info_text.dart';
import 'education.dart';
import 'knowledges.dart';
import 'my_info.dart';
import 'contact_info.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const MyInfo(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    // const AreaInfoText(
                    //   title: "Residence",
                    //   text: "Bangladesh",
                    // ),
                    // const AreaInfoText(
                    //   title: "City",
                    //   text: "Khulna",
                    // ),
                    // AreaInfoText(
                    //   title: "Age",
                    //   text: "${DateTime.now().year - 2002}",
                    // ),
                    const ContactInfo(),
                    const SizedBox(height: defaultPadding),
                    const Education(),
                    const Knowledges(),
                    const Divider(),
                    const SizedBox(height: defaultPadding / 2),

                    TextButton(
                      onPressed: () async {
                        final ByteData data = await rootBundle.load('assets/images/My Cv.pdf');
                        final Directory tempDir = await getTemporaryDirectory();
                        final File tempFile = File('${tempDir.path}/Cv-gazi-faysal-jubayer.pdf');
                        await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);

                        final url = Uri.parse('file://${tempFile.path}');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          // Handle error - unable to launch URL
                          print('Could not launch $url');
                        }
                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "DOWNLOAD CV",
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyText1!.color,
                              ),
                            ),
                            const SizedBox(width: defaultPadding / 2),
                            SvgPicture.asset("assets/icons/download.svg")
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: defaultPadding),
                      color: const Color(0xFF24242E),
                      child: Row(
                        children: [
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/icons/linkedin.svg"),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/icons/github.svg"),
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: SvgPicture.asset("assets/icons/grabcad.svg"),
                          // ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/icons/twitter.svg"),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

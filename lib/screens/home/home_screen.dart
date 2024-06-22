import 'package:flutter/material.dart';
import 'package:portfolio_profile/screens/home/components/about_myself.dart';
import 'package:portfolio_profile/screens/main/main_screen.dart';

import 'components/heighlights.dart';
import 'components/home_banner.dart';
import 'components/my_projects.dart';
import 'components/recommendations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      children: [
        HomeBanner(),
        HighLightsInfo(),
        AboutMyself(),
        MyProjects(),
        Recommendations(),
      ],
    );
  }
}

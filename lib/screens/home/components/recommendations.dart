import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_profile/models/Recommendation.dart';
import 'package:portfolio_profile/screens/home/components/recommendation_card.dart';

import '../../../constants.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({
    Key? key,
  }) : super(key: key);

  @override
  _RecommendationsState createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recommendations",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: defaultPadding),
          Scrollbar(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    _scrollController.position.moveTo(
                      _scrollController.offset - details.delta.dx,
                    );
                  },
                  child: Row(
                    children: List.generate(
                      demo_recommendations.length,
                          (index) => Padding(
                        padding: const EdgeInsets.only(right: defaultPadding),
                        child: RecommendationCard(
                          recommendation: demo_recommendations[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
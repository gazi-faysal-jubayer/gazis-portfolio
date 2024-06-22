import 'package:flutter/material.dart';
import '../../../constants.dart';

class Education extends StatelessWidget {
  const Education({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Education",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const EducationItem(
          degree: "B.Sc in Mechanical Engineering",
          institution: "Khulna University of Engineering and Technology",
          duration: "2023-Present",
          location: "Khulna",
        ),
        const SizedBox(height: defaultPadding),
        const EducationItem(
          degree: "Higher Secondary Certificate",
          institution: "Khulna Public College",
          duration: "2019-2021",
          location: "Khulna",
        ),
        const SizedBox(height: defaultPadding),
        const EducationItem(
          degree: "Secondary School Certificate",
          institution: "Rupapat B.C. High School",
          duration: "2017-2019",
          location: "Boalmari, Faridpur, Dhaka",
        ),
      ],
    );
  }
}

class EducationItem extends StatelessWidget {
  final String degree;
  final String institution;
  final String duration;
  final String location;

  const EducationItem({
    Key? key,
    required this.degree,
    required this.institution,
    required this.duration,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 15,
          height: 15,
          margin: const EdgeInsets.only(top: 5, right: defaultPadding),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                degree,
                style: const TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
              ),
              Text(institution, style: Theme.of(context).textTheme.titleSmall,),
              Text(duration, style: Theme.of(context).textTheme.titleSmall,),
              Text(location, style: Theme.of(context).textTheme.titleSmall,),
            ],
          ),
        ),
      ],
    );
  }
}
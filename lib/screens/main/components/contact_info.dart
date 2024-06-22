import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../constants.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Contact",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        ContactItem(
          icon: CupertinoIcons.phone,
          text: "+8801315669261",
        ),
        SizedBox(height: defaultPadding / 2),
        ContactItem(
          icon: CupertinoIcons.mail,
          text: "gazi.faysal.jubayer@gmail.com",
        ),
        SizedBox(height: defaultPadding / 2),
        ContactItem(
          icon: CupertinoIcons.link,
          text: "www.linkedin.com/in/gazi-faysal-jubayer",
        ),
        SizedBox(height: defaultPadding / 2),
        ContactItem(
          icon: CupertinoIcons.location,
          text: "9203 Khulna, Bangladesh",
        ),
      ],
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: primaryColor, size: 20),
        SizedBox(width: defaultPadding / 2),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ],
    );
  }
}

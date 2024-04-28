// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyTile extends StatelessWidget {
  const MyTile({
    Key? key,
    required this.maintitle,
    this.subtitle,
    required this.url,
  }) : super(key: key);
  final String maintitle;
  final String? subtitle;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 78,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
        child: ListTile(
          title: Text(maintitle),
          subtitle: Text(subtitle ?? ""),
          onTap: () async {
            if (await canLaunchUrl(Uri.parse(url!))) {
              await launchUrl(Uri.parse(url!));
            } else {
              throw 'Could not launch $url';
            }
          },
        ),
      ),
    );
  }
}

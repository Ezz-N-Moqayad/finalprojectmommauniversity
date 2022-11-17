import 'package:flutter/material.dart';

// ignore: camel_case_types
class widget_page_view extends StatelessWidget {
  const widget_page_view({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Color(0xff23203F),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 35,
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xff716F87),
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

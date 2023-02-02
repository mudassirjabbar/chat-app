import 'package:flutter/material.dart';

class TitleRichText extends StatelessWidget {
  const TitleRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: const TextSpan(children: [
            TextSpan(
              text: 'Create ',
              style: TextStyle(color: Color(0xFF140E25), fontSize: 24),
            ),
            TextSpan(
              text: 'Chat',
              style: TextStyle(color: Color(0xFF140E25), fontSize: 24),
            ),
            TextSpan(
              text: 'App ',
              style: TextStyle(color: Color(0xFF00D2AA), fontSize: 24),
            ),
            TextSpan(
              text: 'Account',
              style: TextStyle(color: Color(0xFF140E25), fontSize: 24),
            ),
          ]),
        ),
      ],
    );
  }
}

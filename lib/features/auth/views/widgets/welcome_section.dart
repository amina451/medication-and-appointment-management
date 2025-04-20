import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/widgets/sup_title_message_sceen.dart';
import 'package:pharmacy_app/features/auth/views/widgets/welcome_title.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 34),
        WelcomeTitle(),
        SizedBox(height: 12),
        SupTitleMessage(
          supTitle:
              'Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed do\neiusmod tempor incididunt ut labore et dolore magna aliqua. ',
        ),
        SizedBox(height: 47),
      ],
    );
  }
}

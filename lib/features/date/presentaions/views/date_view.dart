import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/date/presentaions/views/widgets/date_view_body.dart';

class DateView extends StatelessWidget {
  const DateView({super.key});

  static const routeName = "DateView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DateViewBody(),
    );
  }
}

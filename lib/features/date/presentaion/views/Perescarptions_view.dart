import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/date/presentaion/views/widgets/Perescarptions_view_body.dart';

class PerescarptionsView extends StatelessWidget {
  const PerescarptionsView({super.key});

  static const routeName = "DateView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PerescarptionsViewBody());
  }
}

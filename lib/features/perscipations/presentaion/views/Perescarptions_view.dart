import 'package:flutter/material.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/Perescarptions_view_body.dart';

class PerescarptionsView extends StatelessWidget {
  const PerescarptionsView({super.key});

  static const routeName = "PerescarptionsView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PerescarptionsViewBody());
  }
}

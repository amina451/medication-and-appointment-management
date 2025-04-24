import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/card_item_doctor.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/search_form.dart';

class DoctorsViewBody extends StatelessWidget {
  const DoctorsViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SearchForm(),
          const SizedBox(height: 20),
         Expanded(
           child: ListView.separated(itemBuilder: (context,index)=> CardItemDoctor(),
            separatorBuilder: (context,index)=>SizedBox(height: 10.h,), 
            itemCount: 10),
         )
        ],
      ),
    );
  }
}
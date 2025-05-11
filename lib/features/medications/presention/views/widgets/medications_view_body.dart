import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/core/widgets/card_item.dart';
import 'package:pharmacy_app/core/widgets/search_form.dart';

class MedicationsViewBody extends StatelessWidget {
  const MedicationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SearchForm(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemBuilder:
                  (context, index) => CardItem(
                    name: 'Pain Reliever',
                    spicility: index % 2 == 0 ? 'Pain Reliever' : 'Antibiotic',
                    address: "number : 1",
                    image: AppImages.assetsImagesMedication,
                    date: '5.30',
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_images.dart';
import 'package:pharmacy_app/core/widgets/card_item.dart';
import 'package:pharmacy_app/core/widgets/search_form.dart';

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
            child: ListView.separated(
              itemBuilder:
                  (context, index) => CardItem(
                    name: 'Dr. John',
                    specialty: 'Cardiologist',
                    address: 'Address : mascara',
                    image: AppImages.assetsImagesDrWata,
                    date: '12',
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/features/perscipations/domain/model/prescription_models.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_cubit.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/views/widgets/custom_show_more.dart';

class CardPrescriptionsItem extends StatefulWidget {
  const CardPrescriptionsItem({
    super.key,
    required this.pres,
    required this.index,
    required this.onPressed,
  });

  final PrescriptionModel pres;
  final int index;
 final  void Function()? onPressed;

  @override
  State<CardPrescriptionsItem> createState() => _CardPrescriptionsItemState();
}

class _CardPrescriptionsItemState extends State<CardPrescriptionsItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      margin: EdgeInsets.symmetric(horizontal: 20.sp),
      height: isExpanded ? 400.h : 250.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 0.3, color: AppColor.hintColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Prescription #${widget.index + 1}",
                style: AppTextStyle.semiBold20.copyWith(
                  fontSize: 18.sp,
                  color: Colors.black87,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 100.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColor.secondaryColor, // Couleur de la boîte comme dans le design
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  widget.pres.allDateMedication,
                  style: AppTextStyle.semiBold12.copyWith(
                    color: AppColor.primaryColor, // Couleur du texte comme dans le design
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Text(
            "Dr. ${widget.pres.nameDoctor} - ${widget.pres.specialty}",
            style: AppTextStyle.semiBold12.copyWith(
              fontSize: 14.sp,
              color: Colors.blueGrey.shade200,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Médicaments",
            style: AppTextStyle.semiBold20.copyWith(
              fontSize: 18.sp,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: widget.pres.nameMedication.split(',').length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final medication = widget.pres.nameMedication.split(',')[index];
                return Text(medication, style: TextStyle(fontSize: 16.sp));
              },
              separatorBuilder: (context, index) => SizedBox(height: 5.h),
            ),
          ),
          Row(
            children: [
              CustomShowMore(
                isExpanded: isExpanded,
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
              const Spacer(),
              IconButton(
                onPressed:widget.onPressed,
                icon: const Icon(Icons.edit, size: 18),
              ),
              IconButton(
                onPressed: () {
                  context.read<PrescriptionsCubit>().deletePrescription(
                    widget.pres.idPres,
                  );
                },
                icon: const Icon(Icons.delete, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
































/*widget.pres.copyWith(
                    idPres:const Uuid().v4(),
                    allDateMedication:mode ,
                    nameDoctor: ,
                    medicationId: ,
                    nameMedication: ,
                    doctorId: ,
                    userId: ,
                    
                  );
                  context.read<PrescriptionsCubit>().editPrescription(
                    oldPrescription: null,
                    updatedPrescription: null,
                  );*/
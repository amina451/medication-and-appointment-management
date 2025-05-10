// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/core/widgets/custom_button.dart';
import 'package:pharmacy_app/core/widgets/upload_image.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/widgets/form_title.dart';
import 'package:pharmacy_app/features/doctors/domain/model/doctor_models.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_cubit.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_state.dart';
import 'package:pharmacy_app/features/doctors/presention/views/widgets/custom_form_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

void customBuildShowModalSheet(BuildContext context) {
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController specialtyController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
    File? image;
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (BuildContext context) {
      return BlocConsumer<DoctorsCubit, DoctorState>(
        listener: (context, state) {
          if (state is DoctorLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Doctor added successfully!'),
                duration: Duration(seconds: 2),
              ),
            );
            log('Doctor added successfully!');
          } else if (state is DoctorError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                duration: const Duration(seconds: 2),
              ),
            );
            log('Error: ${state.message}');
          }
        },
        builder: (context, state) {
          bool isLoading = state is DoctorLoading;
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom, 
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 52.w, vertical: 20.h),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(), // لتجنب التمرير المفرط
                  child: Column(
                    spacing: 10.h,
                    mainAxisSize: MainAxisSize.min, // لضمان أن الـ Column يأخذ الحجم المناسب
                    children: [
                      const ImageUpload(),
                      const FormTitle(title: "First Name Doctor"),
                      CustomFormAddData(
                        hint: "dr.",
                        controller: firstNameController,
                       
                      ),
                      const FormTitle(title: "Last Name Doctor"),
                      CustomFormAddData(
                        hint: "Last Name Doctor",
                        controller: lastNameController,
                       
                      ),
                      const FormTitle(title: "Specialty"),
                      CustomFormAddData(
                        hint: "Specialty",
                        controller: specialtyController,
                        
                      ),
                      const FormTitle(title: "Address"),
                      CustomFormAddData(
                        hint: "Address",
                        controller: addressController,
                        
                      ),
                      const FormTitle(title: "Phone"),
                      CustomFormAddData(
                        hint: "Phone",
                        controller: phoneController,
                       
                      ),
                      CustomButton(
                        title: "Save",
                        buttonTitleColor: Colors.white,
                        buttonColor: AppColor.primaryColor,
                        onPressed: () {
                          if(image != null){
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                            final currentUserId = Supabase.instance.client.auth.currentUser!.id;
                            context.read<DoctorsCubit>().createDoctor(
                                  DoctorModel(
                                    doctorId: const Uuid().v4(),
                                    doctorName: "${firstNameController.text} ${lastNameController.text}",
                                    image:  image,   
                                    specialty: specialtyController.text,
                                    address: addressController.text,
                                    phone: phoneController.text,
                                    userId: currentUserId,
                                  ),
                                );
                            Navigator.pop(context);
                          }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
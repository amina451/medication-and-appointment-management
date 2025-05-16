import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_cubit.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_state.dart';

class CustomSearchAnchor extends StatelessWidget {
  const CustomSearchAnchor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context,  SearchController controller) {
        return SizedBox(
          height: 50.h,
          child: SearchBar(
            shadowColor: WidgetStateProperty.all<Color>(
              Colors.white.withOpacity(0.30),
            ),
            textStyle: WidgetStateProperty.all<TextStyle>(
              TextStyle(color: Colors.white),
            ),
            hintText: "Rechercher une date.....",
            hintStyle: WidgetStateProperty.all(
              TextStyle(fontSize: 16, color: Colors.white),
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.sp),
              ),
            ),
            side: WidgetStateProperty.all<BorderSide>(
              BorderSide(
                color: Colors.white.withAlpha((0.40 * 255).toInt()),
                width: 1.0,
              ),
            ),
            onChanged: (value) {
              context.read<PrescriptionsCubit>().searchPrescriptions(value);
            },
      

            backgroundColor: WidgetStateProperty.all<Color>(
              Colors.white.withOpacity(0.38),
            ),
            trailing: [Icon(Icons.search, color: Colors.white)],
          ),
        );
      },
      suggestionsBuilder: (context, SearchController controller) {
         final state = context.read<PrescriptionsCubit>().state;

        if (state is PrescriptionLoaded) {
          final query = controller.text;
          final prescriptions = state.prescriptions;

          final filtered = query.isEmpty
              ? prescriptions
              : prescriptions.where((prescription) =>
                  prescription.nameDoctor.toLowerCase().contains(query.toLowerCase()) ||
                  prescription.nameMedication.toLowerCase().contains(query.toLowerCase())
                ).toList();

          return filtered.isNotEmpty
              ? filtered.map((prescription) => ListTile(
                    title: Text(prescription.nameDoctor),
                    subtitle: Text(prescription.nameMedication),
                    onTap: () {
                      controller.closeView(prescription.nameDoctor);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sélectionné : ${prescription.nameMedication}')),
                      );
                    },
                  ))
              : [const Center(child: Text('Aucun résultat trouvé'))];
        } else if (state is PrescriptionLoading) {
          return [const Center(child: CircularProgressIndicator())];
        } else {
          return [const Center(child: Text('Erreur lors du chargement des données'))];
        }

      },
    );
  }
}
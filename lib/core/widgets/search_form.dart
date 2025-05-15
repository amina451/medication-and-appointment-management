import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_cubit.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_state.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          backgroundColor: WidgetStateProperty.all<Color>(
            AppColor.lightSecondryColor,
          ),
          shadowColor: WidgetStateProperty.all<Color>(
            Colors.grey.shade500.withOpacity(0.1),
          ),
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          leading: const Icon(Icons.search),
          hintText: 'Rechercher un médecin...',
          elevation: const WidgetStatePropertyAll(4.0),
          onChanged: (query) {
            context.read<DoctorsCubit>().searchDoctors(query);
          },
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) async {
        final state = context.read<DoctorsCubit>().state;

        if (state is DoctorLoaded) {
          final query = controller.text;
          final doctors = state.doctors;

          final filtered = query.isEmpty
              ? doctors
              : doctors.where((doctor) =>
                  doctor.doctorName.toLowerCase().contains(query.toLowerCase()) ||
                  doctor.spicility.toLowerCase().contains(query.toLowerCase())
                ).toList();

          return filtered.isNotEmpty
              ? filtered.map((doctor) => ListTile(
                    title: Text(doctor.doctorName),
                    subtitle: Text(doctor.spicility),
                    onTap: () {
                      controller.closeView(doctor.doctorName);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sélectionné : ${doctor.doctorName}')),
                      );
                    },
                  ))
              : [const Center(child: Text('Aucun résultat trouvé'))];
        } else if (state is DoctorLoading) {
          return [const Center(child: CircularProgressIndicator())];
        } else {
          return [const Center(child: Text('Erreur lors du chargement des données'))];
        }
      },
    );
  }
}
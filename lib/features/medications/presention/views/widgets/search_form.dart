import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_cubit.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_state.dart';

class SearchFormMedication extends StatelessWidget {
  const SearchFormMedication({super.key});

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
            // ignore: deprecated_member_use
            Colors.grey.shade500.withOpacity(0.1),
          ),
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          leading: const Icon(Icons.search),
          hintText: 'Rechercher un médicament...',
          elevation: const WidgetStatePropertyAll(4.0),
          onChanged: (query) {
            context.read<MedicationsCubit>().searchMedications(query);
          },
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) async {
        final state = context.read<MedicationsCubit>().state;

        if (state is MedicationLoaded) {
          final query = controller.text;
          final medication = state.medication;

          final filtered = query.isEmpty
              ? medication
              : medication.where((doctor) {
                  // Vérifiez null avant d'utiliser toLowerCase()
                  final name = doctor.name_medication?.toLowerCase() ?? '';
                  return name.contains(query.toLowerCase());
                }).toList();

          return filtered.isNotEmpty
              ? filtered.map((doctor) => ListTile(
                    title: Text(doctor.name_medication ?? 'Non disponible'),
                    onTap: () {
                      controller.closeView(doctor.name_medication ?? '');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Sélectionné : ${doctor.name_medication ?? 'Non disponible'}'),
                        ),
                      );
                    },
                  ))
              : [const Center(child: Text('Aucun résultat trouvé'))];
        } else if (state is MedicationLoading) {
          return [const Center(child: CircularProgressIndicator())];
        } else {
          return [const Center(child: Text('Erreur lors du chargement des données'))];
        }
      },
    );
  }
}
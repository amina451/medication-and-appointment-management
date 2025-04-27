import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_color.dart';

class SearchForm extends StatelessWidget {
   SearchForm({super.key, });

    final List<String> items = ['Doctor A', 'Doctor B', 'Doctor C'];

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
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          hintText: 'Dentist...',
          elevation: const WidgetStatePropertyAll(4.0),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        String query = controller.text.toLowerCase();
        List<String> suggestions =
            items.where((item) => item.toLowerCase().contains(query)).toList();

        return suggestions.isNotEmpty
            ? List<Widget>.generate(suggestions.length, (index) {
              String suggestion = suggestions[index];
              return ListTile(
                title: Text(suggestion),
                onTap: () {
                  controller.closeView(suggestion);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: $suggestion')),
                  );
                },
              );
            })
            : [const Center(child: Text('No results found'))];
      },
    );
  }
}

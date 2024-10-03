import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';
import '../widgets/search_bar.dart';
import '../widgets/filter_widget.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Search Projects")),
      body: Column(
        children: [
          SearchBar(
            controller: TextEditingController(),
            onSearch: (query) {
              provider.searchAndFilter(query, 'All', null);
            },
          ),
          FilterWidget(
            onCategorySelected: (category) {
              provider.searchAndFilter('', category, null);
            },
            onDateSelected: (date) {
              provider.searchAndFilter('', 'All', date);
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.filteredProjects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(provider.filteredProjects[index].name),
                  subtitle: Text(provider.filteredProjects[index].content),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

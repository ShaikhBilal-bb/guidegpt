import '../models/project.dart';

class SearchAndFilterLogic {
  List<Project> searchAndFilter(List<Project> projects, String query, String category, DateTime? date) {
    return projects.where((project) {
      final matchesQuery = project.name.toLowerCase().contains(query.toLowerCase()) ||
                           project.content.toLowerCase().contains(query.toLowerCase()) ||
                           project.tags.any((tag) => tag.toLowerCase().contains(query.toLowerCase()));
      
      final matchesCategory = category == 'All' || project.category == category;
      final matchesDate = date == null || project.date.isAtSameMomentAs(date);

      return matchesQuery && matchesCategory && matchesDate;
    }).toList();
  }
}

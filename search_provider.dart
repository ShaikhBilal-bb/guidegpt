import 'package:flutter/material.dart';
import '../models/project.dart';
import '../logic/search_and_filter_logic.dart';

class SearchProvider with ChangeNotifier {
  List<Project> allProjects = [];  // Load initial projects here
  List<Project> filteredProjects = [];

  void searchAndFilter(String query, String category, DateTime? date) {
    filteredProjects = SearchAndFilterLogic().searchAndFilter(allProjects, query, category, date);
    notifyListeners();
  }
}

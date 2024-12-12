import 'package:flutter/material.dart';
import 'MyApp.dart';
import 'PeopleList/PeopleViewModel.dart';
import 'Testing/PeopleListMockRepository.dart';

void main() {
  //USE PeopleListDependencyProvider CLASS TO INJECT THE OBJECTS FOR PRODUCTION or TESTING HERE
  runApp(MyApp(peopleListViewModel: PeopleListDependencyProvider().peopleListMockViewModel));
}

class PeopleListDependencyProvider {
  final peopleListMockViewModel = PeopleViewModel(PeopleListMockRepository());
}

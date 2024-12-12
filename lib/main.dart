import 'package:flutter/material.dart';
import 'ImagesHandler/ImagesHandler.dart';
import 'MyApp.dart';
import 'PeopleList/PeopleListNetworkRepository.dart';
import 'PeopleList/PeopleViewModel.dart';
import 'ServerRequests/URLNetworkConstants.dart';
import 'Testing/PeopleListMockRepository.dart';

void main() {
  //USE PeopleListDependencyProvider CLASS TO INJECT THE OBJECTS FOR PRODUCTION or TESTING HERE
  runApp(MyApp(peopleListViewModel: PeopleListDependencyProvider().peopleListMockViewModel));
}

class PeopleListDependencyProvider {
  final peopleListMockViewModel = PeopleViewModel(PeopleListNetworkRepository(URLNetworkConstants()),ImagesHandler());
}

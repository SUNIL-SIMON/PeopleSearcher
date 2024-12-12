import 'package:flutter/material.dart';
import 'ImagesHandler/ImagesHandler.dart';
import 'MyApp.dart';
import 'PeopleList/PeopleListNetworkRepository.dart';
import 'PeopleList/PeopleViewModel.dart';
import 'ServerRequests/URLNetworkConstants.dart';
import 'Testing/PeopleListMockRepository.dart';
import 'Testing/URLMockConstants.dart';

void main() {
  //USE PeopleListDependencyProvider CLASS TO INJECT THE OBJECTS FOR PRODUCTION or TESTING HERE
  runApp(MyApp(peopleListViewModel: PeopleListDependencyProvider().peopleListViewModel));
}

class PeopleListDependencyProvider {
  //FOLLOWING OBJECT CAN BE USED FOR PRODUCTION, MAKE SURE TO KEEP ONLY ONE OBJECT INITIALIZED EITHER TESTING OR PRODUCTION
  final peopleListViewModel = PeopleViewModel(
    PeopleListNetworkRepository(URLNetworkConstants()),
    ImagesHandler(),
    onError: (errorMessage) {
      MyApp.showErrorDialog(errorMessage);
    },
  );
// //FOLLOWING OBJECT CAN BE USED FOR NETWORK MOCKING             **TESTING/DEVELOPMENT ONLY***
//   final peopleListMockViewModel = PeopleViewModel(
//     PeopleListMockRepository(),
//     ImagesHandler(),
//     onError: (errorMessage) {
//       MyApp.showErrorDialog(errorMessage);
//     },
//   );
// //FOLLOWING OBJECT CAN BE USED FOR TESTING NETWORK EXCEPTIONS       **TESTING/DEVELOPMENT ONLY***
//   final peopleListViewModelWithImageException = PeopleViewModel(
//     PeopleListNetworkRepository(URLMockConstants()),
//     ImagesHandler(),
//     onError: (errorMessage) {
//       MyApp.showErrorDialog(errorMessage);
//     },
//   );
}

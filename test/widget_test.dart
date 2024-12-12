// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:peoplesearcher/ImagesHandler/ImagesHandler.dart';
import 'package:peoplesearcher/MyApp.dart';
import 'package:peoplesearcher/PeopleList/PeopleViewModel.dart';
import 'package:peoplesearcher/Testing/PeopleListMockRepository.dart';

import 'package:peoplesearcher/main.dart';

void main() {
  testWidgets('smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(peopleListViewModel: PeopleViewModel(
      PeopleListMockRepository(),
      ImagesHandler(),
      onError: (errorMessage) {
        MyApp.showErrorDialog(errorMessage);
      },
    )));


  });
}

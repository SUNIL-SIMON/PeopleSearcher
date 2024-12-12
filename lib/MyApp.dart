import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PeopleList/PeopleListView.dart';
import 'PeopleList/PeopleViewModel.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {

  PeopleViewModel peopleListViewModel;

  MyApp({super.key,required this.peopleListViewModel});

  static bool _isDialogShowing = false;

  static void showErrorDialog(String message) {
    if (_isDialogShowing) return;
    _isDialogShowing = true;
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Something went wrong"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _isDialogShowing = false;
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    ).then((_) {
      _isDialogShowing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PeopleViewModel>(
      create: (_) => peopleListViewModel,
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: navigatorKey,  // Set the navigator key
        home: PeopleListView(),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PeopleList/PeopleListView.dart';
import 'PeopleList/PeopleViewModel.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {

  PeopleViewModel peopleListViewModel;

  MyApp({super.key,required this.peopleListViewModel});


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

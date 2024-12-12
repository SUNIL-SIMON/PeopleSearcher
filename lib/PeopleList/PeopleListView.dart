import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'PeopleListTile.dart';
import 'PeopleViewModel.dart';
import 'PersonDetailView.dart';

class PeopleListView extends StatelessWidget {
  PeopleListView({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People List'),
      ),
      body: Consumer<PeopleViewModel>(
        builder: (context, viewModel, child) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification &&
                  scrollNotification.metrics.pixels ==
                      scrollNotification.metrics.maxScrollExtent) {
                viewModel.loadPeople();
              }
              return false;
            },
            child: Column(
              children: [
                // Search bar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search People...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (query) {
                      viewModel.searchPeople(query);
                    },
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: viewModel.filteredPeople.length + (viewModel.isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == viewModel.filteredPeople.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final person = viewModel.filteredPeople[index];

                      return PeopleListTile(
                        person: person,
                        onTap: () {
                          viewModel.routeTo(context, PersonDetailView(person: person, viewModel: viewModel,));
                        }, viewModel: viewModel,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
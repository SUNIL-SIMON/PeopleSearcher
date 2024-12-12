import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ExceptionHandler/AppException.dart';
import '../ImagesHandler/ImagesHandler.dart';
import 'PeopleListRepository.dart';
import 'PersonModel.dart';

class PeopleViewModel extends ChangeNotifier {
  final PeopleListRepository _peopleRepository;
  List<PersonModel> people = [];
  List<PersonModel> filteredPeople = [];
  bool _isLoading = false;
  int _page = 1;
  String _searchQuery = '';

  final ImagesHandler _imagesHandler;
  final Function(String message)? onError;

  PeopleViewModel(this._peopleRepository,this._imagesHandler,{this.onError}){
    loadPeople();
  }

  bool get isLoading => _isLoading;

  Future<void> init() async {
    await loadPeople();
  }

  Future<void> loadPeople() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    try {
      final newPeople = await _peopleRepository.fetchList(_page,onError);
      people.addAll(newPeople);
      searchPeople(_searchQuery);
      _page++;
    } catch (e) {
      if (onError != null) {
        onError!(AppException.handleException(e, 'Error loading people').alertmessage);
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  void searchPeople(String query) {
    _searchQuery = query;

    if (_searchQuery.isEmpty) {
      filteredPeople = List.from(people);
    } else {
      filteredPeople = people.where((person) {
        return person.name.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }

  void routeTo(BuildContext context, StatelessWidget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  Uint8List? getImage(String url)
  {
    Uint8List? image = _imagesHandler.getImage(url,onError,(image){
      notifyListeners();
    });
    return image;
  }

}


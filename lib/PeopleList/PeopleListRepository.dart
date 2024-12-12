import 'PersonModel.dart';

abstract class PeopleListRepository {
  Future<List<PersonModel>> fetchList(int page);
}



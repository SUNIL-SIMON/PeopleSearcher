import 'package:peoplesearcher/PeopleList/PeopleListRepository.dart';
import 'package:peoplesearcher/PeopleList/PersonModel.dart';

class PeopleListMockRepository extends PeopleListRepository{
  Future<List<PersonModel>> fetchList(int page) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    PersonModel dummyPerson = PersonModel(
      gender: 'female',
      name: 'Jane Doe',
      email: 'janedoe@example.com',
      username: 'janedoe123',
      phone: '+1 123 456 7890',
      cell: '+1 987 654 3210',
      pictureLargeUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
      pictureThumbnailUrl: 'https://randomuser.me/api/portraits/thumb/women/1.jpg',
      address: '123 Elm St, Springfield, IL',
      age: 30,
    );
    return [dummyPerson];
  }
}
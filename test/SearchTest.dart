import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/ImagesHandler/ImagesHandler.dart';
import '../lib/PeopleList/PeopleListRepository.dart';
import '../lib/PeopleList/PeopleViewModel.dart';
import '../lib/PeopleList/PersonModel.dart';

// Create Mock Classes
class MockPeopleListRepository extends Mock implements PeopleListRepository {}
class MockImagesHandler extends Mock implements ImagesHandler {}

void main() {
  late PeopleViewModel peopleViewModel;
  late MockPeopleListRepository mockPeopleListRepository;
  late MockImagesHandler mockImagesHandler;

  setUp(() {
    mockPeopleListRepository = MockPeopleListRepository();
    mockImagesHandler = MockImagesHandler();
    peopleViewModel = PeopleViewModel(mockPeopleListRepository, mockImagesHandler);
  });

  group('searchPeople', () {
    test('should return all people if search query is empty', () async {
      // Given
      final people = [
        PersonModel(name: 'John Doe', email: 'john@example.com', gender: 'male', username: 'johndoe', phone: '1234567890', cell: '1234567890', pictureLargeUrl: '', pictureThumbnailUrl: '', address: 'Address 1', age: 30),
        PersonModel(name: 'Jane Doe', email: 'jane@example.com', gender: 'female', username: 'janedoe', phone: '0987654321', cell: '0987654321', pictureLargeUrl: '', pictureThumbnailUrl: '', address: 'Address 2', age: 25),
      ];

      peopleViewModel.people = people;
      peopleViewModel.searchPeople('');

      // Then
      expect(peopleViewModel.filteredPeople.length, 2);
      expect(peopleViewModel.filteredPeople[0].name, 'John Doe');
      expect(peopleViewModel.filteredPeople[1].name, 'Jane Doe');
    });

    test('should filter people based on search query', () async {
      // Given
      final people = [
        PersonModel(name: 'John Doe', email: 'john@example.com', gender: 'male', username: 'johndoe', phone: '1234567890', cell: '1234567890', pictureLargeUrl: '', pictureThumbnailUrl: '', address: 'Address 1', age: 30),
        PersonModel(name: 'Jane Doe', email: 'jane@example.com', gender: 'female', username: 'janedoe', phone: '0987654321', cell: '0987654321', pictureLargeUrl: '', pictureThumbnailUrl: '', address: 'Address 2', age: 25),
      ];

      peopleViewModel.people = people;
      peopleViewModel.searchPeople('Jane');

      // Then
      expect(peopleViewModel.filteredPeople.length, 1);
      expect(peopleViewModel.filteredPeople[0].name, 'Jane Doe');
    });

    test('should return an empty list if no people match the search query', () async {
      // Given
      final people = [
        PersonModel(name: 'John Doe', email: 'john@example.com', gender: 'male', username: 'johndoe', phone: '1234567890', cell: '1234567890', pictureLargeUrl: '', pictureThumbnailUrl: '', address: 'Address 1', age: 30),
        PersonModel(name: 'Jane Doe', email: 'jane@example.com', gender: 'female', username: 'janedoe', phone: '0987654321', cell: '0987654321', pictureLargeUrl: '', pictureThumbnailUrl: '', address: 'Address 2', age: 25),
      ];

      peopleViewModel.people = people;
      peopleViewModel.searchPeople('Non-existent name');

      // Then
      expect(peopleViewModel.filteredPeople.isEmpty, true);
    });

    test('should handle case-insensitive search', () async {
      // Given
      final people = [
        PersonModel(name: 'John Doe', email: 'john@example.com', gender: 'male', username: 'johndoe', phone: '1234567890', cell: '1234567890', pictureLargeUrl: '', pictureThumbnailUrl: '', address: 'Address 1', age: 30),
        PersonModel(name: 'Jane Doe', email: 'jane@example.com', gender: 'female', username: 'janedoe', phone: '0987654321', cell: '0987654321', pictureLargeUrl: '', pictureThumbnailUrl: '', address: 'Address 2', age: 25),
      ];

      peopleViewModel.people = people;
      peopleViewModel.searchPeople('jane');

      // Then
      expect(peopleViewModel.filteredPeople.length, 1);
      expect(peopleViewModel.filteredPeople[0].name, 'Jane Doe');
    });
  });
}
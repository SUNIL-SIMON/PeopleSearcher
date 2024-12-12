import '../ServerRequests/ServerRequestHandler.dart';
import '../ServerRequests/URLConstants.dart';
import 'PeopleListRepository.dart';
import 'PersonModel.dart';

class PeopleListNetworkRepository extends PeopleListRepository{
  final urlRequestHandler = ServerRequestsHandler() ;
  final URLConstants urlConstants;
  PeopleListNetworkRepository(this.urlConstants);
  Future<List<PersonModel>> fetchList(int page) async {
    try {
      final results = await urlRequestHandler.makeRequest('${urlConstants.baseUrl}?results=10');
      return results.map((personJson) => PersonModel.fromJson(personJson)).toList();
    } catch (e) {
      print("THROW ERROR");
    }
    return [];
  }
}
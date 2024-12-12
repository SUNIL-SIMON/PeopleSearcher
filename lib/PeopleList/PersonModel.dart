
class PersonModel {
  final String gender;
  final String name;
  final String email;
  final String username;
  final String phone;
  final String cell;
  final String pictureLargeUrl;
  final String pictureThumbnailUrl;
  final String address;
  final int age;

  PersonModel({
    required this.gender,
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.cell,
    required this.pictureLargeUrl,
    required this.pictureThumbnailUrl,
    required this.address,
    required this.age,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      gender: json['gender'],
      name: '${json['name']['first']} ${json['name']['last']}',
      email: json['email'],
      username: json['login']['username'],
      phone: json['phone'],
      cell: json['cell'],
      pictureLargeUrl: json['picture']['large'],
      pictureThumbnailUrl: json['picture']['thumbnail'],
      address: '${json['location']['street']['name']} ${json['location']['street']['number']}, ${json['location']['city']}, ${json['location']['state']}',
      age: json['dob']['age'],
    );
  }
}
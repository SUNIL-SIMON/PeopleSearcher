import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Appearance/Appearance.dart';
import 'ImageDetailView.dart';
import 'PeopleViewModel.dart';
import 'PersonModel.dart';

class PersonDetailView extends StatelessWidget {
  final PersonModel person;
  final PeopleViewModel viewModel;

  const PersonDetailView({
    super.key,
    required this.person,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details",style: TextStyle(
          fontWeight: FontWeight.w600, // Semi-bold font weight
        ),
        ),
        backgroundColor: Appearance().primaryColor,
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Appearance().primaryColor,
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Large Profile Image
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Appearance().borderColor,
                        width: 2,
                      ),
                    ),
                    child: Consumer<PeopleViewModel>(
                      builder: (context, viewModel, child) {
                        final image = viewModel.getImage(person.pictureLargeUrl);

                        return GestureDetector(
                          onTap: () {
                            viewModel.routeTo(context,ImageDetailView(person: person, viewModel: viewModel));
                          },
                          child: CircleAvatar(
                            backgroundColor:Appearance().primaryColor,
                            radius: 75,
                            backgroundImage: image == null
                                ? null
                                : MemoryImage(image),
                            child: image == null
                                ? const CircularProgressIndicator()
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Name
                Text(
                  person.name,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),

                // Gender and Age
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      person.gender == 'male' ? Icons.male : Icons.female,
                      size: 24.0,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${person.age} years old',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Address
                const Text(
                  'Address:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  person.address,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20),

                // Email
                const Text(
                  'Email:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  person.email,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20),

                // Username
                const Text(
                  'Username:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  person.username,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20),

                // Phone and Cell
                Row(
                  children: [
                    Icon(Icons.phone, size: 24.0),
                    SizedBox(width: 8),
                    Text(
                      person.phone,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.phone_android, size: 24.0),
                    SizedBox(width: 8),
                    Text(
                      person.cell,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


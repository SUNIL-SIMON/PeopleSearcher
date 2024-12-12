import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ImageDetailView.dart';
import 'PeopleViewModel.dart';
import 'PersonModel.dart';

class PeopleListTile extends StatelessWidget {
  final PersonModel person;
  final VoidCallback onTap;
  final PeopleViewModel viewModel;

  const PeopleListTile({
    required this.person,
    required this.onTap,
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = viewModel.getImage(person.pictureThumbnailUrl);

    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              viewModel.routeTo(context,ImageDetailView(person: person, viewModel: viewModel));
            },
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 30,
              backgroundImage: image == null
                  ? null
                  : MemoryImage(image),
              child: image == null
                  ? const CircularProgressIndicator()
                  : null,
            ),
          ),
        ),
        title: Text(
          person.name,
          style: Theme.of(context).textTheme.headline6?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${person.email}', style: TextStyle(fontSize: 14)),
            Text('Phone: ${person.phone}', style: TextStyle(fontSize: 14)),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
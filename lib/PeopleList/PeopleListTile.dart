import 'package:flutter/material.dart';

import '../Appearance/Appearance.dart';
import 'ImageDetailView.dart';
import 'PeopleViewModel.dart';
import 'PersonModel.dart';

class PeopleListTile extends StatefulWidget {
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
  State<PeopleListTile> createState() => _PeopleListTileState();
}

class _PeopleListTileState extends State<PeopleListTile> {
  @override
  void initState() {
    super.initState();
    debugPrint("PeopleListTile for ${widget.person.name} initialized");
  }

  @override
  void dispose() {
    debugPrint("PeopleListTile for ${widget.person.name} disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final image = widget.viewModel.getImage(widget.person.pictureThumbnailUrl);

    return Card(
      color: Appearance().primaryColor,
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
              color: Appearance().borderColor,
              width: 2,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              widget.viewModel.routeTo(
                  context,
                  ImageDetailView(
                      person: widget.person, viewModel: widget.viewModel));
            },
            child: CircleAvatar(
              backgroundColor: Appearance().primaryColor,
              radius: 30,
              backgroundImage: image == null ? null : MemoryImage(image),
              child: image == null
                  ? const CircularProgressIndicator()
                  : null,
            ),
          ),
        ),
        title: Text(
          widget.person.name,
          style: Theme.of(context).textTheme.headline6?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: ${widget.person.email}', style: TextStyle(fontSize: 14)),
            Text('Phone: ${widget.person.phone}', style: TextStyle(fontSize: 14)),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: widget.onTap,
      ),
    );
  }
}

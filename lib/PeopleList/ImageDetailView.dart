import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'PeopleViewModel.dart';
import 'PersonModel.dart';

class ImageDetailView extends StatelessWidget {
  final PersonModel person;
  final PeopleViewModel viewModel;

  const ImageDetailView({
    super.key,
    required this.person,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Full Image")),
      body: Center(
        child: Consumer<PeopleViewModel>(
          builder: (context, viewModel, child) {
            final image = viewModel.getImage(person.pictureLargeUrl);

            return image == null
                ? const CircularProgressIndicator()
                : Image.memory(
              image,
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            );
          },
        ),
      ),
    );
  }
}

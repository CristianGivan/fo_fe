import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';
import 'package:fo_fe/features/organizer/items/tag/presentation/pages/tag_list_page.dart';

class TagScreen extends StatelessWidget {
  const TagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TagBlocTag>().add(GetTagItemsAllBlocEvent());

    return Scaffold(
      appBar: AppBar(title: const Text('Tag Management')),
      body: const Column(
        children: [
          Center(child: Text('All Tags:')),
          Expanded(
            child: TagListPage(),
          ),
        ],
      ),
    );
  }
}

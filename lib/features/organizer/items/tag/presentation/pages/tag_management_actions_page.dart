import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TagManagementActionsPage extends StatelessWidget {
  const TagManagementActionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.push('/tag/tag_add'),
              child: const Text('Add Tag'),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => showFilterDialog(context),
                  child: const Text('Filter Tags'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => showSortDialog(context),
                  child: const Text('Sort Tags'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Enter tag description',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

void showFilterDialog(BuildContext context) {
  // Implement the filter dialog for tags
}

void showSortDialog(BuildContext context) {
  // Implement the sort dialog for tags
}

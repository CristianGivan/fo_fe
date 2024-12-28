import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagManagementActionsPage extends StatelessWidget {
  final OrganizerItems<TagEntity> selectedTags;

  TagManagementActionsPage({super.key, OrganizerItems<TagEntity>? selectedTags})
      : selectedTags = selectedTags ?? OrganizerItems.empty();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.pushNamed(TagRouterNames.tagAddRouteName),
                  child: const Text('Add Tag'),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    if (!selectedTags.isEmpty) {
                      context.pop(selectedTags);
                    } else {
                      context.pop();
                    }
                  },
                  child: const Text('Link'),
                ),
              ),
            ],
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

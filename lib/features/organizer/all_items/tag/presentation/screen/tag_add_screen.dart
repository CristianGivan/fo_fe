// lib/features/organizer/items/tag/presentation/screen/tag_add_screen.dart
import 'package:fo_fe/core/widgets/core_widget_exports.dart';
import 'package:fo_fe/features/organizer/all_items/tag/utils/tag_exports.dart';
import 'package:fo_fe/features/organizer/utils/organizer_exports.dart';

class TagAddScreen extends StatefulWidget {
  const TagAddScreen({super.key});

  @override
  _TagAddScreenState createState() => _TagAddScreenState();
}

class _TagAddScreenState extends State<TagAddScreen> {
  final TextEditingController _tagNameController = TextEditingController();

  @override
  void dispose() {
    _tagNameController.dispose();
    super.dispose();
  }

  void _saveTag(BuildContext context) {
    final String tagName = _tagNameController.text;
    if (tagName.isNotEmpty) {
      final tag = TagEntity(subject: tagName);
      BlocProvider.of<TagBlocTag>(context).add(AddTagBlocEvent(tag));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Tag'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tagNameController,
              decoration: const InputDecoration(
                labelText: 'Tag Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            BlocConsumer<TagBlocTag, TagBlocState>(
              listener: (context, state) {
                if (state is TagSuccessBlocState) {
                  SnackBarWidget.showAboveBottomNavBar(context, content: 'Tag saved successfully');
                  context.pop();
                } else if (state is TagErrorBlocState) {
                  SnackBarWidget.showAboveBottomNavBar(context, content: state.message);
                }
              },
              builder: (context, state) {
                if (state is TagLoadingBlocState) {
                  return CircularProgressIndicator();
                }
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _saveTag(context),
                    child: const Text('Save Tag'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

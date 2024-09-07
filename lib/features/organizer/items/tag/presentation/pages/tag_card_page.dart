import 'package:flutter/material.dart';
import 'package:fo_fe/features/organizer/items/tag/config/tag_exports.dart';

class TagCardPage extends StatelessWidget {
  final TagEntity tag;
  final Function(TagEntity) onUpdateTag;
  final Function() onViewTag;
  final Function() onEditTag;
  final Function(TagEntity) onDeleteTag;

  const TagCardPage({
    super.key,
    required this.tag,
    required this.onUpdateTag,
    required this.onViewTag,
    required this.onEditTag,
    required this.onDeleteTag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onViewTag,
      onLongPress: onEditTag,
      child: Dismissible(
        key: Key(tag.id.toString()),
        direction: DismissDirection.horizontal,
        confirmDismiss: (direction) async {
          // Add any status change logic for tag if needed
          return false;
        },
        background:
            _buildSwipeActionBackground(Icons.arrow_forward, Colors.green),
        secondaryBackground:
            _buildSwipeActionBackground(Icons.arrow_back, Colors.red),
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tag.subject,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _showDeleteConfirmation(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Delete Tag"),
          content: const Text("Are you sure you want to delete this tag?"),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text("Delete"),
              onPressed: () {
                onDeleteTag(tag);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSwipeActionBackground(IconData icon, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Icon(icon, color: Colors.white, size: 30),
    );
  }
}

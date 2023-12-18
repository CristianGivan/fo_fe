part of tasks;

class TagList extends StatefulWidget {
  const TagList({Key? key}) : super(key: key);

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  List<TagEntity> tagList = objectbox.tagBox.getAll();
  List<TagEntity> selectedTag = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Owner'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: tagList.map((tag) {
                  final isSelected = selectedTag.contains(tag);

                  return OwnersTileWidget(
                      tag: tag,
                      isSelected: isSelected,
                      onSelectedOwner: selectOwner);
                }).toList(),
              ),
            ),
            buildSelectButton(context),
          ],
        ));
  }

  void selectOwner(TagEntity tag) {
    final isSelected = selectedTag.contains(tag);

    setState(() {
      isSelected ? selectedTag.remove(tag) : selectedTag.add(tag);
    });
  }

  Widget buildSelectButton(BuildContext context) {
    final label = "Select ${selectedTag.length} Owners";

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: ElevatedButton(
          onPressed: (() => Navigator.pop(context, selectedTag)),
          child: Text(label,
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 16))),
    );
  }
}

class OwnersTileWidget extends StatelessWidget {
  final TagEntity tag;
  final bool isSelected;
  final ValueChanged<TagEntity> onSelectedOwner;

  const OwnersTileWidget(
      {Key? key,
      required this.tag,
      required this.isSelected,
      required this.onSelectedOwner})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).secondaryHeaderColor;
    final style = isSelected
        ? TextStyle(
            fontSize: 18, color: selectedColor, fontWeight: FontWeight.bold)
        : const TextStyle(fontSize: 18);

    return ListTile(
      onTap: () => onSelectedOwner(tag),
      title: Text(tag.tag, style: style),
      trailing:
          isSelected ? Icon(Icons.check, color: selectedColor, size: 26) : null,
    );
  }
}

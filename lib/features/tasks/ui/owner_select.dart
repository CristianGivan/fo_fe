part of tasks;

class TagList extends StatefulWidget {
  const TagList({Key? key}) : super(key: key);

  @override
  State<TagList> createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  // Set<Tag> tagList = database.getAllTags();
  Set<Tag> selectedTagSet = <Tag>{};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TagBloc()..add(GetAllTag()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Select Owner'),
          ),
          body: BlocBuilder<TagBloc, TagBlocState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: state.tagList.map((tag) {
                        final isSelected = selectedTagSet.contains(tag);
                        return OwnersTileWidget(
                            tag: tag,
                            isSelected: isSelected,
                            onSelectedOwner: selectOwner);
                      }).toList(),
                    ),
                  ),
                  buildSelectButton(context),
                ],
              );
            },
          )),
    );
  }

  void selectOwner(Tag tag) {
    final isSelected = selectedTagSet.contains(tag);

    setState(() {
      isSelected ? selectedTagSet.remove(tag) : selectedTagSet.add(tag);
    });
  }

  Widget buildSelectButton(BuildContext context) {
    final label = "Select ${selectedTagSet.length} Owners";

    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: ElevatedButton(
          onPressed: (() => Navigator.pop(context, selectedTagSet)),
          child: Text(label,
              style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 16))),
    );
  }
}

class OwnersTileWidget extends StatelessWidget {
  final Tag tag;
  final bool isSelected;
  final ValueChanged<Tag> onSelectedOwner;

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

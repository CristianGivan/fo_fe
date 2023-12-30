class DeleteMenu {
  final String? text;

  const DeleteMenu({required this.text});
}

class MenuItems {
  static const List<DeleteMenu> itemsFirst = [itemDelete];
  static const List<DeleteMenu> itemsSecond = [itemEdit];

  static const itemDelete = DeleteMenu(text: "Delete");
  static const itemEdit = DeleteMenu(text: "Edit");
}

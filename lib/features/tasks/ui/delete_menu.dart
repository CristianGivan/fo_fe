class Menu {
  final String? text;

  const Menu({required this.text});
}

class MenuItems {
  static const List<Menu> menuList = [itemUpdate,itemDelete];

  static const itemUpdate = Menu(text: "Update");
  static const itemDelete = Menu(text: "Delete");

}

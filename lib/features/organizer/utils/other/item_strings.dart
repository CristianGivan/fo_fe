class ItemStrings {
  final String item;

  ItemStrings(this.item);

  //screens

  String get screenTitle => "$itemPascalCase items";

  String get screenEditTitle => 'Edit $itemPascalCase';

  String get screenDeleteTitle => 'Delete $itemPascalCase Items';

  String get screenViewTitle => 'View $itemPascalCase';

  get screenAddTitle => 'Add $itemPascalCase';

  // other

  String get itemPascalCase => item[0].toUpperCase() + item.substring(1);

  String get noItemsAvailable => 'No $itemPascalCase Available';

  String get noItemsToDisplay => 'No $item to display';

  String get loadingItems => 'Loading $item...';

  String get errorLoadingItems => 'Failed to load $item.';
}

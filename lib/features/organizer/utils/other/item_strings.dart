class ItemStrings {
  final String item;

  ItemStrings(this.item);

  //screens

  String get screenTitle => "$itemPascalCase items";

  // other

  String get itemPascalCase => item[0].toUpperCase() + item.substring(1);

  String get noItemsAvailable => 'No $itemPascalCase Available';

  String get noItemsToDisplay => 'No $item to display';

  String get loadingItems => 'Loading $item...';

  String get errorLoadingItems => 'Failed to load $item.';
}

enum CollectionType {
  trophy('trophy', 'trophies'),
  icon('icon', 'icons'),
  plate('plate', 'plates'),
  frame('frame', 'frames');

  const CollectionType(this.path, this.key);
  final String path;
  final String key;
}

String getCollectionTypeName(CollectionType type) {
  switch (type) {
    case CollectionType.trophy:
      return '称号';
    case CollectionType.icon:
      return '头像';
    case CollectionType.plate:
      return '姓名框';
    case CollectionType.frame:
      return '背景';
  }
}

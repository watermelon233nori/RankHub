// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maimai_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMaimaiCollectionCollection on Isar {
  IsarCollection<MaimaiCollection> get maimaiCollections => this.collection();
}

const MaimaiCollectionSchema = CollectionSchema(
  name: r'MaimaiCollection',
  id: -1494863188010489170,
  properties: {
    r'collectionId': PropertySchema(
      id: 0,
      name: r'collectionId',
      type: IsarType.long,
    ),
    r'collectionType': PropertySchema(
      id: 1,
      name: r'collectionType',
      type: IsarType.string,
    ),
    r'color': PropertySchema(id: 2, name: r'color', type: IsarType.string),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'genre': PropertySchema(id: 4, name: r'genre', type: IsarType.string),
    r'name': PropertySchema(id: 5, name: r'name', type: IsarType.string),
    r'required': PropertySchema(
      id: 6,
      name: r'required',
      type: IsarType.objectList,

      target: r'MaimaiCollectionRequired',
    ),
    r'typeIdKey': PropertySchema(
      id: 7,
      name: r'typeIdKey',
      type: IsarType.string,
    ),
  },

  estimateSize: _maimaiCollectionEstimateSize,
  serialize: _maimaiCollectionSerialize,
  deserialize: _maimaiCollectionDeserialize,
  deserializeProp: _maimaiCollectionDeserializeProp,
  idName: r'id',
  indexes: {
    r'typeIdKey_collectionId': IndexSchema(
      id: 1391738713384664641,
      name: r'typeIdKey_collectionId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'typeIdKey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'collectionId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {
    r'MaimaiCollectionRequired': MaimaiCollectionRequiredSchema,
    r'MaimaiCollectionRequiredSong': MaimaiCollectionRequiredSongSchema,
  },

  getId: _maimaiCollectionGetId,
  getLinks: _maimaiCollectionGetLinks,
  attach: _maimaiCollectionAttach,
  version: '3.3.0',
);

int _maimaiCollectionEstimateSize(
  MaimaiCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.collectionType.length * 3;
  {
    final value = object.color;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.genre;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.required.length * 3;
  {
    final offsets = allOffsets[MaimaiCollectionRequired]!;
    for (var i = 0; i < object.required.length; i++) {
      final value = object.required[i];
      bytesCount += MaimaiCollectionRequiredSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.typeIdKey.length * 3;
  return bytesCount;
}

void _maimaiCollectionSerialize(
  MaimaiCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.collectionId);
  writer.writeString(offsets[1], object.collectionType);
  writer.writeString(offsets[2], object.color);
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.genre);
  writer.writeString(offsets[5], object.name);
  writer.writeObjectList<MaimaiCollectionRequired>(
    offsets[6],
    allOffsets,
    MaimaiCollectionRequiredSchema.serialize,
    object.required,
  );
  writer.writeString(offsets[7], object.typeIdKey);
}

MaimaiCollection _maimaiCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiCollection(
    collectionId: reader.readLongOrNull(offsets[0]) ?? 0,
    collectionType: reader.readStringOrNull(offsets[1]) ?? 'trophy',
    color: reader.readStringOrNull(offsets[2]),
    description: reader.readStringOrNull(offsets[3]),
    genre: reader.readStringOrNull(offsets[4]),
    id: id,
    name: reader.readStringOrNull(offsets[5]) ?? '',
    required:
        reader.readObjectList<MaimaiCollectionRequired>(
          offsets[6],
          MaimaiCollectionRequiredSchema.deserialize,
          allOffsets,
          MaimaiCollectionRequired(),
        ) ??
        const [],
  );
  return object;
}

P _maimaiCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? 'trophy') as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 6:
      return (reader.readObjectList<MaimaiCollectionRequired>(
                offset,
                MaimaiCollectionRequiredSchema.deserialize,
                allOffsets,
                MaimaiCollectionRequired(),
              ) ??
              const [])
          as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _maimaiCollectionGetId(MaimaiCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _maimaiCollectionGetLinks(MaimaiCollection object) {
  return [];
}

void _maimaiCollectionAttach(
  IsarCollection<dynamic> col,
  Id id,
  MaimaiCollection object,
) {
  object.id = id;
}

extension MaimaiCollectionByIndex on IsarCollection<MaimaiCollection> {
  Future<MaimaiCollection?> getByTypeIdKeyCollectionId(
    String typeIdKey,
    int collectionId,
  ) {
    return getByIndex(r'typeIdKey_collectionId', [typeIdKey, collectionId]);
  }

  MaimaiCollection? getByTypeIdKeyCollectionIdSync(
    String typeIdKey,
    int collectionId,
  ) {
    return getByIndexSync(r'typeIdKey_collectionId', [typeIdKey, collectionId]);
  }

  Future<bool> deleteByTypeIdKeyCollectionId(
    String typeIdKey,
    int collectionId,
  ) {
    return deleteByIndex(r'typeIdKey_collectionId', [typeIdKey, collectionId]);
  }

  bool deleteByTypeIdKeyCollectionIdSync(String typeIdKey, int collectionId) {
    return deleteByIndexSync(r'typeIdKey_collectionId', [
      typeIdKey,
      collectionId,
    ]);
  }

  Future<List<MaimaiCollection?>> getAllByTypeIdKeyCollectionId(
    List<String> typeIdKeyValues,
    List<int> collectionIdValues,
  ) {
    final len = typeIdKeyValues.length;
    assert(
      collectionIdValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([typeIdKeyValues[i], collectionIdValues[i]]);
    }

    return getAllByIndex(r'typeIdKey_collectionId', values);
  }

  List<MaimaiCollection?> getAllByTypeIdKeyCollectionIdSync(
    List<String> typeIdKeyValues,
    List<int> collectionIdValues,
  ) {
    final len = typeIdKeyValues.length;
    assert(
      collectionIdValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([typeIdKeyValues[i], collectionIdValues[i]]);
    }

    return getAllByIndexSync(r'typeIdKey_collectionId', values);
  }

  Future<int> deleteAllByTypeIdKeyCollectionId(
    List<String> typeIdKeyValues,
    List<int> collectionIdValues,
  ) {
    final len = typeIdKeyValues.length;
    assert(
      collectionIdValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([typeIdKeyValues[i], collectionIdValues[i]]);
    }

    return deleteAllByIndex(r'typeIdKey_collectionId', values);
  }

  int deleteAllByTypeIdKeyCollectionIdSync(
    List<String> typeIdKeyValues,
    List<int> collectionIdValues,
  ) {
    final len = typeIdKeyValues.length;
    assert(
      collectionIdValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([typeIdKeyValues[i], collectionIdValues[i]]);
    }

    return deleteAllByIndexSync(r'typeIdKey_collectionId', values);
  }

  Future<Id> putByTypeIdKeyCollectionId(MaimaiCollection object) {
    return putByIndex(r'typeIdKey_collectionId', object);
  }

  Id putByTypeIdKeyCollectionIdSync(
    MaimaiCollection object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(
      r'typeIdKey_collectionId',
      object,
      saveLinks: saveLinks,
    );
  }

  Future<List<Id>> putAllByTypeIdKeyCollectionId(
    List<MaimaiCollection> objects,
  ) {
    return putAllByIndex(r'typeIdKey_collectionId', objects);
  }

  List<Id> putAllByTypeIdKeyCollectionIdSync(
    List<MaimaiCollection> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(
      r'typeIdKey_collectionId',
      objects,
      saveLinks: saveLinks,
    );
  }
}

extension MaimaiCollectionQueryWhereSort
    on QueryBuilder<MaimaiCollection, MaimaiCollection, QWhere> {
  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MaimaiCollectionQueryWhere
    on QueryBuilder<MaimaiCollection, MaimaiCollection, QWhereClause> {
  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause>
  typeIdKeyEqualToAnyCollectionId(String typeIdKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'typeIdKey_collectionId',
          value: [typeIdKey],
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause>
  typeIdKeyNotEqualToAnyCollectionId(String typeIdKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'typeIdKey_collectionId',
                lower: [],
                upper: [typeIdKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'typeIdKey_collectionId',
                lower: [typeIdKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'typeIdKey_collectionId',
                lower: [typeIdKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'typeIdKey_collectionId',
                lower: [],
                upper: [typeIdKey],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause>
  typeIdKeyCollectionIdEqualTo(String typeIdKey, int collectionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'typeIdKey_collectionId',
          value: [typeIdKey, collectionId],
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause>
  typeIdKeyEqualToCollectionIdNotEqualTo(String typeIdKey, int collectionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'typeIdKey_collectionId',
                lower: [typeIdKey],
                upper: [typeIdKey, collectionId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'typeIdKey_collectionId',
                lower: [typeIdKey, collectionId],
                includeLower: false,
                upper: [typeIdKey],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'typeIdKey_collectionId',
                lower: [typeIdKey, collectionId],
                includeLower: false,
                upper: [typeIdKey],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'typeIdKey_collectionId',
                lower: [typeIdKey],
                upper: [typeIdKey, collectionId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause>
  typeIdKeyEqualToCollectionIdGreaterThan(
    String typeIdKey,
    int collectionId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'typeIdKey_collectionId',
          lower: [typeIdKey, collectionId],
          includeLower: include,
          upper: [typeIdKey],
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause>
  typeIdKeyEqualToCollectionIdLessThan(
    String typeIdKey,
    int collectionId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'typeIdKey_collectionId',
          lower: [typeIdKey],
          upper: [typeIdKey, collectionId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterWhereClause>
  typeIdKeyEqualToCollectionIdBetween(
    String typeIdKey,
    int lowerCollectionId,
    int upperCollectionId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'typeIdKey_collectionId',
          lower: [typeIdKey, lowerCollectionId],
          includeLower: includeLower,
          upper: [typeIdKey, upperCollectionId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MaimaiCollectionQueryFilter
    on QueryBuilder<MaimaiCollection, MaimaiCollection, QFilterCondition> {
  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'collectionId', value: value),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'collectionId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'collectionId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'collectionId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionTypeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'collectionType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'collectionType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'collectionType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'collectionType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'collectionType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'collectionType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'collectionType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'collectionType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'collectionType', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  collectionTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'collectionType', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'color'),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'color'),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'color',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'color',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'color',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'color', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  colorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'color', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'genre'),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'genre'),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'genre',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'genre',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  genreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  requiredLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'required', length, true, length, true);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  requiredIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'required', 0, true, 0, true);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  requiredIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'required', 0, false, 999999, true);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  requiredLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'required', 0, true, length, include);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  requiredLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'required', length, include, 999999, true);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  requiredLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'required',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  typeIdKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'typeIdKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  typeIdKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'typeIdKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  typeIdKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'typeIdKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  typeIdKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'typeIdKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  typeIdKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'typeIdKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  typeIdKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'typeIdKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  typeIdKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'typeIdKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  typeIdKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'typeIdKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  typeIdKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'typeIdKey', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  typeIdKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'typeIdKey', value: ''),
      );
    });
  }
}

extension MaimaiCollectionQueryObject
    on QueryBuilder<MaimaiCollection, MaimaiCollection, QFilterCondition> {
  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterFilterCondition>
  requiredElement(FilterQuery<MaimaiCollectionRequired> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'required');
    });
  }
}

extension MaimaiCollectionQueryLinks
    on QueryBuilder<MaimaiCollection, MaimaiCollection, QFilterCondition> {}

extension MaimaiCollectionQuerySortBy
    on QueryBuilder<MaimaiCollection, MaimaiCollection, QSortBy> {
  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  sortByCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  sortByCollectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  sortByCollectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionType', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  sortByCollectionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionType', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy> sortByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  sortByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy> sortByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  sortByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  sortByTypeIdKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIdKey', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  sortByTypeIdKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIdKey', Sort.desc);
    });
  }
}

extension MaimaiCollectionQuerySortThenBy
    on QueryBuilder<MaimaiCollection, MaimaiCollection, QSortThenBy> {
  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByCollectionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionId', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByCollectionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionType', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByCollectionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectionType', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy> thenByColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'color', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy> thenByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByTypeIdKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIdKey', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QAfterSortBy>
  thenByTypeIdKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIdKey', Sort.desc);
    });
  }
}

extension MaimaiCollectionQueryWhereDistinct
    on QueryBuilder<MaimaiCollection, MaimaiCollection, QDistinct> {
  QueryBuilder<MaimaiCollection, MaimaiCollection, QDistinct>
  distinctByCollectionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collectionId');
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QDistinct>
  distinctByCollectionType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'collectionType',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QDistinct> distinctByColor({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'color', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QDistinct> distinctByGenre({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiCollection, MaimaiCollection, QDistinct>
  distinctByTypeIdKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeIdKey', caseSensitive: caseSensitive);
    });
  }
}

extension MaimaiCollectionQueryProperty
    on QueryBuilder<MaimaiCollection, MaimaiCollection, QQueryProperty> {
  QueryBuilder<MaimaiCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MaimaiCollection, int, QQueryOperations> collectionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collectionId');
    });
  }

  QueryBuilder<MaimaiCollection, String, QQueryOperations>
  collectionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collectionType');
    });
  }

  QueryBuilder<MaimaiCollection, String?, QQueryOperations> colorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'color');
    });
  }

  QueryBuilder<MaimaiCollection, String?, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<MaimaiCollection, String?, QQueryOperations> genreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genre');
    });
  }

  QueryBuilder<MaimaiCollection, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<
    MaimaiCollection,
    List<MaimaiCollectionRequired>,
    QQueryOperations
  >
  requiredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'required');
    });
  }

  QueryBuilder<MaimaiCollection, String, QQueryOperations> typeIdKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeIdKey');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMaimaiCollectionGenreCollection on Isar {
  IsarCollection<MaimaiCollectionGenre> get maimaiCollectionGenres =>
      this.collection();
}

const MaimaiCollectionGenreSchema = CollectionSchema(
  name: r'MaimaiCollectionGenre',
  id: 4729472892664661440,
  properties: {
    r'genre': PropertySchema(id: 0, name: r'genre', type: IsarType.string),
    r'genreId': PropertySchema(id: 1, name: r'genreId', type: IsarType.long),
    r'title': PropertySchema(id: 2, name: r'title', type: IsarType.string),
  },

  estimateSize: _maimaiCollectionGenreEstimateSize,
  serialize: _maimaiCollectionGenreSerialize,
  deserialize: _maimaiCollectionGenreDeserialize,
  deserializeProp: _maimaiCollectionGenreDeserializeProp,
  idName: r'id',
  indexes: {
    r'genreId': IndexSchema(
      id: 3212228459756463684,
      name: r'genreId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'genreId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _maimaiCollectionGenreGetId,
  getLinks: _maimaiCollectionGenreGetLinks,
  attach: _maimaiCollectionGenreAttach,
  version: '3.3.0',
);

int _maimaiCollectionGenreEstimateSize(
  MaimaiCollectionGenre object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.genre.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _maimaiCollectionGenreSerialize(
  MaimaiCollectionGenre object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.genre);
  writer.writeLong(offsets[1], object.genreId);
  writer.writeString(offsets[2], object.title);
}

MaimaiCollectionGenre _maimaiCollectionGenreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiCollectionGenre(
    genre: reader.readStringOrNull(offsets[0]) ?? '',
    genreId: reader.readLongOrNull(offsets[1]) ?? 0,
    id: id,
    title: reader.readStringOrNull(offsets[2]) ?? '',
  );
  return object;
}

P _maimaiCollectionGenreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _maimaiCollectionGenreGetId(MaimaiCollectionGenre object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _maimaiCollectionGenreGetLinks(
  MaimaiCollectionGenre object,
) {
  return [];
}

void _maimaiCollectionGenreAttach(
  IsarCollection<dynamic> col,
  Id id,
  MaimaiCollectionGenre object,
) {
  object.id = id;
}

extension MaimaiCollectionGenreQueryWhereSort
    on QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QWhere> {
  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhere>
  anyGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'genreId'),
      );
    });
  }
}

extension MaimaiCollectionGenreQueryWhere
    on
        QueryBuilder<
          MaimaiCollectionGenre,
          MaimaiCollectionGenre,
          QWhereClause
        > {
  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhereClause>
  genreIdEqualTo(int genreId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'genreId', value: [genreId]),
      );
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhereClause>
  genreIdNotEqualTo(int genreId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'genreId',
                lower: [],
                upper: [genreId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'genreId',
                lower: [genreId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'genreId',
                lower: [genreId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'genreId',
                lower: [],
                upper: [genreId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhereClause>
  genreIdGreaterThan(int genreId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'genreId',
          lower: [genreId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhereClause>
  genreIdLessThan(int genreId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'genreId',
          lower: [],
          upper: [genreId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterWhereClause>
  genreIdBetween(
    int lowerGenreId,
    int upperGenreId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'genreId',
          lower: [lowerGenreId],
          includeLower: includeLower,
          upper: [upperGenreId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MaimaiCollectionGenreQueryFilter
    on
        QueryBuilder<
          MaimaiCollectionGenre,
          MaimaiCollectionGenre,
          QFilterCondition
        > {
  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'genre',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'genre',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genreId', value: value),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'genreId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'genreId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  genreIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'genreId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  titleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionGenre,
    MaimaiCollectionGenre,
    QAfterFilterCondition
  >
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }
}

extension MaimaiCollectionGenreQueryObject
    on
        QueryBuilder<
          MaimaiCollectionGenre,
          MaimaiCollectionGenre,
          QFilterCondition
        > {}

extension MaimaiCollectionGenreQueryLinks
    on
        QueryBuilder<
          MaimaiCollectionGenre,
          MaimaiCollectionGenre,
          QFilterCondition
        > {}

extension MaimaiCollectionGenreQuerySortBy
    on QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QSortBy> {
  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  sortByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  sortByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  sortByGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  sortByGenreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension MaimaiCollectionGenreQuerySortThenBy
    on QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QSortThenBy> {
  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  thenByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  thenByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  thenByGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  thenByGenreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QAfterSortBy>
  thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension MaimaiCollectionGenreQueryWhereDistinct
    on QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QDistinct> {
  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QDistinct>
  distinctByGenre({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QDistinct>
  distinctByGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genreId');
    });
  }

  QueryBuilder<MaimaiCollectionGenre, MaimaiCollectionGenre, QDistinct>
  distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension MaimaiCollectionGenreQueryProperty
    on
        QueryBuilder<
          MaimaiCollectionGenre,
          MaimaiCollectionGenre,
          QQueryProperty
        > {
  QueryBuilder<MaimaiCollectionGenre, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MaimaiCollectionGenre, String, QQueryOperations>
  genreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genre');
    });
  }

  QueryBuilder<MaimaiCollectionGenre, int, QQueryOperations> genreIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genreId');
    });
  }

  QueryBuilder<MaimaiCollectionGenre, String, QQueryOperations>
  titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MaimaiCollectionRequiredSongSchema = Schema(
  name: r'MaimaiCollectionRequiredSong',
  id: -5700926901696014366,
  properties: {
    r'completed': PropertySchema(
      id: 0,
      name: r'completed',
      type: IsarType.bool,
    ),
    r'completedDifficulties': PropertySchema(
      id: 1,
      name: r'completedDifficulties',
      type: IsarType.stringList,
      enumMap: _MaimaiCollectionRequiredSongcompletedDifficultiesEnumValueMap,
    ),
    r'id': PropertySchema(id: 2, name: r'id', type: IsarType.long),
    r'title': PropertySchema(id: 3, name: r'title', type: IsarType.string),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.string,
      enumMap: _MaimaiCollectionRequiredSongtypeEnumValueMap,
    ),
  },

  estimateSize: _maimaiCollectionRequiredSongEstimateSize,
  serialize: _maimaiCollectionRequiredSongSerialize,
  deserialize: _maimaiCollectionRequiredSongDeserialize,
  deserializeProp: _maimaiCollectionRequiredSongDeserializeProp,
);

int _maimaiCollectionRequiredSongEstimateSize(
  MaimaiCollectionRequiredSong object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.completedDifficulties.length * 3;
  {
    for (var i = 0; i < object.completedDifficulties.length; i++) {
      final value = object.completedDifficulties[i];
      bytesCount += value.name.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _maimaiCollectionRequiredSongSerialize(
  MaimaiCollectionRequiredSong object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.completed);
  writer.writeStringList(
    offsets[1],
    object.completedDifficulties.map((e) => e.name).toList(),
  );
  writer.writeLong(offsets[2], object.id);
  writer.writeString(offsets[3], object.title);
  writer.writeString(offsets[4], object.type.name);
}

MaimaiCollectionRequiredSong _maimaiCollectionRequiredSongDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiCollectionRequiredSong(
    completed: reader.readBoolOrNull(offsets[0]) ?? false,
    completedDifficulties:
        reader
            .readStringList(offsets[1])
            ?.map(
              (e) =>
                  _MaimaiCollectionRequiredSongcompletedDifficultiesValueEnumMap[e] ??
                  LevelIndex.basic,
            )
            .toList() ??
        const [],
    id: reader.readLongOrNull(offsets[2]) ?? 0,
    title: reader.readStringOrNull(offsets[3]) ?? '',
    type:
        _MaimaiCollectionRequiredSongtypeValueEnumMap[reader.readStringOrNull(
          offsets[4],
        )] ??
        SongType.standard,
  );
  return object;
}

P _maimaiCollectionRequiredSongDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (reader
                  .readStringList(offset)
                  ?.map(
                    (e) =>
                        _MaimaiCollectionRequiredSongcompletedDifficultiesValueEnumMap[e] ??
                        LevelIndex.basic,
                  )
                  .toList() ??
              const [])
          as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 4:
      return (_MaimaiCollectionRequiredSongtypeValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              SongType.standard)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MaimaiCollectionRequiredSongcompletedDifficultiesEnumValueMap = {
  r'basic': r'basic',
  r'advanced': r'advanced',
  r'expert': r'expert',
  r'master': r'master',
  r'reMaster': r'reMaster',
};
const _MaimaiCollectionRequiredSongcompletedDifficultiesValueEnumMap = {
  r'basic': LevelIndex.basic,
  r'advanced': LevelIndex.advanced,
  r'expert': LevelIndex.expert,
  r'master': LevelIndex.master,
  r'reMaster': LevelIndex.reMaster,
};
const _MaimaiCollectionRequiredSongtypeEnumValueMap = {
  r'standard': r'standard',
  r'dx': r'dx',
  r'utage': r'utage',
};
const _MaimaiCollectionRequiredSongtypeValueEnumMap = {
  r'standard': SongType.standard,
  r'dx': SongType.dx,
  r'utage': SongType.utage,
};

extension MaimaiCollectionRequiredSongQueryFilter
    on
        QueryBuilder<
          MaimaiCollectionRequiredSong,
          MaimaiCollectionRequiredSong,
          QFilterCondition
        > {
  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completed', value: value),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesElementEqualTo(
    LevelIndex value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'completedDifficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesElementGreaterThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completedDifficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesElementLessThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completedDifficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesElementBetween(
    LevelIndex lower,
    LevelIndex upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completedDifficulties',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'completedDifficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'completedDifficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'completedDifficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'completedDifficulties',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completedDifficulties', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'completedDifficulties',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedDifficulties',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'completedDifficulties', 0, true, 0, true);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'completedDifficulties', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedDifficulties',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedDifficulties',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  completedDifficultiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'completedDifficulties',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  idGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  idLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  titleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  typeEqualTo(SongType value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  typeGreaterThan(
    SongType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  typeLessThan(
    SongType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  typeBetween(
    SongType lower,
    SongType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'type',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  typeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  typeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'type',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'type',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequiredSong,
    MaimaiCollectionRequiredSong,
    QAfterFilterCondition
  >
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }
}

extension MaimaiCollectionRequiredSongQueryObject
    on
        QueryBuilder<
          MaimaiCollectionRequiredSong,
          MaimaiCollectionRequiredSong,
          QFilterCondition
        > {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MaimaiCollectionRequiredSchema = Schema(
  name: r'MaimaiCollectionRequired',
  id: 9052447626866209971,
  properties: {
    r'completed': PropertySchema(
      id: 0,
      name: r'completed',
      type: IsarType.bool,
    ),
    r'difficulties': PropertySchema(
      id: 1,
      name: r'difficulties',
      type: IsarType.stringList,
      enumMap: _MaimaiCollectionRequireddifficultiesEnumValueMap,
    ),
    r'fc': PropertySchema(
      id: 2,
      name: r'fc',
      type: IsarType.string,
      enumMap: _MaimaiCollectionRequiredfcEnumValueMap,
    ),
    r'fs': PropertySchema(
      id: 3,
      name: r'fs',
      type: IsarType.string,
      enumMap: _MaimaiCollectionRequiredfsEnumValueMap,
    ),
    r'rate': PropertySchema(
      id: 4,
      name: r'rate',
      type: IsarType.string,
      enumMap: _MaimaiCollectionRequiredrateEnumValueMap,
    ),
    r'songs': PropertySchema(
      id: 5,
      name: r'songs',
      type: IsarType.objectList,

      target: r'MaimaiCollectionRequiredSong',
    ),
  },

  estimateSize: _maimaiCollectionRequiredEstimateSize,
  serialize: _maimaiCollectionRequiredSerialize,
  deserialize: _maimaiCollectionRequiredDeserialize,
  deserializeProp: _maimaiCollectionRequiredDeserializeProp,
);

int _maimaiCollectionRequiredEstimateSize(
  MaimaiCollectionRequired object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.difficulties.length * 3;
  {
    for (var i = 0; i < object.difficulties.length; i++) {
      final value = object.difficulties[i];
      bytesCount += value.name.length * 3;
    }
  }
  {
    final value = object.fc;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.fs;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.rate;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  bytesCount += 3 + object.songs.length * 3;
  {
    final offsets = allOffsets[MaimaiCollectionRequiredSong]!;
    for (var i = 0; i < object.songs.length; i++) {
      final value = object.songs[i];
      bytesCount += MaimaiCollectionRequiredSongSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  return bytesCount;
}

void _maimaiCollectionRequiredSerialize(
  MaimaiCollectionRequired object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.completed);
  writer.writeStringList(
    offsets[1],
    object.difficulties.map((e) => e.name).toList(),
  );
  writer.writeString(offsets[2], object.fc?.name);
  writer.writeString(offsets[3], object.fs?.name);
  writer.writeString(offsets[4], object.rate?.name);
  writer.writeObjectList<MaimaiCollectionRequiredSong>(
    offsets[5],
    allOffsets,
    MaimaiCollectionRequiredSongSchema.serialize,
    object.songs,
  );
}

MaimaiCollectionRequired _maimaiCollectionRequiredDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiCollectionRequired(
    completed: reader.readBoolOrNull(offsets[0]) ?? false,
    difficulties:
        reader
            .readStringList(offsets[1])
            ?.map(
              (e) =>
                  _MaimaiCollectionRequireddifficultiesValueEnumMap[e] ??
                  LevelIndex.basic,
            )
            .toList() ??
        const [],
    fc:
        _MaimaiCollectionRequiredfcValueEnumMap[reader.readStringOrNull(
          offsets[2],
        )],
    fs:
        _MaimaiCollectionRequiredfsValueEnumMap[reader.readStringOrNull(
          offsets[3],
        )],
    rate:
        _MaimaiCollectionRequiredrateValueEnumMap[reader.readStringOrNull(
          offsets[4],
        )],
    songs:
        reader.readObjectList<MaimaiCollectionRequiredSong>(
          offsets[5],
          MaimaiCollectionRequiredSongSchema.deserialize,
          allOffsets,
          MaimaiCollectionRequiredSong(),
        ) ??
        const [],
  );
  return object;
}

P _maimaiCollectionRequiredDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (reader
                  .readStringList(offset)
                  ?.map(
                    (e) =>
                        _MaimaiCollectionRequireddifficultiesValueEnumMap[e] ??
                        LevelIndex.basic,
                  )
                  .toList() ??
              const [])
          as P;
    case 2:
      return (_MaimaiCollectionRequiredfcValueEnumMap[reader.readStringOrNull(
            offset,
          )])
          as P;
    case 3:
      return (_MaimaiCollectionRequiredfsValueEnumMap[reader.readStringOrNull(
            offset,
          )])
          as P;
    case 4:
      return (_MaimaiCollectionRequiredrateValueEnumMap[reader.readStringOrNull(
            offset,
          )])
          as P;
    case 5:
      return (reader.readObjectList<MaimaiCollectionRequiredSong>(
                offset,
                MaimaiCollectionRequiredSongSchema.deserialize,
                allOffsets,
                MaimaiCollectionRequiredSong(),
              ) ??
              const [])
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MaimaiCollectionRequireddifficultiesEnumValueMap = {
  r'basic': r'basic',
  r'advanced': r'advanced',
  r'expert': r'expert',
  r'master': r'master',
  r'reMaster': r'reMaster',
};
const _MaimaiCollectionRequireddifficultiesValueEnumMap = {
  r'basic': LevelIndex.basic,
  r'advanced': LevelIndex.advanced,
  r'expert': LevelIndex.expert,
  r'master': LevelIndex.master,
  r'reMaster': LevelIndex.reMaster,
};
const _MaimaiCollectionRequiredfcEnumValueMap = {
  r'apPlus': r'apPlus',
  r'ap': r'ap',
  r'fcPlus': r'fcPlus',
  r'fc': r'fc',
};
const _MaimaiCollectionRequiredfcValueEnumMap = {
  r'apPlus': FCType.apPlus,
  r'ap': FCType.ap,
  r'fcPlus': FCType.fcPlus,
  r'fc': FCType.fc,
};
const _MaimaiCollectionRequiredfsEnumValueMap = {
  r'fsdPlus': r'fsdPlus',
  r'fsd': r'fsd',
  r'fsPlus': r'fsPlus',
  r'fs': r'fs',
  r'sync': r'sync',
};
const _MaimaiCollectionRequiredfsValueEnumMap = {
  r'fsdPlus': FSType.fsdPlus,
  r'fsd': FSType.fsd,
  r'fsPlus': FSType.fsPlus,
  r'fs': FSType.fs,
  r'sync': FSType.sync,
};
const _MaimaiCollectionRequiredrateEnumValueMap = {
  r'sssPlus': r'sssPlus',
  r'sss': r'sss',
  r'ssPlus': r'ssPlus',
  r'ss': r'ss',
  r'sPlus': r'sPlus',
  r's': r's',
  r'aaa': r'aaa',
  r'aa': r'aa',
  r'a': r'a',
  r'bbb': r'bbb',
  r'bb': r'bb',
  r'b': r'b',
  r'c': r'c',
  r'd': r'd',
};
const _MaimaiCollectionRequiredrateValueEnumMap = {
  r'sssPlus': RateType.sssPlus,
  r'sss': RateType.sss,
  r'ssPlus': RateType.ssPlus,
  r'ss': RateType.ss,
  r'sPlus': RateType.sPlus,
  r's': RateType.s,
  r'aaa': RateType.aaa,
  r'aa': RateType.aa,
  r'a': RateType.a,
  r'bbb': RateType.bbb,
  r'bb': RateType.bb,
  r'b': RateType.b,
  r'c': RateType.c,
  r'd': RateType.d,
};

extension MaimaiCollectionRequiredQueryFilter
    on
        QueryBuilder<
          MaimaiCollectionRequired,
          MaimaiCollectionRequired,
          QFilterCondition
        > {
  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  completedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completed', value: value),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesElementEqualTo(LevelIndex value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'difficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesElementGreaterThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'difficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesElementLessThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'difficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesElementBetween(
    LevelIndex lower,
    LevelIndex upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'difficulties',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'difficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'difficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'difficulties',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'difficulties',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'difficulties', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'difficulties', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'difficulties', length, true, length, true);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'difficulties', 0, true, 0, true);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'difficulties', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'difficulties', 0, true, length, include);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'difficulties', length, include, 999999, true);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  difficultiesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'difficulties',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fc'),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fc'),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcEqualTo(FCType? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcGreaterThan(
    FCType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcLessThan(FCType? value, {bool include = false, bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcBetween(
    FCType? lower,
    FCType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fc',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'fc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'fc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'fc',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'fc',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fc', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fcIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fc', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fs'),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fs'),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsEqualTo(FSType? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsGreaterThan(
    FSType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsLessThan(FSType? value, {bool include = false, bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsBetween(
    FSType? lower,
    FSType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'fs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'fs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'fs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'fs',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fs', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  fsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fs', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rate'),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rate'),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateEqualTo(RateType? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateGreaterThan(
    RateType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateLessThan(
    RateType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateBetween(
    RateType? lower,
    RateType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'rate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'rate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'rate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'rate',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rate', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  rateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rate', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  songsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'songs', length, true, length, true);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  songsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'songs', 0, true, 0, true);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  songsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'songs', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  songsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'songs', 0, true, length, include);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  songsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'songs', length, include, 999999, true);
    });
  }

  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  songsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'songs',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension MaimaiCollectionRequiredQueryObject
    on
        QueryBuilder<
          MaimaiCollectionRequired,
          MaimaiCollectionRequired,
          QFilterCondition
        > {
  QueryBuilder<
    MaimaiCollectionRequired,
    MaimaiCollectionRequired,
    QAfterFilterCondition
  >
  songsElement(FilterQuery<MaimaiCollectionRequiredSong> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'songs');
    });
  }
}

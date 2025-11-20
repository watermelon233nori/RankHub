// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musedash_elfin.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMuseDashElfinCollection on Isar {
  IsarCollection<MuseDashElfin> get museDashElfins => this.collection();
}

const MuseDashElfinSchema = CollectionSchema(
  name: r'MuseDashElfin',
  id: -2587905730592085451,
  properties: {
    r'chipDescription': PropertySchema(
      id: 0,
      name: r'chipDescription',
      type: IsarType.string,
    ),
    r'chipName': PropertySchema(
      id: 1,
      name: r'chipName',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'elfinId': PropertySchema(id: 4, name: r'elfinId', type: IsarType.long),
    r'name': PropertySchema(id: 5, name: r'name', type: IsarType.string),
    r'skill': PropertySchema(id: 6, name: r'skill', type: IsarType.string),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _museDashElfinEstimateSize,
  serialize: _museDashElfinSerialize,
  deserialize: _museDashElfinDeserialize,
  deserializeProp: _museDashElfinDeserializeProp,
  idName: r'id',
  indexes: {
    r'elfinId': IndexSchema(
      id: 8621469003650632948,
      name: r'elfinId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'elfinId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _museDashElfinGetId,
  getLinks: _museDashElfinGetLinks,
  attach: _museDashElfinAttach,
  version: '3.3.0',
);

int _museDashElfinEstimateSize(
  MuseDashElfin object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.chipDescription.length * 3;
  bytesCount += 3 + object.chipName.length * 3;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.skill.length * 3;
  return bytesCount;
}

void _museDashElfinSerialize(
  MuseDashElfin object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.chipDescription);
  writer.writeString(offsets[1], object.chipName);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.description);
  writer.writeLong(offsets[4], object.elfinId);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.skill);
  writer.writeDateTime(offsets[7], object.updatedAt);
}

MuseDashElfin _museDashElfinDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MuseDashElfin();
  object.chipDescription = reader.readString(offsets[0]);
  object.chipName = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.description = reader.readString(offsets[3]);
  object.elfinId = reader.readLong(offsets[4]);
  object.id = id;
  object.name = reader.readString(offsets[5]);
  object.skill = reader.readString(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  return object;
}

P _museDashElfinDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _museDashElfinGetId(MuseDashElfin object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _museDashElfinGetLinks(MuseDashElfin object) {
  return [];
}

void _museDashElfinAttach(
  IsarCollection<dynamic> col,
  Id id,
  MuseDashElfin object,
) {
  object.id = id;
}

extension MuseDashElfinByIndex on IsarCollection<MuseDashElfin> {
  Future<MuseDashElfin?> getByElfinId(int elfinId) {
    return getByIndex(r'elfinId', [elfinId]);
  }

  MuseDashElfin? getByElfinIdSync(int elfinId) {
    return getByIndexSync(r'elfinId', [elfinId]);
  }

  Future<bool> deleteByElfinId(int elfinId) {
    return deleteByIndex(r'elfinId', [elfinId]);
  }

  bool deleteByElfinIdSync(int elfinId) {
    return deleteByIndexSync(r'elfinId', [elfinId]);
  }

  Future<List<MuseDashElfin?>> getAllByElfinId(List<int> elfinIdValues) {
    final values = elfinIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'elfinId', values);
  }

  List<MuseDashElfin?> getAllByElfinIdSync(List<int> elfinIdValues) {
    final values = elfinIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'elfinId', values);
  }

  Future<int> deleteAllByElfinId(List<int> elfinIdValues) {
    final values = elfinIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'elfinId', values);
  }

  int deleteAllByElfinIdSync(List<int> elfinIdValues) {
    final values = elfinIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'elfinId', values);
  }

  Future<Id> putByElfinId(MuseDashElfin object) {
    return putByIndex(r'elfinId', object);
  }

  Id putByElfinIdSync(MuseDashElfin object, {bool saveLinks = true}) {
    return putByIndexSync(r'elfinId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByElfinId(List<MuseDashElfin> objects) {
    return putAllByIndex(r'elfinId', objects);
  }

  List<Id> putAllByElfinIdSync(
    List<MuseDashElfin> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'elfinId', objects, saveLinks: saveLinks);
  }
}

extension MuseDashElfinQueryWhereSort
    on QueryBuilder<MuseDashElfin, MuseDashElfin, QWhere> {
  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhere> anyElfinId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'elfinId'),
      );
    });
  }
}

extension MuseDashElfinQueryWhere
    on QueryBuilder<MuseDashElfin, MuseDashElfin, QWhereClause> {
  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhereClause> idBetween(
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhereClause> elfinIdEqualTo(
    int elfinId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'elfinId', value: [elfinId]),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhereClause>
  elfinIdNotEqualTo(int elfinId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'elfinId',
                lower: [],
                upper: [elfinId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'elfinId',
                lower: [elfinId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'elfinId',
                lower: [elfinId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'elfinId',
                lower: [],
                upper: [elfinId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhereClause>
  elfinIdGreaterThan(int elfinId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'elfinId',
          lower: [elfinId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhereClause> elfinIdLessThan(
    int elfinId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'elfinId',
          lower: [],
          upper: [elfinId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterWhereClause> elfinIdBetween(
    int lowerElfinId,
    int upperElfinId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'elfinId',
          lower: [lowerElfinId],
          includeLower: includeLower,
          upper: [upperElfinId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MuseDashElfinQueryFilter
    on QueryBuilder<MuseDashElfin, MuseDashElfin, QFilterCondition> {
  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipDescriptionEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'chipDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'chipDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'chipDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'chipDescription',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipDescriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'chipDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipDescriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'chipDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'chipDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'chipDescription',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chipDescription', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chipDescription', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'chipName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'chipName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'chipName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'chipName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'chipName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'chipName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'chipName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'chipName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chipName', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  chipNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chipName', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  descriptionEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  descriptionGreaterThan(
    String value, {
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  descriptionLessThan(
    String value, {
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  descriptionBetween(
    String lower,
    String upper, {
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  elfinIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'elfinId', value: value),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  elfinIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'elfinId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  elfinIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'elfinId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  elfinIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'elfinId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  skillEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'skill',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  skillGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'skill',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  skillLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'skill',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  skillBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'skill',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  skillStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'skill',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  skillEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'skill',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  skillContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'skill',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  skillMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'skill',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  skillIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'skill', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  skillIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'skill', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterFilterCondition>
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MuseDashElfinQueryObject
    on QueryBuilder<MuseDashElfin, MuseDashElfin, QFilterCondition> {}

extension MuseDashElfinQueryLinks
    on QueryBuilder<MuseDashElfin, MuseDashElfin, QFilterCondition> {}

extension MuseDashElfinQuerySortBy
    on QueryBuilder<MuseDashElfin, MuseDashElfin, QSortBy> {
  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  sortByChipDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipDescription', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  sortByChipDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipDescription', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> sortByChipName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipName', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  sortByChipNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipName', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> sortByElfinId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elfinId', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> sortByElfinIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elfinId', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> sortBySkill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> sortBySkillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension MuseDashElfinQuerySortThenBy
    on QueryBuilder<MuseDashElfin, MuseDashElfin, QSortThenBy> {
  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  thenByChipDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipDescription', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  thenByChipDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipDescription', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenByChipName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipName', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  thenByChipNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipName', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenByElfinId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elfinId', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenByElfinIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elfinId', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenBySkill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenBySkillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.desc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension MuseDashElfinQueryWhereDistinct
    on QueryBuilder<MuseDashElfin, MuseDashElfin, QDistinct> {
  QueryBuilder<MuseDashElfin, MuseDashElfin, QDistinct>
  distinctByChipDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'chipDescription',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QDistinct> distinctByChipName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chipName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QDistinct> distinctByDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QDistinct> distinctByElfinId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'elfinId');
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QDistinct> distinctBySkill({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skill', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashElfin, MuseDashElfin, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension MuseDashElfinQueryProperty
    on QueryBuilder<MuseDashElfin, MuseDashElfin, QQueryProperty> {
  QueryBuilder<MuseDashElfin, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MuseDashElfin, String, QQueryOperations>
  chipDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chipDescription');
    });
  }

  QueryBuilder<MuseDashElfin, String, QQueryOperations> chipNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chipName');
    });
  }

  QueryBuilder<MuseDashElfin, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MuseDashElfin, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<MuseDashElfin, int, QQueryOperations> elfinIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'elfinId');
    });
  }

  QueryBuilder<MuseDashElfin, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MuseDashElfin, String, QQueryOperations> skillProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skill');
    });
  }

  QueryBuilder<MuseDashElfin, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

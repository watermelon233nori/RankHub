// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musedash_character.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMuseDashCharacterCollection on Isar {
  IsarCollection<MuseDashCharacter> get museDashCharacters => this.collection();
}

const MuseDashCharacterSchema = CollectionSchema(
  name: r'MuseDashCharacter',
  id: -8155658233063067690,
  properties: {
    r'autoExpressions': PropertySchema(
      id: 0,
      name: r'autoExpressions',
      type: IsarType.string,
    ),
    r'catExpressions': PropertySchema(
      id: 1,
      name: r'catExpressions',
      type: IsarType.string,
    ),
    r'characterId': PropertySchema(
      id: 2,
      name: r'characterId',
      type: IsarType.long,
    ),
    r'characterName': PropertySchema(
      id: 3,
      name: r'characterName',
      type: IsarType.string,
    ),
    r'chipDescription': PropertySchema(
      id: 4,
      name: r'chipDescription',
      type: IsarType.string,
    ),
    r'chipName': PropertySchema(
      id: 5,
      name: r'chipName',
      type: IsarType.string,
    ),
    r'cosName': PropertySchema(id: 6, name: r'cosName', type: IsarType.string),
    r'cosNames': PropertySchema(
      id: 7,
      name: r'cosNames',
      type: IsarType.stringList,
    ),
    r'createdAt': PropertySchema(
      id: 8,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'cv': PropertySchema(id: 9, name: r'cv', type: IsarType.string),
    r'cvs': PropertySchema(id: 10, name: r'cvs', type: IsarType.stringList),
    r'description': PropertySchema(
      id: 11,
      name: r'description',
      type: IsarType.string,
    ),
    r'expressions': PropertySchema(
      id: 12,
      name: r'expressions',
      type: IsarType.string,
    ),
    r'foolishExpressions': PropertySchema(
      id: 13,
      name: r'foolishExpressions',
      type: IsarType.string,
    ),
    r'listIndex': PropertySchema(
      id: 14,
      name: r'listIndex',
      type: IsarType.long,
    ),
    r'reviewExpressions': PropertySchema(
      id: 15,
      name: r'reviewExpressions',
      type: IsarType.string,
    ),
    r'skill': PropertySchema(id: 16, name: r'skill', type: IsarType.string),
    r'skills': PropertySchema(
      id: 17,
      name: r'skills',
      type: IsarType.stringList,
    ),
    r'skinNames': PropertySchema(
      id: 18,
      name: r'skinNames',
      type: IsarType.stringList,
    ),
    r'updatedAt': PropertySchema(
      id: 19,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _museDashCharacterEstimateSize,
  serialize: _museDashCharacterSerialize,
  deserialize: _museDashCharacterDeserialize,
  deserializeProp: _museDashCharacterDeserializeProp,
  idName: r'id',
  indexes: {
    r'characterId': IndexSchema(
      id: 8442520835599207285,
      name: r'characterId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'characterId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _museDashCharacterGetId,
  getLinks: _museDashCharacterGetLinks,
  attach: _museDashCharacterAttach,
  version: '3.3.0',
);

int _museDashCharacterEstimateSize(
  MuseDashCharacter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.autoExpressions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.catExpressions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.characterName.length * 3;
  bytesCount += 3 + object.chipDescription.length * 3;
  bytesCount += 3 + object.chipName.length * 3;
  bytesCount += 3 + object.cosName.length * 3;
  bytesCount += 3 + object.cosNames.length * 3;
  {
    for (var i = 0; i < object.cosNames.length; i++) {
      final value = object.cosNames[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.cv.length * 3;
  bytesCount += 3 + object.cvs.length * 3;
  {
    for (var i = 0; i < object.cvs.length; i++) {
      final value = object.cvs[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.description.length * 3;
  {
    final value = object.expressions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.foolishExpressions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reviewExpressions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.skill.length * 3;
  bytesCount += 3 + object.skills.length * 3;
  {
    for (var i = 0; i < object.skills.length; i++) {
      final value = object.skills[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.skinNames.length * 3;
  {
    for (var i = 0; i < object.skinNames.length; i++) {
      final value = object.skinNames[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _museDashCharacterSerialize(
  MuseDashCharacter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.autoExpressions);
  writer.writeString(offsets[1], object.catExpressions);
  writer.writeLong(offsets[2], object.characterId);
  writer.writeString(offsets[3], object.characterName);
  writer.writeString(offsets[4], object.chipDescription);
  writer.writeString(offsets[5], object.chipName);
  writer.writeString(offsets[6], object.cosName);
  writer.writeStringList(offsets[7], object.cosNames);
  writer.writeDateTime(offsets[8], object.createdAt);
  writer.writeString(offsets[9], object.cv);
  writer.writeStringList(offsets[10], object.cvs);
  writer.writeString(offsets[11], object.description);
  writer.writeString(offsets[12], object.expressions);
  writer.writeString(offsets[13], object.foolishExpressions);
  writer.writeLong(offsets[14], object.listIndex);
  writer.writeString(offsets[15], object.reviewExpressions);
  writer.writeString(offsets[16], object.skill);
  writer.writeStringList(offsets[17], object.skills);
  writer.writeStringList(offsets[18], object.skinNames);
  writer.writeDateTime(offsets[19], object.updatedAt);
}

MuseDashCharacter _museDashCharacterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MuseDashCharacter();
  object.autoExpressions = reader.readStringOrNull(offsets[0]);
  object.catExpressions = reader.readStringOrNull(offsets[1]);
  object.characterId = reader.readLong(offsets[2]);
  object.characterName = reader.readString(offsets[3]);
  object.chipDescription = reader.readString(offsets[4]);
  object.chipName = reader.readString(offsets[5]);
  object.cosName = reader.readString(offsets[6]);
  object.cosNames = reader.readStringList(offsets[7]) ?? [];
  object.createdAt = reader.readDateTime(offsets[8]);
  object.cv = reader.readString(offsets[9]);
  object.cvs = reader.readStringList(offsets[10]) ?? [];
  object.description = reader.readString(offsets[11]);
  object.expressions = reader.readStringOrNull(offsets[12]);
  object.foolishExpressions = reader.readStringOrNull(offsets[13]);
  object.id = id;
  object.listIndex = reader.readLong(offsets[14]);
  object.reviewExpressions = reader.readStringOrNull(offsets[15]);
  object.skill = reader.readString(offsets[16]);
  object.skills = reader.readStringList(offsets[17]) ?? [];
  object.skinNames = reader.readStringList(offsets[18]) ?? [];
  object.updatedAt = reader.readDateTime(offsets[19]);
  return object;
}

P _museDashCharacterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringList(offset) ?? []) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readStringList(offset) ?? []) as P;
    case 18:
      return (reader.readStringList(offset) ?? []) as P;
    case 19:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _museDashCharacterGetId(MuseDashCharacter object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _museDashCharacterGetLinks(
  MuseDashCharacter object,
) {
  return [];
}

void _museDashCharacterAttach(
  IsarCollection<dynamic> col,
  Id id,
  MuseDashCharacter object,
) {
  object.id = id;
}

extension MuseDashCharacterByIndex on IsarCollection<MuseDashCharacter> {
  Future<MuseDashCharacter?> getByCharacterId(int characterId) {
    return getByIndex(r'characterId', [characterId]);
  }

  MuseDashCharacter? getByCharacterIdSync(int characterId) {
    return getByIndexSync(r'characterId', [characterId]);
  }

  Future<bool> deleteByCharacterId(int characterId) {
    return deleteByIndex(r'characterId', [characterId]);
  }

  bool deleteByCharacterIdSync(int characterId) {
    return deleteByIndexSync(r'characterId', [characterId]);
  }

  Future<List<MuseDashCharacter?>> getAllByCharacterId(
    List<int> characterIdValues,
  ) {
    final values = characterIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'characterId', values);
  }

  List<MuseDashCharacter?> getAllByCharacterIdSync(
    List<int> characterIdValues,
  ) {
    final values = characterIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'characterId', values);
  }

  Future<int> deleteAllByCharacterId(List<int> characterIdValues) {
    final values = characterIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'characterId', values);
  }

  int deleteAllByCharacterIdSync(List<int> characterIdValues) {
    final values = characterIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'characterId', values);
  }

  Future<Id> putByCharacterId(MuseDashCharacter object) {
    return putByIndex(r'characterId', object);
  }

  Id putByCharacterIdSync(MuseDashCharacter object, {bool saveLinks = true}) {
    return putByIndexSync(r'characterId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCharacterId(List<MuseDashCharacter> objects) {
    return putAllByIndex(r'characterId', objects);
  }

  List<Id> putAllByCharacterIdSync(
    List<MuseDashCharacter> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'characterId', objects, saveLinks: saveLinks);
  }
}

extension MuseDashCharacterQueryWhereSort
    on QueryBuilder<MuseDashCharacter, MuseDashCharacter, QWhere> {
  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhere>
  anyCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'characterId'),
      );
    });
  }
}

extension MuseDashCharacterQueryWhere
    on QueryBuilder<MuseDashCharacter, MuseDashCharacter, QWhereClause> {
  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhereClause>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhereClause>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhereClause>
  characterIdEqualTo(int characterId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'characterId',
          value: [characterId],
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhereClause>
  characterIdNotEqualTo(int characterId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'characterId',
                lower: [],
                upper: [characterId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'characterId',
                lower: [characterId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'characterId',
                lower: [characterId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'characterId',
                lower: [],
                upper: [characterId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhereClause>
  characterIdGreaterThan(int characterId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'characterId',
          lower: [characterId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhereClause>
  characterIdLessThan(int characterId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'characterId',
          lower: [],
          upper: [characterId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterWhereClause>
  characterIdBetween(
    int lowerCharacterId,
    int upperCharacterId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'characterId',
          lower: [lowerCharacterId],
          includeLower: includeLower,
          upper: [upperCharacterId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MuseDashCharacterQueryFilter
    on QueryBuilder<MuseDashCharacter, MuseDashCharacter, QFilterCondition> {
  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'autoExpressions'),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'autoExpressions'),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'autoExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'autoExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'autoExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'autoExpressions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'autoExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'autoExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'autoExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'autoExpressions',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'autoExpressions', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  autoExpressionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'autoExpressions', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'catExpressions'),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'catExpressions'),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'catExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'catExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'catExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'catExpressions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'catExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'catExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'catExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'catExpressions',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'catExpressions', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  catExpressionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'catExpressions', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'characterId', value: value),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'characterId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'characterId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'characterId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'characterName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'characterName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'characterName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'characterName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'characterName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'characterName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'characterName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'characterName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'characterName', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  characterNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'characterName', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  chipDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chipDescription', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  chipDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chipDescription', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  chipNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chipName', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  chipNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'chipName', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'cosName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cosName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cosName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cosName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'cosName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'cosName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'cosName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'cosName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cosName', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cosName', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'cosNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cosNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cosNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cosNames',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'cosNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'cosNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'cosNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'cosNames',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cosNames', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cosNames', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cosNames', length, true, length, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cosNames', 0, true, 0, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cosNames', 0, false, 999999, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cosNames', 0, true, length, include);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cosNames', length, include, 999999, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cosNamesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'cosNames',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'cv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvLessThan(String value, {bool include = false, bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cv',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'cv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'cv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'cv',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'cv',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cv', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cv', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'cvs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cvs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cvs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cvs',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'cvs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'cvs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'cvs',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'cvs',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cvs', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'cvs', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cvs', length, true, length, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cvs', 0, true, 0, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cvs', 0, false, 999999, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cvs', 0, true, length, include);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cvs', length, include, 999999, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  cvsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'cvs', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'expressions'),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'expressions'),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'expressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'expressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'expressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'expressions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'expressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'expressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'expressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'expressions',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'expressions', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  expressionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'expressions', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'foolishExpressions'),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'foolishExpressions'),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'foolishExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'foolishExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'foolishExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'foolishExpressions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'foolishExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'foolishExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'foolishExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'foolishExpressions',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'foolishExpressions', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  foolishExpressionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'foolishExpressions', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  listIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'listIndex', value: value),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  listIndexGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'listIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  listIndexLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'listIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  listIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'listIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'reviewExpressions'),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'reviewExpressions'),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reviewExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reviewExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reviewExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reviewExpressions',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'reviewExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'reviewExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'reviewExpressions',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'reviewExpressions',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'reviewExpressions', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  reviewExpressionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'reviewExpressions', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'skill', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'skill', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'skills',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'skills',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'skills',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'skills',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'skills',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'skills',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'skills',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'skills',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'skills', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'skills', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'skills', length, true, length, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'skills', 0, true, 0, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'skills', 0, false, 999999, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'skills', 0, true, length, include);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'skills', length, include, 999999, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skillsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'skills',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'skinNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'skinNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'skinNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'skinNames',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'skinNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'skinNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'skinNames',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'skinNames',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'skinNames', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'skinNames', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'skinNames', length, true, length, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'skinNames', 0, true, 0, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'skinNames', 0, false, 999999, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'skinNames', 0, true, length, include);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'skinNames', length, include, 999999, true);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  skinNamesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'skinNames',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterFilterCondition>
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

extension MuseDashCharacterQueryObject
    on QueryBuilder<MuseDashCharacter, MuseDashCharacter, QFilterCondition> {}

extension MuseDashCharacterQueryLinks
    on QueryBuilder<MuseDashCharacter, MuseDashCharacter, QFilterCondition> {}

extension MuseDashCharacterQuerySortBy
    on QueryBuilder<MuseDashCharacter, MuseDashCharacter, QSortBy> {
  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByAutoExpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoExpressions', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByAutoExpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoExpressions', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByCatExpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catExpressions', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByCatExpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catExpressions', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByCharacterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByCharacterName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterName', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByCharacterNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterName', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByChipDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipDescription', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByChipDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipDescription', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByChipName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipName', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByChipNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipName', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByCosName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cosName', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByCosNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cosName', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy> sortByCv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cv', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByCvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cv', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByExpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expressions', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByExpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expressions', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByFoolishExpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foolishExpressions', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByFoolishExpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foolishExpressions', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByListIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listIndex', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByListIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listIndex', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByReviewExpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewExpressions', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByReviewExpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewExpressions', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortBySkill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortBySkillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension MuseDashCharacterQuerySortThenBy
    on QueryBuilder<MuseDashCharacter, MuseDashCharacter, QSortThenBy> {
  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByAutoExpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoExpressions', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByAutoExpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoExpressions', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByCatExpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catExpressions', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByCatExpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catExpressions', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByCharacterIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterId', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByCharacterName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterName', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByCharacterNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterName', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByChipDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipDescription', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByChipDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipDescription', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByChipName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipName', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByChipNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chipName', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByCosName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cosName', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByCosNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cosName', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy> thenByCv() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cv', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByCvDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cv', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByExpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expressions', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByExpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expressions', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByFoolishExpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foolishExpressions', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByFoolishExpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foolishExpressions', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByListIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listIndex', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByListIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listIndex', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByReviewExpressions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewExpressions', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByReviewExpressionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewExpressions', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenBySkill() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenBySkillDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'skill', Sort.desc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension MuseDashCharacterQueryWhereDistinct
    on QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct> {
  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByAutoExpressions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'autoExpressions',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByCatExpressions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'catExpressions',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByCharacterId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'characterId');
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByCharacterName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'characterName',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByChipDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'chipDescription',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByChipName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chipName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByCosName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cosName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByCosNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cosNames');
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct> distinctByCv({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cv', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByCvs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cvs');
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByExpressions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expressions', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByFoolishExpressions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'foolishExpressions',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByListIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'listIndex');
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByReviewExpressions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'reviewExpressions',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctBySkill({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skill', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctBySkills() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skills');
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctBySkinNames() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'skinNames');
    });
  }

  QueryBuilder<MuseDashCharacter, MuseDashCharacter, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension MuseDashCharacterQueryProperty
    on QueryBuilder<MuseDashCharacter, MuseDashCharacter, QQueryProperty> {
  QueryBuilder<MuseDashCharacter, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MuseDashCharacter, String?, QQueryOperations>
  autoExpressionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoExpressions');
    });
  }

  QueryBuilder<MuseDashCharacter, String?, QQueryOperations>
  catExpressionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'catExpressions');
    });
  }

  QueryBuilder<MuseDashCharacter, int, QQueryOperations> characterIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characterId');
    });
  }

  QueryBuilder<MuseDashCharacter, String, QQueryOperations>
  characterNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characterName');
    });
  }

  QueryBuilder<MuseDashCharacter, String, QQueryOperations>
  chipDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chipDescription');
    });
  }

  QueryBuilder<MuseDashCharacter, String, QQueryOperations> chipNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chipName');
    });
  }

  QueryBuilder<MuseDashCharacter, String, QQueryOperations> cosNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cosName');
    });
  }

  QueryBuilder<MuseDashCharacter, List<String>, QQueryOperations>
  cosNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cosNames');
    });
  }

  QueryBuilder<MuseDashCharacter, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MuseDashCharacter, String, QQueryOperations> cvProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cv');
    });
  }

  QueryBuilder<MuseDashCharacter, List<String>, QQueryOperations>
  cvsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cvs');
    });
  }

  QueryBuilder<MuseDashCharacter, String, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<MuseDashCharacter, String?, QQueryOperations>
  expressionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expressions');
    });
  }

  QueryBuilder<MuseDashCharacter, String?, QQueryOperations>
  foolishExpressionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foolishExpressions');
    });
  }

  QueryBuilder<MuseDashCharacter, int, QQueryOperations> listIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listIndex');
    });
  }

  QueryBuilder<MuseDashCharacter, String?, QQueryOperations>
  reviewExpressionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewExpressions');
    });
  }

  QueryBuilder<MuseDashCharacter, String, QQueryOperations> skillProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skill');
    });
  }

  QueryBuilder<MuseDashCharacter, List<String>, QQueryOperations>
  skillsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skills');
    });
  }

  QueryBuilder<MuseDashCharacter, List<String>, QQueryOperations>
  skinNamesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'skinNames');
    });
  }

  QueryBuilder<MuseDashCharacter, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musedash_player.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMuseDashPlayerCollection on Isar {
  IsarCollection<MuseDashPlayer> get museDashPlayers => this.collection();
}

const MuseDashPlayerSchema = CollectionSchema(
  name: r'MuseDashPlayer',
  id: -6163450804127694457,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'diffHistoryNumber': PropertySchema(
      id: 1,
      name: r'diffHistoryNumber',
      type: IsarType.long,
    ),
    r'lastUpdate': PropertySchema(
      id: 2,
      name: r'lastUpdate',
      type: IsarType.long,
    ),
    r'lastUpdateTime': PropertySchema(
      id: 3,
      name: r'lastUpdateTime',
      type: IsarType.dateTime,
    ),
    r'nickname': PropertySchema(
      id: 4,
      name: r'nickname',
      type: IsarType.string,
    ),
    r'objectId': PropertySchema(
      id: 5,
      name: r'objectId',
      type: IsarType.string,
    ),
    r'rl': PropertySchema(id: 6, name: r'rl', type: IsarType.double),
    r'updatedAt': PropertySchema(
      id: 7,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(id: 8, name: r'userId', type: IsarType.string),
    r'userUuid': PropertySchema(
      id: 9,
      name: r'userUuid',
      type: IsarType.string,
    ),
  },

  estimateSize: _museDashPlayerEstimateSize,
  serialize: _museDashPlayerSerialize,
  deserialize: _museDashPlayerDeserialize,
  deserializeProp: _museDashPlayerDeserializeProp,
  idName: r'id',
  indexes: {
    r'userUuid': IndexSchema(
      id: -2441299026227353304,
      name: r'userUuid',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userUuid',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _museDashPlayerGetId,
  getLinks: _museDashPlayerGetLinks,
  attach: _museDashPlayerAttach,
  version: '3.3.0',
);

int _museDashPlayerEstimateSize(
  MuseDashPlayer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nickname.length * 3;
  bytesCount += 3 + object.objectId.length * 3;
  bytesCount += 3 + object.userId.length * 3;
  bytesCount += 3 + object.userUuid.length * 3;
  return bytesCount;
}

void _museDashPlayerSerialize(
  MuseDashPlayer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.diffHistoryNumber);
  writer.writeLong(offsets[2], object.lastUpdate);
  writer.writeDateTime(offsets[3], object.lastUpdateTime);
  writer.writeString(offsets[4], object.nickname);
  writer.writeString(offsets[5], object.objectId);
  writer.writeDouble(offsets[6], object.rl);
  writer.writeDateTime(offsets[7], object.updatedAt);
  writer.writeString(offsets[8], object.userId);
  writer.writeString(offsets[9], object.userUuid);
}

MuseDashPlayer _museDashPlayerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MuseDashPlayer();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.diffHistoryNumber = reader.readLong(offsets[1]);
  object.id = id;
  object.lastUpdate = reader.readLong(offsets[2]);
  object.nickname = reader.readString(offsets[4]);
  object.objectId = reader.readString(offsets[5]);
  object.rl = reader.readDouble(offsets[6]);
  object.updatedAt = reader.readDateTime(offsets[7]);
  object.userId = reader.readString(offsets[8]);
  object.userUuid = reader.readString(offsets[9]);
  return object;
}

P _museDashPlayerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _museDashPlayerGetId(MuseDashPlayer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _museDashPlayerGetLinks(MuseDashPlayer object) {
  return [];
}

void _museDashPlayerAttach(
  IsarCollection<dynamic> col,
  Id id,
  MuseDashPlayer object,
) {
  object.id = id;
}

extension MuseDashPlayerByIndex on IsarCollection<MuseDashPlayer> {
  Future<MuseDashPlayer?> getByUserUuid(String userUuid) {
    return getByIndex(r'userUuid', [userUuid]);
  }

  MuseDashPlayer? getByUserUuidSync(String userUuid) {
    return getByIndexSync(r'userUuid', [userUuid]);
  }

  Future<bool> deleteByUserUuid(String userUuid) {
    return deleteByIndex(r'userUuid', [userUuid]);
  }

  bool deleteByUserUuidSync(String userUuid) {
    return deleteByIndexSync(r'userUuid', [userUuid]);
  }

  Future<List<MuseDashPlayer?>> getAllByUserUuid(List<String> userUuidValues) {
    final values = userUuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'userUuid', values);
  }

  List<MuseDashPlayer?> getAllByUserUuidSync(List<String> userUuidValues) {
    final values = userUuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userUuid', values);
  }

  Future<int> deleteAllByUserUuid(List<String> userUuidValues) {
    final values = userUuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userUuid', values);
  }

  int deleteAllByUserUuidSync(List<String> userUuidValues) {
    final values = userUuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userUuid', values);
  }

  Future<Id> putByUserUuid(MuseDashPlayer object) {
    return putByIndex(r'userUuid', object);
  }

  Id putByUserUuidSync(MuseDashPlayer object, {bool saveLinks = true}) {
    return putByIndexSync(r'userUuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserUuid(List<MuseDashPlayer> objects) {
    return putAllByIndex(r'userUuid', objects);
  }

  List<Id> putAllByUserUuidSync(
    List<MuseDashPlayer> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'userUuid', objects, saveLinks: saveLinks);
  }
}

extension MuseDashPlayerQueryWhereSort
    on QueryBuilder<MuseDashPlayer, MuseDashPlayer, QWhere> {
  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MuseDashPlayerQueryWhere
    on QueryBuilder<MuseDashPlayer, MuseDashPlayer, QWhereClause> {
  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterWhereClause> idBetween(
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

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterWhereClause>
  userUuidEqualTo(String userUuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userUuid', value: [userUuid]),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterWhereClause>
  userUuidNotEqualTo(String userUuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userUuid',
                lower: [],
                upper: [userUuid],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userUuid',
                lower: [userUuid],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userUuid',
                lower: [userUuid],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userUuid',
                lower: [],
                upper: [userUuid],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension MuseDashPlayerQueryFilter
    on QueryBuilder<MuseDashPlayer, MuseDashPlayer, QFilterCondition> {
  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
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

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
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

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
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

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  diffHistoryNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'diffHistoryNumber', value: value),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  diffHistoryNumberGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'diffHistoryNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  diffHistoryNumberLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'diffHistoryNumber',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  diffHistoryNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'diffHistoryNumber',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
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

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
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

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  lastUpdateEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdate', value: value),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  lastUpdateGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUpdate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  lastUpdateLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUpdate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  lastUpdateBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUpdate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  lastUpdateTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdateTime', value: value),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  lastUpdateTimeGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUpdateTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  lastUpdateTimeLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUpdateTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  lastUpdateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUpdateTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  nicknameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  nicknameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  nicknameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  nicknameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nickname',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  nicknameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  nicknameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  nicknameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'nickname',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  nicknameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'nickname',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  nicknameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nickname', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  nicknameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'nickname', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  objectIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'objectId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  objectIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'objectId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  objectIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'objectId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  objectIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'objectId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  objectIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'objectId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  objectIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'objectId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  objectIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'objectId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  objectIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'objectId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  objectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'objectId', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  objectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'objectId', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition> rlEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rl',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  rlGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rl',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  rlLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rl',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition> rlBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
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

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
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

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
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

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userId', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userUuidEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userUuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userUuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userUuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userUuid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userUuidStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userUuidEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userUuid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userUuid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userUuid', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterFilterCondition>
  userUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userUuid', value: ''),
      );
    });
  }
}

extension MuseDashPlayerQueryObject
    on QueryBuilder<MuseDashPlayer, MuseDashPlayer, QFilterCondition> {}

extension MuseDashPlayerQueryLinks
    on QueryBuilder<MuseDashPlayer, MuseDashPlayer, QFilterCondition> {}

extension MuseDashPlayerQuerySortBy
    on QueryBuilder<MuseDashPlayer, MuseDashPlayer, QSortBy> {
  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByDiffHistoryNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diffHistoryNumber', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByDiffHistoryNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diffHistoryNumber', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByLastUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdateTime', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByLastUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdateTime', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> sortByNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> sortByObjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByObjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> sortByRl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rl', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> sortByRlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rl', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> sortByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  sortByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }
}

extension MuseDashPlayerQuerySortThenBy
    on QueryBuilder<MuseDashPlayer, MuseDashPlayer, QSortThenBy> {
  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByDiffHistoryNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diffHistoryNumber', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByDiffHistoryNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diffHistoryNumber', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByLastUpdateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdate', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByLastUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdateTime', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByLastUpdateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdateTime', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> thenByNickname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByNicknameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nickname', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> thenByObjectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByObjectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'objectId', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> thenByRl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rl', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> thenByRlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rl', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy> thenByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QAfterSortBy>
  thenByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }
}

extension MuseDashPlayerQueryWhereDistinct
    on QueryBuilder<MuseDashPlayer, MuseDashPlayer, QDistinct> {
  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QDistinct>
  distinctByDiffHistoryNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diffHistoryNumber');
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QDistinct>
  distinctByLastUpdate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdate');
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QDistinct>
  distinctByLastUpdateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdateTime');
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QDistinct> distinctByNickname({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nickname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QDistinct> distinctByObjectId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'objectId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QDistinct> distinctByRl() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rl');
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QDistinct> distinctByUserId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashPlayer, MuseDashPlayer, QDistinct> distinctByUserUuid({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userUuid', caseSensitive: caseSensitive);
    });
  }
}

extension MuseDashPlayerQueryProperty
    on QueryBuilder<MuseDashPlayer, MuseDashPlayer, QQueryProperty> {
  QueryBuilder<MuseDashPlayer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MuseDashPlayer, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MuseDashPlayer, int, QQueryOperations>
  diffHistoryNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diffHistoryNumber');
    });
  }

  QueryBuilder<MuseDashPlayer, int, QQueryOperations> lastUpdateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdate');
    });
  }

  QueryBuilder<MuseDashPlayer, DateTime, QQueryOperations>
  lastUpdateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdateTime');
    });
  }

  QueryBuilder<MuseDashPlayer, String, QQueryOperations> nicknameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nickname');
    });
  }

  QueryBuilder<MuseDashPlayer, String, QQueryOperations> objectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'objectId');
    });
  }

  QueryBuilder<MuseDashPlayer, double, QQueryOperations> rlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rl');
    });
  }

  QueryBuilder<MuseDashPlayer, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<MuseDashPlayer, String, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<MuseDashPlayer, String, QQueryOperations> userUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userUuid');
    });
  }
}

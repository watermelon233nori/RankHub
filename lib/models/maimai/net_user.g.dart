// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net_user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNetUserCollection on Isar {
  IsarCollection<NetUser> get netUsers => this.collection();
}

const NetUserSchema = CollectionSchema(
  name: r'NetUser',
  id: -5440344401939533120,
  properties: {
    r'iconId': PropertySchema(id: 0, name: r'iconId', type: IsarType.long),
    r'lastPlayDate': PropertySchema(
      id: 1,
      name: r'lastPlayDate',
      type: IsarType.string,
    ),
    r'lastUsedAt': PropertySchema(
      id: 2,
      name: r'lastUsedAt',
      type: IsarType.dateTime,
    ),
    r'nameplateId': PropertySchema(
      id: 3,
      name: r'nameplateId',
      type: IsarType.long,
    ),
    r'playerRating': PropertySchema(
      id: 4,
      name: r'playerRating',
      type: IsarType.long,
    ),
    r'qrCodeKey': PropertySchema(
      id: 5,
      name: r'qrCodeKey',
      type: IsarType.string,
    ),
    r'qrCodeTimestamp': PropertySchema(
      id: 6,
      name: r'qrCodeTimestamp',
      type: IsarType.string,
    ),
    r'trophyId': PropertySchema(id: 7, name: r'trophyId', type: IsarType.long),
    r'userId': PropertySchema(id: 8, name: r'userId', type: IsarType.long),
    r'userName': PropertySchema(
      id: 9,
      name: r'userName',
      type: IsarType.string,
    ),
  },

  estimateSize: _netUserEstimateSize,
  serialize: _netUserSerialize,
  deserialize: _netUserDeserialize,
  deserializeProp: _netUserDeserializeProp,
  idName: r'id',
  indexes: {
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _netUserGetId,
  getLinks: _netUserGetLinks,
  attach: _netUserAttach,
  version: '3.3.0',
);

int _netUserEstimateSize(
  NetUser object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.lastPlayDate;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.qrCodeKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.qrCodeTimestamp;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.userName.length * 3;
  return bytesCount;
}

void _netUserSerialize(
  NetUser object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.iconId);
  writer.writeString(offsets[1], object.lastPlayDate);
  writer.writeDateTime(offsets[2], object.lastUsedAt);
  writer.writeLong(offsets[3], object.nameplateId);
  writer.writeLong(offsets[4], object.playerRating);
  writer.writeString(offsets[5], object.qrCodeKey);
  writer.writeString(offsets[6], object.qrCodeTimestamp);
  writer.writeLong(offsets[7], object.trophyId);
  writer.writeLong(offsets[8], object.userId);
  writer.writeString(offsets[9], object.userName);
}

NetUser _netUserDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NetUser(
    iconId: reader.readLongOrNull(offsets[0]) ?? 0,
    id: id,
    lastPlayDate: reader.readStringOrNull(offsets[1]),
    lastUsedAt: reader.readDateTimeOrNull(offsets[2]),
    nameplateId: reader.readLongOrNull(offsets[3]) ?? 0,
    playerRating: reader.readLongOrNull(offsets[4]) ?? 0,
    qrCodeKey: reader.readStringOrNull(offsets[5]),
    qrCodeTimestamp: reader.readStringOrNull(offsets[6]),
    trophyId: reader.readLongOrNull(offsets[7]) ?? 0,
    userId: reader.readLong(offsets[8]),
    userName: reader.readStringOrNull(offsets[9]) ?? '',
  );
  return object;
}

P _netUserDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _netUserGetId(NetUser object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _netUserGetLinks(NetUser object) {
  return [];
}

void _netUserAttach(IsarCollection<dynamic> col, Id id, NetUser object) {
  object.id = id;
}

extension NetUserByIndex on IsarCollection<NetUser> {
  Future<NetUser?> getByUserId(int userId) {
    return getByIndex(r'userId', [userId]);
  }

  NetUser? getByUserIdSync(int userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(int userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(int userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<NetUser?>> getAllByUserId(List<int> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<NetUser?> getAllByUserIdSync(List<int> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'userId', values);
  }

  Future<int> deleteAllByUserId(List<int> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'userId', values);
  }

  int deleteAllByUserIdSync(List<int> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'userId', values);
  }

  Future<Id> putByUserId(NetUser object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(NetUser object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<NetUser> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<NetUser> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension NetUserQueryWhereSort on QueryBuilder<NetUser, NetUser, QWhere> {
  QueryBuilder<NetUser, NetUser, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterWhere> anyUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userId'),
      );
    });
  }
}

extension NetUserQueryWhere on QueryBuilder<NetUser, NetUser, QWhereClause> {
  QueryBuilder<NetUser, NetUser, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<NetUser, NetUser, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterWhereClause> idBetween(
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

  QueryBuilder<NetUser, NetUser, QAfterWhereClause> userIdEqualTo(int userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterWhereClause> userIdNotEqualTo(
    int userId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [userId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'userId',
                lower: [],
                upper: [userId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterWhereClause> userIdGreaterThan(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userId',
          lower: [userId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterWhereClause> userIdLessThan(
    int userId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userId',
          lower: [],
          upper: [userId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterWhereClause> userIdBetween(
    int lowerUserId,
    int upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'userId',
          lower: [lowerUserId],
          includeLower: includeLower,
          upper: [upperUserId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension NetUserQueryFilter
    on QueryBuilder<NetUser, NetUser, QFilterCondition> {
  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> iconIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'iconId', value: value),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> iconIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'iconId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> iconIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'iconId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> iconIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'iconId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> idBetween(
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

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastPlayDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastPlayDate'),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition>
  lastPlayDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastPlayDate'),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastPlayDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastPlayDate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastPlayDateGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastPlayDate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastPlayDateLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastPlayDate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastPlayDateBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastPlayDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastPlayDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lastPlayDate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastPlayDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lastPlayDate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastPlayDateContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lastPlayDate',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastPlayDateMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lastPlayDate',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastPlayDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastPlayDate', value: ''),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition>
  lastPlayDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lastPlayDate', value: ''),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastUsedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastUsedAt'),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastUsedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastUsedAt'),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastUsedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUsedAt', value: value),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastUsedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUsedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastUsedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUsedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> lastUsedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUsedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> nameplateIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'nameplateId', value: value),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> nameplateIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nameplateId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> nameplateIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nameplateId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> nameplateIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nameplateId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> playerRatingEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'playerRating', value: value),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> playerRatingGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'playerRating',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> playerRatingLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'playerRating',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> playerRatingBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'playerRating',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'qrCodeKey'),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'qrCodeKey'),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'qrCodeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'qrCodeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'qrCodeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'qrCodeKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'qrCodeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'qrCodeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'qrCodeKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'qrCodeKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'qrCodeKey', value: ''),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'qrCodeKey', value: ''),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition>
  qrCodeTimestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'qrCodeTimestamp'),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition>
  qrCodeTimestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'qrCodeTimestamp'),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeTimestampEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'qrCodeTimestamp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition>
  qrCodeTimestampGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'qrCodeTimestamp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeTimestampLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'qrCodeTimestamp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeTimestampBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'qrCodeTimestamp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition>
  qrCodeTimestampStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'qrCodeTimestamp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeTimestampEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'qrCodeTimestamp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeTimestampContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'qrCodeTimestamp',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> qrCodeTimestampMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'qrCodeTimestamp',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition>
  qrCodeTimestampIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'qrCodeTimestamp', value: ''),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition>
  qrCodeTimestampIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'qrCodeTimestamp', value: ''),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> trophyIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'trophyId', value: value),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> trophyIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'trophyId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> trophyIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'trophyId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> trophyIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'trophyId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: value),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'userName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'userName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'userName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'userName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'userName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'userName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userNameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'userName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userNameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'userName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userName', value: ''),
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterFilterCondition> userNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userName', value: ''),
      );
    });
  }
}

extension NetUserQueryObject
    on QueryBuilder<NetUser, NetUser, QFilterCondition> {}

extension NetUserQueryLinks
    on QueryBuilder<NetUser, NetUser, QFilterCondition> {}

extension NetUserQuerySortBy on QueryBuilder<NetUser, NetUser, QSortBy> {
  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByIconId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconId', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByIconIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconId', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByLastPlayDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayDate', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByLastPlayDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayDate', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByLastUsedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByNameplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameplateId', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByNameplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameplateId', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByPlayerRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerRating', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByPlayerRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerRating', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByQrCodeKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCodeKey', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByQrCodeKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCodeKey', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByQrCodeTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCodeTimestamp', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByQrCodeTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCodeTimestamp', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByTrophyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trophyId', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByTrophyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trophyId', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> sortByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension NetUserQuerySortThenBy
    on QueryBuilder<NetUser, NetUser, QSortThenBy> {
  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByIconId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconId', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByIconIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconId', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByLastPlayDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayDate', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByLastPlayDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayDate', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByLastUsedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsedAt', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByNameplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameplateId', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByNameplateIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nameplateId', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByPlayerRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerRating', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByPlayerRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerRating', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByQrCodeKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCodeKey', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByQrCodeKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCodeKey', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByQrCodeTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCodeTimestamp', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByQrCodeTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'qrCodeTimestamp', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByTrophyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trophyId', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByTrophyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'trophyId', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByUserName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.asc);
    });
  }

  QueryBuilder<NetUser, NetUser, QAfterSortBy> thenByUserNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userName', Sort.desc);
    });
  }
}

extension NetUserQueryWhereDistinct
    on QueryBuilder<NetUser, NetUser, QDistinct> {
  QueryBuilder<NetUser, NetUser, QDistinct> distinctByIconId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconId');
    });
  }

  QueryBuilder<NetUser, NetUser, QDistinct> distinctByLastPlayDate({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastPlayDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NetUser, NetUser, QDistinct> distinctByLastUsedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsedAt');
    });
  }

  QueryBuilder<NetUser, NetUser, QDistinct> distinctByNameplateId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nameplateId');
    });
  }

  QueryBuilder<NetUser, NetUser, QDistinct> distinctByPlayerRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerRating');
    });
  }

  QueryBuilder<NetUser, NetUser, QDistinct> distinctByQrCodeKey({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'qrCodeKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<NetUser, NetUser, QDistinct> distinctByQrCodeTimestamp({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'qrCodeTimestamp',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<NetUser, NetUser, QDistinct> distinctByTrophyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'trophyId');
    });
  }

  QueryBuilder<NetUser, NetUser, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<NetUser, NetUser, QDistinct> distinctByUserName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userName', caseSensitive: caseSensitive);
    });
  }
}

extension NetUserQueryProperty
    on QueryBuilder<NetUser, NetUser, QQueryProperty> {
  QueryBuilder<NetUser, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<NetUser, int, QQueryOperations> iconIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconId');
    });
  }

  QueryBuilder<NetUser, String?, QQueryOperations> lastPlayDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPlayDate');
    });
  }

  QueryBuilder<NetUser, DateTime?, QQueryOperations> lastUsedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsedAt');
    });
  }

  QueryBuilder<NetUser, int, QQueryOperations> nameplateIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nameplateId');
    });
  }

  QueryBuilder<NetUser, int, QQueryOperations> playerRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerRating');
    });
  }

  QueryBuilder<NetUser, String?, QQueryOperations> qrCodeKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qrCodeKey');
    });
  }

  QueryBuilder<NetUser, String?, QQueryOperations> qrCodeTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'qrCodeTimestamp');
    });
  }

  QueryBuilder<NetUser, int, QQueryOperations> trophyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trophyId');
    });
  }

  QueryBuilder<NetUser, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<NetUser, String, QQueryOperations> userNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userName');
    });
  }
}

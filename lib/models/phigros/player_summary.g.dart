// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_summary.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPhigrosPlayerSummaryCollection on Isar {
  IsarCollection<PhigrosPlayerSummary> get phigrosPlayerSummarys =>
      this.collection();
}

const PhigrosPlayerSummarySchema = CollectionSchema(
  name: r'PhigrosPlayerSummary',
  id: -6456092589855364015,
  properties: {
    r'aCount': PropertySchema(id: 0, name: r'aCount', type: IsarType.long),
    r'accountId': PropertySchema(
      id: 1,
      name: r'accountId',
      type: IsarType.string,
    ),
    r'atCount': PropertySchema(id: 2, name: r'atCount', type: IsarType.long),
    r'avatarName': PropertySchema(
      id: 3,
      name: r'avatarName',
      type: IsarType.string,
    ),
    r'b19AverageRks': PropertySchema(
      id: 4,
      name: r'b19AverageRks',
      type: IsarType.double,
    ),
    r'bCount': PropertySchema(id: 5, name: r'bCount', type: IsarType.long),
    r'cCount': PropertySchema(id: 6, name: r'cCount', type: IsarType.long),
    r'challengeModeRank': PropertySchema(
      id: 7,
      name: r'challengeModeRank',
      type: IsarType.long,
    ),
    r'ezCount': PropertySchema(id: 8, name: r'ezCount', type: IsarType.long),
    r'fcCount': PropertySchema(id: 9, name: r'fcCount', type: IsarType.long),
    r'hdCount': PropertySchema(id: 10, name: r'hdCount', type: IsarType.long),
    r'inCount': PropertySchema(id: 11, name: r'inCount', type: IsarType.long),
    r'lastUpdated': PropertySchema(
      id: 12,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'phiCount': PropertySchema(id: 13, name: r'phiCount', type: IsarType.long),
    r'sCount': PropertySchema(id: 14, name: r'sCount', type: IsarType.long),
    r'totalRks': PropertySchema(
      id: 15,
      name: r'totalRks',
      type: IsarType.double,
    ),
    r'totalSongsPlayed': PropertySchema(
      id: 16,
      name: r'totalSongsPlayed',
      type: IsarType.long,
    ),
  },

  estimateSize: _phigrosPlayerSummaryEstimateSize,
  serialize: _phigrosPlayerSummarySerialize,
  deserialize: _phigrosPlayerSummaryDeserialize,
  deserializeProp: _phigrosPlayerSummaryDeserializeProp,
  idName: r'id',
  indexes: {
    r'accountId': IndexSchema(
      id: -1591555361937770434,
      name: r'accountId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'accountId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _phigrosPlayerSummaryGetId,
  getLinks: _phigrosPlayerSummaryGetLinks,
  attach: _phigrosPlayerSummaryAttach,
  version: '3.3.0',
);

int _phigrosPlayerSummaryEstimateSize(
  PhigrosPlayerSummary object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accountId.length * 3;
  bytesCount += 3 + object.avatarName.length * 3;
  return bytesCount;
}

void _phigrosPlayerSummarySerialize(
  PhigrosPlayerSummary object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.aCount);
  writer.writeString(offsets[1], object.accountId);
  writer.writeLong(offsets[2], object.atCount);
  writer.writeString(offsets[3], object.avatarName);
  writer.writeDouble(offsets[4], object.b19AverageRks);
  writer.writeLong(offsets[5], object.bCount);
  writer.writeLong(offsets[6], object.cCount);
  writer.writeLong(offsets[7], object.challengeModeRank);
  writer.writeLong(offsets[8], object.ezCount);
  writer.writeLong(offsets[9], object.fcCount);
  writer.writeLong(offsets[10], object.hdCount);
  writer.writeLong(offsets[11], object.inCount);
  writer.writeDateTime(offsets[12], object.lastUpdated);
  writer.writeLong(offsets[13], object.phiCount);
  writer.writeLong(offsets[14], object.sCount);
  writer.writeDouble(offsets[15], object.totalRks);
  writer.writeLong(offsets[16], object.totalSongsPlayed);
}

PhigrosPlayerSummary _phigrosPlayerSummaryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PhigrosPlayerSummary();
  object.aCount = reader.readLong(offsets[0]);
  object.accountId = reader.readString(offsets[1]);
  object.atCount = reader.readLong(offsets[2]);
  object.avatarName = reader.readString(offsets[3]);
  object.b19AverageRks = reader.readDouble(offsets[4]);
  object.bCount = reader.readLong(offsets[5]);
  object.cCount = reader.readLong(offsets[6]);
  object.challengeModeRank = reader.readLong(offsets[7]);
  object.ezCount = reader.readLong(offsets[8]);
  object.fcCount = reader.readLong(offsets[9]);
  object.hdCount = reader.readLong(offsets[10]);
  object.id = id;
  object.inCount = reader.readLong(offsets[11]);
  object.lastUpdated = reader.readDateTime(offsets[12]);
  object.phiCount = reader.readLong(offsets[13]);
  object.sCount = reader.readLong(offsets[14]);
  object.totalRks = reader.readDouble(offsets[15]);
  object.totalSongsPlayed = reader.readLong(offsets[16]);
  return object;
}

P _phigrosPlayerSummaryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readDouble(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _phigrosPlayerSummaryGetId(PhigrosPlayerSummary object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _phigrosPlayerSummaryGetLinks(
  PhigrosPlayerSummary object,
) {
  return [];
}

void _phigrosPlayerSummaryAttach(
  IsarCollection<dynamic> col,
  Id id,
  PhigrosPlayerSummary object,
) {
  object.id = id;
}

extension PhigrosPlayerSummaryByIndex on IsarCollection<PhigrosPlayerSummary> {
  Future<PhigrosPlayerSummary?> getByAccountId(String accountId) {
    return getByIndex(r'accountId', [accountId]);
  }

  PhigrosPlayerSummary? getByAccountIdSync(String accountId) {
    return getByIndexSync(r'accountId', [accountId]);
  }

  Future<bool> deleteByAccountId(String accountId) {
    return deleteByIndex(r'accountId', [accountId]);
  }

  bool deleteByAccountIdSync(String accountId) {
    return deleteByIndexSync(r'accountId', [accountId]);
  }

  Future<List<PhigrosPlayerSummary?>> getAllByAccountId(
    List<String> accountIdValues,
  ) {
    final values = accountIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'accountId', values);
  }

  List<PhigrosPlayerSummary?> getAllByAccountIdSync(
    List<String> accountIdValues,
  ) {
    final values = accountIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'accountId', values);
  }

  Future<int> deleteAllByAccountId(List<String> accountIdValues) {
    final values = accountIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'accountId', values);
  }

  int deleteAllByAccountIdSync(List<String> accountIdValues) {
    final values = accountIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'accountId', values);
  }

  Future<Id> putByAccountId(PhigrosPlayerSummary object) {
    return putByIndex(r'accountId', object);
  }

  Id putByAccountIdSync(PhigrosPlayerSummary object, {bool saveLinks = true}) {
    return putByIndexSync(r'accountId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAccountId(List<PhigrosPlayerSummary> objects) {
    return putAllByIndex(r'accountId', objects);
  }

  List<Id> putAllByAccountIdSync(
    List<PhigrosPlayerSummary> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'accountId', objects, saveLinks: saveLinks);
  }
}

extension PhigrosPlayerSummaryQueryWhereSort
    on QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QWhere> {
  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PhigrosPlayerSummaryQueryWhere
    on QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QWhereClause> {
  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterWhereClause>
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

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterWhereClause>
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

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterWhereClause>
  accountIdEqualTo(String accountId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'accountId', value: [accountId]),
      );
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterWhereClause>
  accountIdNotEqualTo(String accountId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'accountId',
                lower: [],
                upper: [accountId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'accountId',
                lower: [accountId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'accountId',
                lower: [accountId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'accountId',
                lower: [],
                upper: [accountId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension PhigrosPlayerSummaryQueryFilter
    on
        QueryBuilder<
          PhigrosPlayerSummary,
          PhigrosPlayerSummary,
          QFilterCondition
        > {
  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  aCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aCount', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  aCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'aCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  aCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'aCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  aCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'aCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  accountIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'accountId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  accountIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'accountId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  accountIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'accountId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  accountIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'accountId',
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
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  accountIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'accountId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  accountIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'accountId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  accountIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'accountId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  accountIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'accountId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  accountIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'accountId', value: ''),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  accountIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'accountId', value: ''),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  atCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'atCount', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  atCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'atCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  atCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'atCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  atCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'atCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  avatarNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'avatarName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  avatarNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'avatarName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  avatarNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'avatarName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  avatarNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'avatarName',
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
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  avatarNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'avatarName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  avatarNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'avatarName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  avatarNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'avatarName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  avatarNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'avatarName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  avatarNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'avatarName', value: ''),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  avatarNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'avatarName', value: ''),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  b19AverageRksEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'b19AverageRks',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  b19AverageRksGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'b19AverageRks',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  b19AverageRksLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'b19AverageRks',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  b19AverageRksBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'b19AverageRks',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  bCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bCount', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  bCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  bCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  bCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  cCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'cCount', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  cCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'cCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  cCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'cCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  cCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'cCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  challengeModeRankEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'challengeModeRank', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  challengeModeRankGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'challengeModeRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  challengeModeRankLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'challengeModeRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  challengeModeRankBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'challengeModeRank',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  ezCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ezCount', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  ezCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ezCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  ezCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ezCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  ezCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ezCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  fcCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fcCount', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  fcCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fcCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  fcCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fcCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  fcCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fcCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  hdCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hdCount', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  hdCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hdCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  hdCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hdCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  hdCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hdCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
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
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
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
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
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
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
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
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  inCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'inCount', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  inCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'inCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  inCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'inCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  inCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'inCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdated', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  lastUpdatedGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastUpdated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  lastUpdatedLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastUpdated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  lastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastUpdated',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  phiCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'phiCount', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  phiCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'phiCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  phiCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'phiCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  phiCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'phiCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  sCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'sCount', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  sCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'sCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  sCountLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'sCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  sCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'sCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  totalRksEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'totalRks',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  totalRksGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalRks',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  totalRksLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalRks',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  totalRksBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalRks',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  totalSongsPlayedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalSongsPlayed', value: value),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  totalSongsPlayedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalSongsPlayed',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  totalSongsPlayedLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalSongsPlayed',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    PhigrosPlayerSummary,
    PhigrosPlayerSummary,
    QAfterFilterCondition
  >
  totalSongsPlayedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalSongsPlayed',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PhigrosPlayerSummaryQueryObject
    on
        QueryBuilder<
          PhigrosPlayerSummary,
          PhigrosPlayerSummary,
          QFilterCondition
        > {}

extension PhigrosPlayerSummaryQueryLinks
    on
        QueryBuilder<
          PhigrosPlayerSummary,
          PhigrosPlayerSummary,
          QFilterCondition
        > {}

extension PhigrosPlayerSummaryQuerySortBy
    on QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QSortBy> {
  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByACount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByACountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByAtCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByAtCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByAvatarName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarName', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByAvatarNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarName', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByB19AverageRks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b19AverageRks', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByB19AverageRksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b19AverageRks', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByBCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByBCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByCCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByCCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByChallengeModeRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeModeRank', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByChallengeModeRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeModeRank', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByEzCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ezCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByEzCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ezCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByFcCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fcCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByFcCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fcCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByHdCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hdCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByHdCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hdCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByInCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByInCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByPhiCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phiCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByPhiCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phiCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortBySCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortBySCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByTotalRks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRks', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByTotalRksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRks', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByTotalSongsPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSongsPlayed', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  sortByTotalSongsPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSongsPlayed', Sort.desc);
    });
  }
}

extension PhigrosPlayerSummaryQuerySortThenBy
    on QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QSortThenBy> {
  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByACount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByACountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByAtCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByAtCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'atCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByAvatarName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarName', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByAvatarNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarName', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByB19AverageRks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b19AverageRks', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByB19AverageRksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'b19AverageRks', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByBCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByBCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByCCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByCCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByChallengeModeRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeModeRank', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByChallengeModeRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeModeRank', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByEzCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ezCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByEzCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ezCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByFcCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fcCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByFcCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fcCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByHdCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hdCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByHdCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hdCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByInCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByInCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByPhiCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phiCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByPhiCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phiCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenBySCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sCount', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenBySCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sCount', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByTotalRks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRks', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByTotalRksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalRks', Sort.desc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByTotalSongsPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSongsPlayed', Sort.asc);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QAfterSortBy>
  thenByTotalSongsPlayedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalSongsPlayed', Sort.desc);
    });
  }
}

extension PhigrosPlayerSummaryQueryWhereDistinct
    on QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct> {
  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByACount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByAccountId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByAtCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'atCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByAvatarName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByB19AverageRks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'b19AverageRks');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByBCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByCCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByChallengeModeRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'challengeModeRank');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByEzCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ezCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByFcCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fcCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByHdCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hdCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByInCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByPhiCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phiCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctBySCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByTotalRks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalRks');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, PhigrosPlayerSummary, QDistinct>
  distinctByTotalSongsPlayed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalSongsPlayed');
    });
  }
}

extension PhigrosPlayerSummaryQueryProperty
    on
        QueryBuilder<
          PhigrosPlayerSummary,
          PhigrosPlayerSummary,
          QQueryProperty
        > {
  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations> aCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, String, QQueryOperations>
  accountIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountId');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations> atCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'atCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, String, QQueryOperations>
  avatarNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarName');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, double, QQueryOperations>
  b19AverageRksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'b19AverageRks');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations> bCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations> cCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations>
  challengeModeRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'challengeModeRank');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations> ezCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ezCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations> fcCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fcCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations> hdCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hdCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations> inCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, DateTime, QQueryOperations>
  lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations> phiCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phiCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations> sCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sCount');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, double, QQueryOperations>
  totalRksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalRks');
    });
  }

  QueryBuilder<PhigrosPlayerSummary, int, QQueryOperations>
  totalSongsPlayedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalSongsPlayed');
    });
  }
}

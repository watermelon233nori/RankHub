// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_progress.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPhigrosGameProgressCollection on Isar {
  IsarCollection<PhigrosGameProgress> get phigrosGameProgress =>
      this.collection();
}

const PhigrosGameProgressSchema = CollectionSchema(
  name: r'PhigrosGameProgress',
  id: -6432338368734564406,
  properties: {
    r'accountId': PropertySchema(
      id: 0,
      name: r'accountId',
      type: IsarType.string,
    ),
    r'alreadyShowAutoUnlockInTip': PropertySchema(
      id: 1,
      name: r'alreadyShowAutoUnlockInTip',
      type: IsarType.bool,
    ),
    r'alreadyShowCollectionTip': PropertySchema(
      id: 2,
      name: r'alreadyShowCollectionTip',
      type: IsarType.bool,
    ),
    r'challengeModeRank': PropertySchema(
      id: 3,
      name: r'challengeModeRank',
      type: IsarType.long,
    ),
    r'chapter8Passed': PropertySchema(
      id: 4,
      name: r'chapter8Passed',
      type: IsarType.bool,
    ),
    r'chapter8SongUnlocked': PropertySchema(
      id: 5,
      name: r'chapter8SongUnlocked',
      type: IsarType.long,
    ),
    r'chapter8UnlockBegin': PropertySchema(
      id: 6,
      name: r'chapter8UnlockBegin',
      type: IsarType.bool,
    ),
    r'chapter8UnlockSecondPhase': PropertySchema(
      id: 7,
      name: r'chapter8UnlockSecondPhase',
      type: IsarType.bool,
    ),
    r'completed': PropertySchema(
      id: 8,
      name: r'completed',
      type: IsarType.string,
    ),
    r'flagOfSongRecordKey': PropertySchema(
      id: 9,
      name: r'flagOfSongRecordKey',
      type: IsarType.long,
    ),
    r'isFirstRun': PropertySchema(
      id: 10,
      name: r'isFirstRun',
      type: IsarType.bool,
    ),
    r'lastUpdated': PropertySchema(
      id: 11,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'legacyChapterFinished': PropertySchema(
      id: 12,
      name: r'legacyChapterFinished',
      type: IsarType.bool,
    ),
    r'money': PropertySchema(id: 13, name: r'money', type: IsarType.longList),
    r'randomVersionUnlocked': PropertySchema(
      id: 14,
      name: r'randomVersionUnlocked',
      type: IsarType.long,
    ),
    r'songUpdateInfo': PropertySchema(
      id: 15,
      name: r'songUpdateInfo',
      type: IsarType.long,
    ),
    r'unlockFlagOfIgallta': PropertySchema(
      id: 16,
      name: r'unlockFlagOfIgallta',
      type: IsarType.long,
    ),
    r'unlockFlagOfRrharil': PropertySchema(
      id: 17,
      name: r'unlockFlagOfRrharil',
      type: IsarType.long,
    ),
    r'unlockFlagOfSpasmodic': PropertySchema(
      id: 18,
      name: r'unlockFlagOfSpasmodic',
      type: IsarType.long,
    ),
  },

  estimateSize: _phigrosGameProgressEstimateSize,
  serialize: _phigrosGameProgressSerialize,
  deserialize: _phigrosGameProgressDeserialize,
  deserializeProp: _phigrosGameProgressDeserializeProp,
  idName: r'id',
  indexes: {
    r'accountId': IndexSchema(
      id: -1591555361937770434,
      name: r'accountId',
      unique: false,
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

  getId: _phigrosGameProgressGetId,
  getLinks: _phigrosGameProgressGetLinks,
  attach: _phigrosGameProgressAttach,
  version: '3.3.0',
);

int _phigrosGameProgressEstimateSize(
  PhigrosGameProgress object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accountId.length * 3;
  bytesCount += 3 + object.completed.length * 3;
  bytesCount += 3 + object.money.length * 8;
  return bytesCount;
}

void _phigrosGameProgressSerialize(
  PhigrosGameProgress object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountId);
  writer.writeBool(offsets[1], object.alreadyShowAutoUnlockInTip);
  writer.writeBool(offsets[2], object.alreadyShowCollectionTip);
  writer.writeLong(offsets[3], object.challengeModeRank);
  writer.writeBool(offsets[4], object.chapter8Passed);
  writer.writeLong(offsets[5], object.chapter8SongUnlocked);
  writer.writeBool(offsets[6], object.chapter8UnlockBegin);
  writer.writeBool(offsets[7], object.chapter8UnlockSecondPhase);
  writer.writeString(offsets[8], object.completed);
  writer.writeLong(offsets[9], object.flagOfSongRecordKey);
  writer.writeBool(offsets[10], object.isFirstRun);
  writer.writeDateTime(offsets[11], object.lastUpdated);
  writer.writeBool(offsets[12], object.legacyChapterFinished);
  writer.writeLongList(offsets[13], object.money);
  writer.writeLong(offsets[14], object.randomVersionUnlocked);
  writer.writeLong(offsets[15], object.songUpdateInfo);
  writer.writeLong(offsets[16], object.unlockFlagOfIgallta);
  writer.writeLong(offsets[17], object.unlockFlagOfRrharil);
  writer.writeLong(offsets[18], object.unlockFlagOfSpasmodic);
}

PhigrosGameProgress _phigrosGameProgressDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PhigrosGameProgress();
  object.accountId = reader.readString(offsets[0]);
  object.alreadyShowAutoUnlockInTip = reader.readBool(offsets[1]);
  object.alreadyShowCollectionTip = reader.readBool(offsets[2]);
  object.challengeModeRank = reader.readLong(offsets[3]);
  object.chapter8Passed = reader.readBool(offsets[4]);
  object.chapter8SongUnlocked = reader.readLong(offsets[5]);
  object.chapter8UnlockBegin = reader.readBool(offsets[6]);
  object.chapter8UnlockSecondPhase = reader.readBool(offsets[7]);
  object.completed = reader.readString(offsets[8]);
  object.flagOfSongRecordKey = reader.readLong(offsets[9]);
  object.id = id;
  object.isFirstRun = reader.readBool(offsets[10]);
  object.lastUpdated = reader.readDateTime(offsets[11]);
  object.legacyChapterFinished = reader.readBool(offsets[12]);
  object.money = reader.readLongList(offsets[13]) ?? [];
  object.randomVersionUnlocked = reader.readLong(offsets[14]);
  object.songUpdateInfo = reader.readLong(offsets[15]);
  object.unlockFlagOfIgallta = reader.readLong(offsets[16]);
  object.unlockFlagOfRrharil = reader.readLong(offsets[17]);
  object.unlockFlagOfSpasmodic = reader.readLong(offsets[18]);
  return object;
}

P _phigrosGameProgressDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readLongList(offset) ?? []) as P;
    case 14:
      return (reader.readLong(offset)) as P;
    case 15:
      return (reader.readLong(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _phigrosGameProgressGetId(PhigrosGameProgress object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _phigrosGameProgressGetLinks(
  PhigrosGameProgress object,
) {
  return [];
}

void _phigrosGameProgressAttach(
  IsarCollection<dynamic> col,
  Id id,
  PhigrosGameProgress object,
) {
  object.id = id;
}

extension PhigrosGameProgressQueryWhereSort
    on QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QWhere> {
  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PhigrosGameProgressQueryWhere
    on QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QWhereClause> {
  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterWhereClause>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterWhereClause>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterWhereClause>
  accountIdEqualTo(String accountId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'accountId', value: [accountId]),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterWhereClause>
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

extension PhigrosGameProgressQueryFilter
    on
        QueryBuilder<
          PhigrosGameProgress,
          PhigrosGameProgress,
          QFilterCondition
        > {
  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  accountIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'accountId', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  accountIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'accountId', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  alreadyShowAutoUnlockInTipEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'alreadyShowAutoUnlockInTip',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  alreadyShowCollectionTipEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'alreadyShowCollectionTip',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  challengeModeRankEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'challengeModeRank', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  chapter8PassedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chapter8Passed', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  chapter8SongUnlockedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'chapter8SongUnlocked',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  chapter8SongUnlockedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'chapter8SongUnlocked',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  chapter8SongUnlockedLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'chapter8SongUnlocked',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  chapter8SongUnlockedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'chapter8SongUnlocked',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  chapter8UnlockBeginEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'chapter8UnlockBegin', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  chapter8UnlockSecondPhaseEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'chapter8UnlockSecondPhase',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  completedEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'completed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  completedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'completed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  completedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'completed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  completedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'completed',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  completedStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'completed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  completedEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'completed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  completedContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'completed',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  completedMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'completed',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  completedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'completed', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  completedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'completed', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  flagOfSongRecordKeyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'flagOfSongRecordKey', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  flagOfSongRecordKeyGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'flagOfSongRecordKey',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  flagOfSongRecordKeyLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'flagOfSongRecordKey',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  flagOfSongRecordKeyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'flagOfSongRecordKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  isFirstRunEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isFirstRun', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdated', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  legacyChapterFinishedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'legacyChapterFinished',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  moneyElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'money', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  moneyElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'money',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  moneyElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'money',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  moneyElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'money',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  moneyLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'money', length, true, length, true);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  moneyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'money', 0, true, 0, true);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  moneyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'money', 0, false, 999999, true);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  moneyLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'money', 0, true, length, include);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  moneyLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'money', length, include, 999999, true);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  moneyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'money',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  randomVersionUnlockedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'randomVersionUnlocked',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  randomVersionUnlockedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'randomVersionUnlocked',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  randomVersionUnlockedLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'randomVersionUnlocked',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  randomVersionUnlockedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'randomVersionUnlocked',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  songUpdateInfoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songUpdateInfo', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  songUpdateInfoGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'songUpdateInfo',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  songUpdateInfoLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'songUpdateInfo',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  songUpdateInfoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'songUpdateInfo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfIgalltaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unlockFlagOfIgallta', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfIgalltaGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unlockFlagOfIgallta',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfIgalltaLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unlockFlagOfIgallta',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfIgalltaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unlockFlagOfIgallta',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfRrharilEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'unlockFlagOfRrharil', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfRrharilGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unlockFlagOfRrharil',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfRrharilLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unlockFlagOfRrharil',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfRrharilBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unlockFlagOfRrharil',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfSpasmodicEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'unlockFlagOfSpasmodic',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfSpasmodicGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'unlockFlagOfSpasmodic',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfSpasmodicLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'unlockFlagOfSpasmodic',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterFilterCondition>
  unlockFlagOfSpasmodicBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'unlockFlagOfSpasmodic',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PhigrosGameProgressQueryObject
    on
        QueryBuilder<
          PhigrosGameProgress,
          PhigrosGameProgress,
          QFilterCondition
        > {}

extension PhigrosGameProgressQueryLinks
    on
        QueryBuilder<
          PhigrosGameProgress,
          PhigrosGameProgress,
          QFilterCondition
        > {}

extension PhigrosGameProgressQuerySortBy
    on QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QSortBy> {
  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByAlreadyShowAutoUnlockInTip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyShowAutoUnlockInTip', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByAlreadyShowAutoUnlockInTipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyShowAutoUnlockInTip', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByAlreadyShowCollectionTip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyShowCollectionTip', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByAlreadyShowCollectionTipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyShowCollectionTip', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByChallengeModeRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeModeRank', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByChallengeModeRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeModeRank', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByChapter8Passed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8Passed', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByChapter8PassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8Passed', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByChapter8SongUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8SongUnlocked', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByChapter8SongUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8SongUnlocked', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByChapter8UnlockBegin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8UnlockBegin', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByChapter8UnlockBeginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8UnlockBegin', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByChapter8UnlockSecondPhase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8UnlockSecondPhase', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByChapter8UnlockSecondPhaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8UnlockSecondPhase', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByFlagOfSongRecordKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flagOfSongRecordKey', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByFlagOfSongRecordKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flagOfSongRecordKey', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByIsFirstRun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFirstRun', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByIsFirstRunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFirstRun', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByLegacyChapterFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'legacyChapterFinished', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByLegacyChapterFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'legacyChapterFinished', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByRandomVersionUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'randomVersionUnlocked', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByRandomVersionUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'randomVersionUnlocked', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortBySongUpdateInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songUpdateInfo', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortBySongUpdateInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songUpdateInfo', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByUnlockFlagOfIgallta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfIgallta', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByUnlockFlagOfIgalltaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfIgallta', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByUnlockFlagOfRrharil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfRrharil', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByUnlockFlagOfRrharilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfRrharil', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByUnlockFlagOfSpasmodic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfSpasmodic', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  sortByUnlockFlagOfSpasmodicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfSpasmodic', Sort.desc);
    });
  }
}

extension PhigrosGameProgressQuerySortThenBy
    on QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QSortThenBy> {
  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByAlreadyShowAutoUnlockInTip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyShowAutoUnlockInTip', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByAlreadyShowAutoUnlockInTipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyShowAutoUnlockInTip', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByAlreadyShowCollectionTip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyShowCollectionTip', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByAlreadyShowCollectionTipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alreadyShowCollectionTip', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByChallengeModeRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeModeRank', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByChallengeModeRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'challengeModeRank', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByChapter8Passed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8Passed', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByChapter8PassedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8Passed', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByChapter8SongUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8SongUnlocked', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByChapter8SongUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8SongUnlocked', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByChapter8UnlockBegin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8UnlockBegin', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByChapter8UnlockBeginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8UnlockBegin', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByChapter8UnlockSecondPhase() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8UnlockSecondPhase', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByChapter8UnlockSecondPhaseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chapter8UnlockSecondPhase', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'completed', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByFlagOfSongRecordKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flagOfSongRecordKey', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByFlagOfSongRecordKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flagOfSongRecordKey', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByIsFirstRun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFirstRun', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByIsFirstRunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFirstRun', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByLegacyChapterFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'legacyChapterFinished', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByLegacyChapterFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'legacyChapterFinished', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByRandomVersionUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'randomVersionUnlocked', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByRandomVersionUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'randomVersionUnlocked', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenBySongUpdateInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songUpdateInfo', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenBySongUpdateInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songUpdateInfo', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByUnlockFlagOfIgallta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfIgallta', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByUnlockFlagOfIgalltaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfIgallta', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByUnlockFlagOfRrharil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfRrharil', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByUnlockFlagOfRrharilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfRrharil', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByUnlockFlagOfSpasmodic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfSpasmodic', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QAfterSortBy>
  thenByUnlockFlagOfSpasmodicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockFlagOfSpasmodic', Sort.desc);
    });
  }
}

extension PhigrosGameProgressQueryWhereDistinct
    on QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct> {
  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByAccountId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByAlreadyShowAutoUnlockInTip() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alreadyShowAutoUnlockInTip');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByAlreadyShowCollectionTip() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alreadyShowCollectionTip');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByChallengeModeRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'challengeModeRank');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByChapter8Passed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapter8Passed');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByChapter8SongUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapter8SongUnlocked');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByChapter8UnlockBegin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapter8UnlockBegin');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByChapter8UnlockSecondPhase() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chapter8UnlockSecondPhase');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByCompleted({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'completed', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByFlagOfSongRecordKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flagOfSongRecordKey');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByIsFirstRun() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFirstRun');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByLegacyChapterFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'legacyChapterFinished');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByMoney() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'money');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByRandomVersionUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'randomVersionUnlocked');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctBySongUpdateInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songUpdateInfo');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByUnlockFlagOfIgallta() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockFlagOfIgallta');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByUnlockFlagOfRrharil() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockFlagOfRrharil');
    });
  }

  QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QDistinct>
  distinctByUnlockFlagOfSpasmodic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockFlagOfSpasmodic');
    });
  }
}

extension PhigrosGameProgressQueryProperty
    on QueryBuilder<PhigrosGameProgress, PhigrosGameProgress, QQueryProperty> {
  QueryBuilder<PhigrosGameProgress, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PhigrosGameProgress, String, QQueryOperations>
  accountIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountId');
    });
  }

  QueryBuilder<PhigrosGameProgress, bool, QQueryOperations>
  alreadyShowAutoUnlockInTipProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alreadyShowAutoUnlockInTip');
    });
  }

  QueryBuilder<PhigrosGameProgress, bool, QQueryOperations>
  alreadyShowCollectionTipProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alreadyShowCollectionTip');
    });
  }

  QueryBuilder<PhigrosGameProgress, int, QQueryOperations>
  challengeModeRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'challengeModeRank');
    });
  }

  QueryBuilder<PhigrosGameProgress, bool, QQueryOperations>
  chapter8PassedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapter8Passed');
    });
  }

  QueryBuilder<PhigrosGameProgress, int, QQueryOperations>
  chapter8SongUnlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapter8SongUnlocked');
    });
  }

  QueryBuilder<PhigrosGameProgress, bool, QQueryOperations>
  chapter8UnlockBeginProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapter8UnlockBegin');
    });
  }

  QueryBuilder<PhigrosGameProgress, bool, QQueryOperations>
  chapter8UnlockSecondPhaseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chapter8UnlockSecondPhase');
    });
  }

  QueryBuilder<PhigrosGameProgress, String, QQueryOperations>
  completedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'completed');
    });
  }

  QueryBuilder<PhigrosGameProgress, int, QQueryOperations>
  flagOfSongRecordKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flagOfSongRecordKey');
    });
  }

  QueryBuilder<PhigrosGameProgress, bool, QQueryOperations>
  isFirstRunProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFirstRun');
    });
  }

  QueryBuilder<PhigrosGameProgress, DateTime, QQueryOperations>
  lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<PhigrosGameProgress, bool, QQueryOperations>
  legacyChapterFinishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'legacyChapterFinished');
    });
  }

  QueryBuilder<PhigrosGameProgress, List<int>, QQueryOperations>
  moneyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'money');
    });
  }

  QueryBuilder<PhigrosGameProgress, int, QQueryOperations>
  randomVersionUnlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'randomVersionUnlocked');
    });
  }

  QueryBuilder<PhigrosGameProgress, int, QQueryOperations>
  songUpdateInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songUpdateInfo');
    });
  }

  QueryBuilder<PhigrosGameProgress, int, QQueryOperations>
  unlockFlagOfIgalltaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockFlagOfIgallta');
    });
  }

  QueryBuilder<PhigrosGameProgress, int, QQueryOperations>
  unlockFlagOfRrharilProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockFlagOfRrharil');
    });
  }

  QueryBuilder<PhigrosGameProgress, int, QQueryOperations>
  unlockFlagOfSpasmodicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockFlagOfSpasmodic');
    });
  }
}

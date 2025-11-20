// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musedash_score.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMuseDashScoreCollection on Isar {
  IsarCollection<MuseDashScore> get museDashScores => this.collection();
}

const MuseDashScoreSchema = CollectionSchema(
  name: r'MuseDashScore',
  id: 6840091616308026769,
  properties: {
    r'acc': PropertySchema(id: 0, name: r'acc', type: IsarType.double),
    r'characterUid': PropertySchema(
      id: 1,
      name: r'characterUid',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'difficulty': PropertySchema(
      id: 3,
      name: r'difficulty',
      type: IsarType.long,
    ),
    r'elfinUid': PropertySchema(
      id: 4,
      name: r'elfinUid',
      type: IsarType.string,
    ),
    r'globalRank': PropertySchema(
      id: 5,
      name: r'globalRank',
      type: IsarType.long,
    ),
    r'hasScore': PropertySchema(id: 6, name: r'hasScore', type: IsarType.bool),
    r'musicUid': PropertySchema(
      id: 7,
      name: r'musicUid',
      type: IsarType.string,
    ),
    r'platform': PropertySchema(
      id: 8,
      name: r'platform',
      type: IsarType.string,
    ),
    r'platformRank': PropertySchema(
      id: 9,
      name: r'platformRank',
      type: IsarType.long,
    ),
    r'rank': PropertySchema(id: 10, name: r'rank', type: IsarType.string),
    r'score': PropertySchema(id: 11, name: r'score', type: IsarType.long),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userUuid': PropertySchema(
      id: 13,
      name: r'userUuid',
      type: IsarType.string,
    ),
  },

  estimateSize: _museDashScoreEstimateSize,
  serialize: _museDashScoreSerialize,
  deserialize: _museDashScoreDeserialize,
  deserializeProp: _museDashScoreDeserializeProp,
  idName: r'id',
  indexes: {
    r'userUuid': IndexSchema(
      id: -2441299026227353304,
      name: r'userUuid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userUuid',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'musicUid': IndexSchema(
      id: 8460149118941980191,
      name: r'musicUid',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'musicUid',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _museDashScoreGetId,
  getLinks: _museDashScoreGetLinks,
  attach: _museDashScoreAttach,
  version: '3.3.0',
);

int _museDashScoreEstimateSize(
  MuseDashScore object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.characterUid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.elfinUid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.musicUid.length * 3;
  {
    final value = object.platform;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.rank.length * 3;
  bytesCount += 3 + object.userUuid.length * 3;
  return bytesCount;
}

void _museDashScoreSerialize(
  MuseDashScore object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.acc);
  writer.writeString(offsets[1], object.characterUid);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeLong(offsets[3], object.difficulty);
  writer.writeString(offsets[4], object.elfinUid);
  writer.writeLong(offsets[5], object.globalRank);
  writer.writeBool(offsets[6], object.hasScore);
  writer.writeString(offsets[7], object.musicUid);
  writer.writeString(offsets[8], object.platform);
  writer.writeLong(offsets[9], object.platformRank);
  writer.writeString(offsets[10], object.rank);
  writer.writeLong(offsets[11], object.score);
  writer.writeDateTime(offsets[12], object.updatedAt);
  writer.writeString(offsets[13], object.userUuid);
}

MuseDashScore _museDashScoreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MuseDashScore();
  object.acc = reader.readDoubleOrNull(offsets[0]);
  object.characterUid = reader.readStringOrNull(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.difficulty = reader.readLong(offsets[3]);
  object.elfinUid = reader.readStringOrNull(offsets[4]);
  object.globalRank = reader.readLongOrNull(offsets[5]);
  object.id = id;
  object.musicUid = reader.readString(offsets[7]);
  object.platform = reader.readStringOrNull(offsets[8]);
  object.platformRank = reader.readLongOrNull(offsets[9]);
  object.score = reader.readLongOrNull(offsets[11]);
  object.updatedAt = reader.readDateTime(offsets[12]);
  object.userUuid = reader.readString(offsets[13]);
  return object;
}

P _museDashScoreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readLongOrNull(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _museDashScoreGetId(MuseDashScore object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _museDashScoreGetLinks(MuseDashScore object) {
  return [];
}

void _museDashScoreAttach(
  IsarCollection<dynamic> col,
  Id id,
  MuseDashScore object,
) {
  object.id = id;
}

extension MuseDashScoreQueryWhereSort
    on QueryBuilder<MuseDashScore, MuseDashScore, QWhere> {
  QueryBuilder<MuseDashScore, MuseDashScore, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MuseDashScoreQueryWhere
    on QueryBuilder<MuseDashScore, MuseDashScore, QWhereClause> {
  QueryBuilder<MuseDashScore, MuseDashScore, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterWhereClause> idBetween(
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterWhereClause> userUuidEqualTo(
    String userUuid,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userUuid', value: [userUuid]),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterWhereClause>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterWhereClause> musicUidEqualTo(
    String musicUid,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'musicUid', value: [musicUid]),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterWhereClause>
  musicUidNotEqualTo(String musicUid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'musicUid',
                lower: [],
                upper: [musicUid],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'musicUid',
                lower: [musicUid],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'musicUid',
                lower: [musicUid],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'musicUid',
                lower: [],
                upper: [musicUid],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension MuseDashScoreQueryFilter
    on QueryBuilder<MuseDashScore, MuseDashScore, QFilterCondition> {
  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  accIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'acc'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  accIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'acc'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition> accEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'acc',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  accGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'acc',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition> accLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'acc',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition> accBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'acc',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'characterUid'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'characterUid'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'characterUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'characterUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'characterUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'characterUid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'characterUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'characterUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'characterUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'characterUid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'characterUid', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  characterUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'characterUid', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  difficultyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'difficulty', value: value),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  difficultyGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'difficulty',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  difficultyLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'difficulty',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  difficultyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'difficulty',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'elfinUid'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'elfinUid'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'elfinUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'elfinUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'elfinUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'elfinUid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'elfinUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'elfinUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'elfinUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'elfinUid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'elfinUid', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  elfinUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'elfinUid', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  globalRankIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'globalRank'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  globalRankIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'globalRank'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  globalRankEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'globalRank', value: value),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  globalRankGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'globalRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  globalRankLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'globalRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  globalRankBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'globalRank',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  hasScoreEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hasScore', value: value),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  musicUidEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'musicUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  musicUidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'musicUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  musicUidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'musicUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  musicUidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'musicUid',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  musicUidStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'musicUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  musicUidEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'musicUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  musicUidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'musicUid',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  musicUidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'musicUid',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  musicUidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'musicUid', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  musicUidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'musicUid', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'platform'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'platform'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'platform',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'platform',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'platform',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'platform',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'platform',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'platform',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'platform',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'platform',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'platform', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'platform', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformRankIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'platformRank'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformRankIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'platformRank'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformRankEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'platformRank', value: value),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformRankGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'platformRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformRankLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'platformRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  platformRankBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'platformRank',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition> rankEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rank',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  rankGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rank',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  rankLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rank',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition> rankBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rank',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  rankStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'rank',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  rankEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'rank',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  rankContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'rank',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition> rankMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'rank',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  rankIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rank', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  rankIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rank', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  scoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'score'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  scoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'score'),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  scoreEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'score', value: value),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  scoreGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'score',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  scoreLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'score',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  scoreBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'score',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
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

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  userUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userUuid', value: ''),
      );
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterFilterCondition>
  userUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'userUuid', value: ''),
      );
    });
  }
}

extension MuseDashScoreQueryObject
    on QueryBuilder<MuseDashScore, MuseDashScore, QFilterCondition> {}

extension MuseDashScoreQueryLinks
    on QueryBuilder<MuseDashScore, MuseDashScore, QFilterCondition> {}

extension MuseDashScoreQuerySortBy
    on QueryBuilder<MuseDashScore, MuseDashScore, QSortBy> {
  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByAcc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acc', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByAccDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acc', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByCharacterUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterUid', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByCharacterUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterUid', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByElfinUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elfinUid', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByElfinUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elfinUid', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByGlobalRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalRank', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByGlobalRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalRank', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByHasScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasScore', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByHasScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasScore', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByMusicUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'musicUid', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByMusicUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'musicUid', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByPlatform() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platform', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByPlatformDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platform', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByPlatformRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformRank', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByPlatformRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformRank', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> sortByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  sortByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }
}

extension MuseDashScoreQuerySortThenBy
    on QueryBuilder<MuseDashScore, MuseDashScore, QSortThenBy> {
  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByAcc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acc', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByAccDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acc', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByCharacterUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterUid', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByCharacterUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterUid', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByDifficultyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'difficulty', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByElfinUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elfinUid', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByElfinUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'elfinUid', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByGlobalRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalRank', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByGlobalRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalRank', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByHasScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasScore', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByHasScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasScore', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByMusicUid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'musicUid', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByMusicUidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'musicUid', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByPlatform() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platform', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByPlatformDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platform', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByPlatformRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformRank', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByPlatformRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformRank', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy> thenByUserUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.asc);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QAfterSortBy>
  thenByUserUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userUuid', Sort.desc);
    });
  }
}

extension MuseDashScoreQueryWhereDistinct
    on QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> {
  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByAcc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'acc');
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByCharacterUid({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'characterUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByDifficulty() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'difficulty');
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByElfinUid({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'elfinUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByGlobalRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'globalRank');
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByHasScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasScore');
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByMusicUid({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'musicUid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByPlatform({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'platform', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct>
  distinctByPlatformRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'platformRank');
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByRank({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rank', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<MuseDashScore, MuseDashScore, QDistinct> distinctByUserUuid({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userUuid', caseSensitive: caseSensitive);
    });
  }
}

extension MuseDashScoreQueryProperty
    on QueryBuilder<MuseDashScore, MuseDashScore, QQueryProperty> {
  QueryBuilder<MuseDashScore, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MuseDashScore, double?, QQueryOperations> accProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'acc');
    });
  }

  QueryBuilder<MuseDashScore, String?, QQueryOperations>
  characterUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characterUid');
    });
  }

  QueryBuilder<MuseDashScore, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MuseDashScore, int, QQueryOperations> difficultyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficulty');
    });
  }

  QueryBuilder<MuseDashScore, String?, QQueryOperations> elfinUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'elfinUid');
    });
  }

  QueryBuilder<MuseDashScore, int?, QQueryOperations> globalRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'globalRank');
    });
  }

  QueryBuilder<MuseDashScore, bool, QQueryOperations> hasScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasScore');
    });
  }

  QueryBuilder<MuseDashScore, String, QQueryOperations> musicUidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'musicUid');
    });
  }

  QueryBuilder<MuseDashScore, String?, QQueryOperations> platformProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'platform');
    });
  }

  QueryBuilder<MuseDashScore, int?, QQueryOperations> platformRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'platformRank');
    });
  }

  QueryBuilder<MuseDashScore, String, QQueryOperations> rankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rank');
    });
  }

  QueryBuilder<MuseDashScore, int?, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<MuseDashScore, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<MuseDashScore, String, QQueryOperations> userUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userUuid');
    });
  }
}

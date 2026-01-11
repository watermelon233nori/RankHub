// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'osu_score.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOsuScoreCollection on Isar {
  IsarCollection<OsuScore> get osuScores => this.collection();
}

const OsuScoreSchema = CollectionSchema(
  name: r'OsuScore',
  id: -8015120688402191298,
  properties: {
    r'accuracy': PropertySchema(
      id: 0,
      name: r'accuracy',
      type: IsarType.double,
    ),
    r'beatmapId': PropertySchema(
      id: 1,
      name: r'beatmapId',
      type: IsarType.long,
    ),
    r'beatmapSetId': PropertySchema(
      id: 2,
      name: r'beatmapSetId',
      type: IsarType.long,
    ),
    r'beatmapTitle': PropertySchema(
      id: 3,
      name: r'beatmapTitle',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 4,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'maxCombo': PropertySchema(id: 5, name: r'maxCombo', type: IsarType.long),
    r'mode': PropertySchema(id: 6, name: r'mode', type: IsarType.string),
    r'mods': PropertySchema(id: 7, name: r'mods', type: IsarType.stringList),
    r'pp': PropertySchema(id: 8, name: r'pp', type: IsarType.double),
    r'rank': PropertySchema(id: 9, name: r'rank', type: IsarType.string),
    r'scoreId': PropertySchema(id: 10, name: r'scoreId', type: IsarType.long),
    r'totalScore': PropertySchema(
      id: 11,
      name: r'totalScore',
      type: IsarType.long,
    ),
    r'userId': PropertySchema(id: 12, name: r'userId', type: IsarType.long),
    r'version': PropertySchema(id: 13, name: r'version', type: IsarType.string),
  },

  estimateSize: _osuScoreEstimateSize,
  serialize: _osuScoreSerialize,
  deserialize: _osuScoreDeserialize,
  deserializeProp: _osuScoreDeserializeProp,
  idName: r'id',
  indexes: {
    r'scoreId': IndexSchema(
      id: -6109564276298568708,
      name: r'scoreId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'scoreId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'userId': IndexSchema(
      id: -2005826577402374815,
      name: r'userId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'userId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'beatmapId': IndexSchema(
      id: -3426303223066503557,
      name: r'beatmapId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'beatmapId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _osuScoreGetId,
  getLinks: _osuScoreGetLinks,
  attach: _osuScoreAttach,
  version: '3.3.0',
);

int _osuScoreEstimateSize(
  OsuScore object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.beatmapTitle.length * 3;
  bytesCount += 3 + object.mode.length * 3;
  bytesCount += 3 + object.mods.length * 3;
  {
    for (var i = 0; i < object.mods.length; i++) {
      final value = object.mods[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.rank.length * 3;
  bytesCount += 3 + object.version.length * 3;
  return bytesCount;
}

void _osuScoreSerialize(
  OsuScore object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.accuracy);
  writer.writeLong(offsets[1], object.beatmapId);
  writer.writeLong(offsets[2], object.beatmapSetId);
  writer.writeString(offsets[3], object.beatmapTitle);
  writer.writeDateTime(offsets[4], object.createdAt);
  writer.writeLong(offsets[5], object.maxCombo);
  writer.writeString(offsets[6], object.mode);
  writer.writeStringList(offsets[7], object.mods);
  writer.writeDouble(offsets[8], object.pp);
  writer.writeString(offsets[9], object.rank);
  writer.writeLong(offsets[10], object.scoreId);
  writer.writeLong(offsets[11], object.totalScore);
  writer.writeLong(offsets[12], object.userId);
  writer.writeString(offsets[13], object.version);
}

OsuScore _osuScoreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OsuScore();
  object.accuracy = reader.readDouble(offsets[0]);
  object.beatmapId = reader.readLong(offsets[1]);
  object.beatmapSetId = reader.readLong(offsets[2]);
  object.beatmapTitle = reader.readString(offsets[3]);
  object.createdAt = reader.readDateTime(offsets[4]);
  object.id = id;
  object.maxCombo = reader.readLong(offsets[5]);
  object.mode = reader.readString(offsets[6]);
  object.mods = reader.readStringList(offsets[7]) ?? [];
  object.pp = reader.readDoubleOrNull(offsets[8]);
  object.rank = reader.readString(offsets[9]);
  object.scoreId = reader.readLong(offsets[10]);
  object.totalScore = reader.readLong(offsets[11]);
  object.userId = reader.readLong(offsets[12]);
  object.version = reader.readString(offsets[13]);
  return object;
}

P _osuScoreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _osuScoreGetId(OsuScore object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _osuScoreGetLinks(OsuScore object) {
  return [];
}

void _osuScoreAttach(IsarCollection<dynamic> col, Id id, OsuScore object) {
  object.id = id;
}

extension OsuScoreByIndex on IsarCollection<OsuScore> {
  Future<OsuScore?> getByScoreId(int scoreId) {
    return getByIndex(r'scoreId', [scoreId]);
  }

  OsuScore? getByScoreIdSync(int scoreId) {
    return getByIndexSync(r'scoreId', [scoreId]);
  }

  Future<bool> deleteByScoreId(int scoreId) {
    return deleteByIndex(r'scoreId', [scoreId]);
  }

  bool deleteByScoreIdSync(int scoreId) {
    return deleteByIndexSync(r'scoreId', [scoreId]);
  }

  Future<List<OsuScore?>> getAllByScoreId(List<int> scoreIdValues) {
    final values = scoreIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'scoreId', values);
  }

  List<OsuScore?> getAllByScoreIdSync(List<int> scoreIdValues) {
    final values = scoreIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'scoreId', values);
  }

  Future<int> deleteAllByScoreId(List<int> scoreIdValues) {
    final values = scoreIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'scoreId', values);
  }

  int deleteAllByScoreIdSync(List<int> scoreIdValues) {
    final values = scoreIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'scoreId', values);
  }

  Future<Id> putByScoreId(OsuScore object) {
    return putByIndex(r'scoreId', object);
  }

  Id putByScoreIdSync(OsuScore object, {bool saveLinks = true}) {
    return putByIndexSync(r'scoreId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByScoreId(List<OsuScore> objects) {
    return putAllByIndex(r'scoreId', objects);
  }

  List<Id> putAllByScoreIdSync(
    List<OsuScore> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'scoreId', objects, saveLinks: saveLinks);
  }
}

extension OsuScoreQueryWhereSort on QueryBuilder<OsuScore, OsuScore, QWhere> {
  QueryBuilder<OsuScore, OsuScore, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhere> anyScoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'scoreId'),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhere> anyUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userId'),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhere> anyBeatmapId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'beatmapId'),
      );
    });
  }
}

extension OsuScoreQueryWhere on QueryBuilder<OsuScore, OsuScore, QWhereClause> {
  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> idBetween(
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

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> scoreIdEqualTo(
    int scoreId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'scoreId', value: [scoreId]),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> scoreIdNotEqualTo(
    int scoreId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreId',
                lower: [],
                upper: [scoreId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreId',
                lower: [scoreId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreId',
                lower: [scoreId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreId',
                lower: [],
                upper: [scoreId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> scoreIdGreaterThan(
    int scoreId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scoreId',
          lower: [scoreId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> scoreIdLessThan(
    int scoreId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scoreId',
          lower: [],
          upper: [scoreId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> scoreIdBetween(
    int lowerScoreId,
    int upperScoreId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scoreId',
          lower: [lowerScoreId],
          includeLower: includeLower,
          upper: [upperScoreId],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> userIdEqualTo(
    int userId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> userIdNotEqualTo(
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

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> userIdGreaterThan(
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

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> userIdLessThan(
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

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> userIdBetween(
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

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> beatmapIdEqualTo(
    int beatmapId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'beatmapId', value: [beatmapId]),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> beatmapIdNotEqualTo(
    int beatmapId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'beatmapId',
                lower: [],
                upper: [beatmapId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'beatmapId',
                lower: [beatmapId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'beatmapId',
                lower: [beatmapId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'beatmapId',
                lower: [],
                upper: [beatmapId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> beatmapIdGreaterThan(
    int beatmapId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'beatmapId',
          lower: [beatmapId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> beatmapIdLessThan(
    int beatmapId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'beatmapId',
          lower: [],
          upper: [beatmapId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterWhereClause> beatmapIdBetween(
    int lowerBeatmapId,
    int upperBeatmapId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'beatmapId',
          lower: [lowerBeatmapId],
          includeLower: includeLower,
          upper: [upperBeatmapId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension OsuScoreQueryFilter
    on QueryBuilder<OsuScore, OsuScore, QFilterCondition> {
  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> accuracyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'accuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> accuracyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'accuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> accuracyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'accuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> accuracyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'accuracy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'beatmapId', value: value),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'beatmapId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'beatmapId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'beatmapId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapSetIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'beatmapSetId', value: value),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition>
  beatmapSetIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'beatmapSetId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapSetIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'beatmapSetId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapSetIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'beatmapSetId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapTitleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'beatmapTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition>
  beatmapTitleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'beatmapTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapTitleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'beatmapTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapTitleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'beatmapTitle',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition>
  beatmapTitleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'beatmapTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'beatmapTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapTitleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'beatmapTitle',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> beatmapTitleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'beatmapTitle',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition>
  beatmapTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'beatmapTitle', value: ''),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition>
  beatmapTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'beatmapTitle', value: ''),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> maxComboEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'maxCombo', value: value),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> maxComboGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maxCombo',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> maxComboLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maxCombo',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> maxComboBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maxCombo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'mode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'mode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'mode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'mode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'mode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'mode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'mode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'mode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'mode', value: ''),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'mode', value: ''),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'mods',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition>
  modsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'mods',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'mods',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'mods',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'mods',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'mods',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'mods',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'mods',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'mods', value: ''),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition>
  modsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'mods', value: ''),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'mods', length, true, length, true);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'mods', 0, true, 0, true);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'mods', 0, false, 999999, true);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'mods', 0, true, length, include);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'mods', length, include, 999999, true);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> modsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'mods',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> ppIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pp'),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> ppIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pp'),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> ppEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pp',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> ppGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pp',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> ppLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pp',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> ppBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> rankEqualTo(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> rankGreaterThan(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> rankLessThan(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> rankBetween(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> rankStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> rankEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> rankContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> rankMatches(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> rankIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rank', value: ''),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> rankIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rank', value: ''),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> scoreIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scoreId', value: value),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> scoreIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scoreId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> scoreIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scoreId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> scoreIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scoreId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> totalScoreEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalScore', value: value),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> totalScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalScore',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> totalScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalScore',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> totalScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalScore',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> userIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: value),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> versionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'version',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> versionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'version',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> versionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'version',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> versionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'version',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> versionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'version',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> versionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'version',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> versionContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'version',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> versionMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'version',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> versionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'version', value: ''),
      );
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterFilterCondition> versionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'version', value: ''),
      );
    });
  }
}

extension OsuScoreQueryObject
    on QueryBuilder<OsuScore, OsuScore, QFilterCondition> {}

extension OsuScoreQueryLinks
    on QueryBuilder<OsuScore, OsuScore, QFilterCondition> {}

extension OsuScoreQuerySortBy on QueryBuilder<OsuScore, OsuScore, QSortBy> {
  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByBeatmapId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapId', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByBeatmapIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapId', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByBeatmapSetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapSetId', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByBeatmapSetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapSetId', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByBeatmapTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapTitle', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByBeatmapTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapTitle', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByMaxCombo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCombo', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByMaxComboDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCombo', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByPp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByPpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByScoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreId', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByScoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreId', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByTotalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByTotalScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension OsuScoreQuerySortThenBy
    on QueryBuilder<OsuScore, OsuScore, QSortThenBy> {
  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accuracy', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByBeatmapId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapId', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByBeatmapIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapId', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByBeatmapSetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapSetId', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByBeatmapSetIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapSetId', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByBeatmapTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapTitle', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByBeatmapTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'beatmapTitle', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByMaxCombo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCombo', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByMaxComboDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxCombo', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mode', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByPp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByPpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rank', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByScoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreId', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByScoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreId', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByTotalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByTotalScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension OsuScoreQueryWhereDistinct
    on QueryBuilder<OsuScore, OsuScore, QDistinct> {
  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accuracy');
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByBeatmapId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beatmapId');
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByBeatmapSetId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beatmapSetId');
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByBeatmapTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'beatmapTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByMaxCombo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxCombo');
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByMode({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByMods() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mods');
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByPp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pp');
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByRank({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rank', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByScoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scoreId');
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByTotalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalScore');
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<OsuScore, OsuScore, QDistinct> distinctByVersion({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version', caseSensitive: caseSensitive);
    });
  }
}

extension OsuScoreQueryProperty
    on QueryBuilder<OsuScore, OsuScore, QQueryProperty> {
  QueryBuilder<OsuScore, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OsuScore, double, QQueryOperations> accuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accuracy');
    });
  }

  QueryBuilder<OsuScore, int, QQueryOperations> beatmapIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beatmapId');
    });
  }

  QueryBuilder<OsuScore, int, QQueryOperations> beatmapSetIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beatmapSetId');
    });
  }

  QueryBuilder<OsuScore, String, QQueryOperations> beatmapTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'beatmapTitle');
    });
  }

  QueryBuilder<OsuScore, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OsuScore, int, QQueryOperations> maxComboProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxCombo');
    });
  }

  QueryBuilder<OsuScore, String, QQueryOperations> modeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mode');
    });
  }

  QueryBuilder<OsuScore, List<String>, QQueryOperations> modsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mods');
    });
  }

  QueryBuilder<OsuScore, double?, QQueryOperations> ppProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pp');
    });
  }

  QueryBuilder<OsuScore, String, QQueryOperations> rankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rank');
    });
  }

  QueryBuilder<OsuScore, int, QQueryOperations> scoreIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scoreId');
    });
  }

  QueryBuilder<OsuScore, int, QQueryOperations> totalScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalScore');
    });
  }

  QueryBuilder<OsuScore, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<OsuScore, String, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScoreCollection on Isar {
  IsarCollection<Score> get scores => this.collection();
}

const ScoreSchema = CollectionSchema(
  name: r'Score',
  id: -357457489503241584,
  properties: {
    r'achievements': PropertySchema(
      id: 0,
      name: r'achievements',
      type: IsarType.double,
    ),
    r'dxRating': PropertySchema(
      id: 1,
      name: r'dxRating',
      type: IsarType.double,
    ),
    r'dxScore': PropertySchema(id: 2, name: r'dxScore', type: IsarType.long),
    r'dxStar': PropertySchema(id: 3, name: r'dxStar', type: IsarType.long),
    r'fc': PropertySchema(
      id: 4,
      name: r'fc',
      type: IsarType.string,
      enumMap: _ScorefcEnumValueMap,
    ),
    r'fs': PropertySchema(
      id: 5,
      name: r'fs',
      type: IsarType.string,
      enumMap: _ScorefsEnumValueMap,
    ),
    r'lastPlayedTime': PropertySchema(
      id: 6,
      name: r'lastPlayedTime',
      type: IsarType.string,
    ),
    r'level': PropertySchema(id: 7, name: r'level', type: IsarType.string),
    r'levelIndex': PropertySchema(
      id: 8,
      name: r'levelIndex',
      type: IsarType.string,
      enumMap: _ScorelevelIndexEnumValueMap,
    ),
    r'playTime': PropertySchema(
      id: 9,
      name: r'playTime',
      type: IsarType.string,
    ),
    r'rate': PropertySchema(
      id: 10,
      name: r'rate',
      type: IsarType.string,
      enumMap: _ScorerateEnumValueMap,
    ),
    r'scoreKey': PropertySchema(id: 11, name: r'scoreKey', type: IsarType.long),
    r'songId': PropertySchema(id: 12, name: r'songId', type: IsarType.long),
    r'songName': PropertySchema(
      id: 13,
      name: r'songName',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 14,
      name: r'type',
      type: IsarType.string,
      enumMap: _ScoretypeEnumValueMap,
    ),
    r'uploadTime': PropertySchema(
      id: 15,
      name: r'uploadTime',
      type: IsarType.string,
    ),
  },

  estimateSize: _scoreEstimateSize,
  serialize: _scoreSerialize,
  deserialize: _scoreDeserialize,
  deserializeProp: _scoreDeserializeProp,
  idName: r'id',
  indexes: {
    r'scoreKey_levelIndex_type': IndexSchema(
      id: 6711425885913746226,
      name: r'scoreKey_levelIndex_type',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'scoreKey',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'levelIndex',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'type',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _scoreGetId,
  getLinks: _scoreGetLinks,
  attach: _scoreAttach,
  version: '3.3.0',
);

int _scoreEstimateSize(
  Score object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
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
    final value = object.lastPlayedTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.level.length * 3;
  bytesCount += 3 + object.levelIndex.name.length * 3;
  {
    final value = object.playTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rate;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  bytesCount += 3 + object.songName.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  {
    final value = object.uploadTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _scoreSerialize(
  Score object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.achievements);
  writer.writeDouble(offsets[1], object.dxRating);
  writer.writeLong(offsets[2], object.dxScore);
  writer.writeLong(offsets[3], object.dxStar);
  writer.writeString(offsets[4], object.fc?.name);
  writer.writeString(offsets[5], object.fs?.name);
  writer.writeString(offsets[6], object.lastPlayedTime);
  writer.writeString(offsets[7], object.level);
  writer.writeString(offsets[8], object.levelIndex.name);
  writer.writeString(offsets[9], object.playTime);
  writer.writeString(offsets[10], object.rate?.name);
  writer.writeLong(offsets[11], object.scoreKey);
  writer.writeLong(offsets[12], object.songId);
  writer.writeString(offsets[13], object.songName);
  writer.writeString(offsets[14], object.type.name);
  writer.writeString(offsets[15], object.uploadTime);
}

Score _scoreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Score(
    achievements: reader.readDoubleOrNull(offsets[0]) ?? 0.0,
    dxRating: reader.readDoubleOrNull(offsets[1]) ?? 0.0,
    dxScore: reader.readLongOrNull(offsets[2]) ?? 0,
    dxStar: reader.readLongOrNull(offsets[3]) ?? 0,
    fc: _ScorefcValueEnumMap[reader.readStringOrNull(offsets[4])],
    fs: _ScorefsValueEnumMap[reader.readStringOrNull(offsets[5])],
    id: id,
    lastPlayedTime: reader.readStringOrNull(offsets[6]),
    level: reader.readStringOrNull(offsets[7]) ?? '',
    levelIndex:
        _ScorelevelIndexValueEnumMap[reader.readStringOrNull(offsets[8])] ??
        LevelIndex.basic,
    playTime: reader.readStringOrNull(offsets[9]),
    rate: _ScorerateValueEnumMap[reader.readStringOrNull(offsets[10])],
    songId: reader.readLongOrNull(offsets[12]) ?? 0,
    songName: reader.readStringOrNull(offsets[13]) ?? '',
    type:
        _ScoretypeValueEnumMap[reader.readStringOrNull(offsets[14])] ??
        SongType.standard,
    uploadTime: reader.readStringOrNull(offsets[15]),
  );
  return object;
}

P _scoreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 1:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 4:
      return (_ScorefcValueEnumMap[reader.readStringOrNull(offset)]) as P;
    case 5:
      return (_ScorefsValueEnumMap[reader.readStringOrNull(offset)]) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 8:
      return (_ScorelevelIndexValueEnumMap[reader.readStringOrNull(offset)] ??
              LevelIndex.basic)
          as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (_ScorerateValueEnumMap[reader.readStringOrNull(offset)]) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 13:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 14:
      return (_ScoretypeValueEnumMap[reader.readStringOrNull(offset)] ??
              SongType.standard)
          as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ScorefcEnumValueMap = {
  r'apPlus': r'apPlus',
  r'ap': r'ap',
  r'fcPlus': r'fcPlus',
  r'fc': r'fc',
};
const _ScorefcValueEnumMap = {
  r'apPlus': FCType.apPlus,
  r'ap': FCType.ap,
  r'fcPlus': FCType.fcPlus,
  r'fc': FCType.fc,
};
const _ScorefsEnumValueMap = {
  r'fsdPlus': r'fsdPlus',
  r'fsd': r'fsd',
  r'fsPlus': r'fsPlus',
  r'fs': r'fs',
  r'sync': r'sync',
};
const _ScorefsValueEnumMap = {
  r'fsdPlus': FSType.fsdPlus,
  r'fsd': FSType.fsd,
  r'fsPlus': FSType.fsPlus,
  r'fs': FSType.fs,
  r'sync': FSType.sync,
};
const _ScorelevelIndexEnumValueMap = {
  r'basic': r'basic',
  r'advanced': r'advanced',
  r'expert': r'expert',
  r'master': r'master',
  r'reMaster': r'reMaster',
};
const _ScorelevelIndexValueEnumMap = {
  r'basic': LevelIndex.basic,
  r'advanced': LevelIndex.advanced,
  r'expert': LevelIndex.expert,
  r'master': LevelIndex.master,
  r'reMaster': LevelIndex.reMaster,
};
const _ScorerateEnumValueMap = {
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
const _ScorerateValueEnumMap = {
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
const _ScoretypeEnumValueMap = {
  r'standard': r'standard',
  r'dx': r'dx',
  r'utage': r'utage',
};
const _ScoretypeValueEnumMap = {
  r'standard': SongType.standard,
  r'dx': SongType.dx,
  r'utage': SongType.utage,
};

Id _scoreGetId(Score object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scoreGetLinks(Score object) {
  return [];
}

void _scoreAttach(IsarCollection<dynamic> col, Id id, Score object) {
  object.id = id;
}

extension ScoreByIndex on IsarCollection<Score> {
  Future<Score?> getByScoreKeyLevelIndexType(
    int scoreKey,
    LevelIndex levelIndex,
    SongType type,
  ) {
    return getByIndex(r'scoreKey_levelIndex_type', [
      scoreKey,
      levelIndex,
      type,
    ]);
  }

  Score? getByScoreKeyLevelIndexTypeSync(
    int scoreKey,
    LevelIndex levelIndex,
    SongType type,
  ) {
    return getByIndexSync(r'scoreKey_levelIndex_type', [
      scoreKey,
      levelIndex,
      type,
    ]);
  }

  Future<bool> deleteByScoreKeyLevelIndexType(
    int scoreKey,
    LevelIndex levelIndex,
    SongType type,
  ) {
    return deleteByIndex(r'scoreKey_levelIndex_type', [
      scoreKey,
      levelIndex,
      type,
    ]);
  }

  bool deleteByScoreKeyLevelIndexTypeSync(
    int scoreKey,
    LevelIndex levelIndex,
    SongType type,
  ) {
    return deleteByIndexSync(r'scoreKey_levelIndex_type', [
      scoreKey,
      levelIndex,
      type,
    ]);
  }

  Future<List<Score?>> getAllByScoreKeyLevelIndexType(
    List<int> scoreKeyValues,
    List<LevelIndex> levelIndexValues,
    List<SongType> typeValues,
  ) {
    final len = scoreKeyValues.length;
    assert(
      levelIndexValues.length == len && typeValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([scoreKeyValues[i], levelIndexValues[i], typeValues[i]]);
    }

    return getAllByIndex(r'scoreKey_levelIndex_type', values);
  }

  List<Score?> getAllByScoreKeyLevelIndexTypeSync(
    List<int> scoreKeyValues,
    List<LevelIndex> levelIndexValues,
    List<SongType> typeValues,
  ) {
    final len = scoreKeyValues.length;
    assert(
      levelIndexValues.length == len && typeValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([scoreKeyValues[i], levelIndexValues[i], typeValues[i]]);
    }

    return getAllByIndexSync(r'scoreKey_levelIndex_type', values);
  }

  Future<int> deleteAllByScoreKeyLevelIndexType(
    List<int> scoreKeyValues,
    List<LevelIndex> levelIndexValues,
    List<SongType> typeValues,
  ) {
    final len = scoreKeyValues.length;
    assert(
      levelIndexValues.length == len && typeValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([scoreKeyValues[i], levelIndexValues[i], typeValues[i]]);
    }

    return deleteAllByIndex(r'scoreKey_levelIndex_type', values);
  }

  int deleteAllByScoreKeyLevelIndexTypeSync(
    List<int> scoreKeyValues,
    List<LevelIndex> levelIndexValues,
    List<SongType> typeValues,
  ) {
    final len = scoreKeyValues.length;
    assert(
      levelIndexValues.length == len && typeValues.length == len,
      'All index values must have the same length',
    );
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([scoreKeyValues[i], levelIndexValues[i], typeValues[i]]);
    }

    return deleteAllByIndexSync(r'scoreKey_levelIndex_type', values);
  }

  Future<Id> putByScoreKeyLevelIndexType(Score object) {
    return putByIndex(r'scoreKey_levelIndex_type', object);
  }

  Id putByScoreKeyLevelIndexTypeSync(Score object, {bool saveLinks = true}) {
    return putByIndexSync(
      r'scoreKey_levelIndex_type',
      object,
      saveLinks: saveLinks,
    );
  }

  Future<List<Id>> putAllByScoreKeyLevelIndexType(List<Score> objects) {
    return putAllByIndex(r'scoreKey_levelIndex_type', objects);
  }

  List<Id> putAllByScoreKeyLevelIndexTypeSync(
    List<Score> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(
      r'scoreKey_levelIndex_type',
      objects,
      saveLinks: saveLinks,
    );
  }
}

extension ScoreQueryWhereSort on QueryBuilder<Score, Score, QWhere> {
  QueryBuilder<Score, Score, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScoreQueryWhere on QueryBuilder<Score, Score, QWhereClause> {
  QueryBuilder<Score, Score, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Score, Score, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause> idBetween(
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

  QueryBuilder<Score, Score, QAfterWhereClause>
  scoreKeyEqualToAnyLevelIndexType(int scoreKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'scoreKey_levelIndex_type',
          value: [scoreKey],
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause>
  scoreKeyNotEqualToAnyLevelIndexType(int scoreKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [],
                upper: [scoreKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [scoreKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [scoreKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [],
                upper: [scoreKey],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause>
  scoreKeyGreaterThanAnyLevelIndexType(int scoreKey, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scoreKey_levelIndex_type',
          lower: [scoreKey],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause>
  scoreKeyLessThanAnyLevelIndexType(int scoreKey, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scoreKey_levelIndex_type',
          lower: [],
          upper: [scoreKey],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause>
  scoreKeyBetweenAnyLevelIndexType(
    int lowerScoreKey,
    int upperScoreKey, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'scoreKey_levelIndex_type',
          lower: [lowerScoreKey],
          includeLower: includeLower,
          upper: [upperScoreKey],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause>
  scoreKeyLevelIndexEqualToAnyType(int scoreKey, LevelIndex levelIndex) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'scoreKey_levelIndex_type',
          value: [scoreKey, levelIndex],
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause>
  scoreKeyEqualToLevelIndexNotEqualToAnyType(
    int scoreKey,
    LevelIndex levelIndex,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [scoreKey],
                upper: [scoreKey, levelIndex],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [scoreKey, levelIndex],
                includeLower: false,
                upper: [scoreKey],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [scoreKey, levelIndex],
                includeLower: false,
                upper: [scoreKey],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [scoreKey],
                upper: [scoreKey, levelIndex],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause> scoreKeyLevelIndexTypeEqualTo(
    int scoreKey,
    LevelIndex levelIndex,
    SongType type,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'scoreKey_levelIndex_type',
          value: [scoreKey, levelIndex, type],
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause>
  scoreKeyLevelIndexEqualToTypeNotEqualTo(
    int scoreKey,
    LevelIndex levelIndex,
    SongType type,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [scoreKey, levelIndex],
                upper: [scoreKey, levelIndex, type],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [scoreKey, levelIndex, type],
                includeLower: false,
                upper: [scoreKey, levelIndex],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [scoreKey, levelIndex, type],
                includeLower: false,
                upper: [scoreKey, levelIndex],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'scoreKey_levelIndex_type',
                lower: [scoreKey, levelIndex],
                upper: [scoreKey, levelIndex, type],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension ScoreQueryFilter on QueryBuilder<Score, Score, QFilterCondition> {
  QueryBuilder<Score, Score, QAfterFilterCondition> achievementsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'achievements',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> achievementsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'achievements',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> achievementsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'achievements',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> achievementsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'achievements',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxRatingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'dxRating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxRatingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dxRating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxRatingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dxRating',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxRatingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dxRating',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxScoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dxScore', value: value),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dxScore',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dxScore',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dxScore',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxStarEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dxStar', value: value),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxStarGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dxStar',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxStarLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dxStar',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dxStarBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dxStar',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> fcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fc'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> fcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fc'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> fcEqualTo(
    FCType? value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fcGreaterThan(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fcLessThan(
    FCType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fcBetween(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fcStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fcEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fcContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fcMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fcIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fc', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> fcIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fc', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> fsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fs'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> fsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fs'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> fsEqualTo(
    FSType? value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fsGreaterThan(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fsLessThan(
    FSType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fsBetween(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fsContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fsMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> fsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fs', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> fsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fs', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastPlayedTime'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastPlayedTime'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lastPlayedTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastPlayedTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastPlayedTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastPlayedTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'lastPlayedTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'lastPlayedTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'lastPlayedTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'lastPlayedTime',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastPlayedTime', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> lastPlayedTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lastPlayedTime', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'level',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'level',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIndexEqualTo(
    LevelIndex value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIndexGreaterThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIndexLessThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIndexBetween(
    LevelIndex lower,
    LevelIndex upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'levelIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIndexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIndexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIndexContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIndexMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'levelIndex',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'levelIndex', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> levelIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'levelIndex', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'playTime'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'playTime'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'playTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'playTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'playTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'playTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'playTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'playTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'playTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'playTime',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'playTime', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'playTime', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rate'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rate'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> rateEqualTo(
    RateType? value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> rateGreaterThan(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> rateLessThan(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> rateBetween(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> rateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> rateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> rateContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> rateMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> rateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rate', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> rateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rate', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> scoreKeyEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scoreKey', value: value),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> scoreKeyGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scoreKey',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> scoreKeyLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scoreKey',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> scoreKeyBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scoreKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songId', value: value),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'songId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'songId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'songId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'songName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songNameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songNameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'songName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songName', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> songNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'songName', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> typeEqualTo(
    SongType value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> typeBetween(
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

  QueryBuilder<Score, Score, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> typeContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> typeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<Score, Score, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'uploadTime'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'uploadTime'),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'uploadTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'uploadTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'uploadTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'uploadTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'uploadTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'uploadTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'uploadTime',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'uploadTime',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'uploadTime', value: ''),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> uploadTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'uploadTime', value: ''),
      );
    });
  }
}

extension ScoreQueryObject on QueryBuilder<Score, Score, QFilterCondition> {}

extension ScoreQueryLinks on QueryBuilder<Score, Score, QFilterCondition> {}

extension ScoreQuerySortBy on QueryBuilder<Score, Score, QSortBy> {
  QueryBuilder<Score, Score, QAfterSortBy> sortByAchievements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievements', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByAchievementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievements', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByDxRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxRating', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByDxRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxRating', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByDxScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxScore', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByDxScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxScore', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByDxStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxStar', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByDxStarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxStar', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByFc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByFcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByFs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByFsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByLastPlayedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayedTime', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByLastPlayedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayedTime', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByLevelIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByLevelIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByPlayTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByPlayTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByScoreKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreKey', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByScoreKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreKey', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension ScoreQuerySortThenBy on QueryBuilder<Score, Score, QSortThenBy> {
  QueryBuilder<Score, Score, QAfterSortBy> thenByAchievements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievements', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByAchievementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievements', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByDxRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxRating', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByDxRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxRating', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByDxScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxScore', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByDxScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxScore', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByDxStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxStar', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByDxStarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxStar', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByFc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByFcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByFs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByFsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByLastPlayedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayedTime', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByLastPlayedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayedTime', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByLevelIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByLevelIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByPlayTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByPlayTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByScoreKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreKey', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByScoreKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreKey', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension ScoreQueryWhereDistinct on QueryBuilder<Score, Score, QDistinct> {
  QueryBuilder<Score, Score, QDistinct> distinctByAchievements() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'achievements');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByDxRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dxRating');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByDxScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dxScore');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByDxStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dxStar');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByFc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByFs({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fs', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByLastPlayedTime({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'lastPlayedTime',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByLevel({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByLevelIndex({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'levelIndex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByPlayTime({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByRate({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByScoreKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scoreKey');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songId');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctBySongName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByUploadTime({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadTime', caseSensitive: caseSensitive);
    });
  }
}

extension ScoreQueryProperty on QueryBuilder<Score, Score, QQueryProperty> {
  QueryBuilder<Score, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Score, double, QQueryOperations> achievementsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'achievements');
    });
  }

  QueryBuilder<Score, double, QQueryOperations> dxRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dxRating');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> dxScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dxScore');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> dxStarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dxStar');
    });
  }

  QueryBuilder<Score, FCType?, QQueryOperations> fcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fc');
    });
  }

  QueryBuilder<Score, FSType?, QQueryOperations> fsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fs');
    });
  }

  QueryBuilder<Score, String?, QQueryOperations> lastPlayedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPlayedTime');
    });
  }

  QueryBuilder<Score, String, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<Score, LevelIndex, QQueryOperations> levelIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'levelIndex');
    });
  }

  QueryBuilder<Score, String?, QQueryOperations> playTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playTime');
    });
  }

  QueryBuilder<Score, RateType?, QQueryOperations> rateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rate');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> scoreKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scoreKey');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> songIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songId');
    });
  }

  QueryBuilder<Score, String, QQueryOperations> songNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songName');
    });
  }

  QueryBuilder<Score, SongType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<Score, String?, QQueryOperations> uploadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadTime');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSimpleScoreCollection on Isar {
  IsarCollection<SimpleScore> get simpleScores => this.collection();
}

const SimpleScoreSchema = CollectionSchema(
  name: r'SimpleScore',
  id: 9190132301040740964,
  properties: {
    r'fc': PropertySchema(
      id: 0,
      name: r'fc',
      type: IsarType.string,
      enumMap: _SimpleScorefcEnumValueMap,
    ),
    r'fs': PropertySchema(
      id: 1,
      name: r'fs',
      type: IsarType.string,
      enumMap: _SimpleScorefsEnumValueMap,
    ),
    r'level': PropertySchema(id: 2, name: r'level', type: IsarType.string),
    r'levelIndex': PropertySchema(
      id: 3,
      name: r'levelIndex',
      type: IsarType.string,
      enumMap: _SimpleScorelevelIndexEnumValueMap,
    ),
    r'rate': PropertySchema(
      id: 4,
      name: r'rate',
      type: IsarType.string,
      enumMap: _SimpleScorerateEnumValueMap,
    ),
    r'songId': PropertySchema(id: 5, name: r'songId', type: IsarType.long),
    r'songName': PropertySchema(
      id: 6,
      name: r'songName',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 7,
      name: r'type',
      type: IsarType.string,
      enumMap: _SimpleScoretypeEnumValueMap,
    ),
  },

  estimateSize: _simpleScoreEstimateSize,
  serialize: _simpleScoreSerialize,
  deserialize: _simpleScoreDeserialize,
  deserializeProp: _simpleScoreDeserializeProp,
  idName: r'id',
  indexes: {
    r'songId': IndexSchema(
      id: -4588889454650216128,
      name: r'songId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'songId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _simpleScoreGetId,
  getLinks: _simpleScoreGetLinks,
  attach: _simpleScoreAttach,
  version: '3.3.0',
);

int _simpleScoreEstimateSize(
  SimpleScore object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
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
  bytesCount += 3 + object.level.length * 3;
  bytesCount += 3 + object.levelIndex.name.length * 3;
  {
    final value = object.rate;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  bytesCount += 3 + object.songName.length * 3;
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _simpleScoreSerialize(
  SimpleScore object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.fc?.name);
  writer.writeString(offsets[1], object.fs?.name);
  writer.writeString(offsets[2], object.level);
  writer.writeString(offsets[3], object.levelIndex.name);
  writer.writeString(offsets[4], object.rate?.name);
  writer.writeLong(offsets[5], object.songId);
  writer.writeString(offsets[6], object.songName);
  writer.writeString(offsets[7], object.type.name);
}

SimpleScore _simpleScoreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SimpleScore(
    fc: _SimpleScorefcValueEnumMap[reader.readStringOrNull(offsets[0])],
    fs: _SimpleScorefsValueEnumMap[reader.readStringOrNull(offsets[1])],
    id: id,
    level: reader.readStringOrNull(offsets[2]) ?? '',
    levelIndex:
        _SimpleScorelevelIndexValueEnumMap[reader.readStringOrNull(
          offsets[3],
        )] ??
        LevelIndex.basic,
    rate: _SimpleScorerateValueEnumMap[reader.readStringOrNull(offsets[4])],
    songId: reader.readLongOrNull(offsets[5]) ?? 0,
    songName: reader.readStringOrNull(offsets[6]) ?? '',
    type:
        _SimpleScoretypeValueEnumMap[reader.readStringOrNull(offsets[7])] ??
        SongType.standard,
  );
  return object;
}

P _simpleScoreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_SimpleScorefcValueEnumMap[reader.readStringOrNull(offset)]) as P;
    case 1:
      return (_SimpleScorefsValueEnumMap[reader.readStringOrNull(offset)]) as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 3:
      return (_SimpleScorelevelIndexValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              LevelIndex.basic)
          as P;
    case 4:
      return (_SimpleScorerateValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 7:
      return (_SimpleScoretypeValueEnumMap[reader.readStringOrNull(offset)] ??
              SongType.standard)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SimpleScorefcEnumValueMap = {
  r'apPlus': r'apPlus',
  r'ap': r'ap',
  r'fcPlus': r'fcPlus',
  r'fc': r'fc',
};
const _SimpleScorefcValueEnumMap = {
  r'apPlus': FCType.apPlus,
  r'ap': FCType.ap,
  r'fcPlus': FCType.fcPlus,
  r'fc': FCType.fc,
};
const _SimpleScorefsEnumValueMap = {
  r'fsdPlus': r'fsdPlus',
  r'fsd': r'fsd',
  r'fsPlus': r'fsPlus',
  r'fs': r'fs',
  r'sync': r'sync',
};
const _SimpleScorefsValueEnumMap = {
  r'fsdPlus': FSType.fsdPlus,
  r'fsd': FSType.fsd,
  r'fsPlus': FSType.fsPlus,
  r'fs': FSType.fs,
  r'sync': FSType.sync,
};
const _SimpleScorelevelIndexEnumValueMap = {
  r'basic': r'basic',
  r'advanced': r'advanced',
  r'expert': r'expert',
  r'master': r'master',
  r'reMaster': r'reMaster',
};
const _SimpleScorelevelIndexValueEnumMap = {
  r'basic': LevelIndex.basic,
  r'advanced': LevelIndex.advanced,
  r'expert': LevelIndex.expert,
  r'master': LevelIndex.master,
  r'reMaster': LevelIndex.reMaster,
};
const _SimpleScorerateEnumValueMap = {
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
const _SimpleScorerateValueEnumMap = {
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
const _SimpleScoretypeEnumValueMap = {
  r'standard': r'standard',
  r'dx': r'dx',
  r'utage': r'utage',
};
const _SimpleScoretypeValueEnumMap = {
  r'standard': SongType.standard,
  r'dx': SongType.dx,
  r'utage': SongType.utage,
};

Id _simpleScoreGetId(SimpleScore object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _simpleScoreGetLinks(SimpleScore object) {
  return [];
}

void _simpleScoreAttach(
  IsarCollection<dynamic> col,
  Id id,
  SimpleScore object,
) {
  object.id = id;
}

extension SimpleScoreQueryWhereSort
    on QueryBuilder<SimpleScore, SimpleScore, QWhere> {
  QueryBuilder<SimpleScore, SimpleScore, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterWhere> anySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'songId'),
      );
    });
  }
}

extension SimpleScoreQueryWhere
    on QueryBuilder<SimpleScore, SimpleScore, QWhereClause> {
  QueryBuilder<SimpleScore, SimpleScore, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterWhereClause> idBetween(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterWhereClause> songIdEqualTo(
    int songId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'songId', value: [songId]),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterWhereClause> songIdNotEqualTo(
    int songId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'songId',
                lower: [],
                upper: [songId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'songId',
                lower: [songId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'songId',
                lower: [songId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'songId',
                lower: [],
                upper: [songId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterWhereClause> songIdGreaterThan(
    int songId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'songId',
          lower: [songId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterWhereClause> songIdLessThan(
    int songId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'songId',
          lower: [],
          upper: [songId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterWhereClause> songIdBetween(
    int lowerSongId,
    int upperSongId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'songId',
          lower: [lowerSongId],
          includeLower: includeLower,
          upper: [upperSongId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension SimpleScoreQueryFilter
    on QueryBuilder<SimpleScore, SimpleScore, QFilterCondition> {
  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fc'),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fc'),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcEqualTo(
    FCType? value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcGreaterThan(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcLessThan(
    FCType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcBetween(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fc', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fcIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fc', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fs'),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fs'),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsEqualTo(
    FSType? value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsGreaterThan(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsLessThan(
    FSType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsBetween(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fs', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> fsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fs', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> levelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> levelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> levelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'level',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> levelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> levelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> levelContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'level',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> levelMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'level',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelIndexEqualTo(LevelIndex value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelIndexGreaterThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelIndexLessThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelIndexBetween(
    LevelIndex lower,
    LevelIndex upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'levelIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelIndexStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelIndexEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelIndexContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'levelIndex',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelIndexMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'levelIndex',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'levelIndex', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  levelIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'levelIndex', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rate'),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rate'),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> rateEqualTo(
    RateType? value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> rateGreaterThan(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> rateLessThan(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> rateBetween(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> rateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> rateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> rateContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> rateMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> rateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rate', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  rateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rate', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> songIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songId', value: value),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  songIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'songId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> songIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'songId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> songIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'songId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> songNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  songNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  songNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> songNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'songName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  songNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  songNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  songNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'songName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> songNameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'songName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  songNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songName', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  songNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'songName', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> typeEqualTo(
    SongType value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> typeBetween(
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> typeContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> typeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }
}

extension SimpleScoreQueryObject
    on QueryBuilder<SimpleScore, SimpleScore, QFilterCondition> {}

extension SimpleScoreQueryLinks
    on QueryBuilder<SimpleScore, SimpleScore, QFilterCondition> {}

extension SimpleScoreQuerySortBy
    on QueryBuilder<SimpleScore, SimpleScore, QSortBy> {
  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByFc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByFcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByFs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByFsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByLevelIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByLevelIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension SimpleScoreQuerySortThenBy
    on QueryBuilder<SimpleScore, SimpleScore, QSortThenBy> {
  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByFc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByFcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByFs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByFsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByLevelIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByLevelIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension SimpleScoreQueryWhereDistinct
    on QueryBuilder<SimpleScore, SimpleScore, QDistinct> {
  QueryBuilder<SimpleScore, SimpleScore, QDistinct> distinctByFc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QDistinct> distinctByFs({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fs', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QDistinct> distinctByLevel({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QDistinct> distinctByLevelIndex({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'levelIndex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QDistinct> distinctByRate({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QDistinct> distinctBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songId');
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QDistinct> distinctBySongName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SimpleScore, SimpleScore, QDistinct> distinctByType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension SimpleScoreQueryProperty
    on QueryBuilder<SimpleScore, SimpleScore, QQueryProperty> {
  QueryBuilder<SimpleScore, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SimpleScore, FCType?, QQueryOperations> fcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fc');
    });
  }

  QueryBuilder<SimpleScore, FSType?, QQueryOperations> fsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fs');
    });
  }

  QueryBuilder<SimpleScore, String, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<SimpleScore, LevelIndex, QQueryOperations> levelIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'levelIndex');
    });
  }

  QueryBuilder<SimpleScore, RateType?, QQueryOperations> rateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rate');
    });
  }

  QueryBuilder<SimpleScore, int, QQueryOperations> songIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songId');
    });
  }

  QueryBuilder<SimpleScore, String, QQueryOperations> songNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songName');
    });
  }

  QueryBuilder<SimpleScore, SongType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

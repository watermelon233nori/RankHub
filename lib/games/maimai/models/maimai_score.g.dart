// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maimai_score.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMaimaiScoreCollection on Isar {
  IsarCollection<MaimaiScore> get maimaiScores => this.collection();
}

const MaimaiScoreSchema = CollectionSchema(
  name: r'MaimaiScore',
  id: 6087164346585926267,
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
      enumMap: _MaimaiScorefcEnumValueMap,
    ),
    r'fs': PropertySchema(
      id: 5,
      name: r'fs',
      type: IsarType.string,
      enumMap: _MaimaiScorefsEnumValueMap,
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
      enumMap: _MaimaiScorelevelIndexEnumValueMap,
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
      enumMap: _MaimaiScorerateEnumValueMap,
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
      enumMap: _MaimaiScoretypeEnumValueMap,
    ),
    r'uploadTime': PropertySchema(
      id: 15,
      name: r'uploadTime',
      type: IsarType.string,
    ),
  },

  estimateSize: _maimaiScoreEstimateSize,
  serialize: _maimaiScoreSerialize,
  deserialize: _maimaiScoreDeserialize,
  deserializeProp: _maimaiScoreDeserializeProp,
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

  getId: _maimaiScoreGetId,
  getLinks: _maimaiScoreGetLinks,
  attach: _maimaiScoreAttach,
  version: '3.3.0',
);

int _maimaiScoreEstimateSize(
  MaimaiScore object,
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

void _maimaiScoreSerialize(
  MaimaiScore object,
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

MaimaiScore _maimaiScoreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiScore(
    achievements: reader.readDoubleOrNull(offsets[0]) ?? 0.0,
    dxRating: reader.readDoubleOrNull(offsets[1]) ?? 0.0,
    dxScore: reader.readLongOrNull(offsets[2]) ?? 0,
    dxStar: reader.readLongOrNull(offsets[3]) ?? 0,
    fc: _MaimaiScorefcValueEnumMap[reader.readStringOrNull(offsets[4])],
    fs: _MaimaiScorefsValueEnumMap[reader.readStringOrNull(offsets[5])],
    id: id,
    lastPlayedTime: reader.readStringOrNull(offsets[6]),
    level: reader.readStringOrNull(offsets[7]) ?? '',
    levelIndex:
        _MaimaiScorelevelIndexValueEnumMap[reader.readStringOrNull(
          offsets[8],
        )] ??
        LevelIndex.basic,
    playTime: reader.readStringOrNull(offsets[9]),
    rate: _MaimaiScorerateValueEnumMap[reader.readStringOrNull(offsets[10])],
    songId: reader.readLongOrNull(offsets[12]) ?? 0,
    songName: reader.readStringOrNull(offsets[13]) ?? '',
    type:
        _MaimaiScoretypeValueEnumMap[reader.readStringOrNull(offsets[14])] ??
        SongType.standard,
    uploadTime: reader.readStringOrNull(offsets[15]),
  );
  return object;
}

P _maimaiScoreDeserializeProp<P>(
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
      return (_MaimaiScorefcValueEnumMap[reader.readStringOrNull(offset)]) as P;
    case 5:
      return (_MaimaiScorefsValueEnumMap[reader.readStringOrNull(offset)]) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 8:
      return (_MaimaiScorelevelIndexValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              LevelIndex.basic)
          as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (_MaimaiScorerateValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 13:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 14:
      return (_MaimaiScoretypeValueEnumMap[reader.readStringOrNull(offset)] ??
              SongType.standard)
          as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MaimaiScorefcEnumValueMap = {
  r'apPlus': r'apPlus',
  r'ap': r'ap',
  r'fcPlus': r'fcPlus',
  r'fc': r'fc',
};
const _MaimaiScorefcValueEnumMap = {
  r'apPlus': FCType.apPlus,
  r'ap': FCType.ap,
  r'fcPlus': FCType.fcPlus,
  r'fc': FCType.fc,
};
const _MaimaiScorefsEnumValueMap = {
  r'fsdPlus': r'fsdPlus',
  r'fsd': r'fsd',
  r'fsPlus': r'fsPlus',
  r'fs': r'fs',
  r'sync': r'sync',
};
const _MaimaiScorefsValueEnumMap = {
  r'fsdPlus': FSType.fsdPlus,
  r'fsd': FSType.fsd,
  r'fsPlus': FSType.fsPlus,
  r'fs': FSType.fs,
  r'sync': FSType.sync,
};
const _MaimaiScorelevelIndexEnumValueMap = {
  r'basic': r'basic',
  r'advanced': r'advanced',
  r'expert': r'expert',
  r'master': r'master',
  r'reMaster': r'reMaster',
};
const _MaimaiScorelevelIndexValueEnumMap = {
  r'basic': LevelIndex.basic,
  r'advanced': LevelIndex.advanced,
  r'expert': LevelIndex.expert,
  r'master': LevelIndex.master,
  r'reMaster': LevelIndex.reMaster,
};
const _MaimaiScorerateEnumValueMap = {
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
const _MaimaiScorerateValueEnumMap = {
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
const _MaimaiScoretypeEnumValueMap = {
  r'standard': r'standard',
  r'dx': r'dx',
  r'utage': r'utage',
};
const _MaimaiScoretypeValueEnumMap = {
  r'standard': SongType.standard,
  r'dx': SongType.dx,
  r'utage': SongType.utage,
};

Id _maimaiScoreGetId(MaimaiScore object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _maimaiScoreGetLinks(MaimaiScore object) {
  return [];
}

void _maimaiScoreAttach(
  IsarCollection<dynamic> col,
  Id id,
  MaimaiScore object,
) {
  object.id = id;
}

extension MaimaiScoreByIndex on IsarCollection<MaimaiScore> {
  Future<MaimaiScore?> getByScoreKeyLevelIndexType(
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

  MaimaiScore? getByScoreKeyLevelIndexTypeSync(
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

  Future<List<MaimaiScore?>> getAllByScoreKeyLevelIndexType(
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

  List<MaimaiScore?> getAllByScoreKeyLevelIndexTypeSync(
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

  Future<Id> putByScoreKeyLevelIndexType(MaimaiScore object) {
    return putByIndex(r'scoreKey_levelIndex_type', object);
  }

  Id putByScoreKeyLevelIndexTypeSync(
    MaimaiScore object, {
    bool saveLinks = true,
  }) {
    return putByIndexSync(
      r'scoreKey_levelIndex_type',
      object,
      saveLinks: saveLinks,
    );
  }

  Future<List<Id>> putAllByScoreKeyLevelIndexType(List<MaimaiScore> objects) {
    return putAllByIndex(r'scoreKey_levelIndex_type', objects);
  }

  List<Id> putAllByScoreKeyLevelIndexTypeSync(
    List<MaimaiScore> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(
      r'scoreKey_levelIndex_type',
      objects,
      saveLinks: saveLinks,
    );
  }
}

extension MaimaiScoreQueryWhereSort
    on QueryBuilder<MaimaiScore, MaimaiScore, QWhere> {
  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MaimaiScoreQueryWhere
    on QueryBuilder<MaimaiScore, MaimaiScore, QWhereClause> {
  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause> idBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause>
  scoreKeyLevelIndexTypeEqualTo(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterWhereClause>
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

extension MaimaiScoreQueryFilter
    on QueryBuilder<MaimaiScore, MaimaiScore, QFilterCondition> {
  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  achievementsEqualTo(double value, {double epsilon = Query.epsilon}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  achievementsGreaterThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  achievementsLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  achievementsBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> dxRatingEqualTo(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  dxRatingGreaterThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  dxRatingLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> dxRatingBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> dxScoreEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dxScore', value: value),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  dxScoreGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> dxScoreLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> dxScoreBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> dxStarEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dxStar', value: value),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  dxStarGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> dxStarLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> dxStarBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fc'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fc'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcEqualTo(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcGreaterThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcStartsWith(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcEndsWith(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcContains(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcMatches(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fc', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fcIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fc', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fs'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fs'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsEqualTo(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsGreaterThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsStartsWith(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsEndsWith(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsContains(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsMatches(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fs', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> fsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fs', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastPlayedTime'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastPlayedTime'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeEqualTo(String? value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeGreaterThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastPlayedTime', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  lastPlayedTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'lastPlayedTime', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> levelEqualTo(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> levelLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> levelBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> levelStartsWith(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> levelEndsWith(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> levelContains(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> levelMatches(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  levelIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'levelIndex', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  levelIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'levelIndex', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  playTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'playTime'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  playTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'playTime'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> playTimeEqualTo(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  playTimeGreaterThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  playTimeLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> playTimeBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  playTimeStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  playTimeEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  playTimeContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> playTimeMatches(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  playTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'playTime', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  playTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'playTime', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rate'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rate'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> rateEqualTo(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> rateGreaterThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> rateLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> rateBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> rateStartsWith(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> rateEndsWith(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> rateContains(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> rateMatches(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> rateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rate', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  rateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rate', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> scoreKeyEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scoreKey', value: value),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  scoreKeyGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  scoreKeyLessThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> scoreKeyBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> songIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songId', value: value),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> songIdLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> songIdBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> songNameEqualTo(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> songNameBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> songNameMatches(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  songNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songName', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  songNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'songName', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> typeEqualTo(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> typeGreaterThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> typeLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> typeBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> typeStartsWith(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> typeEndsWith(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> typeContains(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> typeMatches(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'uploadTime'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'uploadTime'),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeEqualTo(String? value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeGreaterThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeLessThan(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeBetween(
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'uploadTime', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterFilterCondition>
  uploadTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'uploadTime', value: ''),
      );
    });
  }
}

extension MaimaiScoreQueryObject
    on QueryBuilder<MaimaiScore, MaimaiScore, QFilterCondition> {}

extension MaimaiScoreQueryLinks
    on QueryBuilder<MaimaiScore, MaimaiScore, QFilterCondition> {}

extension MaimaiScoreQuerySortBy
    on QueryBuilder<MaimaiScore, MaimaiScore, QSortBy> {
  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByAchievements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievements', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy>
  sortByAchievementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievements', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByDxRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxRating', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByDxRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxRating', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByDxScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxScore', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByDxScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxScore', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByDxStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxStar', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByDxStarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxStar', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByFc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByFcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByFs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByFsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByLastPlayedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayedTime', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy>
  sortByLastPlayedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayedTime', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByLevelIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByLevelIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByPlayTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByPlayTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByScoreKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreKey', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByScoreKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreKey', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> sortByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension MaimaiScoreQuerySortThenBy
    on QueryBuilder<MaimaiScore, MaimaiScore, QSortThenBy> {
  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByAchievements() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievements', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy>
  thenByAchievementsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievements', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByDxRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxRating', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByDxRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxRating', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByDxScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxScore', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByDxScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxScore', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByDxStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxStar', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByDxStarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dxStar', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByFc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByFcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByFs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByFsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByLastPlayedTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayedTime', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy>
  thenByLastPlayedTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastPlayedTime', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByLevelIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByLevelIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByPlayTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByPlayTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByScoreKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreKey', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByScoreKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scoreKey', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QAfterSortBy> thenByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension MaimaiScoreQueryWhereDistinct
    on QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> {
  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByAchievements() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'achievements');
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByDxRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dxRating');
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByDxScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dxScore');
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByDxStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dxStar');
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByFc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByFs({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fs', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByLastPlayedTime({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'lastPlayedTime',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByLevel({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByLevelIndex({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'levelIndex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByPlayTime({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByRate({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByScoreKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scoreKey');
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songId');
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctBySongName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiScore, MaimaiScore, QDistinct> distinctByUploadTime({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadTime', caseSensitive: caseSensitive);
    });
  }
}

extension MaimaiScoreQueryProperty
    on QueryBuilder<MaimaiScore, MaimaiScore, QQueryProperty> {
  QueryBuilder<MaimaiScore, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MaimaiScore, double, QQueryOperations> achievementsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'achievements');
    });
  }

  QueryBuilder<MaimaiScore, double, QQueryOperations> dxRatingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dxRating');
    });
  }

  QueryBuilder<MaimaiScore, int, QQueryOperations> dxScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dxScore');
    });
  }

  QueryBuilder<MaimaiScore, int, QQueryOperations> dxStarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dxStar');
    });
  }

  QueryBuilder<MaimaiScore, FCType?, QQueryOperations> fcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fc');
    });
  }

  QueryBuilder<MaimaiScore, FSType?, QQueryOperations> fsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fs');
    });
  }

  QueryBuilder<MaimaiScore, String?, QQueryOperations>
  lastPlayedTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastPlayedTime');
    });
  }

  QueryBuilder<MaimaiScore, String, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<MaimaiScore, LevelIndex, QQueryOperations> levelIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'levelIndex');
    });
  }

  QueryBuilder<MaimaiScore, String?, QQueryOperations> playTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playTime');
    });
  }

  QueryBuilder<MaimaiScore, RateType?, QQueryOperations> rateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rate');
    });
  }

  QueryBuilder<MaimaiScore, int, QQueryOperations> scoreKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scoreKey');
    });
  }

  QueryBuilder<MaimaiScore, int, QQueryOperations> songIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songId');
    });
  }

  QueryBuilder<MaimaiScore, String, QQueryOperations> songNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songName');
    });
  }

  QueryBuilder<MaimaiScore, SongType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<MaimaiScore, String?, QQueryOperations> uploadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadTime');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMaiMaiSimpleScoreCollection on Isar {
  IsarCollection<MaiMaiSimpleScore> get maiMaiSimpleScores => this.collection();
}

const MaiMaiSimpleScoreSchema = CollectionSchema(
  name: r'MaiMaiSimpleScore',
  id: -800756128267804006,
  properties: {
    r'fc': PropertySchema(
      id: 0,
      name: r'fc',
      type: IsarType.string,
      enumMap: _MaiMaiSimpleScorefcEnumValueMap,
    ),
    r'fs': PropertySchema(
      id: 1,
      name: r'fs',
      type: IsarType.string,
      enumMap: _MaiMaiSimpleScorefsEnumValueMap,
    ),
    r'level': PropertySchema(id: 2, name: r'level', type: IsarType.string),
    r'levelIndex': PropertySchema(
      id: 3,
      name: r'levelIndex',
      type: IsarType.string,
      enumMap: _MaiMaiSimpleScorelevelIndexEnumValueMap,
    ),
    r'rate': PropertySchema(
      id: 4,
      name: r'rate',
      type: IsarType.string,
      enumMap: _MaiMaiSimpleScorerateEnumValueMap,
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
      enumMap: _MaiMaiSimpleScoretypeEnumValueMap,
    ),
  },

  estimateSize: _maiMaiSimpleScoreEstimateSize,
  serialize: _maiMaiSimpleScoreSerialize,
  deserialize: _maiMaiSimpleScoreDeserialize,
  deserializeProp: _maiMaiSimpleScoreDeserializeProp,
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

  getId: _maiMaiSimpleScoreGetId,
  getLinks: _maiMaiSimpleScoreGetLinks,
  attach: _maiMaiSimpleScoreAttach,
  version: '3.3.0',
);

int _maiMaiSimpleScoreEstimateSize(
  MaiMaiSimpleScore object,
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

void _maiMaiSimpleScoreSerialize(
  MaiMaiSimpleScore object,
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

MaiMaiSimpleScore _maiMaiSimpleScoreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaiMaiSimpleScore(
    fc: _MaiMaiSimpleScorefcValueEnumMap[reader.readStringOrNull(offsets[0])],
    fs: _MaiMaiSimpleScorefsValueEnumMap[reader.readStringOrNull(offsets[1])],
    id: id,
    level: reader.readStringOrNull(offsets[2]) ?? '',
    levelIndex:
        _MaiMaiSimpleScorelevelIndexValueEnumMap[reader.readStringOrNull(
          offsets[3],
        )] ??
        LevelIndex.basic,
    rate:
        _MaiMaiSimpleScorerateValueEnumMap[reader.readStringOrNull(offsets[4])],
    songId: reader.readLongOrNull(offsets[5]) ?? 0,
    songName: reader.readStringOrNull(offsets[6]) ?? '',
    type:
        _MaiMaiSimpleScoretypeValueEnumMap[reader.readStringOrNull(
          offsets[7],
        )] ??
        SongType.standard,
  );
  return object;
}

P _maiMaiSimpleScoreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_MaiMaiSimpleScorefcValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    case 1:
      return (_MaiMaiSimpleScorefsValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 3:
      return (_MaiMaiSimpleScorelevelIndexValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              LevelIndex.basic)
          as P;
    case 4:
      return (_MaiMaiSimpleScorerateValueEnumMap[reader.readStringOrNull(
            offset,
          )])
          as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 7:
      return (_MaiMaiSimpleScoretypeValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SongType.standard)
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MaiMaiSimpleScorefcEnumValueMap = {
  r'apPlus': r'apPlus',
  r'ap': r'ap',
  r'fcPlus': r'fcPlus',
  r'fc': r'fc',
};
const _MaiMaiSimpleScorefcValueEnumMap = {
  r'apPlus': FCType.apPlus,
  r'ap': FCType.ap,
  r'fcPlus': FCType.fcPlus,
  r'fc': FCType.fc,
};
const _MaiMaiSimpleScorefsEnumValueMap = {
  r'fsdPlus': r'fsdPlus',
  r'fsd': r'fsd',
  r'fsPlus': r'fsPlus',
  r'fs': r'fs',
  r'sync': r'sync',
};
const _MaiMaiSimpleScorefsValueEnumMap = {
  r'fsdPlus': FSType.fsdPlus,
  r'fsd': FSType.fsd,
  r'fsPlus': FSType.fsPlus,
  r'fs': FSType.fs,
  r'sync': FSType.sync,
};
const _MaiMaiSimpleScorelevelIndexEnumValueMap = {
  r'basic': r'basic',
  r'advanced': r'advanced',
  r'expert': r'expert',
  r'master': r'master',
  r'reMaster': r'reMaster',
};
const _MaiMaiSimpleScorelevelIndexValueEnumMap = {
  r'basic': LevelIndex.basic,
  r'advanced': LevelIndex.advanced,
  r'expert': LevelIndex.expert,
  r'master': LevelIndex.master,
  r'reMaster': LevelIndex.reMaster,
};
const _MaiMaiSimpleScorerateEnumValueMap = {
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
const _MaiMaiSimpleScorerateValueEnumMap = {
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
const _MaiMaiSimpleScoretypeEnumValueMap = {
  r'standard': r'standard',
  r'dx': r'dx',
  r'utage': r'utage',
};
const _MaiMaiSimpleScoretypeValueEnumMap = {
  r'standard': SongType.standard,
  r'dx': SongType.dx,
  r'utage': SongType.utage,
};

Id _maiMaiSimpleScoreGetId(MaiMaiSimpleScore object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _maiMaiSimpleScoreGetLinks(
  MaiMaiSimpleScore object,
) {
  return [];
}

void _maiMaiSimpleScoreAttach(
  IsarCollection<dynamic> col,
  Id id,
  MaiMaiSimpleScore object,
) {
  object.id = id;
}

extension MaiMaiSimpleScoreQueryWhereSort
    on QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QWhere> {
  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhere> anySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'songId'),
      );
    });
  }
}

extension MaiMaiSimpleScoreQueryWhere
    on QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QWhereClause> {
  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhereClause>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhereClause>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhereClause>
  songIdEqualTo(int songId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'songId', value: [songId]),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhereClause>
  songIdNotEqualTo(int songId) {
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhereClause>
  songIdGreaterThan(int songId, {bool include = false}) {
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhereClause>
  songIdLessThan(int songId, {bool include = false}) {
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterWhereClause>
  songIdBetween(
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

extension MaiMaiSimpleScoreQueryFilter
    on QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QFilterCondition> {
  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  fcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fc'),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  fcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fc'),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  fcIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fc', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  fcIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fc', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  fsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fs'),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  fsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fs'),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  fsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fs', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  fsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fs', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  levelEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  levelLessThan(
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  levelBetween(
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  levelStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  levelEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  levelContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  levelMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  levelIndexIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'levelIndex', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  levelIndexIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'levelIndex', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  rateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rate'),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  rateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rate'),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  rateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rate', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  rateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rate', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  songIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songId', value: value),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  songIdLessThan(int value, {bool include = false}) {
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  songIdBetween(
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  songNameEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  songNameBetween(
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  songNameMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  songNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songName', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  songNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'songName', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
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

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }
}

extension MaiMaiSimpleScoreQueryObject
    on QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QFilterCondition> {}

extension MaiMaiSimpleScoreQueryLinks
    on QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QFilterCondition> {}

extension MaiMaiSimpleScoreQuerySortBy
    on QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QSortBy> {
  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy> sortByFc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortByFcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy> sortByFs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortByFsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortByLevelIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortByLevelIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension MaiMaiSimpleScoreQuerySortThenBy
    on QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QSortThenBy> {
  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy> thenByFc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenByFcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy> thenByFs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenByFsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fs', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenByLevelIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenByLevelIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelIndex', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenByRate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenByRateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rate', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QAfterSortBy>
  thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension MaiMaiSimpleScoreQueryWhereDistinct
    on QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QDistinct> {
  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QDistinct> distinctByFc({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QDistinct> distinctByFs({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fs', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QDistinct>
  distinctByLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QDistinct>
  distinctByLevelIndex({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'levelIndex', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QDistinct> distinctByRate({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QDistinct>
  distinctBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songId');
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QDistinct>
  distinctBySongName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QDistinct> distinctByType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension MaiMaiSimpleScoreQueryProperty
    on QueryBuilder<MaiMaiSimpleScore, MaiMaiSimpleScore, QQueryProperty> {
  QueryBuilder<MaiMaiSimpleScore, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MaiMaiSimpleScore, FCType?, QQueryOperations> fcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fc');
    });
  }

  QueryBuilder<MaiMaiSimpleScore, FSType?, QQueryOperations> fsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fs');
    });
  }

  QueryBuilder<MaiMaiSimpleScore, String, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<MaiMaiSimpleScore, LevelIndex, QQueryOperations>
  levelIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'levelIndex');
    });
  }

  QueryBuilder<MaiMaiSimpleScore, RateType?, QQueryOperations> rateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rate');
    });
  }

  QueryBuilder<MaiMaiSimpleScore, int, QQueryOperations> songIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songId');
    });
  }

  QueryBuilder<MaiMaiSimpleScore, String, QQueryOperations> songNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songName');
    });
  }

  QueryBuilder<MaiMaiSimpleScore, SongType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

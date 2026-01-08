// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'osu_user.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOsuUserCollection on Isar {
  IsarCollection<OsuUser> get osuUsers => this.collection();
}

const OsuUserSchema = CollectionSchema(
  name: r'OsuUser',
  id: 5770811697676452662,
  properties: {
    r'avatarUrl': PropertySchema(
      id: 0,
      name: r'avatarUrl',
      type: IsarType.string,
    ),
    r'catchStatisticsJson': PropertySchema(
      id: 1,
      name: r'catchStatisticsJson',
      type: IsarType.string,
    ),
    r'countryCode': PropertySchema(
      id: 2,
      name: r'countryCode',
      type: IsarType.string,
    ),
    r'countryRank': PropertySchema(
      id: 3,
      name: r'countryRank',
      type: IsarType.long,
    ),
    r'coverUrl': PropertySchema(
      id: 4,
      name: r'coverUrl',
      type: IsarType.string,
    ),
    r'currentLevel': PropertySchema(
      id: 5,
      name: r'currentLevel',
      type: IsarType.long,
    ),
    r'favouriteBeatmapsetCount': PropertySchema(
      id: 6,
      name: r'favouriteBeatmapsetCount',
      type: IsarType.long,
    ),
    r'followerCount': PropertySchema(
      id: 7,
      name: r'followerCount',
      type: IsarType.long,
    ),
    r'globalRank': PropertySchema(
      id: 8,
      name: r'globalRank',
      type: IsarType.long,
    ),
    r'graveyardBeatmapsetCount': PropertySchema(
      id: 9,
      name: r'graveyardBeatmapsetCount',
      type: IsarType.long,
    ),
    r'hitAccuracy': PropertySchema(
      id: 10,
      name: r'hitAccuracy',
      type: IsarType.double,
    ),
    r'isActive': PropertySchema(id: 11, name: r'isActive', type: IsarType.bool),
    r'isBot': PropertySchema(id: 12, name: r'isBot', type: IsarType.bool),
    r'isDeleted': PropertySchema(
      id: 13,
      name: r'isDeleted',
      type: IsarType.bool,
    ),
    r'isOnline': PropertySchema(id: 14, name: r'isOnline', type: IsarType.bool),
    r'isSupporter': PropertySchema(
      id: 15,
      name: r'isSupporter',
      type: IsarType.bool,
    ),
    r'joinDate': PropertySchema(
      id: 16,
      name: r'joinDate',
      type: IsarType.dateTime,
    ),
    r'lastVisit': PropertySchema(
      id: 17,
      name: r'lastVisit',
      type: IsarType.dateTime,
    ),
    r'levelProgress': PropertySchema(
      id: 18,
      name: r'levelProgress',
      type: IsarType.long,
    ),
    r'lovedBeatmapsetCount': PropertySchema(
      id: 19,
      name: r'lovedBeatmapsetCount',
      type: IsarType.long,
    ),
    r'maniaStatisticsJson': PropertySchema(
      id: 20,
      name: r'maniaStatisticsJson',
      type: IsarType.string,
    ),
    r'mappingFollowerCount': PropertySchema(
      id: 21,
      name: r'mappingFollowerCount',
      type: IsarType.long,
    ),
    r'maximumCombo': PropertySchema(
      id: 22,
      name: r'maximumCombo',
      type: IsarType.long,
    ),
    r'nominatedBeatmapsetCount': PropertySchema(
      id: 23,
      name: r'nominatedBeatmapsetCount',
      type: IsarType.long,
    ),
    r'pendingBeatmapsetCount': PropertySchema(
      id: 24,
      name: r'pendingBeatmapsetCount',
      type: IsarType.long,
    ),
    r'playCount': PropertySchema(
      id: 25,
      name: r'playCount',
      type: IsarType.long,
    ),
    r'playTime': PropertySchema(id: 26, name: r'playTime', type: IsarType.long),
    r'playmode': PropertySchema(
      id: 27,
      name: r'playmode',
      type: IsarType.string,
    ),
    r'pp': PropertySchema(id: 28, name: r'pp', type: IsarType.double),
    r'profileColour': PropertySchema(
      id: 29,
      name: r'profileColour',
      type: IsarType.string,
    ),
    r'rankedBeatmapsetCount': PropertySchema(
      id: 30,
      name: r'rankedBeatmapsetCount',
      type: IsarType.long,
    ),
    r'rawJson': PropertySchema(id: 31, name: r'rawJson', type: IsarType.string),
    r'stdStatisticsJson': PropertySchema(
      id: 32,
      name: r'stdStatisticsJson',
      type: IsarType.string,
    ),
    r'taikoStatisticsJson': PropertySchema(
      id: 33,
      name: r'taikoStatisticsJson',
      type: IsarType.string,
    ),
    r'totalScore': PropertySchema(
      id: 34,
      name: r'totalScore',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 35,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'userId': PropertySchema(id: 36, name: r'userId', type: IsarType.long),
    r'username': PropertySchema(
      id: 37,
      name: r'username',
      type: IsarType.string,
    ),
  },

  estimateSize: _osuUserEstimateSize,
  serialize: _osuUserSerialize,
  deserialize: _osuUserDeserialize,
  deserializeProp: _osuUserDeserializeProp,
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
    r'playmode': IndexSchema(
      id: 891849153947827027,
      name: r'playmode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'playmode',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _osuUserGetId,
  getLinks: _osuUserGetLinks,
  attach: _osuUserAttach,
  version: '3.3.0',
);

int _osuUserEstimateSize(
  OsuUser object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.avatarUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.catchStatisticsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.countryCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.coverUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.maniaStatisticsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.playmode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.profileColour;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rawJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stdStatisticsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taikoStatisticsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.username.length * 3;
  return bytesCount;
}

void _osuUserSerialize(
  OsuUser object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.avatarUrl);
  writer.writeString(offsets[1], object.catchStatisticsJson);
  writer.writeString(offsets[2], object.countryCode);
  writer.writeLong(offsets[3], object.countryRank);
  writer.writeString(offsets[4], object.coverUrl);
  writer.writeLong(offsets[5], object.currentLevel);
  writer.writeLong(offsets[6], object.favouriteBeatmapsetCount);
  writer.writeLong(offsets[7], object.followerCount);
  writer.writeLong(offsets[8], object.globalRank);
  writer.writeLong(offsets[9], object.graveyardBeatmapsetCount);
  writer.writeDouble(offsets[10], object.hitAccuracy);
  writer.writeBool(offsets[11], object.isActive);
  writer.writeBool(offsets[12], object.isBot);
  writer.writeBool(offsets[13], object.isDeleted);
  writer.writeBool(offsets[14], object.isOnline);
  writer.writeBool(offsets[15], object.isSupporter);
  writer.writeDateTime(offsets[16], object.joinDate);
  writer.writeDateTime(offsets[17], object.lastVisit);
  writer.writeLong(offsets[18], object.levelProgress);
  writer.writeLong(offsets[19], object.lovedBeatmapsetCount);
  writer.writeString(offsets[20], object.maniaStatisticsJson);
  writer.writeLong(offsets[21], object.mappingFollowerCount);
  writer.writeLong(offsets[22], object.maximumCombo);
  writer.writeLong(offsets[23], object.nominatedBeatmapsetCount);
  writer.writeLong(offsets[24], object.pendingBeatmapsetCount);
  writer.writeLong(offsets[25], object.playCount);
  writer.writeLong(offsets[26], object.playTime);
  writer.writeString(offsets[27], object.playmode);
  writer.writeDouble(offsets[28], object.pp);
  writer.writeString(offsets[29], object.profileColour);
  writer.writeLong(offsets[30], object.rankedBeatmapsetCount);
  writer.writeString(offsets[31], object.rawJson);
  writer.writeString(offsets[32], object.stdStatisticsJson);
  writer.writeString(offsets[33], object.taikoStatisticsJson);
  writer.writeLong(offsets[34], object.totalScore);
  writer.writeDateTime(offsets[35], object.updatedAt);
  writer.writeLong(offsets[36], object.userId);
  writer.writeString(offsets[37], object.username);
}

OsuUser _osuUserDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OsuUser();
  object.avatarUrl = reader.readStringOrNull(offsets[0]);
  object.catchStatisticsJson = reader.readStringOrNull(offsets[1]);
  object.countryCode = reader.readStringOrNull(offsets[2]);
  object.countryRank = reader.readLongOrNull(offsets[3]);
  object.coverUrl = reader.readStringOrNull(offsets[4]);
  object.currentLevel = reader.readLongOrNull(offsets[5]);
  object.favouriteBeatmapsetCount = reader.readLongOrNull(offsets[6]);
  object.followerCount = reader.readLongOrNull(offsets[7]);
  object.globalRank = reader.readLongOrNull(offsets[8]);
  object.graveyardBeatmapsetCount = reader.readLongOrNull(offsets[9]);
  object.hitAccuracy = reader.readDoubleOrNull(offsets[10]);
  object.id = id;
  object.isActive = reader.readBool(offsets[11]);
  object.isBot = reader.readBool(offsets[12]);
  object.isDeleted = reader.readBool(offsets[13]);
  object.isOnline = reader.readBool(offsets[14]);
  object.isSupporter = reader.readBool(offsets[15]);
  object.joinDate = reader.readDateTimeOrNull(offsets[16]);
  object.lastVisit = reader.readDateTimeOrNull(offsets[17]);
  object.levelProgress = reader.readLongOrNull(offsets[18]);
  object.lovedBeatmapsetCount = reader.readLongOrNull(offsets[19]);
  object.maniaStatisticsJson = reader.readStringOrNull(offsets[20]);
  object.mappingFollowerCount = reader.readLongOrNull(offsets[21]);
  object.maximumCombo = reader.readLongOrNull(offsets[22]);
  object.nominatedBeatmapsetCount = reader.readLongOrNull(offsets[23]);
  object.pendingBeatmapsetCount = reader.readLongOrNull(offsets[24]);
  object.playCount = reader.readLongOrNull(offsets[25]);
  object.playTime = reader.readLongOrNull(offsets[26]);
  object.playmode = reader.readStringOrNull(offsets[27]);
  object.pp = reader.readDoubleOrNull(offsets[28]);
  object.profileColour = reader.readStringOrNull(offsets[29]);
  object.rankedBeatmapsetCount = reader.readLongOrNull(offsets[30]);
  object.rawJson = reader.readStringOrNull(offsets[31]);
  object.stdStatisticsJson = reader.readStringOrNull(offsets[32]);
  object.taikoStatisticsJson = reader.readStringOrNull(offsets[33]);
  object.totalScore = reader.readLongOrNull(offsets[34]);
  object.updatedAt = reader.readDateTime(offsets[35]);
  object.userId = reader.readLong(offsets[36]);
  object.username = reader.readString(offsets[37]);
  return object;
}

P _osuUserDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 18:
      return (reader.readLongOrNull(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readLongOrNull(offset)) as P;
    case 22:
      return (reader.readLongOrNull(offset)) as P;
    case 23:
      return (reader.readLongOrNull(offset)) as P;
    case 24:
      return (reader.readLongOrNull(offset)) as P;
    case 25:
      return (reader.readLongOrNull(offset)) as P;
    case 26:
      return (reader.readLongOrNull(offset)) as P;
    case 27:
      return (reader.readStringOrNull(offset)) as P;
    case 28:
      return (reader.readDoubleOrNull(offset)) as P;
    case 29:
      return (reader.readStringOrNull(offset)) as P;
    case 30:
      return (reader.readLongOrNull(offset)) as P;
    case 31:
      return (reader.readStringOrNull(offset)) as P;
    case 32:
      return (reader.readStringOrNull(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readLongOrNull(offset)) as P;
    case 35:
      return (reader.readDateTime(offset)) as P;
    case 36:
      return (reader.readLong(offset)) as P;
    case 37:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _osuUserGetId(OsuUser object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _osuUserGetLinks(OsuUser object) {
  return [];
}

void _osuUserAttach(IsarCollection<dynamic> col, Id id, OsuUser object) {
  object.id = id;
}

extension OsuUserByIndex on IsarCollection<OsuUser> {
  Future<OsuUser?> getByUserId(int userId) {
    return getByIndex(r'userId', [userId]);
  }

  OsuUser? getByUserIdSync(int userId) {
    return getByIndexSync(r'userId', [userId]);
  }

  Future<bool> deleteByUserId(int userId) {
    return deleteByIndex(r'userId', [userId]);
  }

  bool deleteByUserIdSync(int userId) {
    return deleteByIndexSync(r'userId', [userId]);
  }

  Future<List<OsuUser?>> getAllByUserId(List<int> userIdValues) {
    final values = userIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'userId', values);
  }

  List<OsuUser?> getAllByUserIdSync(List<int> userIdValues) {
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

  Future<Id> putByUserId(OsuUser object) {
    return putByIndex(r'userId', object);
  }

  Id putByUserIdSync(OsuUser object, {bool saveLinks = true}) {
    return putByIndexSync(r'userId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUserId(List<OsuUser> objects) {
    return putAllByIndex(r'userId', objects);
  }

  List<Id> putAllByUserIdSync(List<OsuUser> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'userId', objects, saveLinks: saveLinks);
  }
}

extension OsuUserQueryWhereSort on QueryBuilder<OsuUser, OsuUser, QWhere> {
  QueryBuilder<OsuUser, OsuUser, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterWhere> anyUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'userId'),
      );
    });
  }
}

extension OsuUserQueryWhere on QueryBuilder<OsuUser, OsuUser, QWhereClause> {
  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> idBetween(
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

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> userIdEqualTo(int userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'userId', value: [userId]),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> userIdNotEqualTo(
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

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> userIdGreaterThan(
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

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> userIdLessThan(
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

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> userIdBetween(
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

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> playmodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'playmode', value: [null]),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> playmodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'playmode',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> playmodeEqualTo(
    String? playmode,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'playmode', value: [playmode]),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterWhereClause> playmodeNotEqualTo(
    String? playmode,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'playmode',
                lower: [],
                upper: [playmode],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'playmode',
                lower: [playmode],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'playmode',
                lower: [playmode],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'playmode',
                lower: [],
                upper: [playmode],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension OsuUserQueryFilter
    on QueryBuilder<OsuUser, OsuUser, QFilterCondition> {
  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'avatarUrl'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'avatarUrl'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'avatarUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'avatarUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'avatarUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'avatarUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'avatarUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'avatarUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'avatarUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'avatarUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'avatarUrl', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> avatarUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'avatarUrl', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'catchStatisticsJson'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'catchStatisticsJson'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'catchStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'catchStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'catchStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'catchStatisticsJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'catchStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'catchStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'catchStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'catchStatisticsJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'catchStatisticsJson', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  catchStatisticsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'catchStatisticsJson',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'countryCode'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'countryCode'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'countryCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'countryCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'countryCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'countryCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'countryCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'countryCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryCodeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'countryCode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryCodeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'countryCode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'countryCode', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  countryCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'countryCode', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryRankIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'countryRank'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryRankIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'countryRank'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryRankEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'countryRank', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryRankGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'countryRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryRankLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'countryRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> countryRankBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'countryRank',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'coverUrl'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'coverUrl'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'coverUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'coverUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'coverUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'coverUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'coverUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'coverUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'coverUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'coverUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'coverUrl', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> coverUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'coverUrl', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> currentLevelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'currentLevel'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  currentLevelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'currentLevel'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> currentLevelEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currentLevel', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> currentLevelGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currentLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> currentLevelLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currentLevel',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> currentLevelBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currentLevel',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  favouriteBeatmapsetCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'favouriteBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  favouriteBeatmapsetCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'favouriteBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  favouriteBeatmapsetCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'favouriteBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  favouriteBeatmapsetCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'favouriteBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  favouriteBeatmapsetCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'favouriteBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  favouriteBeatmapsetCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'favouriteBeatmapsetCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> followerCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'followerCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  followerCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'followerCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> followerCountEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'followerCount', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  followerCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'followerCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> followerCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'followerCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> followerCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'followerCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> globalRankIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'globalRank'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> globalRankIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'globalRank'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> globalRankEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'globalRank', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> globalRankGreaterThan(
    int? value, {
    bool include = false,
  }) {
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> globalRankLessThan(
    int? value, {
    bool include = false,
  }) {
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> globalRankBetween(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  graveyardBeatmapsetCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'graveyardBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  graveyardBeatmapsetCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'graveyardBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  graveyardBeatmapsetCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'graveyardBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  graveyardBeatmapsetCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'graveyardBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  graveyardBeatmapsetCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'graveyardBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  graveyardBeatmapsetCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'graveyardBeatmapsetCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> hitAccuracyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'hitAccuracy'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> hitAccuracyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'hitAccuracy'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> hitAccuracyEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'hitAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> hitAccuracyGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hitAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> hitAccuracyLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hitAccuracy',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> hitAccuracyBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hitAccuracy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> isActiveEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActive', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> isBotEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isBot', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> isDeletedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isDeleted', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> isOnlineEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isOnline', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> isSupporterEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isSupporter', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> joinDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'joinDate'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> joinDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'joinDate'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> joinDateEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'joinDate', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> joinDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'joinDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> joinDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'joinDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> joinDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'joinDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> lastVisitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lastVisit'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> lastVisitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lastVisit'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> lastVisitEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastVisit', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> lastVisitGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastVisit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> lastVisitLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastVisit',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> lastVisitBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastVisit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> levelProgressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'levelProgress'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  levelProgressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'levelProgress'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> levelProgressEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'levelProgress', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  levelProgressGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'levelProgress',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> levelProgressLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'levelProgress',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> levelProgressBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'levelProgress',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  lovedBeatmapsetCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'lovedBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  lovedBeatmapsetCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'lovedBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  lovedBeatmapsetCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'lovedBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  lovedBeatmapsetCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lovedBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  lovedBeatmapsetCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lovedBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  lovedBeatmapsetCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lovedBeatmapsetCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'maniaStatisticsJson'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'maniaStatisticsJson'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'maniaStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maniaStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maniaStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maniaStatisticsJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'maniaStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'maniaStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'maniaStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'maniaStatisticsJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'maniaStatisticsJson', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maniaStatisticsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'maniaStatisticsJson',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  mappingFollowerCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'mappingFollowerCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  mappingFollowerCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'mappingFollowerCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  mappingFollowerCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'mappingFollowerCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  mappingFollowerCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'mappingFollowerCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  mappingFollowerCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'mappingFollowerCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  mappingFollowerCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'mappingFollowerCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> maximumComboIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'maximumCombo'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  maximumComboIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'maximumCombo'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> maximumComboEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'maximumCombo', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> maximumComboGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'maximumCombo',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> maximumComboLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'maximumCombo',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> maximumComboBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'maximumCombo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  nominatedBeatmapsetCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'nominatedBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  nominatedBeatmapsetCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'nominatedBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  nominatedBeatmapsetCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'nominatedBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  nominatedBeatmapsetCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'nominatedBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  nominatedBeatmapsetCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'nominatedBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  nominatedBeatmapsetCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'nominatedBeatmapsetCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  pendingBeatmapsetCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pendingBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  pendingBeatmapsetCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pendingBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  pendingBeatmapsetCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'pendingBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  pendingBeatmapsetCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'pendingBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  pendingBeatmapsetCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'pendingBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  pendingBeatmapsetCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'pendingBeatmapsetCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'playCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'playCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playCountEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'playCount', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'playCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'playCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'playCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'playTime'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'playTime'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playTimeEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'playTime', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'playTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'playTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'playTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'playmode'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'playmode'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'playmode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'playmode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'playmode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'playmode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'playmode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'playmode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'playmode',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'playmode',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'playmode', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> playmodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'playmode', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> ppIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'pp'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> ppIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'pp'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> ppEqualTo(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> ppGreaterThan(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> ppLessThan(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> ppBetween(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> profileColourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'profileColour'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  profileColourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'profileColour'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> profileColourEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'profileColour',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  profileColourGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'profileColour',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> profileColourLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'profileColour',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> profileColourBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'profileColour',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> profileColourStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'profileColour',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> profileColourEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'profileColour',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> profileColourContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'profileColour',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> profileColourMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'profileColour',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> profileColourIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'profileColour', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  profileColourIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'profileColour', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  rankedBeatmapsetCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rankedBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  rankedBeatmapsetCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rankedBeatmapsetCount'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  rankedBeatmapsetCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rankedBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  rankedBeatmapsetCountGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rankedBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  rankedBeatmapsetCountLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rankedBeatmapsetCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  rankedBeatmapsetCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rankedBeatmapsetCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rawJson'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rawJson'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rawJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rawJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rawJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rawJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'rawJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'rawJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'rawJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'rawJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rawJson', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> rawJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rawJson', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'stdStatisticsJson'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'stdStatisticsJson'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'stdStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stdStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stdStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stdStatisticsJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'stdStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'stdStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'stdStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'stdStatisticsJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stdStatisticsJson', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  stdStatisticsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'stdStatisticsJson', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'taikoStatisticsJson'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'taikoStatisticsJson'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'taikoStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'taikoStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'taikoStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'taikoStatisticsJson',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'taikoStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'taikoStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'taikoStatisticsJson',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'taikoStatisticsJson',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'taikoStatisticsJson', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition>
  taikoStatisticsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          property: r'taikoStatisticsJson',
          value: '',
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> totalScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'totalScore'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> totalScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'totalScore'),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> totalScoreEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalScore', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> totalScoreGreaterThan(
    int? value, {
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> totalScoreLessThan(
    int? value, {
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> totalScoreBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> updatedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> updatedAtBetween(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> userIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'userId', value: value),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> usernameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> usernameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> usernameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> usernameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'username',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> usernameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> usernameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> usernameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'username',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> usernameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'username',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> usernameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'username', value: ''),
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterFilterCondition> usernameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'username', value: ''),
      );
    });
  }
}

extension OsuUserQueryObject
    on QueryBuilder<OsuUser, OsuUser, QFilterCondition> {}

extension OsuUserQueryLinks
    on QueryBuilder<OsuUser, OsuUser, QFilterCondition> {}

extension OsuUserQuerySortBy on QueryBuilder<OsuUser, OsuUser, QSortBy> {
  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByCatchStatisticsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catchStatisticsJson', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByCatchStatisticsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catchStatisticsJson', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByCountryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryCode', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByCountryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryCode', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByCountryRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryRank', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByCountryRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryRank', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByCoverUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByCoverUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByCurrentLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByCurrentLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  sortByFavouriteBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favouriteBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  sortByFavouriteBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favouriteBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByFollowerCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followerCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByFollowerCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followerCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByGlobalRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalRank', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByGlobalRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalRank', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  sortByGraveyardBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'graveyardBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  sortByGraveyardBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'graveyardBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByHitAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitAccuracy', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByHitAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitAccuracy', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByIsBot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBot', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByIsBotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBot', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByIsOnlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByIsSupporter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSupporter', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByIsSupporterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSupporter', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByJoinDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joinDate', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByJoinDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joinDate', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByLastVisit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVisit', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByLastVisitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVisit', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByLevelProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelProgress', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByLevelProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelProgress', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByLovedBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lovedBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  sortByLovedBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lovedBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByManiaStatisticsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maniaStatisticsJson', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByManiaStatisticsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maniaStatisticsJson', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByMappingFollowerCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFollowerCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  sortByMappingFollowerCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFollowerCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByMaximumCombo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximumCombo', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByMaximumComboDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximumCombo', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  sortByNominatedBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominatedBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  sortByNominatedBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominatedBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByPendingBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  sortByPendingBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByPlayCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByPlayCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByPlayTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByPlayTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByPlaymode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playmode', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByPlaymodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playmode', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByPp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByPpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByProfileColour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileColour', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByProfileColourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileColour', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByRankedBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rankedBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  sortByRankedBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rankedBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByRawJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawJson', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByRawJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawJson', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByStdStatisticsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stdStatisticsJson', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByStdStatisticsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stdStatisticsJson', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByTaikoStatisticsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taikoStatisticsJson', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByTaikoStatisticsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taikoStatisticsJson', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByTotalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByTotalScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> sortByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension OsuUserQuerySortThenBy
    on QueryBuilder<OsuUser, OsuUser, QSortThenBy> {
  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByCatchStatisticsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catchStatisticsJson', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByCatchStatisticsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'catchStatisticsJson', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByCountryCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryCode', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByCountryCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryCode', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByCountryRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryRank', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByCountryRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countryRank', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByCoverUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByCoverUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverUrl', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByCurrentLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByCurrentLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentLevel', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  thenByFavouriteBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favouriteBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  thenByFavouriteBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'favouriteBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByFollowerCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followerCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByFollowerCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'followerCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByGlobalRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalRank', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByGlobalRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalRank', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  thenByGraveyardBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'graveyardBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  thenByGraveyardBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'graveyardBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByHitAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitAccuracy', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByHitAccuracyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hitAccuracy', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByIsBot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBot', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByIsBotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBot', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByIsDeletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isDeleted', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByIsOnlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByIsSupporter() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSupporter', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByIsSupporterDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSupporter', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByJoinDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joinDate', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByJoinDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'joinDate', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByLastVisit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVisit', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByLastVisitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastVisit', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByLevelProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelProgress', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByLevelProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'levelProgress', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByLovedBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lovedBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  thenByLovedBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lovedBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByManiaStatisticsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maniaStatisticsJson', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByManiaStatisticsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maniaStatisticsJson', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByMappingFollowerCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFollowerCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  thenByMappingFollowerCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mappingFollowerCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByMaximumCombo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximumCombo', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByMaximumComboDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maximumCombo', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  thenByNominatedBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominatedBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  thenByNominatedBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nominatedBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByPendingBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  thenByPendingBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pendingBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByPlayCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByPlayCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByPlayTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByPlayTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playTime', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByPlaymode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playmode', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByPlaymodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playmode', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByPp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByPpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pp', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByProfileColour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileColour', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByProfileColourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileColour', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByRankedBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rankedBeatmapsetCount', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy>
  thenByRankedBeatmapsetCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rankedBeatmapsetCount', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByRawJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawJson', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByRawJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rawJson', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByStdStatisticsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stdStatisticsJson', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByStdStatisticsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stdStatisticsJson', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByTaikoStatisticsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taikoStatisticsJson', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByTaikoStatisticsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taikoStatisticsJson', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByTotalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByTotalScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalScore', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByUsername() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.asc);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QAfterSortBy> thenByUsernameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'username', Sort.desc);
    });
  }
}

extension OsuUserQueryWhereDistinct
    on QueryBuilder<OsuUser, OsuUser, QDistinct> {
  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByAvatarUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByCatchStatisticsJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'catchStatisticsJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByCountryCode({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countryCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByCountryRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countryRank');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByCoverUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByCurrentLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentLevel');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct>
  distinctByFavouriteBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'favouriteBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByFollowerCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'followerCount');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByGlobalRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'globalRank');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct>
  distinctByGraveyardBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'graveyardBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByHitAccuracy() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hitAccuracy');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByIsBot() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBot');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByIsDeleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isDeleted');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOnline');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByIsSupporter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSupporter');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByJoinDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'joinDate');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByLastVisit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastVisit');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByLevelProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'levelProgress');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByLovedBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lovedBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByManiaStatisticsJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'maniaStatisticsJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByMappingFollowerCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mappingFollowerCount');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByMaximumCombo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maximumCombo');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct>
  distinctByNominatedBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nominatedBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByPendingBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pendingBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByPlayCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playCount');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByPlayTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playTime');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByPlaymode({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playmode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByPp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pp');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByProfileColour({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'profileColour',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByRankedBeatmapsetCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rankedBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByRawJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rawJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByStdStatisticsJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'stdStatisticsJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByTaikoStatisticsJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'taikoStatisticsJson',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByTotalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalScore');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }

  QueryBuilder<OsuUser, OsuUser, QDistinct> distinctByUsername({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'username', caseSensitive: caseSensitive);
    });
  }
}

extension OsuUserQueryProperty
    on QueryBuilder<OsuUser, OsuUser, QQueryProperty> {
  QueryBuilder<OsuUser, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OsuUser, String?, QQueryOperations> avatarUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarUrl');
    });
  }

  QueryBuilder<OsuUser, String?, QQueryOperations>
  catchStatisticsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'catchStatisticsJson');
    });
  }

  QueryBuilder<OsuUser, String?, QQueryOperations> countryCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countryCode');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations> countryRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countryRank');
    });
  }

  QueryBuilder<OsuUser, String?, QQueryOperations> coverUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverUrl');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations> currentLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentLevel');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations>
  favouriteBeatmapsetCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'favouriteBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations> followerCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'followerCount');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations> globalRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'globalRank');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations>
  graveyardBeatmapsetCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'graveyardBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, double?, QQueryOperations> hitAccuracyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hitAccuracy');
    });
  }

  QueryBuilder<OsuUser, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<OsuUser, bool, QQueryOperations> isBotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBot');
    });
  }

  QueryBuilder<OsuUser, bool, QQueryOperations> isDeletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isDeleted');
    });
  }

  QueryBuilder<OsuUser, bool, QQueryOperations> isOnlineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOnline');
    });
  }

  QueryBuilder<OsuUser, bool, QQueryOperations> isSupporterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSupporter');
    });
  }

  QueryBuilder<OsuUser, DateTime?, QQueryOperations> joinDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'joinDate');
    });
  }

  QueryBuilder<OsuUser, DateTime?, QQueryOperations> lastVisitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastVisit');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations> levelProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'levelProgress');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations> lovedBeatmapsetCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lovedBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, String?, QQueryOperations>
  maniaStatisticsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maniaStatisticsJson');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations> mappingFollowerCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mappingFollowerCount');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations> maximumComboProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maximumCombo');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations>
  nominatedBeatmapsetCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nominatedBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations>
  pendingBeatmapsetCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pendingBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations> playCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playCount');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations> playTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playTime');
    });
  }

  QueryBuilder<OsuUser, String?, QQueryOperations> playmodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playmode');
    });
  }

  QueryBuilder<OsuUser, double?, QQueryOperations> ppProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pp');
    });
  }

  QueryBuilder<OsuUser, String?, QQueryOperations> profileColourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileColour');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations>
  rankedBeatmapsetCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rankedBeatmapsetCount');
    });
  }

  QueryBuilder<OsuUser, String?, QQueryOperations> rawJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rawJson');
    });
  }

  QueryBuilder<OsuUser, String?, QQueryOperations> stdStatisticsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stdStatisticsJson');
    });
  }

  QueryBuilder<OsuUser, String?, QQueryOperations>
  taikoStatisticsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taikoStatisticsJson');
    });
  }

  QueryBuilder<OsuUser, int?, QQueryOperations> totalScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalScore');
    });
  }

  QueryBuilder<OsuUser, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<OsuUser, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<OsuUser, String, QQueryOperations> usernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'username');
    });
  }
}

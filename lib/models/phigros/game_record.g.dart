// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPhigrosGameRecordCollection on Isar {
  IsarCollection<PhigrosGameRecord> get phigrosGameRecords => this.collection();
}

const PhigrosGameRecordSchema = CollectionSchema(
  name: r'PhigrosGameRecord',
  id: -4295716281540967489,
  properties: {
    r'acc': PropertySchema(id: 0, name: r'acc', type: IsarType.double),
    r'accountId': PropertySchema(
      id: 1,
      name: r'accountId',
      type: IsarType.string,
    ),
    r'artist': PropertySchema(id: 2, name: r'artist', type: IsarType.string),
    r'constant': PropertySchema(
      id: 3,
      name: r'constant',
      type: IsarType.double,
    ),
    r'fc': PropertySchema(id: 4, name: r'fc', type: IsarType.bool),
    r'isBlueV': PropertySchema(id: 5, name: r'isBlueV', type: IsarType.bool),
    r'lastUpdated': PropertySchema(
      id: 6,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'level': PropertySchema(id: 7, name: r'level', type: IsarType.string),
    r'rating': PropertySchema(id: 8, name: r'rating', type: IsarType.string),
    r'rks': PropertySchema(id: 9, name: r'rks', type: IsarType.double),
    r'score': PropertySchema(id: 10, name: r'score', type: IsarType.long),
    r'songId': PropertySchema(id: 11, name: r'songId', type: IsarType.string),
    r'songName': PropertySchema(
      id: 12,
      name: r'songName',
      type: IsarType.string,
    ),
  },

  estimateSize: _phigrosGameRecordEstimateSize,
  serialize: _phigrosGameRecordSerialize,
  deserialize: _phigrosGameRecordDeserialize,
  deserializeProp: _phigrosGameRecordDeserializeProp,
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
    r'songId': IndexSchema(
      id: -4588889454650216128,
      name: r'songId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'songId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'level': IndexSchema(
      id: -730704511986726349,
      name: r'level',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'level',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _phigrosGameRecordGetId,
  getLinks: _phigrosGameRecordGetLinks,
  attach: _phigrosGameRecordAttach,
  version: '3.3.0',
);

int _phigrosGameRecordEstimateSize(
  PhigrosGameRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accountId.length * 3;
  bytesCount += 3 + object.artist.length * 3;
  bytesCount += 3 + object.level.length * 3;
  bytesCount += 3 + object.rating.length * 3;
  bytesCount += 3 + object.songId.length * 3;
  bytesCount += 3 + object.songName.length * 3;
  return bytesCount;
}

void _phigrosGameRecordSerialize(
  PhigrosGameRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.acc);
  writer.writeString(offsets[1], object.accountId);
  writer.writeString(offsets[2], object.artist);
  writer.writeDouble(offsets[3], object.constant);
  writer.writeBool(offsets[4], object.fc);
  writer.writeBool(offsets[5], object.isBlueV);
  writer.writeDateTime(offsets[6], object.lastUpdated);
  writer.writeString(offsets[7], object.level);
  writer.writeString(offsets[8], object.rating);
  writer.writeDouble(offsets[9], object.rks);
  writer.writeLong(offsets[10], object.score);
  writer.writeString(offsets[11], object.songId);
  writer.writeString(offsets[12], object.songName);
}

PhigrosGameRecord _phigrosGameRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PhigrosGameRecord();
  object.acc = reader.readDouble(offsets[0]);
  object.accountId = reader.readString(offsets[1]);
  object.artist = reader.readString(offsets[2]);
  object.constant = reader.readDouble(offsets[3]);
  object.fc = reader.readBool(offsets[4]);
  object.id = id;
  object.lastUpdated = reader.readDateTime(offsets[6]);
  object.level = reader.readString(offsets[7]);
  object.rks = reader.readDouble(offsets[9]);
  object.score = reader.readLong(offsets[10]);
  object.songId = reader.readString(offsets[11]);
  object.songName = reader.readString(offsets[12]);
  return object;
}

P _phigrosGameRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _phigrosGameRecordGetId(PhigrosGameRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _phigrosGameRecordGetLinks(
  PhigrosGameRecord object,
) {
  return [];
}

void _phigrosGameRecordAttach(
  IsarCollection<dynamic> col,
  Id id,
  PhigrosGameRecord object,
) {
  object.id = id;
}

extension PhigrosGameRecordQueryWhereSort
    on QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QWhere> {
  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PhigrosGameRecordQueryWhere
    on QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QWhereClause> {
  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhereClause>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhereClause>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhereClause>
  accountIdEqualTo(String accountId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'accountId', value: [accountId]),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhereClause>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhereClause>
  songIdEqualTo(String songId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'songId', value: [songId]),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhereClause>
  songIdNotEqualTo(String songId) {
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhereClause>
  levelEqualTo(String level) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'level', value: [level]),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterWhereClause>
  levelNotEqualTo(String level) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [],
                upper: [level],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [level],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [level],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [],
                upper: [level],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension PhigrosGameRecordQueryFilter
    on QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QFilterCondition> {
  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  accEqualTo(double value, {double epsilon = Query.epsilon}) {
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  accGreaterThan(
    double value, {
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  accLessThan(
    double value, {
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  accBetween(
    double lower,
    double upper, {
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  accountIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'accountId', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  accountIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'accountId', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  artistEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'artist',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  artistGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'artist',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  artistLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'artist',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  artistBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'artist',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  artistStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'artist',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  artistEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'artist',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  artistContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'artist',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  artistMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'artist',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  artistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'artist', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  artistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'artist', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  constantEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'constant',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  constantGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'constant',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  constantLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'constant',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  constantBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'constant',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  fcEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fc', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  isBlueVEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isBlueV', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastUpdated', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  ratingEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rating',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  ratingGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rating',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  ratingLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rating',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  ratingBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rating',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  ratingStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'rating',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  ratingEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'rating',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  ratingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'rating',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  ratingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'rating',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  ratingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rating', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  ratingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rating', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  rksEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rks',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  rksGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rks',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  rksLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rks',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  rksBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rks',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  scoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'score', value: value),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  scoreGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  scoreLessThan(int value, {bool include = false}) {
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  scoreBetween(
    int lower,
    int upper, {
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'songId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'songId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'songId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'songId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'songId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'songId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'songId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'songId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songId', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'songId', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
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

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songName', value: ''),
      );
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterFilterCondition>
  songNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'songName', value: ''),
      );
    });
  }
}

extension PhigrosGameRecordQueryObject
    on QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QFilterCondition> {}

extension PhigrosGameRecordQueryLinks
    on QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QFilterCondition> {}

extension PhigrosGameRecordQuerySortBy
    on QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QSortBy> {
  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy> sortByAcc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acc', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByAccDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acc', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByConstant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constant', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByConstantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constant', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy> sortByFc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByFcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByIsBlueV() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlueV', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByIsBlueVDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlueV', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy> sortByRks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rks', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByRksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rks', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  sortBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }
}

extension PhigrosGameRecordQuerySortThenBy
    on QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QSortThenBy> {
  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy> thenByAcc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acc', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByAccDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'acc', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByAccountId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByAccountIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountId', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByConstant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constant', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByConstantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'constant', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy> thenByFc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByFcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fc', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByIsBlueV() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlueV', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByIsBlueVDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isBlueV', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy> thenByRks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rks', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByRksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rks', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenByScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenBySongName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.asc);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QAfterSortBy>
  thenBySongNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songName', Sort.desc);
    });
  }
}

extension PhigrosGameRecordQueryWhereDistinct
    on QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct> {
  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctByAcc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'acc');
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctByAccountId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctByArtist({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artist', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctByConstant() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'constant');
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct> distinctByFc() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fc');
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctByIsBlueV() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isBlueV');
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctByLevel({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctByRating({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctByRks() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rks');
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctByScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score');
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctBySongId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QDistinct>
  distinctBySongName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songName', caseSensitive: caseSensitive);
    });
  }
}

extension PhigrosGameRecordQueryProperty
    on QueryBuilder<PhigrosGameRecord, PhigrosGameRecord, QQueryProperty> {
  QueryBuilder<PhigrosGameRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PhigrosGameRecord, double, QQueryOperations> accProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'acc');
    });
  }

  QueryBuilder<PhigrosGameRecord, String, QQueryOperations>
  accountIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountId');
    });
  }

  QueryBuilder<PhigrosGameRecord, String, QQueryOperations> artistProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artist');
    });
  }

  QueryBuilder<PhigrosGameRecord, double, QQueryOperations> constantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'constant');
    });
  }

  QueryBuilder<PhigrosGameRecord, bool, QQueryOperations> fcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fc');
    });
  }

  QueryBuilder<PhigrosGameRecord, bool, QQueryOperations> isBlueVProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isBlueV');
    });
  }

  QueryBuilder<PhigrosGameRecord, DateTime, QQueryOperations>
  lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<PhigrosGameRecord, String, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<PhigrosGameRecord, String, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<PhigrosGameRecord, double, QQueryOperations> rksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rks');
    });
  }

  QueryBuilder<PhigrosGameRecord, int, QQueryOperations> scoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score');
    });
  }

  QueryBuilder<PhigrosGameRecord, String, QQueryOperations> songIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songId');
    });
  }

  QueryBuilder<PhigrosGameRecord, String, QQueryOperations> songNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songName');
    });
  }
}

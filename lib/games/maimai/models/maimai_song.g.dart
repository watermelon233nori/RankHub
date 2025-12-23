// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maimai_song.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMaimaiSongCollection on Isar {
  IsarCollection<MaimaiSong> get maimaiSongs => this.collection();
}

const MaimaiSongSchema = CollectionSchema(
  name: r'MaimaiSong',
  id: -5110258190789997494,
  properties: {
    r'artist': PropertySchema(id: 0, name: r'artist', type: IsarType.string),
    r'bpm': PropertySchema(id: 1, name: r'bpm', type: IsarType.long),
    r'difficulties': PropertySchema(
      id: 2,
      name: r'difficulties',
      type: IsarType.object,

      target: r'MaimaiSongDifficulties',
    ),
    r'disabled': PropertySchema(id: 3, name: r'disabled', type: IsarType.bool),
    r'genre': PropertySchema(id: 4, name: r'genre', type: IsarType.string),
    r'locked': PropertySchema(id: 5, name: r'locked', type: IsarType.bool),
    r'map': PropertySchema(id: 6, name: r'map', type: IsarType.string),
    r'rights': PropertySchema(id: 7, name: r'rights', type: IsarType.string),
    r'songId': PropertySchema(id: 8, name: r'songId', type: IsarType.long),
    r'title': PropertySchema(id: 9, name: r'title', type: IsarType.string),
    r'version': PropertySchema(id: 10, name: r'version', type: IsarType.long),
  },

  estimateSize: _maimaiSongEstimateSize,
  serialize: _maimaiSongSerialize,
  deserialize: _maimaiSongDeserialize,
  deserializeProp: _maimaiSongDeserializeProp,
  idName: r'id',
  indexes: {
    r'songId': IndexSchema(
      id: -4588889454650216128,
      name: r'songId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'songId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'title': IndexSchema(
      id: -7636685945352118059,
      name: r'title',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'title',
          type: IndexType.value,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {
    r'MaimaiSongDifficulties': MaimaiSongDifficultiesSchema,
    r'MaimaiSongDifficulty': MaimaiSongDifficultySchema,
    r'MaimaiNotes': MaimaiNotesSchema,
    r'MaimaiSongDifficultyUtage': MaimaiSongDifficultyUtageSchema,
    r'MaimaiBuddyNotes': MaimaiBuddyNotesSchema,
  },

  getId: _maimaiSongGetId,
  getLinks: _maimaiSongGetLinks,
  attach: _maimaiSongAttach,
  version: '3.3.0',
);

int _maimaiSongEstimateSize(
  MaimaiSong object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.artist.length * 3;
  bytesCount +=
      3 +
      MaimaiSongDifficultiesSchema.estimateSize(
        object.difficulties,
        allOffsets[MaimaiSongDifficulties]!,
        allOffsets,
      );
  bytesCount += 3 + object.genre.length * 3;
  {
    final value = object.map;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rights;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _maimaiSongSerialize(
  MaimaiSong object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.artist);
  writer.writeLong(offsets[1], object.bpm);
  writer.writeObject<MaimaiSongDifficulties>(
    offsets[2],
    allOffsets,
    MaimaiSongDifficultiesSchema.serialize,
    object.difficulties,
  );
  writer.writeBool(offsets[3], object.disabled);
  writer.writeString(offsets[4], object.genre);
  writer.writeBool(offsets[5], object.locked);
  writer.writeString(offsets[6], object.map);
  writer.writeString(offsets[7], object.rights);
  writer.writeLong(offsets[8], object.songId);
  writer.writeString(offsets[9], object.title);
  writer.writeLong(offsets[10], object.version);
}

MaimaiSong _maimaiSongDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiSong(
    artist: reader.readStringOrNull(offsets[0]) ?? '',
    bpm: reader.readLongOrNull(offsets[1]) ?? 0,
    difficulties:
        reader.readObjectOrNull<MaimaiSongDifficulties>(
          offsets[2],
          MaimaiSongDifficultiesSchema.deserialize,
          allOffsets,
        ) ??
        const MaimaiSongDifficulties(),
    disabled: reader.readBoolOrNull(offsets[3]) ?? false,
    genre: reader.readStringOrNull(offsets[4]) ?? '',
    id: id,
    locked: reader.readBoolOrNull(offsets[5]) ?? false,
    map: reader.readStringOrNull(offsets[6]),
    rights: reader.readStringOrNull(offsets[7]),
    songId: reader.readLongOrNull(offsets[8]) ?? 0,
    title: reader.readStringOrNull(offsets[9]) ?? '',
    version: reader.readLongOrNull(offsets[10]) ?? 0,
  );
  return object;
}

P _maimaiSongDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readObjectOrNull<MaimaiSongDifficulties>(
                offset,
                MaimaiSongDifficultiesSchema.deserialize,
                allOffsets,
              ) ??
              const MaimaiSongDifficulties())
          as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 5:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 9:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 10:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _maimaiSongGetId(MaimaiSong object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _maimaiSongGetLinks(MaimaiSong object) {
  return [];
}

void _maimaiSongAttach(IsarCollection<dynamic> col, Id id, MaimaiSong object) {
  object.id = id;
}

extension MaimaiSongByIndex on IsarCollection<MaimaiSong> {
  Future<MaimaiSong?> getBySongId(int songId) {
    return getByIndex(r'songId', [songId]);
  }

  MaimaiSong? getBySongIdSync(int songId) {
    return getByIndexSync(r'songId', [songId]);
  }

  Future<bool> deleteBySongId(int songId) {
    return deleteByIndex(r'songId', [songId]);
  }

  bool deleteBySongIdSync(int songId) {
    return deleteByIndexSync(r'songId', [songId]);
  }

  Future<List<MaimaiSong?>> getAllBySongId(List<int> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'songId', values);
  }

  List<MaimaiSong?> getAllBySongIdSync(List<int> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'songId', values);
  }

  Future<int> deleteAllBySongId(List<int> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'songId', values);
  }

  int deleteAllBySongIdSync(List<int> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'songId', values);
  }

  Future<Id> putBySongId(MaimaiSong object) {
    return putByIndex(r'songId', object);
  }

  Id putBySongIdSync(MaimaiSong object, {bool saveLinks = true}) {
    return putByIndexSync(r'songId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySongId(List<MaimaiSong> objects) {
    return putAllByIndex(r'songId', objects);
  }

  List<Id> putAllBySongIdSync(
    List<MaimaiSong> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'songId', objects, saveLinks: saveLinks);
  }
}

extension MaimaiSongQueryWhereSort
    on QueryBuilder<MaimaiSong, MaimaiSong, QWhere> {
  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhere> anySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'songId'),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhere> anyTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'title'),
      );
    });
  }
}

extension MaimaiSongQueryWhere
    on QueryBuilder<MaimaiSong, MaimaiSong, QWhereClause> {
  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> idBetween(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> songIdEqualTo(
    int songId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'songId', value: [songId]),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> songIdNotEqualTo(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> songIdGreaterThan(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> songIdLessThan(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> songIdBetween(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> titleEqualTo(
    String title,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: [title]),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> titleNotEqualTo(
    String title,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [],
                upper: [title],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [title],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [title],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'title',
                lower: [],
                upper: [title],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> titleGreaterThan(
    String title, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [title],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> titleLessThan(
    String title, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [],
          upper: [title],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> titleBetween(
    String lowerTitle,
    String upperTitle, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [lowerTitle],
          includeLower: includeLower,
          upper: [upperTitle],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> titleStartsWith(
    String TitlePrefix,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'title',
          lower: [TitlePrefix],
          upper: ['$TitlePrefix\u{FFFFF}'],
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: ['']),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterWhereClause> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'title', upper: ['']),
            )
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'title', lower: ['']),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.greaterThan(indexName: r'title', lower: ['']),
            )
            .addWhereClause(
              IndexWhereClause.lessThan(indexName: r'title', upper: ['']),
            );
      }
    });
  }
}

extension MaimaiSongQueryFilter
    on QueryBuilder<MaimaiSong, MaimaiSong, QFilterCondition> {
  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> artistEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> artistGreaterThan(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> artistLessThan(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> artistBetween(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> artistStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> artistEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> artistContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> artistMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> artistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'artist', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition>
  artistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'artist', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> bpmEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bpm', value: value),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> bpmGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'bpm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> bpmLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'bpm',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> bpmBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'bpm',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> disabledEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'disabled', value: value),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> genreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> genreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> genreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> genreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'genre',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> genreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> genreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> genreContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> genreMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'genre',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> genreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition>
  genreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> lockedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'locked', value: value),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'map'),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'map'),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'map',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'map',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'map',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'map',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'map',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'map',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'map',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'map',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'map', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> mapIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'map', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> rightsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rights'),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition>
  rightsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rights'),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> rightsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'rights',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> rightsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rights',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> rightsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rights',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> rightsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rights',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> rightsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'rights',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> rightsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'rights',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> rightsContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'rights',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> rightsMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'rights',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> rightsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rights', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition>
  rightsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rights', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> songIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songId', value: value),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> songIdGreaterThan(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> songIdLessThan(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> songIdBetween(
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

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> titleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> titleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> versionEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'version', value: value),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition>
  versionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'version',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'version',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'version',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MaimaiSongQueryObject
    on QueryBuilder<MaimaiSong, MaimaiSong, QFilterCondition> {
  QueryBuilder<MaimaiSong, MaimaiSong, QAfterFilterCondition> difficulties(
    FilterQuery<MaimaiSongDifficulties> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'difficulties');
    });
  }
}

extension MaimaiSongQueryLinks
    on QueryBuilder<MaimaiSong, MaimaiSong, QFilterCondition> {}

extension MaimaiSongQuerySortBy
    on QueryBuilder<MaimaiSong, MaimaiSong, QSortBy> {
  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByBpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByDisabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabled', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByDisabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabled', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByMap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'map', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByMapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'map', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByRights() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rights', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByRightsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rights', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension MaimaiSongQuerySortThenBy
    on QueryBuilder<MaimaiSong, MaimaiSong, QSortThenBy> {
  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByBpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByDisabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabled', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByDisabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabled', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByMap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'map', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByMapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'map', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByRights() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rights', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByRightsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rights', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension MaimaiSongQueryWhereDistinct
    on QueryBuilder<MaimaiSong, MaimaiSong, QDistinct> {
  QueryBuilder<MaimaiSong, MaimaiSong, QDistinct> distinctByArtist({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artist', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QDistinct> distinctByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bpm');
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QDistinct> distinctByDisabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'disabled');
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QDistinct> distinctByGenre({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QDistinct> distinctByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locked');
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QDistinct> distinctByMap({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'map', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QDistinct> distinctByRights({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rights', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QDistinct> distinctBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songId');
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSong, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension MaimaiSongQueryProperty
    on QueryBuilder<MaimaiSong, MaimaiSong, QQueryProperty> {
  QueryBuilder<MaimaiSong, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MaimaiSong, String, QQueryOperations> artistProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artist');
    });
  }

  QueryBuilder<MaimaiSong, int, QQueryOperations> bpmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bpm');
    });
  }

  QueryBuilder<MaimaiSong, MaimaiSongDifficulties, QQueryOperations>
  difficultiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficulties');
    });
  }

  QueryBuilder<MaimaiSong, bool, QQueryOperations> disabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'disabled');
    });
  }

  QueryBuilder<MaimaiSong, String, QQueryOperations> genreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genre');
    });
  }

  QueryBuilder<MaimaiSong, bool, QQueryOperations> lockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locked');
    });
  }

  QueryBuilder<MaimaiSong, String?, QQueryOperations> mapProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'map');
    });
  }

  QueryBuilder<MaimaiSong, String?, QQueryOperations> rightsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rights');
    });
  }

  QueryBuilder<MaimaiSong, int, QQueryOperations> songIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songId');
    });
  }

  QueryBuilder<MaimaiSong, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<MaimaiSong, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMaimaiGenreCollection on Isar {
  IsarCollection<MaimaiGenre> get maimaiGenres => this.collection();
}

const MaimaiGenreSchema = CollectionSchema(
  name: r'MaimaiGenre',
  id: -4927588897003568729,
  properties: {
    r'genre': PropertySchema(id: 0, name: r'genre', type: IsarType.string),
    r'genreId': PropertySchema(id: 1, name: r'genreId', type: IsarType.long),
    r'title': PropertySchema(id: 2, name: r'title', type: IsarType.string),
  },

  estimateSize: _maimaiGenreEstimateSize,
  serialize: _maimaiGenreSerialize,
  deserialize: _maimaiGenreDeserialize,
  deserializeProp: _maimaiGenreDeserializeProp,
  idName: r'id',
  indexes: {
    r'genreId': IndexSchema(
      id: 3212228459756463684,
      name: r'genreId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'genreId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _maimaiGenreGetId,
  getLinks: _maimaiGenreGetLinks,
  attach: _maimaiGenreAttach,
  version: '3.3.0',
);

int _maimaiGenreEstimateSize(
  MaimaiGenre object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.genre.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _maimaiGenreSerialize(
  MaimaiGenre object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.genre);
  writer.writeLong(offsets[1], object.genreId);
  writer.writeString(offsets[2], object.title);
}

MaimaiGenre _maimaiGenreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiGenre(
    genre: reader.readStringOrNull(offsets[0]) ?? '',
    genreId: reader.readLongOrNull(offsets[1]) ?? 0,
    id: id,
    title: reader.readStringOrNull(offsets[2]) ?? '',
  );
  return object;
}

P _maimaiGenreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? '') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _maimaiGenreGetId(MaimaiGenre object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _maimaiGenreGetLinks(MaimaiGenre object) {
  return [];
}

void _maimaiGenreAttach(
  IsarCollection<dynamic> col,
  Id id,
  MaimaiGenre object,
) {
  object.id = id;
}

extension MaimaiGenreByIndex on IsarCollection<MaimaiGenre> {
  Future<MaimaiGenre?> getByGenreId(int genreId) {
    return getByIndex(r'genreId', [genreId]);
  }

  MaimaiGenre? getByGenreIdSync(int genreId) {
    return getByIndexSync(r'genreId', [genreId]);
  }

  Future<bool> deleteByGenreId(int genreId) {
    return deleteByIndex(r'genreId', [genreId]);
  }

  bool deleteByGenreIdSync(int genreId) {
    return deleteByIndexSync(r'genreId', [genreId]);
  }

  Future<List<MaimaiGenre?>> getAllByGenreId(List<int> genreIdValues) {
    final values = genreIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'genreId', values);
  }

  List<MaimaiGenre?> getAllByGenreIdSync(List<int> genreIdValues) {
    final values = genreIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'genreId', values);
  }

  Future<int> deleteAllByGenreId(List<int> genreIdValues) {
    final values = genreIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'genreId', values);
  }

  int deleteAllByGenreIdSync(List<int> genreIdValues) {
    final values = genreIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'genreId', values);
  }

  Future<Id> putByGenreId(MaimaiGenre object) {
    return putByIndex(r'genreId', object);
  }

  Id putByGenreIdSync(MaimaiGenre object, {bool saveLinks = true}) {
    return putByIndexSync(r'genreId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByGenreId(List<MaimaiGenre> objects) {
    return putAllByIndex(r'genreId', objects);
  }

  List<Id> putAllByGenreIdSync(
    List<MaimaiGenre> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'genreId', objects, saveLinks: saveLinks);
  }
}

extension MaimaiGenreQueryWhereSort
    on QueryBuilder<MaimaiGenre, MaimaiGenre, QWhere> {
  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhere> anyGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'genreId'),
      );
    });
  }
}

extension MaimaiGenreQueryWhere
    on QueryBuilder<MaimaiGenre, MaimaiGenre, QWhereClause> {
  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhereClause> idBetween(
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

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhereClause> genreIdEqualTo(
    int genreId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'genreId', value: [genreId]),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhereClause> genreIdNotEqualTo(
    int genreId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'genreId',
                lower: [],
                upper: [genreId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'genreId',
                lower: [genreId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'genreId',
                lower: [genreId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'genreId',
                lower: [],
                upper: [genreId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhereClause> genreIdGreaterThan(
    int genreId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'genreId',
          lower: [genreId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhereClause> genreIdLessThan(
    int genreId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'genreId',
          lower: [],
          upper: [genreId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterWhereClause> genreIdBetween(
    int lowerGenreId,
    int upperGenreId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'genreId',
          lower: [lowerGenreId],
          includeLower: includeLower,
          upper: [upperGenreId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MaimaiGenreQueryFilter
    on QueryBuilder<MaimaiGenre, MaimaiGenre, QFilterCondition> {
  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> genreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition>
  genreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> genreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> genreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'genre',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> genreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> genreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> genreContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'genre',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> genreMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'genre',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> genreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition>
  genreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> genreIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genreId', value: value),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition>
  genreIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'genreId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> genreIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'genreId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> genreIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'genreId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition>
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> titleContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> titleMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }
}

extension MaimaiGenreQueryObject
    on QueryBuilder<MaimaiGenre, MaimaiGenre, QFilterCondition> {}

extension MaimaiGenreQueryLinks
    on QueryBuilder<MaimaiGenre, MaimaiGenre, QFilterCondition> {}

extension MaimaiGenreQuerySortBy
    on QueryBuilder<MaimaiGenre, MaimaiGenre, QSortBy> {
  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> sortByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> sortByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> sortByGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> sortByGenreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.desc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension MaimaiGenreQuerySortThenBy
    on QueryBuilder<MaimaiGenre, MaimaiGenre, QSortThenBy> {
  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> thenByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> thenByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> thenByGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> thenByGenreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.desc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension MaimaiGenreQueryWhereDistinct
    on QueryBuilder<MaimaiGenre, MaimaiGenre, QDistinct> {
  QueryBuilder<MaimaiGenre, MaimaiGenre, QDistinct> distinctByGenre({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QDistinct> distinctByGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genreId');
    });
  }

  QueryBuilder<MaimaiGenre, MaimaiGenre, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension MaimaiGenreQueryProperty
    on QueryBuilder<MaimaiGenre, MaimaiGenre, QQueryProperty> {
  QueryBuilder<MaimaiGenre, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MaimaiGenre, String, QQueryOperations> genreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genre');
    });
  }

  QueryBuilder<MaimaiGenre, int, QQueryOperations> genreIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genreId');
    });
  }

  QueryBuilder<MaimaiGenre, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMaimaiVersionCollection on Isar {
  IsarCollection<MaimaiVersion> get maimaiVersions => this.collection();
}

const MaimaiVersionSchema = CollectionSchema(
  name: r'MaimaiVersion',
  id: -7023542754995245292,
  properties: {
    r'title': PropertySchema(id: 0, name: r'title', type: IsarType.string),
    r'version': PropertySchema(id: 1, name: r'version', type: IsarType.long),
    r'versionId': PropertySchema(
      id: 2,
      name: r'versionId',
      type: IsarType.long,
    ),
  },

  estimateSize: _maimaiVersionEstimateSize,
  serialize: _maimaiVersionSerialize,
  deserialize: _maimaiVersionDeserialize,
  deserializeProp: _maimaiVersionDeserializeProp,
  idName: r'id',
  indexes: {
    r'versionId': IndexSchema(
      id: -4747984966447694449,
      name: r'versionId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'versionId',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _maimaiVersionGetId,
  getLinks: _maimaiVersionGetLinks,
  attach: _maimaiVersionAttach,
  version: '3.3.0',
);

int _maimaiVersionEstimateSize(
  MaimaiVersion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _maimaiVersionSerialize(
  MaimaiVersion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.title);
  writer.writeLong(offsets[1], object.version);
  writer.writeLong(offsets[2], object.versionId);
}

MaimaiVersion _maimaiVersionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiVersion(
    id: id,
    title: reader.readStringOrNull(offsets[0]) ?? '',
    version: reader.readLongOrNull(offsets[1]) ?? 0,
    versionId: reader.readLongOrNull(offsets[2]) ?? 0,
  );
  return object;
}

P _maimaiVersionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _maimaiVersionGetId(MaimaiVersion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _maimaiVersionGetLinks(MaimaiVersion object) {
  return [];
}

void _maimaiVersionAttach(
  IsarCollection<dynamic> col,
  Id id,
  MaimaiVersion object,
) {
  object.id = id;
}

extension MaimaiVersionByIndex on IsarCollection<MaimaiVersion> {
  Future<MaimaiVersion?> getByVersionId(int versionId) {
    return getByIndex(r'versionId', [versionId]);
  }

  MaimaiVersion? getByVersionIdSync(int versionId) {
    return getByIndexSync(r'versionId', [versionId]);
  }

  Future<bool> deleteByVersionId(int versionId) {
    return deleteByIndex(r'versionId', [versionId]);
  }

  bool deleteByVersionIdSync(int versionId) {
    return deleteByIndexSync(r'versionId', [versionId]);
  }

  Future<List<MaimaiVersion?>> getAllByVersionId(List<int> versionIdValues) {
    final values = versionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'versionId', values);
  }

  List<MaimaiVersion?> getAllByVersionIdSync(List<int> versionIdValues) {
    final values = versionIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'versionId', values);
  }

  Future<int> deleteAllByVersionId(List<int> versionIdValues) {
    final values = versionIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'versionId', values);
  }

  int deleteAllByVersionIdSync(List<int> versionIdValues) {
    final values = versionIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'versionId', values);
  }

  Future<Id> putByVersionId(MaimaiVersion object) {
    return putByIndex(r'versionId', object);
  }

  Id putByVersionIdSync(MaimaiVersion object, {bool saveLinks = true}) {
    return putByIndexSync(r'versionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByVersionId(List<MaimaiVersion> objects) {
    return putAllByIndex(r'versionId', objects);
  }

  List<Id> putAllByVersionIdSync(
    List<MaimaiVersion> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'versionId', objects, saveLinks: saveLinks);
  }
}

extension MaimaiVersionQueryWhereSort
    on QueryBuilder<MaimaiVersion, MaimaiVersion, QWhere> {
  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhere> anyVersionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'versionId'),
      );
    });
  }
}

extension MaimaiVersionQueryWhere
    on QueryBuilder<MaimaiVersion, MaimaiVersion, QWhereClause> {
  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhereClause> idBetween(
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

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhereClause>
  versionIdEqualTo(int versionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'versionId', value: [versionId]),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhereClause>
  versionIdNotEqualTo(int versionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'versionId',
                lower: [],
                upper: [versionId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'versionId',
                lower: [versionId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'versionId',
                lower: [versionId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'versionId',
                lower: [],
                upper: [versionId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhereClause>
  versionIdGreaterThan(int versionId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'versionId',
          lower: [versionId],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhereClause>
  versionIdLessThan(int versionId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'versionId',
          lower: [],
          upper: [versionId],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterWhereClause>
  versionIdBetween(
    int lowerVersionId,
    int upperVersionId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'versionId',
          lower: [lowerVersionId],
          includeLower: includeLower,
          upper: [upperVersionId],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MaimaiVersionQueryFilter
    on QueryBuilder<MaimaiVersion, MaimaiVersion, QFilterCondition> {
  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
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

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  titleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'version', value: value),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  versionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'version',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  versionLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'version',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'version',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  versionIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'versionId', value: value),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  versionIdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'versionId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  versionIdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'versionId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterFilterCondition>
  versionIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'versionId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MaimaiVersionQueryObject
    on QueryBuilder<MaimaiVersion, MaimaiVersion, QFilterCondition> {}

extension MaimaiVersionQueryLinks
    on QueryBuilder<MaimaiVersion, MaimaiVersion, QFilterCondition> {}

extension MaimaiVersionQuerySortBy
    on QueryBuilder<MaimaiVersion, MaimaiVersion, QSortBy> {
  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> sortByVersionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy>
  sortByVersionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionId', Sort.desc);
    });
  }
}

extension MaimaiVersionQuerySortThenBy
    on QueryBuilder<MaimaiVersion, MaimaiVersion, QSortThenBy> {
  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy> thenByVersionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionId', Sort.asc);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QAfterSortBy>
  thenByVersionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionId', Sort.desc);
    });
  }
}

extension MaimaiVersionQueryWhereDistinct
    on QueryBuilder<MaimaiVersion, MaimaiVersion, QDistinct> {
  QueryBuilder<MaimaiVersion, MaimaiVersion, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }

  QueryBuilder<MaimaiVersion, MaimaiVersion, QDistinct> distinctByVersionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'versionId');
    });
  }
}

extension MaimaiVersionQueryProperty
    on QueryBuilder<MaimaiVersion, MaimaiVersion, QQueryProperty> {
  QueryBuilder<MaimaiVersion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MaimaiVersion, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<MaimaiVersion, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }

  QueryBuilder<MaimaiVersion, int, QQueryOperations> versionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'versionId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAliasCollection on Isar {
  IsarCollection<Alias> get alias => this.collection();
}

const AliasSchema = CollectionSchema(
  name: r'Alias',
  id: 2746193814116187017,
  properties: {
    r'aliases': PropertySchema(
      id: 0,
      name: r'aliases',
      type: IsarType.stringList,
    ),
    r'songId': PropertySchema(id: 1, name: r'songId', type: IsarType.long),
  },

  estimateSize: _aliasEstimateSize,
  serialize: _aliasSerialize,
  deserialize: _aliasDeserialize,
  deserializeProp: _aliasDeserializeProp,
  idName: r'id',
  indexes: {
    r'songId': IndexSchema(
      id: -4588889454650216128,
      name: r'songId',
      unique: true,
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

  getId: _aliasGetId,
  getLinks: _aliasGetLinks,
  attach: _aliasAttach,
  version: '3.3.0',
);

int _aliasEstimateSize(
  Alias object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.aliases.length * 3;
  {
    for (var i = 0; i < object.aliases.length; i++) {
      final value = object.aliases[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _aliasSerialize(
  Alias object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.aliases);
  writer.writeLong(offsets[1], object.songId);
}

Alias _aliasDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Alias(
    aliases: reader.readStringList(offsets[0]) ?? const [],
    id: id,
    songId: reader.readLongOrNull(offsets[1]) ?? 0,
  );
  return object;
}

P _aliasDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? const []) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _aliasGetId(Alias object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _aliasGetLinks(Alias object) {
  return [];
}

void _aliasAttach(IsarCollection<dynamic> col, Id id, Alias object) {
  object.id = id;
}

extension AliasByIndex on IsarCollection<Alias> {
  Future<Alias?> getBySongId(int songId) {
    return getByIndex(r'songId', [songId]);
  }

  Alias? getBySongIdSync(int songId) {
    return getByIndexSync(r'songId', [songId]);
  }

  Future<bool> deleteBySongId(int songId) {
    return deleteByIndex(r'songId', [songId]);
  }

  bool deleteBySongIdSync(int songId) {
    return deleteByIndexSync(r'songId', [songId]);
  }

  Future<List<Alias?>> getAllBySongId(List<int> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'songId', values);
  }

  List<Alias?> getAllBySongIdSync(List<int> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'songId', values);
  }

  Future<int> deleteAllBySongId(List<int> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'songId', values);
  }

  int deleteAllBySongIdSync(List<int> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'songId', values);
  }

  Future<Id> putBySongId(Alias object) {
    return putByIndex(r'songId', object);
  }

  Id putBySongIdSync(Alias object, {bool saveLinks = true}) {
    return putByIndexSync(r'songId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySongId(List<Alias> objects) {
    return putAllByIndex(r'songId', objects);
  }

  List<Id> putAllBySongIdSync(List<Alias> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'songId', objects, saveLinks: saveLinks);
  }
}

extension AliasQueryWhereSort on QueryBuilder<Alias, Alias, QWhere> {
  QueryBuilder<Alias, Alias, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Alias, Alias, QAfterWhere> anySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'songId'),
      );
    });
  }
}

extension AliasQueryWhere on QueryBuilder<Alias, Alias, QWhereClause> {
  QueryBuilder<Alias, Alias, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Alias, Alias, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Alias, Alias, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterWhereClause> idBetween(
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

  QueryBuilder<Alias, Alias, QAfterWhereClause> songIdEqualTo(int songId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'songId', value: [songId]),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterWhereClause> songIdNotEqualTo(int songId) {
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

  QueryBuilder<Alias, Alias, QAfterWhereClause> songIdGreaterThan(
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

  QueryBuilder<Alias, Alias, QAfterWhereClause> songIdLessThan(
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

  QueryBuilder<Alias, Alias, QAfterWhereClause> songIdBetween(
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

extension AliasQueryFilter on QueryBuilder<Alias, Alias, QFilterCondition> {
  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'aliases',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'aliases',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'aliases',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'aliases',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'aliases',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'aliases',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesElementContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'aliases',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesElementMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'aliases',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'aliases', value: ''),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'aliases', value: ''),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesLengthEqualTo(
    int length,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'aliases', length, true, length, true);
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'aliases', 0, true, 0, true);
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'aliases', 0, false, 999999, true);
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'aliases', 0, true, length, include);
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'aliases', length, include, 999999, true);
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> aliasesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'aliases',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Alias, Alias, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Alias, Alias, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Alias, Alias, QAfterFilterCondition> songIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songId', value: value),
      );
    });
  }

  QueryBuilder<Alias, Alias, QAfterFilterCondition> songIdGreaterThan(
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

  QueryBuilder<Alias, Alias, QAfterFilterCondition> songIdLessThan(
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

  QueryBuilder<Alias, Alias, QAfterFilterCondition> songIdBetween(
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
}

extension AliasQueryObject on QueryBuilder<Alias, Alias, QFilterCondition> {}

extension AliasQueryLinks on QueryBuilder<Alias, Alias, QFilterCondition> {}

extension AliasQuerySortBy on QueryBuilder<Alias, Alias, QSortBy> {
  QueryBuilder<Alias, Alias, QAfterSortBy> sortBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<Alias, Alias, QAfterSortBy> sortBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }
}

extension AliasQuerySortThenBy on QueryBuilder<Alias, Alias, QSortThenBy> {
  QueryBuilder<Alias, Alias, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Alias, Alias, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Alias, Alias, QAfterSortBy> thenBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<Alias, Alias, QAfterSortBy> thenBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }
}

extension AliasQueryWhereDistinct on QueryBuilder<Alias, Alias, QDistinct> {
  QueryBuilder<Alias, Alias, QDistinct> distinctByAliases() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aliases');
    });
  }

  QueryBuilder<Alias, Alias, QDistinct> distinctBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songId');
    });
  }
}

extension AliasQueryProperty on QueryBuilder<Alias, Alias, QQueryProperty> {
  QueryBuilder<Alias, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Alias, List<String>, QQueryOperations> aliasesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aliases');
    });
  }

  QueryBuilder<Alias, int, QQueryOperations> songIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MaimaiSongDifficultySchema = Schema(
  name: r'MaimaiSongDifficulty',
  id: 3299015587723775187,
  properties: {
    r'difficulty': PropertySchema(
      id: 0,
      name: r'difficulty',
      type: IsarType.string,
      enumMap: _MaimaiSongDifficultydifficultyEnumValueMap,
    ),
    r'level': PropertySchema(id: 1, name: r'level', type: IsarType.string),
    r'levelValue': PropertySchema(
      id: 2,
      name: r'levelValue',
      type: IsarType.double,
    ),
    r'noteDesigner': PropertySchema(
      id: 3,
      name: r'noteDesigner',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 4,
      name: r'notes',
      type: IsarType.object,

      target: r'MaimaiNotes',
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.string,
      enumMap: _MaimaiSongDifficultytypeEnumValueMap,
    ),
    r'version': PropertySchema(id: 6, name: r'version', type: IsarType.long),
  },

  estimateSize: _maimaiSongDifficultyEstimateSize,
  serialize: _maimaiSongDifficultySerialize,
  deserialize: _maimaiSongDifficultyDeserialize,
  deserializeProp: _maimaiSongDifficultyDeserializeProp,
);

int _maimaiSongDifficultyEstimateSize(
  MaimaiSongDifficulty object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.difficulty.name.length * 3;
  bytesCount += 3 + object.level.length * 3;
  bytesCount += 3 + object.noteDesigner.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount +=
          3 +
          MaimaiNotesSchema.estimateSize(
            value,
            allOffsets[MaimaiNotes]!,
            allOffsets,
          );
    }
  }
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _maimaiSongDifficultySerialize(
  MaimaiSongDifficulty object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.difficulty.name);
  writer.writeString(offsets[1], object.level);
  writer.writeDouble(offsets[2], object.levelValue);
  writer.writeString(offsets[3], object.noteDesigner);
  writer.writeObject<MaimaiNotes>(
    offsets[4],
    allOffsets,
    MaimaiNotesSchema.serialize,
    object.notes,
  );
  writer.writeString(offsets[5], object.type.name);
  writer.writeLong(offsets[6], object.version);
}

MaimaiSongDifficulty _maimaiSongDifficultyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiSongDifficulty(
    difficulty:
        _MaimaiSongDifficultydifficultyValueEnumMap[reader.readStringOrNull(
          offsets[0],
        )] ??
        LevelIndex.basic,
    level: reader.readStringOrNull(offsets[1]) ?? '',
    levelValue: reader.readDoubleOrNull(offsets[2]) ?? 0.0,
    noteDesigner: reader.readStringOrNull(offsets[3]) ?? '',
    notes: reader.readObjectOrNull<MaimaiNotes>(
      offsets[4],
      MaimaiNotesSchema.deserialize,
      allOffsets,
    ),
    type:
        _MaimaiSongDifficultytypeValueEnumMap[reader.readStringOrNull(
          offsets[5],
        )] ??
        SongType.standard,
    version: reader.readLongOrNull(offsets[6]) ?? 0,
  );
  return object;
}

P _maimaiSongDifficultyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_MaimaiSongDifficultydifficultyValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              LevelIndex.basic)
          as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 2:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 4:
      return (reader.readObjectOrNull<MaimaiNotes>(
            offset,
            MaimaiNotesSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 5:
      return (_MaimaiSongDifficultytypeValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SongType.standard)
          as P;
    case 6:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MaimaiSongDifficultydifficultyEnumValueMap = {
  r'basic': r'basic',
  r'advanced': r'advanced',
  r'expert': r'expert',
  r'master': r'master',
  r'reMaster': r'reMaster',
};
const _MaimaiSongDifficultydifficultyValueEnumMap = {
  r'basic': LevelIndex.basic,
  r'advanced': LevelIndex.advanced,
  r'expert': LevelIndex.expert,
  r'master': LevelIndex.master,
  r'reMaster': LevelIndex.reMaster,
};
const _MaimaiSongDifficultytypeEnumValueMap = {
  r'standard': r'standard',
  r'dx': r'dx',
  r'utage': r'utage',
};
const _MaimaiSongDifficultytypeValueEnumMap = {
  r'standard': SongType.standard,
  r'dx': SongType.dx,
  r'utage': SongType.utage,
};

extension MaimaiSongDifficultyQueryFilter
    on
        QueryBuilder<
          MaimaiSongDifficulty,
          MaimaiSongDifficulty,
          QFilterCondition
        > {
  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  difficultyEqualTo(LevelIndex value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  difficultyGreaterThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  difficultyLessThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  difficultyBetween(
    LevelIndex lower,
    LevelIndex upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'difficulty',
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
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  difficultyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  difficultyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  difficultyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  difficultyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'difficulty',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  difficultyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  difficultyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  levelValueEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'levelValue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  levelValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'levelValue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  levelValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'levelValue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  levelValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'levelValue',
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
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  noteDesignerEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  noteDesignerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  noteDesignerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  noteDesignerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'noteDesigner',
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
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  noteDesignerStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  noteDesignerEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  noteDesignerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  noteDesignerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'noteDesigner',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  noteDesignerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'noteDesigner', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  noteDesignerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'noteDesigner', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'version', value: value),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  versionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'version',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  versionLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'version',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'version',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MaimaiSongDifficultyQueryObject
    on
        QueryBuilder<
          MaimaiSongDifficulty,
          MaimaiSongDifficulty,
          QFilterCondition
        > {
  QueryBuilder<
    MaimaiSongDifficulty,
    MaimaiSongDifficulty,
    QAfterFilterCondition
  >
  notes(FilterQuery<MaimaiNotes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'notes');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MaimaiSongDifficultyUtageSchema = Schema(
  name: r'MaimaiSongDifficultyUtage',
  id: -4934388686217541995,
  properties: {
    r'buddyNotes': PropertySchema(
      id: 0,
      name: r'buddyNotes',
      type: IsarType.object,

      target: r'MaimaiBuddyNotes',
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'difficulty': PropertySchema(
      id: 2,
      name: r'difficulty',
      type: IsarType.string,
      enumMap: _MaimaiSongDifficultyUtagedifficultyEnumValueMap,
    ),
    r'isBuddy': PropertySchema(id: 3, name: r'isBuddy', type: IsarType.bool),
    r'kanji': PropertySchema(id: 4, name: r'kanji', type: IsarType.string),
    r'level': PropertySchema(id: 5, name: r'level', type: IsarType.string),
    r'levelValue': PropertySchema(
      id: 6,
      name: r'levelValue',
      type: IsarType.double,
    ),
    r'noteDesigner': PropertySchema(
      id: 7,
      name: r'noteDesigner',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 8,
      name: r'notes',
      type: IsarType.object,

      target: r'MaimaiNotes',
    ),
    r'type': PropertySchema(
      id: 9,
      name: r'type',
      type: IsarType.string,
      enumMap: _MaimaiSongDifficultyUtagetypeEnumValueMap,
    ),
    r'version': PropertySchema(id: 10, name: r'version', type: IsarType.long),
  },

  estimateSize: _maimaiSongDifficultyUtageEstimateSize,
  serialize: _maimaiSongDifficultyUtageSerialize,
  deserialize: _maimaiSongDifficultyUtageDeserialize,
  deserializeProp: _maimaiSongDifficultyUtageDeserializeProp,
);

int _maimaiSongDifficultyUtageEstimateSize(
  MaimaiSongDifficultyUtage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.buddyNotes;
    if (value != null) {
      bytesCount +=
          3 +
          MaimaiBuddyNotesSchema.estimateSize(
            value,
            allOffsets[MaimaiBuddyNotes]!,
            allOffsets,
          );
    }
  }
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.difficulty.name.length * 3;
  bytesCount += 3 + object.kanji.length * 3;
  bytesCount += 3 + object.level.length * 3;
  bytesCount += 3 + object.noteDesigner.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount +=
          3 +
          MaimaiNotesSchema.estimateSize(
            value,
            allOffsets[MaimaiNotes]!,
            allOffsets,
          );
    }
  }
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _maimaiSongDifficultyUtageSerialize(
  MaimaiSongDifficultyUtage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<MaimaiBuddyNotes>(
    offsets[0],
    allOffsets,
    MaimaiBuddyNotesSchema.serialize,
    object.buddyNotes,
  );
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.difficulty.name);
  writer.writeBool(offsets[3], object.isBuddy);
  writer.writeString(offsets[4], object.kanji);
  writer.writeString(offsets[5], object.level);
  writer.writeDouble(offsets[6], object.levelValue);
  writer.writeString(offsets[7], object.noteDesigner);
  writer.writeObject<MaimaiNotes>(
    offsets[8],
    allOffsets,
    MaimaiNotesSchema.serialize,
    object.notes,
  );
  writer.writeString(offsets[9], object.type.name);
  writer.writeLong(offsets[10], object.version);
}

MaimaiSongDifficultyUtage _maimaiSongDifficultyUtageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiSongDifficultyUtage(
    buddyNotes: reader.readObjectOrNull<MaimaiBuddyNotes>(
      offsets[0],
      MaimaiBuddyNotesSchema.deserialize,
      allOffsets,
    ),
    description: reader.readStringOrNull(offsets[1]) ?? '',
    difficulty:
        _MaimaiSongDifficultyUtagedifficultyValueEnumMap[reader
            .readStringOrNull(offsets[2])] ??
        LevelIndex.basic,
    isBuddy: reader.readBoolOrNull(offsets[3]) ?? false,
    kanji: reader.readStringOrNull(offsets[4]) ?? '',
    level: reader.readStringOrNull(offsets[5]) ?? '',
    levelValue: reader.readDoubleOrNull(offsets[6]) ?? 0.0,
    noteDesigner: reader.readStringOrNull(offsets[7]) ?? '',
    notes: reader.readObjectOrNull<MaimaiNotes>(
      offsets[8],
      MaimaiNotesSchema.deserialize,
      allOffsets,
    ),
    type:
        _MaimaiSongDifficultyUtagetypeValueEnumMap[reader.readStringOrNull(
          offsets[9],
        )] ??
        SongType.standard,
    version: reader.readLongOrNull(offsets[10]) ?? 0,
  );
  return object;
}

P _maimaiSongDifficultyUtageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<MaimaiBuddyNotes>(
            offset,
            MaimaiBuddyNotesSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 2:
      return (_MaimaiSongDifficultyUtagedifficultyValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              LevelIndex.basic)
          as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 5:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 6:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 8:
      return (reader.readObjectOrNull<MaimaiNotes>(
            offset,
            MaimaiNotesSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 9:
      return (_MaimaiSongDifficultyUtagetypeValueEnumMap[reader
                  .readStringOrNull(offset)] ??
              SongType.standard)
          as P;
    case 10:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MaimaiSongDifficultyUtagedifficultyEnumValueMap = {
  r'basic': r'basic',
  r'advanced': r'advanced',
  r'expert': r'expert',
  r'master': r'master',
  r'reMaster': r'reMaster',
};
const _MaimaiSongDifficultyUtagedifficultyValueEnumMap = {
  r'basic': LevelIndex.basic,
  r'advanced': LevelIndex.advanced,
  r'expert': LevelIndex.expert,
  r'master': LevelIndex.master,
  r'reMaster': LevelIndex.reMaster,
};
const _MaimaiSongDifficultyUtagetypeEnumValueMap = {
  r'standard': r'standard',
  r'dx': r'dx',
  r'utage': r'utage',
};
const _MaimaiSongDifficultyUtagetypeValueEnumMap = {
  r'standard': SongType.standard,
  r'dx': SongType.dx,
  r'utage': SongType.utage,
};

extension MaimaiSongDifficultyUtageQueryFilter
    on
        QueryBuilder<
          MaimaiSongDifficultyUtage,
          MaimaiSongDifficultyUtage,
          QFilterCondition
        > {
  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  buddyNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'buddyNotes'),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  buddyNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'buddyNotes'),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  descriptionEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
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
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  difficultyEqualTo(LevelIndex value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  difficultyGreaterThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  difficultyLessThan(
    LevelIndex value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  difficultyBetween(
    LevelIndex lower,
    LevelIndex upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'difficulty',
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
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  difficultyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  difficultyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  difficultyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'difficulty',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  difficultyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'difficulty',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  difficultyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  difficultyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  isBuddyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isBuddy', value: value),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  kanjiEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  kanjiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  kanjiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  kanjiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'kanji',
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
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  kanjiStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  kanjiEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  kanjiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'kanji',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  kanjiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'kanji',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  kanjiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'kanji', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  kanjiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'kanji', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  levelValueEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'levelValue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  levelValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'levelValue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  levelValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'levelValue',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  levelValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'levelValue',
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
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  noteDesignerEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  noteDesignerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  noteDesignerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  noteDesignerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'noteDesigner',
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
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  noteDesignerStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  noteDesignerEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  noteDesignerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'noteDesigner',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  noteDesignerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'noteDesigner',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  noteDesignerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'noteDesigner', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  noteDesignerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'noteDesigner', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'version', value: value),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  versionGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'version',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  versionLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'version',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'version',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MaimaiSongDifficultyUtageQueryObject
    on
        QueryBuilder<
          MaimaiSongDifficultyUtage,
          MaimaiSongDifficultyUtage,
          QFilterCondition
        > {
  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  buddyNotes(FilterQuery<MaimaiBuddyNotes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'buddyNotes');
    });
  }

  QueryBuilder<
    MaimaiSongDifficultyUtage,
    MaimaiSongDifficultyUtage,
    QAfterFilterCondition
  >
  notes(FilterQuery<MaimaiNotes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'notes');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MaimaiSongDifficultiesSchema = Schema(
  name: r'MaimaiSongDifficulties',
  id: -4566106252888485666,
  properties: {
    r'dx': PropertySchema(
      id: 0,
      name: r'dx',
      type: IsarType.objectList,

      target: r'MaimaiSongDifficulty',
    ),
    r'standard': PropertySchema(
      id: 1,
      name: r'standard',
      type: IsarType.objectList,

      target: r'MaimaiSongDifficulty',
    ),
    r'utage': PropertySchema(
      id: 2,
      name: r'utage',
      type: IsarType.objectList,

      target: r'MaimaiSongDifficultyUtage',
    ),
  },

  estimateSize: _maimaiSongDifficultiesEstimateSize,
  serialize: _maimaiSongDifficultiesSerialize,
  deserialize: _maimaiSongDifficultiesDeserialize,
  deserializeProp: _maimaiSongDifficultiesDeserializeProp,
);

int _maimaiSongDifficultiesEstimateSize(
  MaimaiSongDifficulties object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dx.length * 3;
  {
    final offsets = allOffsets[MaimaiSongDifficulty]!;
    for (var i = 0; i < object.dx.length; i++) {
      final value = object.dx[i];
      bytesCount += MaimaiSongDifficultySchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.standard.length * 3;
  {
    final offsets = allOffsets[MaimaiSongDifficulty]!;
    for (var i = 0; i < object.standard.length; i++) {
      final value = object.standard[i];
      bytesCount += MaimaiSongDifficultySchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.utage.length * 3;
  {
    final offsets = allOffsets[MaimaiSongDifficultyUtage]!;
    for (var i = 0; i < object.utage.length; i++) {
      final value = object.utage[i];
      bytesCount += MaimaiSongDifficultyUtageSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  return bytesCount;
}

void _maimaiSongDifficultiesSerialize(
  MaimaiSongDifficulties object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<MaimaiSongDifficulty>(
    offsets[0],
    allOffsets,
    MaimaiSongDifficultySchema.serialize,
    object.dx,
  );
  writer.writeObjectList<MaimaiSongDifficulty>(
    offsets[1],
    allOffsets,
    MaimaiSongDifficultySchema.serialize,
    object.standard,
  );
  writer.writeObjectList<MaimaiSongDifficultyUtage>(
    offsets[2],
    allOffsets,
    MaimaiSongDifficultyUtageSchema.serialize,
    object.utage,
  );
}

MaimaiSongDifficulties _maimaiSongDifficultiesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiSongDifficulties(
    dx:
        reader.readObjectList<MaimaiSongDifficulty>(
          offsets[0],
          MaimaiSongDifficultySchema.deserialize,
          allOffsets,
          MaimaiSongDifficulty(),
        ) ??
        const [],
    standard:
        reader.readObjectList<MaimaiSongDifficulty>(
          offsets[1],
          MaimaiSongDifficultySchema.deserialize,
          allOffsets,
          MaimaiSongDifficulty(),
        ) ??
        const [],
    utage:
        reader.readObjectList<MaimaiSongDifficultyUtage>(
          offsets[2],
          MaimaiSongDifficultyUtageSchema.deserialize,
          allOffsets,
          MaimaiSongDifficultyUtage(),
        ) ??
        const [],
  );
  return object;
}

P _maimaiSongDifficultiesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<MaimaiSongDifficulty>(
                offset,
                MaimaiSongDifficultySchema.deserialize,
                allOffsets,
                MaimaiSongDifficulty(),
              ) ??
              const [])
          as P;
    case 1:
      return (reader.readObjectList<MaimaiSongDifficulty>(
                offset,
                MaimaiSongDifficultySchema.deserialize,
                allOffsets,
                MaimaiSongDifficulty(),
              ) ??
              const [])
          as P;
    case 2:
      return (reader.readObjectList<MaimaiSongDifficultyUtage>(
                offset,
                MaimaiSongDifficultyUtageSchema.deserialize,
                allOffsets,
                MaimaiSongDifficultyUtage(),
              ) ??
              const [])
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MaimaiSongDifficultiesQueryFilter
    on
        QueryBuilder<
          MaimaiSongDifficulties,
          MaimaiSongDifficulties,
          QFilterCondition
        > {
  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  dxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dx', length, true, length, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  dxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dx', 0, true, 0, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  dxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dx', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  dxLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dx', 0, true, length, include);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  dxLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dx', length, include, 999999, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  dxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dx', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  standardLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'standard', length, true, length, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  standardIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'standard', 0, true, 0, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  standardIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'standard', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  standardLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'standard', 0, true, length, include);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  standardLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'standard', length, include, 999999, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  standardLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'standard',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  utageLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'utage', length, true, length, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  utageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'utage', 0, true, 0, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  utageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'utage', 0, false, 999999, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  utageLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'utage', 0, true, length, include);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  utageLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'utage', length, include, 999999, true);
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  utageLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'utage',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension MaimaiSongDifficultiesQueryObject
    on
        QueryBuilder<
          MaimaiSongDifficulties,
          MaimaiSongDifficulties,
          QFilterCondition
        > {
  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  dxElement(FilterQuery<MaimaiSongDifficulty> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dx');
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  standardElement(FilterQuery<MaimaiSongDifficulty> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'standard');
    });
  }

  QueryBuilder<
    MaimaiSongDifficulties,
    MaimaiSongDifficulties,
    QAfterFilterCondition
  >
  utageElement(FilterQuery<MaimaiSongDifficultyUtage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'utage');
    });
  }
}

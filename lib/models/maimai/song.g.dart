// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSongCollection on Isar {
  IsarCollection<Song> get songs => this.collection();
}

const SongSchema = CollectionSchema(
  name: r'Song',
  id: -5548886644249537934,
  properties: {
    r'artist': PropertySchema(id: 0, name: r'artist', type: IsarType.string),
    r'bpm': PropertySchema(id: 1, name: r'bpm', type: IsarType.long),
    r'difficulties': PropertySchema(
      id: 2,
      name: r'difficulties',
      type: IsarType.object,

      target: r'SongDifficulties',
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

  estimateSize: _songEstimateSize,
  serialize: _songSerialize,
  deserialize: _songDeserialize,
  deserializeProp: _songDeserializeProp,
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
    r'SongDifficulties': SongDifficultiesSchema,
    r'SongDifficulty': SongDifficultySchema,
    r'Notes': NotesSchema,
    r'SongDifficultyUtage': SongDifficultyUtageSchema,
    r'BuddyNotes': BuddyNotesSchema,
  },

  getId: _songGetId,
  getLinks: _songGetLinks,
  attach: _songAttach,
  version: '3.3.0',
);

int _songEstimateSize(
  Song object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.artist.length * 3;
  bytesCount +=
      3 +
      SongDifficultiesSchema.estimateSize(
        object.difficulties,
        allOffsets[SongDifficulties]!,
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

void _songSerialize(
  Song object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.artist);
  writer.writeLong(offsets[1], object.bpm);
  writer.writeObject<SongDifficulties>(
    offsets[2],
    allOffsets,
    SongDifficultiesSchema.serialize,
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

Song _songDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Song(
    artist: reader.readStringOrNull(offsets[0]) ?? '',
    bpm: reader.readLongOrNull(offsets[1]) ?? 0,
    difficulties:
        reader.readObjectOrNull<SongDifficulties>(
          offsets[2],
          SongDifficultiesSchema.deserialize,
          allOffsets,
        ) ??
        const SongDifficulties(),
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

P _songDeserializeProp<P>(
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
      return (reader.readObjectOrNull<SongDifficulties>(
                offset,
                SongDifficultiesSchema.deserialize,
                allOffsets,
              ) ??
              const SongDifficulties())
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

Id _songGetId(Song object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _songGetLinks(Song object) {
  return [];
}

void _songAttach(IsarCollection<dynamic> col, Id id, Song object) {
  object.id = id;
}

extension SongByIndex on IsarCollection<Song> {
  Future<Song?> getBySongId(int songId) {
    return getByIndex(r'songId', [songId]);
  }

  Song? getBySongIdSync(int songId) {
    return getByIndexSync(r'songId', [songId]);
  }

  Future<bool> deleteBySongId(int songId) {
    return deleteByIndex(r'songId', [songId]);
  }

  bool deleteBySongIdSync(int songId) {
    return deleteByIndexSync(r'songId', [songId]);
  }

  Future<List<Song?>> getAllBySongId(List<int> songIdValues) {
    final values = songIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'songId', values);
  }

  List<Song?> getAllBySongIdSync(List<int> songIdValues) {
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

  Future<Id> putBySongId(Song object) {
    return putByIndex(r'songId', object);
  }

  Id putBySongIdSync(Song object, {bool saveLinks = true}) {
    return putByIndexSync(r'songId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySongId(List<Song> objects) {
    return putAllByIndex(r'songId', objects);
  }

  List<Id> putAllBySongIdSync(List<Song> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'songId', objects, saveLinks: saveLinks);
  }
}

extension SongQueryWhereSort on QueryBuilder<Song, Song, QWhere> {
  QueryBuilder<Song, Song, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Song, Song, QAfterWhere> anySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'songId'),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterWhere> anyTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'title'),
      );
    });
  }
}

extension SongQueryWhere on QueryBuilder<Song, Song, QWhereClause> {
  QueryBuilder<Song, Song, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Song, Song, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Song, Song, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterWhereClause> idBetween(
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

  QueryBuilder<Song, Song, QAfterWhereClause> songIdEqualTo(int songId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'songId', value: [songId]),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterWhereClause> songIdNotEqualTo(int songId) {
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

  QueryBuilder<Song, Song, QAfterWhereClause> songIdGreaterThan(
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

  QueryBuilder<Song, Song, QAfterWhereClause> songIdLessThan(
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

  QueryBuilder<Song, Song, QAfterWhereClause> songIdBetween(
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

  QueryBuilder<Song, Song, QAfterWhereClause> titleEqualTo(String title) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: [title]),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterWhereClause> titleNotEqualTo(String title) {
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

  QueryBuilder<Song, Song, QAfterWhereClause> titleGreaterThan(
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

  QueryBuilder<Song, Song, QAfterWhereClause> titleLessThan(
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

  QueryBuilder<Song, Song, QAfterWhereClause> titleBetween(
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

  QueryBuilder<Song, Song, QAfterWhereClause> titleStartsWith(
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

  QueryBuilder<Song, Song, QAfterWhereClause> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'title', value: ['']),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterWhereClause> titleIsNotEmpty() {
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

extension SongQueryFilter on QueryBuilder<Song, Song, QFilterCondition> {
  QueryBuilder<Song, Song, QAfterFilterCondition> artistEqualTo(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> artistGreaterThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> artistLessThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> artistBetween(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> artistStartsWith(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> artistEndsWith(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> artistContains(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> artistMatches(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> artistIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'artist', value: ''),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> artistIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'artist', value: ''),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> bpmEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'bpm', value: value),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> bpmGreaterThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> bpmLessThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> bpmBetween(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> disabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'disabled', value: value),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> genreEqualTo(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> genreGreaterThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> genreLessThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> genreBetween(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> genreStartsWith(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> genreEndsWith(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> genreContains(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> genreMatches(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> genreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> genreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> lockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'locked', value: value),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> mapIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'map'),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> mapIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'map'),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> mapEqualTo(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> mapGreaterThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> mapLessThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> mapBetween(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> mapStartsWith(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> mapEndsWith(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> mapContains(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> mapMatches(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> mapIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'map', value: ''),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> mapIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'map', value: ''),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'rights'),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'rights'),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsEqualTo(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsGreaterThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsLessThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsBetween(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsStartsWith(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsEndsWith(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsContains(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsMatches(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rights', value: ''),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> rightsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'rights', value: ''),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> songIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'songId', value: value),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> songIdGreaterThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> songIdLessThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> songIdBetween(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> titleContains(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'version', value: value),
      );
    });
  }

  QueryBuilder<Song, Song, QAfterFilterCondition> versionGreaterThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Song, Song, QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<Song, Song, QAfterFilterCondition> versionBetween(
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

extension SongQueryObject on QueryBuilder<Song, Song, QFilterCondition> {
  QueryBuilder<Song, Song, QAfterFilterCondition> difficulties(
    FilterQuery<SongDifficulties> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'difficulties');
    });
  }
}

extension SongQueryLinks on QueryBuilder<Song, Song, QFilterCondition> {}

extension SongQuerySortBy on QueryBuilder<Song, Song, QSortBy> {
  QueryBuilder<Song, Song, QAfterSortBy> sortByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByBpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByDisabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabled', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByDisabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabled', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByMap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'map', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByMapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'map', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByRights() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rights', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByRightsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rights', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension SongQuerySortThenBy on QueryBuilder<Song, Song, QSortThenBy> {
  QueryBuilder<Song, Song, QAfterSortBy> thenByArtist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByArtistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'artist', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByBpmDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bpm', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByDisabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabled', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByDisabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'disabled', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByLockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locked', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByMap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'map', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByMapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'map', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByRights() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rights', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByRightsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rights', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenBySongIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'songId', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<Song, Song, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension SongQueryWhereDistinct on QueryBuilder<Song, Song, QDistinct> {
  QueryBuilder<Song, Song, QDistinct> distinctByArtist({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'artist', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Song, Song, QDistinct> distinctByBpm() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bpm');
    });
  }

  QueryBuilder<Song, Song, QDistinct> distinctByDisabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'disabled');
    });
  }

  QueryBuilder<Song, Song, QDistinct> distinctByGenre({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Song, Song, QDistinct> distinctByLocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locked');
    });
  }

  QueryBuilder<Song, Song, QDistinct> distinctByMap({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'map', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Song, Song, QDistinct> distinctByRights({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rights', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Song, Song, QDistinct> distinctBySongId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'songId');
    });
  }

  QueryBuilder<Song, Song, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Song, Song, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension SongQueryProperty on QueryBuilder<Song, Song, QQueryProperty> {
  QueryBuilder<Song, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Song, String, QQueryOperations> artistProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'artist');
    });
  }

  QueryBuilder<Song, int, QQueryOperations> bpmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bpm');
    });
  }

  QueryBuilder<Song, SongDifficulties, QQueryOperations>
  difficultiesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'difficulties');
    });
  }

  QueryBuilder<Song, bool, QQueryOperations> disabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'disabled');
    });
  }

  QueryBuilder<Song, String, QQueryOperations> genreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genre');
    });
  }

  QueryBuilder<Song, bool, QQueryOperations> lockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locked');
    });
  }

  QueryBuilder<Song, String?, QQueryOperations> mapProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'map');
    });
  }

  QueryBuilder<Song, String?, QQueryOperations> rightsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rights');
    });
  }

  QueryBuilder<Song, int, QQueryOperations> songIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'songId');
    });
  }

  QueryBuilder<Song, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Song, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGenreCollection on Isar {
  IsarCollection<Genre> get genres => this.collection();
}

const GenreSchema = CollectionSchema(
  name: r'Genre',
  id: -453881181692258612,
  properties: {
    r'genre': PropertySchema(id: 0, name: r'genre', type: IsarType.string),
    r'genreId': PropertySchema(id: 1, name: r'genreId', type: IsarType.long),
    r'title': PropertySchema(id: 2, name: r'title', type: IsarType.string),
  },

  estimateSize: _genreEstimateSize,
  serialize: _genreSerialize,
  deserialize: _genreDeserialize,
  deserializeProp: _genreDeserializeProp,
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

  getId: _genreGetId,
  getLinks: _genreGetLinks,
  attach: _genreAttach,
  version: '3.3.0',
);

int _genreEstimateSize(
  Genre object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.genre.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _genreSerialize(
  Genre object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.genre);
  writer.writeLong(offsets[1], object.genreId);
  writer.writeString(offsets[2], object.title);
}

Genre _genreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Genre(
    genre: reader.readStringOrNull(offsets[0]) ?? '',
    genreId: reader.readLongOrNull(offsets[1]) ?? 0,
    id: id,
    title: reader.readStringOrNull(offsets[2]) ?? '',
  );
  return object;
}

P _genreDeserializeProp<P>(
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

Id _genreGetId(Genre object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _genreGetLinks(Genre object) {
  return [];
}

void _genreAttach(IsarCollection<dynamic> col, Id id, Genre object) {
  object.id = id;
}

extension GenreByIndex on IsarCollection<Genre> {
  Future<Genre?> getByGenreId(int genreId) {
    return getByIndex(r'genreId', [genreId]);
  }

  Genre? getByGenreIdSync(int genreId) {
    return getByIndexSync(r'genreId', [genreId]);
  }

  Future<bool> deleteByGenreId(int genreId) {
    return deleteByIndex(r'genreId', [genreId]);
  }

  bool deleteByGenreIdSync(int genreId) {
    return deleteByIndexSync(r'genreId', [genreId]);
  }

  Future<List<Genre?>> getAllByGenreId(List<int> genreIdValues) {
    final values = genreIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'genreId', values);
  }

  List<Genre?> getAllByGenreIdSync(List<int> genreIdValues) {
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

  Future<Id> putByGenreId(Genre object) {
    return putByIndex(r'genreId', object);
  }

  Id putByGenreIdSync(Genre object, {bool saveLinks = true}) {
    return putByIndexSync(r'genreId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByGenreId(List<Genre> objects) {
    return putAllByIndex(r'genreId', objects);
  }

  List<Id> putAllByGenreIdSync(List<Genre> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'genreId', objects, saveLinks: saveLinks);
  }
}

extension GenreQueryWhereSort on QueryBuilder<Genre, Genre, QWhere> {
  QueryBuilder<Genre, Genre, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Genre, Genre, QAfterWhere> anyGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'genreId'),
      );
    });
  }
}

extension GenreQueryWhere on QueryBuilder<Genre, Genre, QWhereClause> {
  QueryBuilder<Genre, Genre, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Genre, Genre, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Genre, Genre, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Genre, Genre, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Genre, Genre, QAfterWhereClause> idBetween(
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

  QueryBuilder<Genre, Genre, QAfterWhereClause> genreIdEqualTo(int genreId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'genreId', value: [genreId]),
      );
    });
  }

  QueryBuilder<Genre, Genre, QAfterWhereClause> genreIdNotEqualTo(int genreId) {
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

  QueryBuilder<Genre, Genre, QAfterWhereClause> genreIdGreaterThan(
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

  QueryBuilder<Genre, Genre, QAfterWhereClause> genreIdLessThan(
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

  QueryBuilder<Genre, Genre, QAfterWhereClause> genreIdBetween(
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

extension GenreQueryFilter on QueryBuilder<Genre, Genre, QFilterCondition> {
  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreEqualTo(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreGreaterThan(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreLessThan(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreBetween(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreStartsWith(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreEndsWith(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreContains(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreMatches(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'genre', value: ''),
      );
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'genreId', value: value),
      );
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreIdGreaterThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreIdLessThan(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> genreIdBetween(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> titleContains(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<Genre, Genre, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<Genre, Genre, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }
}

extension GenreQueryObject on QueryBuilder<Genre, Genre, QFilterCondition> {}

extension GenreQueryLinks on QueryBuilder<Genre, Genre, QFilterCondition> {}

extension GenreQuerySortBy on QueryBuilder<Genre, Genre, QSortBy> {
  QueryBuilder<Genre, Genre, QAfterSortBy> sortByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> sortByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> sortByGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.asc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> sortByGenreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.desc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension GenreQuerySortThenBy on QueryBuilder<Genre, Genre, QSortThenBy> {
  QueryBuilder<Genre, Genre, QAfterSortBy> thenByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> thenByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> thenByGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.asc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> thenByGenreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genreId', Sort.desc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Genre, Genre, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension GenreQueryWhereDistinct on QueryBuilder<Genre, Genre, QDistinct> {
  QueryBuilder<Genre, Genre, QDistinct> distinctByGenre({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Genre, Genre, QDistinct> distinctByGenreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genreId');
    });
  }

  QueryBuilder<Genre, Genre, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension GenreQueryProperty on QueryBuilder<Genre, Genre, QQueryProperty> {
  QueryBuilder<Genre, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Genre, String, QQueryOperations> genreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genre');
    });
  }

  QueryBuilder<Genre, int, QQueryOperations> genreIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genreId');
    });
  }

  QueryBuilder<Genre, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVersionCollection on Isar {
  IsarCollection<Version> get versions => this.collection();
}

const VersionSchema = CollectionSchema(
  name: r'Version',
  id: 1032601149805461396,
  properties: {
    r'title': PropertySchema(id: 0, name: r'title', type: IsarType.string),
    r'version': PropertySchema(id: 1, name: r'version', type: IsarType.long),
    r'versionId': PropertySchema(
      id: 2,
      name: r'versionId',
      type: IsarType.long,
    ),
  },

  estimateSize: _versionEstimateSize,
  serialize: _versionSerialize,
  deserialize: _versionDeserialize,
  deserializeProp: _versionDeserializeProp,
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

  getId: _versionGetId,
  getLinks: _versionGetLinks,
  attach: _versionAttach,
  version: '3.3.0',
);

int _versionEstimateSize(
  Version object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _versionSerialize(
  Version object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.title);
  writer.writeLong(offsets[1], object.version);
  writer.writeLong(offsets[2], object.versionId);
}

Version _versionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Version(
    id: id,
    title: reader.readStringOrNull(offsets[0]) ?? '',
    version: reader.readLongOrNull(offsets[1]) ?? 0,
    versionId: reader.readLongOrNull(offsets[2]) ?? 0,
  );
  return object;
}

P _versionDeserializeProp<P>(
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

Id _versionGetId(Version object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _versionGetLinks(Version object) {
  return [];
}

void _versionAttach(IsarCollection<dynamic> col, Id id, Version object) {
  object.id = id;
}

extension VersionByIndex on IsarCollection<Version> {
  Future<Version?> getByVersionId(int versionId) {
    return getByIndex(r'versionId', [versionId]);
  }

  Version? getByVersionIdSync(int versionId) {
    return getByIndexSync(r'versionId', [versionId]);
  }

  Future<bool> deleteByVersionId(int versionId) {
    return deleteByIndex(r'versionId', [versionId]);
  }

  bool deleteByVersionIdSync(int versionId) {
    return deleteByIndexSync(r'versionId', [versionId]);
  }

  Future<List<Version?>> getAllByVersionId(List<int> versionIdValues) {
    final values = versionIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'versionId', values);
  }

  List<Version?> getAllByVersionIdSync(List<int> versionIdValues) {
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

  Future<Id> putByVersionId(Version object) {
    return putByIndex(r'versionId', object);
  }

  Id putByVersionIdSync(Version object, {bool saveLinks = true}) {
    return putByIndexSync(r'versionId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByVersionId(List<Version> objects) {
    return putAllByIndex(r'versionId', objects);
  }

  List<Id> putAllByVersionIdSync(
    List<Version> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'versionId', objects, saveLinks: saveLinks);
  }
}

extension VersionQueryWhereSort on QueryBuilder<Version, Version, QWhere> {
  QueryBuilder<Version, Version, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Version, Version, QAfterWhere> anyVersionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'versionId'),
      );
    });
  }
}

extension VersionQueryWhere on QueryBuilder<Version, Version, QWhereClause> {
  QueryBuilder<Version, Version, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Version, Version, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Version, Version, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Version, Version, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Version, Version, QAfterWhereClause> idBetween(
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

  QueryBuilder<Version, Version, QAfterWhereClause> versionIdEqualTo(
    int versionId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'versionId', value: [versionId]),
      );
    });
  }

  QueryBuilder<Version, Version, QAfterWhereClause> versionIdNotEqualTo(
    int versionId,
  ) {
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

  QueryBuilder<Version, Version, QAfterWhereClause> versionIdGreaterThan(
    int versionId, {
    bool include = false,
  }) {
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

  QueryBuilder<Version, Version, QAfterWhereClause> versionIdLessThan(
    int versionId, {
    bool include = false,
  }) {
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

  QueryBuilder<Version, Version, QAfterWhereClause> versionIdBetween(
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

extension VersionQueryFilter
    on QueryBuilder<Version, Version, QFilterCondition> {
  QueryBuilder<Version, Version, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> titleEqualTo(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> titleGreaterThan(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> titleLessThan(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> titleBetween(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> titleContains(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> versionEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'version', value: value),
      );
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> versionGreaterThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Version, Version, QAfterFilterCondition> versionLessThan(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> versionBetween(
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

  QueryBuilder<Version, Version, QAfterFilterCondition> versionIdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'versionId', value: value),
      );
    });
  }

  QueryBuilder<Version, Version, QAfterFilterCondition> versionIdGreaterThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Version, Version, QAfterFilterCondition> versionIdLessThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Version, Version, QAfterFilterCondition> versionIdBetween(
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

extension VersionQueryObject
    on QueryBuilder<Version, Version, QFilterCondition> {}

extension VersionQueryLinks
    on QueryBuilder<Version, Version, QFilterCondition> {}

extension VersionQuerySortBy on QueryBuilder<Version, Version, QSortBy> {
  QueryBuilder<Version, Version, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> sortByVersionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionId', Sort.asc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> sortByVersionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionId', Sort.desc);
    });
  }
}

extension VersionQuerySortThenBy
    on QueryBuilder<Version, Version, QSortThenBy> {
  QueryBuilder<Version, Version, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> thenByVersionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionId', Sort.asc);
    });
  }

  QueryBuilder<Version, Version, QAfterSortBy> thenByVersionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'versionId', Sort.desc);
    });
  }
}

extension VersionQueryWhereDistinct
    on QueryBuilder<Version, Version, QDistinct> {
  QueryBuilder<Version, Version, QDistinct> distinctByTitle({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Version, Version, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }

  QueryBuilder<Version, Version, QDistinct> distinctByVersionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'versionId');
    });
  }
}

extension VersionQueryProperty
    on QueryBuilder<Version, Version, QQueryProperty> {
  QueryBuilder<Version, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Version, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<Version, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }

  QueryBuilder<Version, int, QQueryOperations> versionIdProperty() {
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

const SongDifficultySchema = Schema(
  name: r'SongDifficulty',
  id: -5260645172630021112,
  properties: {
    r'difficulty': PropertySchema(
      id: 0,
      name: r'difficulty',
      type: IsarType.string,
      enumMap: _SongDifficultydifficultyEnumValueMap,
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

      target: r'Notes',
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.string,
      enumMap: _SongDifficultytypeEnumValueMap,
    ),
    r'version': PropertySchema(id: 6, name: r'version', type: IsarType.long),
  },

  estimateSize: _songDifficultyEstimateSize,
  serialize: _songDifficultySerialize,
  deserialize: _songDifficultyDeserialize,
  deserializeProp: _songDifficultyDeserializeProp,
);

int _songDifficultyEstimateSize(
  SongDifficulty object,
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
          3 + NotesSchema.estimateSize(value, allOffsets[Notes]!, allOffsets);
    }
  }
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _songDifficultySerialize(
  SongDifficulty object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.difficulty.name);
  writer.writeString(offsets[1], object.level);
  writer.writeDouble(offsets[2], object.levelValue);
  writer.writeString(offsets[3], object.noteDesigner);
  writer.writeObject<Notes>(
    offsets[4],
    allOffsets,
    NotesSchema.serialize,
    object.notes,
  );
  writer.writeString(offsets[5], object.type.name);
  writer.writeLong(offsets[6], object.version);
}

SongDifficulty _songDifficultyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SongDifficulty(
    difficulty:
        _SongDifficultydifficultyValueEnumMap[reader.readStringOrNull(
          offsets[0],
        )] ??
        LevelIndex.basic,
    level: reader.readStringOrNull(offsets[1]) ?? '',
    levelValue: reader.readDoubleOrNull(offsets[2]) ?? 0.0,
    noteDesigner: reader.readStringOrNull(offsets[3]) ?? '',
    notes: reader.readObjectOrNull<Notes>(
      offsets[4],
      NotesSchema.deserialize,
      allOffsets,
    ),
    type:
        _SongDifficultytypeValueEnumMap[reader.readStringOrNull(offsets[5])] ??
        SongType.standard,
    version: reader.readLongOrNull(offsets[6]) ?? 0,
  );
  return object;
}

P _songDifficultyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_SongDifficultydifficultyValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              LevelIndex.basic)
          as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 2:
      return (reader.readDoubleOrNull(offset) ?? 0.0) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 4:
      return (reader.readObjectOrNull<Notes>(
            offset,
            NotesSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 5:
      return (_SongDifficultytypeValueEnumMap[reader.readStringOrNull(
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

const _SongDifficultydifficultyEnumValueMap = {
  r'basic': r'basic',
  r'advanced': r'advanced',
  r'expert': r'expert',
  r'master': r'master',
  r'reMaster': r'reMaster',
};
const _SongDifficultydifficultyValueEnumMap = {
  r'basic': LevelIndex.basic,
  r'advanced': LevelIndex.advanced,
  r'expert': LevelIndex.expert,
  r'master': LevelIndex.master,
  r'reMaster': LevelIndex.reMaster,
};
const _SongDifficultytypeEnumValueMap = {
  r'standard': r'standard',
  r'dx': r'dx',
  r'utage': r'utage',
};
const _SongDifficultytypeValueEnumMap = {
  r'standard': SongType.standard,
  r'dx': SongType.dx,
  r'utage': SongType.utage,
};

extension SongDifficultyQueryFilter
    on QueryBuilder<SongDifficulty, SongDifficulty, QFilterCondition> {
  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
  difficultyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
  difficultyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
  levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
  levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
  noteDesignerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'noteDesigner', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
  noteDesignerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'noteDesigner', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
  versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'version', value: value),
      );
    });
  }

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition>
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

extension SongDifficultyQueryObject
    on QueryBuilder<SongDifficulty, SongDifficulty, QFilterCondition> {
  QueryBuilder<SongDifficulty, SongDifficulty, QAfterFilterCondition> notes(
    FilterQuery<Notes> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'notes');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SongDifficultyUtageSchema = Schema(
  name: r'SongDifficultyUtage',
  id: 7945928931627616180,
  properties: {
    r'buddyNotes': PropertySchema(
      id: 0,
      name: r'buddyNotes',
      type: IsarType.object,

      target: r'BuddyNotes',
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
      enumMap: _SongDifficultyUtagedifficultyEnumValueMap,
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

      target: r'Notes',
    ),
    r'type': PropertySchema(
      id: 9,
      name: r'type',
      type: IsarType.string,
      enumMap: _SongDifficultyUtagetypeEnumValueMap,
    ),
    r'version': PropertySchema(id: 10, name: r'version', type: IsarType.long),
  },

  estimateSize: _songDifficultyUtageEstimateSize,
  serialize: _songDifficultyUtageSerialize,
  deserialize: _songDifficultyUtageDeserialize,
  deserializeProp: _songDifficultyUtageDeserializeProp,
);

int _songDifficultyUtageEstimateSize(
  SongDifficultyUtage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.buddyNotes;
    if (value != null) {
      bytesCount +=
          3 +
          BuddyNotesSchema.estimateSize(
            value,
            allOffsets[BuddyNotes]!,
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
          3 + NotesSchema.estimateSize(value, allOffsets[Notes]!, allOffsets);
    }
  }
  bytesCount += 3 + object.type.name.length * 3;
  return bytesCount;
}

void _songDifficultyUtageSerialize(
  SongDifficultyUtage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<BuddyNotes>(
    offsets[0],
    allOffsets,
    BuddyNotesSchema.serialize,
    object.buddyNotes,
  );
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.difficulty.name);
  writer.writeBool(offsets[3], object.isBuddy);
  writer.writeString(offsets[4], object.kanji);
  writer.writeString(offsets[5], object.level);
  writer.writeDouble(offsets[6], object.levelValue);
  writer.writeString(offsets[7], object.noteDesigner);
  writer.writeObject<Notes>(
    offsets[8],
    allOffsets,
    NotesSchema.serialize,
    object.notes,
  );
  writer.writeString(offsets[9], object.type.name);
  writer.writeLong(offsets[10], object.version);
}

SongDifficultyUtage _songDifficultyUtageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SongDifficultyUtage(
    buddyNotes: reader.readObjectOrNull<BuddyNotes>(
      offsets[0],
      BuddyNotesSchema.deserialize,
      allOffsets,
    ),
    description: reader.readStringOrNull(offsets[1]) ?? '',
    difficulty:
        _SongDifficultyUtagedifficultyValueEnumMap[reader.readStringOrNull(
          offsets[2],
        )] ??
        LevelIndex.basic,
    isBuddy: reader.readBoolOrNull(offsets[3]) ?? false,
    kanji: reader.readStringOrNull(offsets[4]) ?? '',
    level: reader.readStringOrNull(offsets[5]) ?? '',
    levelValue: reader.readDoubleOrNull(offsets[6]) ?? 0.0,
    noteDesigner: reader.readStringOrNull(offsets[7]) ?? '',
    notes: reader.readObjectOrNull<Notes>(
      offsets[8],
      NotesSchema.deserialize,
      allOffsets,
    ),
    type:
        _SongDifficultyUtagetypeValueEnumMap[reader.readStringOrNull(
          offsets[9],
        )] ??
        SongType.standard,
    version: reader.readLongOrNull(offsets[10]) ?? 0,
  );
  return object;
}

P _songDifficultyUtageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<BuddyNotes>(
            offset,
            BuddyNotesSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 1:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 2:
      return (_SongDifficultyUtagedifficultyValueEnumMap[reader
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
      return (reader.readObjectOrNull<Notes>(
            offset,
            NotesSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 9:
      return (_SongDifficultyUtagetypeValueEnumMap[reader.readStringOrNull(
                offset,
              )] ??
              SongType.standard)
          as P;
    case 10:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SongDifficultyUtagedifficultyEnumValueMap = {
  r'basic': r'basic',
  r'advanced': r'advanced',
  r'expert': r'expert',
  r'master': r'master',
  r'reMaster': r'reMaster',
};
const _SongDifficultyUtagedifficultyValueEnumMap = {
  r'basic': LevelIndex.basic,
  r'advanced': LevelIndex.advanced,
  r'expert': LevelIndex.expert,
  r'master': LevelIndex.master,
  r'reMaster': LevelIndex.reMaster,
};
const _SongDifficultyUtagetypeEnumValueMap = {
  r'standard': r'standard',
  r'dx': r'dx',
  r'utage': r'utage',
};
const _SongDifficultyUtagetypeValueEnumMap = {
  r'standard': SongType.standard,
  r'dx': SongType.dx,
  r'utage': SongType.utage,
};

extension SongDifficultyUtageQueryFilter
    on
        QueryBuilder<
          SongDifficultyUtage,
          SongDifficultyUtage,
          QFilterCondition
        > {
  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  buddyNotesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'buddyNotes'),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  buddyNotesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'buddyNotes'),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  difficultyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  difficultyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'difficulty', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  isBuddyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isBuddy', value: value),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  kanjiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'kanji', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  kanjiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'kanji', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'level', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  noteDesignerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'noteDesigner', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  noteDesignerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'noteDesigner', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'notes'),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'type', value: ''),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'version', value: value),
      );
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
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

extension SongDifficultyUtageQueryObject
    on
        QueryBuilder<
          SongDifficultyUtage,
          SongDifficultyUtage,
          QFilterCondition
        > {
  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  buddyNotes(FilterQuery<BuddyNotes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'buddyNotes');
    });
  }

  QueryBuilder<SongDifficultyUtage, SongDifficultyUtage, QAfterFilterCondition>
  notes(FilterQuery<Notes> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'notes');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SongDifficultiesSchema = Schema(
  name: r'SongDifficulties',
  id: 8216837729361955866,
  properties: {
    r'dx': PropertySchema(
      id: 0,
      name: r'dx',
      type: IsarType.objectList,

      target: r'SongDifficulty',
    ),
    r'standard': PropertySchema(
      id: 1,
      name: r'standard',
      type: IsarType.objectList,

      target: r'SongDifficulty',
    ),
    r'utage': PropertySchema(
      id: 2,
      name: r'utage',
      type: IsarType.objectList,

      target: r'SongDifficultyUtage',
    ),
  },

  estimateSize: _songDifficultiesEstimateSize,
  serialize: _songDifficultiesSerialize,
  deserialize: _songDifficultiesDeserialize,
  deserializeProp: _songDifficultiesDeserializeProp,
);

int _songDifficultiesEstimateSize(
  SongDifficulties object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dx.length * 3;
  {
    final offsets = allOffsets[SongDifficulty]!;
    for (var i = 0; i < object.dx.length; i++) {
      final value = object.dx[i];
      bytesCount += SongDifficultySchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.standard.length * 3;
  {
    final offsets = allOffsets[SongDifficulty]!;
    for (var i = 0; i < object.standard.length; i++) {
      final value = object.standard[i];
      bytesCount += SongDifficultySchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  bytesCount += 3 + object.utage.length * 3;
  {
    final offsets = allOffsets[SongDifficultyUtage]!;
    for (var i = 0; i < object.utage.length; i++) {
      final value = object.utage[i];
      bytesCount += SongDifficultyUtageSchema.estimateSize(
        value,
        offsets,
        allOffsets,
      );
    }
  }
  return bytesCount;
}

void _songDifficultiesSerialize(
  SongDifficulties object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<SongDifficulty>(
    offsets[0],
    allOffsets,
    SongDifficultySchema.serialize,
    object.dx,
  );
  writer.writeObjectList<SongDifficulty>(
    offsets[1],
    allOffsets,
    SongDifficultySchema.serialize,
    object.standard,
  );
  writer.writeObjectList<SongDifficultyUtage>(
    offsets[2],
    allOffsets,
    SongDifficultyUtageSchema.serialize,
    object.utage,
  );
}

SongDifficulties _songDifficultiesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SongDifficulties(
    dx:
        reader.readObjectList<SongDifficulty>(
          offsets[0],
          SongDifficultySchema.deserialize,
          allOffsets,
          SongDifficulty(),
        ) ??
        const [],
    standard:
        reader.readObjectList<SongDifficulty>(
          offsets[1],
          SongDifficultySchema.deserialize,
          allOffsets,
          SongDifficulty(),
        ) ??
        const [],
    utage:
        reader.readObjectList<SongDifficultyUtage>(
          offsets[2],
          SongDifficultyUtageSchema.deserialize,
          allOffsets,
          SongDifficultyUtage(),
        ) ??
        const [],
  );
  return object;
}

P _songDifficultiesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<SongDifficulty>(
                offset,
                SongDifficultySchema.deserialize,
                allOffsets,
                SongDifficulty(),
              ) ??
              const [])
          as P;
    case 1:
      return (reader.readObjectList<SongDifficulty>(
                offset,
                SongDifficultySchema.deserialize,
                allOffsets,
                SongDifficulty(),
              ) ??
              const [])
          as P;
    case 2:
      return (reader.readObjectList<SongDifficultyUtage>(
                offset,
                SongDifficultyUtageSchema.deserialize,
                allOffsets,
                SongDifficultyUtage(),
              ) ??
              const [])
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SongDifficultiesQueryFilter
    on QueryBuilder<SongDifficulties, SongDifficulties, QFilterCondition> {
  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  dxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dx', length, true, length, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  dxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dx', 0, true, 0, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  dxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dx', 0, false, 999999, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  dxLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dx', 0, true, length, include);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  dxLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'dx', length, include, 999999, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  standardLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'standard', length, true, length, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  standardIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'standard', 0, true, 0, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  standardIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'standard', 0, false, 999999, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  standardLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'standard', 0, true, length, include);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  standardLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'standard', length, include, 999999, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
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

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  utageLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'utage', length, true, length, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  utageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'utage', 0, true, 0, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  utageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'utage', 0, false, 999999, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  utageLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'utage', 0, true, length, include);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  utageLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'utage', length, include, 999999, true);
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
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

extension SongDifficultiesQueryObject
    on QueryBuilder<SongDifficulties, SongDifficulties, QFilterCondition> {
  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  dxElement(FilterQuery<SongDifficulty> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'dx');
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  standardElement(FilterQuery<SongDifficulty> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'standard');
    });
  }

  QueryBuilder<SongDifficulties, SongDifficulties, QAfterFilterCondition>
  utageElement(FilterQuery<SongDifficultyUtage> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'utage');
    });
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRatingTrendCollection on Isar {
  IsarCollection<RatingTrend> get ratingTrends => this.collection();
}

const RatingTrendSchema = CollectionSchema(
  name: r'RatingTrend',
  id: -8602028324489741633,
  properties: {
    r'date': PropertySchema(id: 0, name: r'date', type: IsarType.string),
    r'dx': PropertySchema(id: 1, name: r'dx', type: IsarType.long),
    r'standard': PropertySchema(id: 2, name: r'standard', type: IsarType.long),
    r'total': PropertySchema(id: 3, name: r'total', type: IsarType.long),
  },

  estimateSize: _ratingTrendEstimateSize,
  serialize: _ratingTrendSerialize,
  deserialize: _ratingTrendDeserialize,
  deserializeProp: _ratingTrendDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _ratingTrendGetId,
  getLinks: _ratingTrendGetLinks,
  attach: _ratingTrendAttach,
  version: '3.3.0',
);

int _ratingTrendEstimateSize(
  RatingTrend object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.date.length * 3;
  return bytesCount;
}

void _ratingTrendSerialize(
  RatingTrend object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
  writer.writeLong(offsets[1], object.dx);
  writer.writeLong(offsets[2], object.standard);
  writer.writeLong(offsets[3], object.total);
}

RatingTrend _ratingTrendDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RatingTrend(
    date: reader.readStringOrNull(offsets[0]) ?? '',
    dx: reader.readLongOrNull(offsets[1]) ?? 0,
    id: id,
    standard: reader.readLongOrNull(offsets[2]) ?? 0,
    total: reader.readLongOrNull(offsets[3]) ?? 0,
  );
  return object;
}

P _ratingTrendDeserializeProp<P>(
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
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ratingTrendGetId(RatingTrend object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ratingTrendGetLinks(RatingTrend object) {
  return [];
}

void _ratingTrendAttach(
  IsarCollection<dynamic> col,
  Id id,
  RatingTrend object,
) {
  object.id = id;
}

extension RatingTrendQueryWhereSort
    on QueryBuilder<RatingTrend, RatingTrend, QWhere> {
  QueryBuilder<RatingTrend, RatingTrend, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RatingTrendQueryWhere
    on QueryBuilder<RatingTrend, RatingTrend, QWhereClause> {
  QueryBuilder<RatingTrend, RatingTrend, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<RatingTrend, RatingTrend, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterWhereClause> idBetween(
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

  QueryBuilder<RatingTrend, RatingTrend, QAfterWhereClause> dateEqualTo(
    String date,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'date', value: [date]),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterWhereClause> dateNotEqualTo(
    String date,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [],
                upper: [date],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [date],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [date],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'date',
                lower: [],
                upper: [date],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension RatingTrendQueryFilter
    on QueryBuilder<RatingTrend, RatingTrend, QFilterCondition> {
  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'date',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dateContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'date',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dateMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'date',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date', value: ''),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition>
  dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'date', value: ''),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dxEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dx', value: value),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dxGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dx',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dxLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dx',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> dxBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dx',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> standardEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'standard', value: value),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition>
  standardGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'standard',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition>
  standardLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'standard',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> standardBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'standard',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> totalEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'total', value: value),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition>
  totalGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'total',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> totalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'total',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterFilterCondition> totalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'total',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension RatingTrendQueryObject
    on QueryBuilder<RatingTrend, RatingTrend, QFilterCondition> {}

extension RatingTrendQueryLinks
    on QueryBuilder<RatingTrend, RatingTrend, QFilterCondition> {}

extension RatingTrendQuerySortBy
    on QueryBuilder<RatingTrend, RatingTrend, QSortBy> {
  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> sortByDx() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dx', Sort.asc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> sortByDxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dx', Sort.desc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> sortByStandard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standard', Sort.asc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> sortByStandardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standard', Sort.desc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension RatingTrendQuerySortThenBy
    on QueryBuilder<RatingTrend, RatingTrend, QSortThenBy> {
  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> thenByDx() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dx', Sort.asc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> thenByDxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dx', Sort.desc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> thenByStandard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standard', Sort.asc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> thenByStandardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standard', Sort.desc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension RatingTrendQueryWhereDistinct
    on QueryBuilder<RatingTrend, RatingTrend, QDistinct> {
  QueryBuilder<RatingTrend, RatingTrend, QDistinct> distinctByDate({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QDistinct> distinctByDx() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dx');
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QDistinct> distinctByStandard() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'standard');
    });
  }

  QueryBuilder<RatingTrend, RatingTrend, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }
}

extension RatingTrendQueryProperty
    on QueryBuilder<RatingTrend, RatingTrend, QQueryProperty> {
  QueryBuilder<RatingTrend, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RatingTrend, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<RatingTrend, int, QQueryOperations> dxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dx');
    });
  }

  QueryBuilder<RatingTrend, int, QQueryOperations> standardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'standard');
    });
  }

  QueryBuilder<RatingTrend, int, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlayerCollection on Isar {
  IsarCollection<Player> get players => this.collection();
}

const PlayerSchema = CollectionSchema(
  name: r'Player',
  id: -1052842935974721688,
  properties: {
    r'classRank': PropertySchema(
      id: 0,
      name: r'classRank',
      type: IsarType.long,
    ),
    r'courseRank': PropertySchema(
      id: 1,
      name: r'courseRank',
      type: IsarType.long,
    ),
    r'frame': PropertySchema(
      id: 2,
      name: r'frame',
      type: IsarType.object,

      target: r'Frame',
    ),
    r'friendCode': PropertySchema(
      id: 3,
      name: r'friendCode',
      type: IsarType.long,
    ),
    r'icon': PropertySchema(
      id: 4,
      name: r'icon',
      type: IsarType.object,

      target: r'IconData',
    ),
    r'name': PropertySchema(id: 5, name: r'name', type: IsarType.string),
    r'namePlate': PropertySchema(
      id: 6,
      name: r'namePlate',
      type: IsarType.object,

      target: r'NamePlate',
    ),
    r'rating': PropertySchema(id: 7, name: r'rating', type: IsarType.long),
    r'star': PropertySchema(id: 8, name: r'star', type: IsarType.long),
    r'trophy': PropertySchema(
      id: 9,
      name: r'trophy',
      type: IsarType.object,

      target: r'Trophy',
    ),
    r'uploadTime': PropertySchema(
      id: 10,
      name: r'uploadTime',
      type: IsarType.string,
    ),
  },

  estimateSize: _playerEstimateSize,
  serialize: _playerSerialize,
  deserialize: _playerDeserialize,
  deserializeProp: _playerDeserializeProp,
  idName: r'id',
  indexes: {
    r'friendCode': IndexSchema(
      id: 4223631537265626297,
      name: r'friendCode',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'friendCode',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {
    r'Trophy': TrophySchema,
    r'IconData': IconDataSchema,
    r'NamePlate': NamePlateSchema,
    r'Frame': FrameSchema,
  },

  getId: _playerGetId,
  getLinks: _playerGetLinks,
  attach: _playerAttach,
  version: '3.3.0',
);

int _playerEstimateSize(
  Player object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.frame;
    if (value != null) {
      bytesCount +=
          3 + FrameSchema.estimateSize(value, allOffsets[Frame]!, allOffsets);
    }
  }
  {
    final value = object.icon;
    if (value != null) {
      bytesCount +=
          3 +
          IconDataSchema.estimateSize(value, allOffsets[IconData]!, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.namePlate;
    if (value != null) {
      bytesCount +=
          3 +
          NamePlateSchema.estimateSize(
            value,
            allOffsets[NamePlate]!,
            allOffsets,
          );
    }
  }
  {
    final value = object.trophy;
    if (value != null) {
      bytesCount +=
          3 + TrophySchema.estimateSize(value, allOffsets[Trophy]!, allOffsets);
    }
  }
  {
    final value = object.uploadTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _playerSerialize(
  Player object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.classRank);
  writer.writeLong(offsets[1], object.courseRank);
  writer.writeObject<Frame>(
    offsets[2],
    allOffsets,
    FrameSchema.serialize,
    object.frame,
  );
  writer.writeLong(offsets[3], object.friendCode);
  writer.writeObject<IconData>(
    offsets[4],
    allOffsets,
    IconDataSchema.serialize,
    object.icon,
  );
  writer.writeString(offsets[5], object.name);
  writer.writeObject<NamePlate>(
    offsets[6],
    allOffsets,
    NamePlateSchema.serialize,
    object.namePlate,
  );
  writer.writeLong(offsets[7], object.rating);
  writer.writeLong(offsets[8], object.star);
  writer.writeObject<Trophy>(
    offsets[9],
    allOffsets,
    TrophySchema.serialize,
    object.trophy,
  );
  writer.writeString(offsets[10], object.uploadTime);
}

Player _playerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Player(
    classRank: reader.readLongOrNull(offsets[0]) ?? 0,
    courseRank: reader.readLongOrNull(offsets[1]) ?? 0,
    frame: reader.readObjectOrNull<Frame>(
      offsets[2],
      FrameSchema.deserialize,
      allOffsets,
    ),
    friendCode: reader.readLongOrNull(offsets[3]) ?? 0,
    icon: reader.readObjectOrNull<IconData>(
      offsets[4],
      IconDataSchema.deserialize,
      allOffsets,
    ),
    id: id,
    name: reader.readStringOrNull(offsets[5]) ?? '',
    namePlate: reader.readObjectOrNull<NamePlate>(
      offsets[6],
      NamePlateSchema.deserialize,
      allOffsets,
    ),
    rating: reader.readLongOrNull(offsets[7]) ?? 0,
    star: reader.readLongOrNull(offsets[8]) ?? 0,
    trophy: reader.readObjectOrNull<Trophy>(
      offsets[9],
      TrophySchema.deserialize,
      allOffsets,
    ),
    uploadTime: reader.readStringOrNull(offsets[10]),
  );
  return object;
}

P _playerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readObjectOrNull<Frame>(
            offset,
            FrameSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 4:
      return (reader.readObjectOrNull<IconData>(
            offset,
            IconDataSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 5:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 6:
      return (reader.readObjectOrNull<NamePlate>(
            offset,
            NamePlateSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 7:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 8:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 9:
      return (reader.readObjectOrNull<Trophy>(
            offset,
            TrophySchema.deserialize,
            allOffsets,
          ))
          as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _playerGetId(Player object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _playerGetLinks(Player object) {
  return [];
}

void _playerAttach(IsarCollection<dynamic> col, Id id, Player object) {
  object.id = id;
}

extension PlayerByIndex on IsarCollection<Player> {
  Future<Player?> getByFriendCode(int friendCode) {
    return getByIndex(r'friendCode', [friendCode]);
  }

  Player? getByFriendCodeSync(int friendCode) {
    return getByIndexSync(r'friendCode', [friendCode]);
  }

  Future<bool> deleteByFriendCode(int friendCode) {
    return deleteByIndex(r'friendCode', [friendCode]);
  }

  bool deleteByFriendCodeSync(int friendCode) {
    return deleteByIndexSync(r'friendCode', [friendCode]);
  }

  Future<List<Player?>> getAllByFriendCode(List<int> friendCodeValues) {
    final values = friendCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'friendCode', values);
  }

  List<Player?> getAllByFriendCodeSync(List<int> friendCodeValues) {
    final values = friendCodeValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'friendCode', values);
  }

  Future<int> deleteAllByFriendCode(List<int> friendCodeValues) {
    final values = friendCodeValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'friendCode', values);
  }

  int deleteAllByFriendCodeSync(List<int> friendCodeValues) {
    final values = friendCodeValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'friendCode', values);
  }

  Future<Id> putByFriendCode(Player object) {
    return putByIndex(r'friendCode', object);
  }

  Id putByFriendCodeSync(Player object, {bool saveLinks = true}) {
    return putByIndexSync(r'friendCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFriendCode(List<Player> objects) {
    return putAllByIndex(r'friendCode', objects);
  }

  List<Id> putAllByFriendCodeSync(
    List<Player> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'friendCode', objects, saveLinks: saveLinks);
  }
}

extension PlayerQueryWhereSort on QueryBuilder<Player, Player, QWhere> {
  QueryBuilder<Player, Player, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Player, Player, QAfterWhere> anyFriendCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'friendCode'),
      );
    });
  }
}

extension PlayerQueryWhere on QueryBuilder<Player, Player, QWhereClause> {
  QueryBuilder<Player, Player, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Player, Player, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> idBetween(
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

  QueryBuilder<Player, Player, QAfterWhereClause> friendCodeEqualTo(
    int friendCode,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'friendCode', value: [friendCode]),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> friendCodeNotEqualTo(
    int friendCode,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'friendCode',
                lower: [],
                upper: [friendCode],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'friendCode',
                lower: [friendCode],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'friendCode',
                lower: [friendCode],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'friendCode',
                lower: [],
                upper: [friendCode],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> friendCodeGreaterThan(
    int friendCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'friendCode',
          lower: [friendCode],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> friendCodeLessThan(
    int friendCode, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'friendCode',
          lower: [],
          upper: [friendCode],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterWhereClause> friendCodeBetween(
    int lowerFriendCode,
    int upperFriendCode, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'friendCode',
          lower: [lowerFriendCode],
          includeLower: includeLower,
          upper: [upperFriendCode],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension PlayerQueryFilter on QueryBuilder<Player, Player, QFilterCondition> {
  QueryBuilder<Player, Player, QAfterFilterCondition> classRankEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'classRank', value: value),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> classRankGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'classRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> classRankLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'classRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> classRankBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'classRank',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> courseRankEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'courseRank', value: value),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> courseRankGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'courseRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> courseRankLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'courseRank',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> courseRankBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'courseRank',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> frameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'frame'),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> frameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'frame'),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> friendCodeEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'friendCode', value: value),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> friendCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'friendCode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> friendCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'friendCode',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> friendCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'friendCode',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> iconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'icon'),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> iconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'icon'),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> namePlateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'namePlate'),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> namePlateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'namePlate'),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> ratingEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rating', value: value),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> ratingGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'rating',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> ratingLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'rating',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> ratingBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'rating',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> starEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'star', value: value),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> starGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'star',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> starLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'star',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> starBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'star',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> trophyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'trophy'),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> trophyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'trophy'),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'uploadTime'),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'uploadTime'),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeEqualTo(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeGreaterThan(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeLessThan(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeBetween(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeStartsWith(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeEndsWith(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeContains(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeMatches(
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

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'uploadTime', value: ''),
      );
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> uploadTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'uploadTime', value: ''),
      );
    });
  }
}

extension PlayerQueryObject on QueryBuilder<Player, Player, QFilterCondition> {
  QueryBuilder<Player, Player, QAfterFilterCondition> frame(
    FilterQuery<Frame> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'frame');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> icon(
    FilterQuery<IconData> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'icon');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> namePlate(
    FilterQuery<NamePlate> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'namePlate');
    });
  }

  QueryBuilder<Player, Player, QAfterFilterCondition> trophy(
    FilterQuery<Trophy> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'trophy');
    });
  }
}

extension PlayerQueryLinks on QueryBuilder<Player, Player, QFilterCondition> {}

extension PlayerQuerySortBy on QueryBuilder<Player, Player, QSortBy> {
  QueryBuilder<Player, Player, QAfterSortBy> sortByClassRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRank', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByClassRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRank', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByCourseRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRank', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByCourseRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRank', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByFriendCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'friendCode', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByFriendCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'friendCode', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'star', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByStarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'star', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> sortByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension PlayerQuerySortThenBy on QueryBuilder<Player, Player, QSortThenBy> {
  QueryBuilder<Player, Player, QAfterSortBy> thenByClassRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRank', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByClassRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRank', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByCourseRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRank', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByCourseRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRank', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByFriendCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'friendCode', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByFriendCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'friendCode', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'star', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByStarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'star', Sort.desc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<Player, Player, QAfterSortBy> thenByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension PlayerQueryWhereDistinct on QueryBuilder<Player, Player, QDistinct> {
  QueryBuilder<Player, Player, QDistinct> distinctByClassRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classRank');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByCourseRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courseRank');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByFriendCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'friendCode');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'star');
    });
  }

  QueryBuilder<Player, Player, QDistinct> distinctByUploadTime({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadTime', caseSensitive: caseSensitive);
    });
  }
}

extension PlayerQueryProperty on QueryBuilder<Player, Player, QQueryProperty> {
  QueryBuilder<Player, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Player, int, QQueryOperations> classRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classRank');
    });
  }

  QueryBuilder<Player, int, QQueryOperations> courseRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseRank');
    });
  }

  QueryBuilder<Player, Frame?, QQueryOperations> frameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frame');
    });
  }

  QueryBuilder<Player, int, QQueryOperations> friendCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'friendCode');
    });
  }

  QueryBuilder<Player, IconData?, QQueryOperations> iconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'icon');
    });
  }

  QueryBuilder<Player, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Player, NamePlate?, QQueryOperations> namePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namePlate');
    });
  }

  QueryBuilder<Player, int, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<Player, int, QQueryOperations> starProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'star');
    });
  }

  QueryBuilder<Player, Trophy?, QQueryOperations> trophyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trophy');
    });
  }

  QueryBuilder<Player, String?, QQueryOperations> uploadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadTime');
    });
  }
}

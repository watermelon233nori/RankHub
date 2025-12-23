// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maimai_player.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMaimaiRatingTrendCollection on Isar {
  IsarCollection<MaimaiRatingTrend> get maimaiRatingTrends => this.collection();
}

const MaimaiRatingTrendSchema = CollectionSchema(
  name: r'MaimaiRatingTrend',
  id: -2310698009299017975,
  properties: {
    r'date': PropertySchema(id: 0, name: r'date', type: IsarType.string),
    r'dx': PropertySchema(id: 1, name: r'dx', type: IsarType.long),
    r'standard': PropertySchema(id: 2, name: r'standard', type: IsarType.long),
    r'total': PropertySchema(id: 3, name: r'total', type: IsarType.long),
  },

  estimateSize: _maimaiRatingTrendEstimateSize,
  serialize: _maimaiRatingTrendSerialize,
  deserialize: _maimaiRatingTrendDeserialize,
  deserializeProp: _maimaiRatingTrendDeserializeProp,
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

  getId: _maimaiRatingTrendGetId,
  getLinks: _maimaiRatingTrendGetLinks,
  attach: _maimaiRatingTrendAttach,
  version: '3.3.0',
);

int _maimaiRatingTrendEstimateSize(
  MaimaiRatingTrend object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.date.length * 3;
  return bytesCount;
}

void _maimaiRatingTrendSerialize(
  MaimaiRatingTrend object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.date);
  writer.writeLong(offsets[1], object.dx);
  writer.writeLong(offsets[2], object.standard);
  writer.writeLong(offsets[3], object.total);
}

MaimaiRatingTrend _maimaiRatingTrendDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiRatingTrend(
    date: reader.readStringOrNull(offsets[0]) ?? '',
    dx: reader.readLongOrNull(offsets[1]) ?? 0,
    id: id,
    standard: reader.readLongOrNull(offsets[2]) ?? 0,
    total: reader.readLongOrNull(offsets[3]) ?? 0,
  );
  return object;
}

P _maimaiRatingTrendDeserializeProp<P>(
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

Id _maimaiRatingTrendGetId(MaimaiRatingTrend object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _maimaiRatingTrendGetLinks(
  MaimaiRatingTrend object,
) {
  return [];
}

void _maimaiRatingTrendAttach(
  IsarCollection<dynamic> col,
  Id id,
  MaimaiRatingTrend object,
) {
  object.id = id;
}

extension MaimaiRatingTrendQueryWhereSort
    on QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QWhere> {
  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MaimaiRatingTrendQueryWhere
    on QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QWhereClause> {
  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterWhereClause>
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterWhereClause>
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterWhereClause>
  dateEqualTo(String date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'date', value: [date]),
      );
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterWhereClause>
  dateNotEqualTo(String date) {
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

extension MaimaiRatingTrendQueryFilter
    on QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QFilterCondition> {
  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dateEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dateGreaterThan(
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dateLessThan(
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dateBetween(
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dateStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dateEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dateContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dateMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'date', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dxEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dx', value: value),
      );
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dxGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dxLessThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  dxBetween(
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  standardEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'standard', value: value),
      );
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  standardBetween(
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  totalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'total', value: value),
      );
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  totalLessThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterFilterCondition>
  totalBetween(
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

extension MaimaiRatingTrendQueryObject
    on QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QFilterCondition> {}

extension MaimaiRatingTrendQueryLinks
    on QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QFilterCondition> {}

extension MaimaiRatingTrendQuerySortBy
    on QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QSortBy> {
  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy> sortByDx() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dx', Sort.asc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  sortByDxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dx', Sort.desc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  sortByStandard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standard', Sort.asc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  sortByStandardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standard', Sort.desc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension MaimaiRatingTrendQuerySortThenBy
    on QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QSortThenBy> {
  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy> thenByDx() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dx', Sort.asc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  thenByDxDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dx', Sort.desc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  thenByStandard() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standard', Sort.asc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  thenByStandardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'standard', Sort.desc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QAfterSortBy>
  thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }
}

extension MaimaiRatingTrendQueryWhereDistinct
    on QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QDistinct> {
  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QDistinct> distinctByDate({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QDistinct> distinctByDx() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dx');
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QDistinct>
  distinctByStandard() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'standard');
    });
  }

  QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QDistinct>
  distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }
}

extension MaimaiRatingTrendQueryProperty
    on QueryBuilder<MaimaiRatingTrend, MaimaiRatingTrend, QQueryProperty> {
  QueryBuilder<MaimaiRatingTrend, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MaimaiRatingTrend, String, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<MaimaiRatingTrend, int, QQueryOperations> dxProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dx');
    });
  }

  QueryBuilder<MaimaiRatingTrend, int, QQueryOperations> standardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'standard');
    });
  }

  QueryBuilder<MaimaiRatingTrend, int, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMaimaiPlayerCollection on Isar {
  IsarCollection<MaimaiPlayer> get maimaiPlayers => this.collection();
}

const MaimaiPlayerSchema = CollectionSchema(
  name: r'MaimaiPlayer',
  id: -763514341388755665,
  properties: {
    r'classRank': PropertySchema(
      id: 0,
      name: r'classRank',
      type: IsarType.long,
    ),
    r'classRankImageUrl': PropertySchema(
      id: 1,
      name: r'classRankImageUrl',
      type: IsarType.string,
    ),
    r'courseRank': PropertySchema(
      id: 2,
      name: r'courseRank',
      type: IsarType.long,
    ),
    r'courseRankImageUrl': PropertySchema(
      id: 3,
      name: r'courseRankImageUrl',
      type: IsarType.string,
    ),
    r'frame': PropertySchema(
      id: 4,
      name: r'frame',
      type: IsarType.object,

      target: r'MaimaiFrame',
    ),
    r'friendCode': PropertySchema(
      id: 5,
      name: r'friendCode',
      type: IsarType.long,
    ),
    r'icon': PropertySchema(
      id: 6,
      name: r'icon',
      type: IsarType.object,

      target: r'MaimaiIconData',
    ),
    r'name': PropertySchema(id: 7, name: r'name', type: IsarType.string),
    r'namePlate': PropertySchema(
      id: 8,
      name: r'namePlate',
      type: IsarType.object,

      target: r'MaimaiNamePlate',
    ),
    r'rating': PropertySchema(id: 9, name: r'rating', type: IsarType.long),
    r'star': PropertySchema(id: 10, name: r'star', type: IsarType.long),
    r'starIconUrl': PropertySchema(
      id: 11,
      name: r'starIconUrl',
      type: IsarType.string,
    ),
    r'trophy': PropertySchema(
      id: 12,
      name: r'trophy',
      type: IsarType.object,

      target: r'MaimaiTrophy',
    ),
    r'uploadTime': PropertySchema(
      id: 13,
      name: r'uploadTime',
      type: IsarType.string,
    ),
  },

  estimateSize: _maimaiPlayerEstimateSize,
  serialize: _maimaiPlayerSerialize,
  deserialize: _maimaiPlayerDeserialize,
  deserializeProp: _maimaiPlayerDeserializeProp,
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
    r'MaimaiTrophy': MaimaiTrophySchema,
    r'MaimaiIconData': MaimaiIconDataSchema,
    r'MaimaiNamePlate': MaimaiNamePlateSchema,
    r'MaimaiFrame': MaimaiFrameSchema,
  },

  getId: _maimaiPlayerGetId,
  getLinks: _maimaiPlayerGetLinks,
  attach: _maimaiPlayerAttach,
  version: '3.3.0',
);

int _maimaiPlayerEstimateSize(
  MaimaiPlayer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.classRankImageUrl.length * 3;
  bytesCount += 3 + object.courseRankImageUrl.length * 3;
  {
    final value = object.frame;
    if (value != null) {
      bytesCount +=
          3 +
          MaimaiFrameSchema.estimateSize(
            value,
            allOffsets[MaimaiFrame]!,
            allOffsets,
          );
    }
  }
  {
    final value = object.icon;
    if (value != null) {
      bytesCount +=
          3 +
          MaimaiIconDataSchema.estimateSize(
            value,
            allOffsets[MaimaiIconData]!,
            allOffsets,
          );
    }
  }
  bytesCount += 3 + object.name.length * 3;
  {
    final value = object.namePlate;
    if (value != null) {
      bytesCount +=
          3 +
          MaimaiNamePlateSchema.estimateSize(
            value,
            allOffsets[MaimaiNamePlate]!,
            allOffsets,
          );
    }
  }
  bytesCount += 3 + object.starIconUrl.length * 3;
  {
    final value = object.trophy;
    if (value != null) {
      bytesCount +=
          3 +
          MaimaiTrophySchema.estimateSize(
            value,
            allOffsets[MaimaiTrophy]!,
            allOffsets,
          );
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

void _maimaiPlayerSerialize(
  MaimaiPlayer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.classRank);
  writer.writeString(offsets[1], object.classRankImageUrl);
  writer.writeLong(offsets[2], object.courseRank);
  writer.writeString(offsets[3], object.courseRankImageUrl);
  writer.writeObject<MaimaiFrame>(
    offsets[4],
    allOffsets,
    MaimaiFrameSchema.serialize,
    object.frame,
  );
  writer.writeLong(offsets[5], object.friendCode);
  writer.writeObject<MaimaiIconData>(
    offsets[6],
    allOffsets,
    MaimaiIconDataSchema.serialize,
    object.icon,
  );
  writer.writeString(offsets[7], object.name);
  writer.writeObject<MaimaiNamePlate>(
    offsets[8],
    allOffsets,
    MaimaiNamePlateSchema.serialize,
    object.namePlate,
  );
  writer.writeLong(offsets[9], object.rating);
  writer.writeLong(offsets[10], object.star);
  writer.writeString(offsets[11], object.starIconUrl);
  writer.writeObject<MaimaiTrophy>(
    offsets[12],
    allOffsets,
    MaimaiTrophySchema.serialize,
    object.trophy,
  );
  writer.writeString(offsets[13], object.uploadTime);
}

MaimaiPlayer _maimaiPlayerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiPlayer(
    classRank: reader.readLongOrNull(offsets[0]) ?? 0,
    courseRank: reader.readLongOrNull(offsets[2]) ?? 0,
    frame: reader.readObjectOrNull<MaimaiFrame>(
      offsets[4],
      MaimaiFrameSchema.deserialize,
      allOffsets,
    ),
    friendCode: reader.readLongOrNull(offsets[5]) ?? 0,
    icon: reader.readObjectOrNull<MaimaiIconData>(
      offsets[6],
      MaimaiIconDataSchema.deserialize,
      allOffsets,
    ),
    id: id,
    name: reader.readStringOrNull(offsets[7]) ?? '',
    namePlate: reader.readObjectOrNull<MaimaiNamePlate>(
      offsets[8],
      MaimaiNamePlateSchema.deserialize,
      allOffsets,
    ),
    rating: reader.readLongOrNull(offsets[9]) ?? 0,
    star: reader.readLongOrNull(offsets[10]) ?? 0,
    trophy: reader.readObjectOrNull<MaimaiTrophy>(
      offsets[12],
      MaimaiTrophySchema.deserialize,
      allOffsets,
    ),
    uploadTime: reader.readStringOrNull(offsets[13]),
  );
  return object;
}

P _maimaiPlayerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<MaimaiFrame>(
            offset,
            MaimaiFrameSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 6:
      return (reader.readObjectOrNull<MaimaiIconData>(
            offset,
            MaimaiIconDataSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 7:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 8:
      return (reader.readObjectOrNull<MaimaiNamePlate>(
            offset,
            MaimaiNamePlateSchema.deserialize,
            allOffsets,
          ))
          as P;
    case 9:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 10:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readObjectOrNull<MaimaiTrophy>(
            offset,
            MaimaiTrophySchema.deserialize,
            allOffsets,
          ))
          as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _maimaiPlayerGetId(MaimaiPlayer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _maimaiPlayerGetLinks(MaimaiPlayer object) {
  return [];
}

void _maimaiPlayerAttach(
  IsarCollection<dynamic> col,
  Id id,
  MaimaiPlayer object,
) {
  object.id = id;
}

extension MaimaiPlayerByIndex on IsarCollection<MaimaiPlayer> {
  Future<MaimaiPlayer?> getByFriendCode(int friendCode) {
    return getByIndex(r'friendCode', [friendCode]);
  }

  MaimaiPlayer? getByFriendCodeSync(int friendCode) {
    return getByIndexSync(r'friendCode', [friendCode]);
  }

  Future<bool> deleteByFriendCode(int friendCode) {
    return deleteByIndex(r'friendCode', [friendCode]);
  }

  bool deleteByFriendCodeSync(int friendCode) {
    return deleteByIndexSync(r'friendCode', [friendCode]);
  }

  Future<List<MaimaiPlayer?>> getAllByFriendCode(List<int> friendCodeValues) {
    final values = friendCodeValues.map((e) => [e]).toList();
    return getAllByIndex(r'friendCode', values);
  }

  List<MaimaiPlayer?> getAllByFriendCodeSync(List<int> friendCodeValues) {
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

  Future<Id> putByFriendCode(MaimaiPlayer object) {
    return putByIndex(r'friendCode', object);
  }

  Id putByFriendCodeSync(MaimaiPlayer object, {bool saveLinks = true}) {
    return putByIndexSync(r'friendCode', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByFriendCode(List<MaimaiPlayer> objects) {
    return putAllByIndex(r'friendCode', objects);
  }

  List<Id> putAllByFriendCodeSync(
    List<MaimaiPlayer> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'friendCode', objects, saveLinks: saveLinks);
  }
}

extension MaimaiPlayerQueryWhereSort
    on QueryBuilder<MaimaiPlayer, MaimaiPlayer, QWhere> {
  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhere> anyFriendCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'friendCode'),
      );
    });
  }
}

extension MaimaiPlayerQueryWhere
    on QueryBuilder<MaimaiPlayer, MaimaiPlayer, QWhereClause> {
  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhereClause> idBetween(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhereClause> friendCodeEqualTo(
    int friendCode,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'friendCode', value: [friendCode]),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhereClause>
  friendCodeNotEqualTo(int friendCode) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhereClause>
  friendCodeGreaterThan(int friendCode, {bool include = false}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhereClause>
  friendCodeLessThan(int friendCode, {bool include = false}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterWhereClause> friendCodeBetween(
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

extension MaimaiPlayerQueryFilter
    on QueryBuilder<MaimaiPlayer, MaimaiPlayer, QFilterCondition> {
  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'classRank', value: value),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankLessThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankBetween(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankImageUrlEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'classRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankImageUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'classRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankImageUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'classRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankImageUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'classRankImageUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankImageUrlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'classRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankImageUrlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'classRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankImageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'classRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankImageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'classRankImageUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankImageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'classRankImageUrl', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  classRankImageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'classRankImageUrl', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'courseRank', value: value),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankLessThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankBetween(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankImageUrlEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'courseRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankImageUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'courseRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankImageUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'courseRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankImageUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'courseRankImageUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankImageUrlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'courseRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankImageUrlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'courseRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankImageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'courseRankImageUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankImageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'courseRankImageUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankImageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'courseRankImageUrl', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  courseRankImageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'courseRankImageUrl', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  frameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'frame'),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  frameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'frame'),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  friendCodeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'friendCode', value: value),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  friendCodeGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  friendCodeLessThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  friendCodeBetween(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> iconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'icon'),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  iconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'icon'),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  nameGreaterThan(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> nameContains(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  namePlateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'namePlate'),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  namePlateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'namePlate'),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> ratingEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'rating', value: value),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  ratingGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  ratingLessThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> ratingBetween(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> starEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'star', value: value),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  starGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> starLessThan(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> starBetween(
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  starIconUrlEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'starIconUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  starIconUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'starIconUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  starIconUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'starIconUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  starIconUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'starIconUrl',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  starIconUrlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'starIconUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  starIconUrlEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'starIconUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  starIconUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'starIconUrl',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  starIconUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'starIconUrl',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  starIconUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'starIconUrl', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  starIconUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'starIconUrl', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  trophyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'trophy'),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  trophyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'trophy'),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  uploadTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'uploadTime'),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  uploadTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'uploadTime'),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
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

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  uploadTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'uploadTime', value: ''),
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition>
  uploadTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'uploadTime', value: ''),
      );
    });
  }
}

extension MaimaiPlayerQueryObject
    on QueryBuilder<MaimaiPlayer, MaimaiPlayer, QFilterCondition> {
  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> frame(
    FilterQuery<MaimaiFrame> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'frame');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> icon(
    FilterQuery<MaimaiIconData> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'icon');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> namePlate(
    FilterQuery<MaimaiNamePlate> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'namePlate');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterFilterCondition> trophy(
    FilterQuery<MaimaiTrophy> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'trophy');
    });
  }
}

extension MaimaiPlayerQueryLinks
    on QueryBuilder<MaimaiPlayer, MaimaiPlayer, QFilterCondition> {}

extension MaimaiPlayerQuerySortBy
    on QueryBuilder<MaimaiPlayer, MaimaiPlayer, QSortBy> {
  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByClassRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRank', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByClassRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRank', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  sortByClassRankImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRankImageUrl', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  sortByClassRankImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRankImageUrl', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByCourseRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRank', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  sortByCourseRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRank', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  sortByCourseRankImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRankImageUrl', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  sortByCourseRankImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRankImageUrl', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByFriendCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'friendCode', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  sortByFriendCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'friendCode', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'star', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByStarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'star', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByStarIconUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starIconUrl', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  sortByStarIconUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starIconUrl', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> sortByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  sortByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension MaimaiPlayerQuerySortThenBy
    on QueryBuilder<MaimaiPlayer, MaimaiPlayer, QSortThenBy> {
  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByClassRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRank', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByClassRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRank', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  thenByClassRankImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRankImageUrl', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  thenByClassRankImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'classRankImageUrl', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByCourseRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRank', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  thenByCourseRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRank', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  thenByCourseRankImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRankImageUrl', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  thenByCourseRankImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courseRankImageUrl', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByFriendCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'friendCode', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  thenByFriendCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'friendCode', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'star', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByStarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'star', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByStarIconUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starIconUrl', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  thenByStarIconUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starIconUrl', Sort.desc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy> thenByUploadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.asc);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QAfterSortBy>
  thenByUploadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uploadTime', Sort.desc);
    });
  }
}

extension MaimaiPlayerQueryWhereDistinct
    on QueryBuilder<MaimaiPlayer, MaimaiPlayer, QDistinct> {
  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QDistinct> distinctByClassRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classRank');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QDistinct>
  distinctByClassRankImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'classRankImageUrl',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QDistinct> distinctByCourseRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courseRank');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QDistinct>
  distinctByCourseRankImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'courseRankImageUrl',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QDistinct> distinctByFriendCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'friendCode');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QDistinct> distinctByStar() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'star');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QDistinct> distinctByStarIconUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'starIconUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiPlayer, QDistinct> distinctByUploadTime({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uploadTime', caseSensitive: caseSensitive);
    });
  }
}

extension MaimaiPlayerQueryProperty
    on QueryBuilder<MaimaiPlayer, MaimaiPlayer, QQueryProperty> {
  QueryBuilder<MaimaiPlayer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MaimaiPlayer, int, QQueryOperations> classRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classRank');
    });
  }

  QueryBuilder<MaimaiPlayer, String, QQueryOperations>
  classRankImageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classRankImageUrl');
    });
  }

  QueryBuilder<MaimaiPlayer, int, QQueryOperations> courseRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseRank');
    });
  }

  QueryBuilder<MaimaiPlayer, String, QQueryOperations>
  courseRankImageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courseRankImageUrl');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiFrame?, QQueryOperations> frameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frame');
    });
  }

  QueryBuilder<MaimaiPlayer, int, QQueryOperations> friendCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'friendCode');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiIconData?, QQueryOperations> iconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'icon');
    });
  }

  QueryBuilder<MaimaiPlayer, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiNamePlate?, QQueryOperations>
  namePlateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namePlate');
    });
  }

  QueryBuilder<MaimaiPlayer, int, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<MaimaiPlayer, int, QQueryOperations> starProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'star');
    });
  }

  QueryBuilder<MaimaiPlayer, String, QQueryOperations> starIconUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'starIconUrl');
    });
  }

  QueryBuilder<MaimaiPlayer, MaimaiTrophy?, QQueryOperations> trophyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'trophy');
    });
  }

  QueryBuilder<MaimaiPlayer, String?, QQueryOperations> uploadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uploadTime');
    });
  }
}

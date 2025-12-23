// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maimai_notes.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MaimaiNotesSchema = Schema(
  name: r'MaimaiNotes',
  id: -1040928060975125239,
  properties: {
    r'break_note': PropertySchema(
      id: 0,
      name: r'break_note',
      type: IsarType.long,
    ),
    r'hold': PropertySchema(id: 1, name: r'hold', type: IsarType.long),
    r'slide': PropertySchema(id: 2, name: r'slide', type: IsarType.long),
    r'tap': PropertySchema(id: 3, name: r'tap', type: IsarType.long),
    r'total': PropertySchema(id: 4, name: r'total', type: IsarType.long),
    r'touch': PropertySchema(id: 5, name: r'touch', type: IsarType.long),
  },

  estimateSize: _maimaiNotesEstimateSize,
  serialize: _maimaiNotesSerialize,
  deserialize: _maimaiNotesDeserialize,
  deserializeProp: _maimaiNotesDeserializeProp,
);

int _maimaiNotesEstimateSize(
  MaimaiNotes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _maimaiNotesSerialize(
  MaimaiNotes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.breakNote);
  writer.writeLong(offsets[1], object.hold);
  writer.writeLong(offsets[2], object.slide);
  writer.writeLong(offsets[3], object.tap);
  writer.writeLong(offsets[4], object.total);
  writer.writeLong(offsets[5], object.touch);
}

MaimaiNotes _maimaiNotesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiNotes(
    breakNote: reader.readLongOrNull(offsets[0]) ?? 0,
    hold: reader.readLongOrNull(offsets[1]) ?? 0,
    slide: reader.readLongOrNull(offsets[2]) ?? 0,
    tap: reader.readLongOrNull(offsets[3]) ?? 0,
    total: reader.readLongOrNull(offsets[4]) ?? 0,
    touch: reader.readLongOrNull(offsets[5]) ?? 0,
  );
  return object;
}

P _maimaiNotesDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 5:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MaimaiNotesQueryFilter
    on QueryBuilder<MaimaiNotes, MaimaiNotes, QFilterCondition> {
  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition>
  breakNoteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'break_note', value: value),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition>
  breakNoteGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'break_note',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition>
  breakNoteLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'break_note',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition>
  breakNoteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'break_note',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> holdEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hold', value: value),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> holdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'hold',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> holdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'hold',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> holdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'hold',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> slideEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'slide', value: value),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition>
  slideGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'slide',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> slideLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'slide',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> slideBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'slide',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> tapEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tap', value: value),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> tapGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tap',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> tapLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tap',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> tapBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tap',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> totalEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'total', value: value),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition>
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

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> totalLessThan(
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

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> totalBetween(
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

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> touchEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'touch', value: value),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition>
  touchGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'touch',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> touchLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'touch',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<MaimaiNotes, MaimaiNotes, QAfterFilterCondition> touchBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'touch',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension MaimaiNotesQueryObject
    on QueryBuilder<MaimaiNotes, MaimaiNotes, QFilterCondition> {}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NotesSchema = Schema(
  name: r'Notes',
  id: 1316144172548953035,
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

  estimateSize: _notesEstimateSize,
  serialize: _notesSerialize,
  deserialize: _notesDeserialize,
  deserializeProp: _notesDeserializeProp,
);

int _notesEstimateSize(
  Notes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _notesSerialize(
  Notes object,
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

Notes _notesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Notes(
    breakNote: reader.readLongOrNull(offsets[0]) ?? 0,
    hold: reader.readLongOrNull(offsets[1]) ?? 0,
    slide: reader.readLongOrNull(offsets[2]) ?? 0,
    tap: reader.readLongOrNull(offsets[3]) ?? 0,
    total: reader.readLongOrNull(offsets[4]) ?? 0,
    touch: reader.readLongOrNull(offsets[5]) ?? 0,
  );
  return object;
}

P _notesDeserializeProp<P>(
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

extension NotesQueryFilter on QueryBuilder<Notes, Notes, QFilterCondition> {
  QueryBuilder<Notes, Notes, QAfterFilterCondition> breakNoteEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'break_note', value: value),
      );
    });
  }

  QueryBuilder<Notes, Notes, QAfterFilterCondition> breakNoteGreaterThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> breakNoteLessThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> breakNoteBetween(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> holdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'hold', value: value),
      );
    });
  }

  QueryBuilder<Notes, Notes, QAfterFilterCondition> holdGreaterThan(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> holdLessThan(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> holdBetween(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> slideEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'slide', value: value),
      );
    });
  }

  QueryBuilder<Notes, Notes, QAfterFilterCondition> slideGreaterThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> slideLessThan(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> slideBetween(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> tapEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tap', value: value),
      );
    });
  }

  QueryBuilder<Notes, Notes, QAfterFilterCondition> tapGreaterThan(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> tapLessThan(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> tapBetween(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> totalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'total', value: value),
      );
    });
  }

  QueryBuilder<Notes, Notes, QAfterFilterCondition> totalGreaterThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> totalLessThan(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> totalBetween(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> touchEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'touch', value: value),
      );
    });
  }

  QueryBuilder<Notes, Notes, QAfterFilterCondition> touchGreaterThan(
    int value, {
    bool include = false,
  }) {
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> touchLessThan(
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

  QueryBuilder<Notes, Notes, QAfterFilterCondition> touchBetween(
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

extension NotesQueryObject on QueryBuilder<Notes, Notes, QFilterCondition> {}

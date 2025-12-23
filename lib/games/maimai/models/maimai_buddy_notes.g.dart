// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maimai_buddy_notes.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MaimaiBuddyNotesSchema = Schema(
  name: r'MaimaiBuddyNotes',
  id: 6427164040023279760,
  properties: {
    r'left': PropertySchema(
      id: 0,
      name: r'left',
      type: IsarType.object,

      target: r'MaimaiNotes',
    ),
    r'right': PropertySchema(
      id: 1,
      name: r'right',
      type: IsarType.object,

      target: r'MaimaiNotes',
    ),
  },

  estimateSize: _maimaiBuddyNotesEstimateSize,
  serialize: _maimaiBuddyNotesSerialize,
  deserialize: _maimaiBuddyNotesDeserialize,
  deserializeProp: _maimaiBuddyNotesDeserializeProp,
);

int _maimaiBuddyNotesEstimateSize(
  MaimaiBuddyNotes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount +=
      3 +
      MaimaiNotesSchema.estimateSize(
        object.left,
        allOffsets[MaimaiNotes]!,
        allOffsets,
      );
  bytesCount +=
      3 +
      MaimaiNotesSchema.estimateSize(
        object.right,
        allOffsets[MaimaiNotes]!,
        allOffsets,
      );
  return bytesCount;
}

void _maimaiBuddyNotesSerialize(
  MaimaiBuddyNotes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<MaimaiNotes>(
    offsets[0],
    allOffsets,
    MaimaiNotesSchema.serialize,
    object.left,
  );
  writer.writeObject<MaimaiNotes>(
    offsets[1],
    allOffsets,
    MaimaiNotesSchema.serialize,
    object.right,
  );
}

MaimaiBuddyNotes _maimaiBuddyNotesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MaimaiBuddyNotes(
    left:
        reader.readObjectOrNull<MaimaiNotes>(
          offsets[0],
          MaimaiNotesSchema.deserialize,
          allOffsets,
        ) ??
        const MaimaiNotes(),
    right:
        reader.readObjectOrNull<MaimaiNotes>(
          offsets[1],
          MaimaiNotesSchema.deserialize,
          allOffsets,
        ) ??
        const MaimaiNotes(),
  );
  return object;
}

P _maimaiBuddyNotesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<MaimaiNotes>(
                offset,
                MaimaiNotesSchema.deserialize,
                allOffsets,
              ) ??
              const MaimaiNotes())
          as P;
    case 1:
      return (reader.readObjectOrNull<MaimaiNotes>(
                offset,
                MaimaiNotesSchema.deserialize,
                allOffsets,
              ) ??
              const MaimaiNotes())
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MaimaiBuddyNotesQueryFilter
    on QueryBuilder<MaimaiBuddyNotes, MaimaiBuddyNotes, QFilterCondition> {}

extension MaimaiBuddyNotesQueryObject
    on QueryBuilder<MaimaiBuddyNotes, MaimaiBuddyNotes, QFilterCondition> {
  QueryBuilder<MaimaiBuddyNotes, MaimaiBuddyNotes, QAfterFilterCondition> left(
    FilterQuery<MaimaiNotes> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'left');
    });
  }

  QueryBuilder<MaimaiBuddyNotes, MaimaiBuddyNotes, QAfterFilterCondition> right(
    FilterQuery<MaimaiNotes> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'right');
    });
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buddy_notes.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const BuddyNotesSchema = Schema(
  name: r'BuddyNotes',
  id: -1207471828698065119,
  properties: {
    r'left': PropertySchema(
      id: 0,
      name: r'left',
      type: IsarType.object,

      target: r'Notes',
    ),
    r'right': PropertySchema(
      id: 1,
      name: r'right',
      type: IsarType.object,

      target: r'Notes',
    ),
  },

  estimateSize: _buddyNotesEstimateSize,
  serialize: _buddyNotesSerialize,
  deserialize: _buddyNotesDeserialize,
  deserializeProp: _buddyNotesDeserializeProp,
);

int _buddyNotesEstimateSize(
  BuddyNotes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount +=
      3 + NotesSchema.estimateSize(object.left, allOffsets[Notes]!, allOffsets);
  bytesCount +=
      3 +
      NotesSchema.estimateSize(object.right, allOffsets[Notes]!, allOffsets);
  return bytesCount;
}

void _buddyNotesSerialize(
  BuddyNotes object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Notes>(
    offsets[0],
    allOffsets,
    NotesSchema.serialize,
    object.left,
  );
  writer.writeObject<Notes>(
    offsets[1],
    allOffsets,
    NotesSchema.serialize,
    object.right,
  );
}

BuddyNotes _buddyNotesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BuddyNotes(
    left:
        reader.readObjectOrNull<Notes>(
          offsets[0],
          NotesSchema.deserialize,
          allOffsets,
        ) ??
        const Notes(),
    right:
        reader.readObjectOrNull<Notes>(
          offsets[1],
          NotesSchema.deserialize,
          allOffsets,
        ) ??
        const Notes(),
  );
  return object;
}

P _buddyNotesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Notes>(
                offset,
                NotesSchema.deserialize,
                allOffsets,
              ) ??
              const Notes())
          as P;
    case 1:
      return (reader.readObjectOrNull<Notes>(
                offset,
                NotesSchema.deserialize,
                allOffsets,
              ) ??
              const Notes())
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension BuddyNotesQueryFilter
    on QueryBuilder<BuddyNotes, BuddyNotes, QFilterCondition> {}

extension BuddyNotesQueryObject
    on QueryBuilder<BuddyNotes, BuddyNotes, QFilterCondition> {
  QueryBuilder<BuddyNotes, BuddyNotes, QAfterFilterCondition> left(
    FilterQuery<Notes> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'left');
    });
  }

  QueryBuilder<BuddyNotes, BuddyNotes, QAfterFilterCondition> right(
    FilterQuery<Notes> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'right');
    });
  }
}

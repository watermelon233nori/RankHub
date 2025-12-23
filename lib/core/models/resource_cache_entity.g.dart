// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_cache_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetResourceCacheEntityCollection on Isar {
  IsarCollection<ResourceCacheEntity> get resourceCacheEntitys =>
      this.collection();
}

const ResourceCacheEntitySchema = CollectionSchema(
  name: r'ResourceCacheEntity',
  id: 2778240926344127251,
  properties: {
    r'accountKey': PropertySchema(
      id: 0,
      name: r'accountKey',
      type: IsarType.string,
    ),
    r'expiryTime': PropertySchema(
      id: 1,
      name: r'expiryTime',
      type: IsarType.dateTime,
    ),
    r'isAccountRelated': PropertySchema(
      id: 2,
      name: r'isAccountRelated',
      type: IsarType.bool,
    ),
    r'isExpired': PropertySchema(
      id: 3,
      name: r'isExpired',
      type: IsarType.bool,
    ),
    r'lastLoadTime': PropertySchema(
      id: 4,
      name: r'lastLoadTime',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(id: 5, name: r'name', type: IsarType.string),
    r'namespace': PropertySchema(
      id: 6,
      name: r'namespace',
      type: IsarType.string,
    ),
    r'resourceKey': PropertySchema(
      id: 7,
      name: r'resourceKey',
      type: IsarType.string,
    ),
    r'scope': PropertySchema(id: 8, name: r'scope', type: IsarType.string),
    r'ttlSeconds': PropertySchema(
      id: 9,
      name: r'ttlSeconds',
      type: IsarType.long,
    ),
  },

  estimateSize: _resourceCacheEntityEstimateSize,
  serialize: _resourceCacheEntitySerialize,
  deserialize: _resourceCacheEntityDeserialize,
  deserializeProp: _resourceCacheEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'resourceKey': IndexSchema(
      id: 8701471516144682442,
      name: r'resourceKey',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'resourceKey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'accountKey': IndexSchema(
      id: -1912253120142389921,
      name: r'accountKey',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'accountKey',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'namespace': IndexSchema(
      id: 2334977328868235416,
      name: r'namespace',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'namespace',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _resourceCacheEntityGetId,
  getLinks: _resourceCacheEntityGetLinks,
  attach: _resourceCacheEntityAttach,
  version: '3.3.0',
);

int _resourceCacheEntityEstimateSize(
  ResourceCacheEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.accountKey.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.namespace.length * 3;
  bytesCount += 3 + object.resourceKey.length * 3;
  {
    final value = object.scope;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _resourceCacheEntitySerialize(
  ResourceCacheEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.accountKey);
  writer.writeDateTime(offsets[1], object.expiryTime);
  writer.writeBool(offsets[2], object.isAccountRelated);
  writer.writeBool(offsets[3], object.isExpired);
  writer.writeDateTime(offsets[4], object.lastLoadTime);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.namespace);
  writer.writeString(offsets[7], object.resourceKey);
  writer.writeString(offsets[8], object.scope);
  writer.writeLong(offsets[9], object.ttlSeconds);
}

ResourceCacheEntity _resourceCacheEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ResourceCacheEntity();
  object.accountKey = reader.readString(offsets[0]);
  object.expiryTime = reader.readDateTime(offsets[1]);
  object.id = id;
  object.isAccountRelated = reader.readBool(offsets[2]);
  object.lastLoadTime = reader.readDateTime(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.namespace = reader.readString(offsets[6]);
  object.resourceKey = reader.readString(offsets[7]);
  object.scope = reader.readStringOrNull(offsets[8]);
  object.ttlSeconds = reader.readLong(offsets[9]);
  return object;
}

P _resourceCacheEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _resourceCacheEntityGetId(ResourceCacheEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _resourceCacheEntityGetLinks(
  ResourceCacheEntity object,
) {
  return [];
}

void _resourceCacheEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  ResourceCacheEntity object,
) {
  object.id = id;
}

extension ResourceCacheEntityByIndex on IsarCollection<ResourceCacheEntity> {
  Future<ResourceCacheEntity?> getByResourceKey(String resourceKey) {
    return getByIndex(r'resourceKey', [resourceKey]);
  }

  ResourceCacheEntity? getByResourceKeySync(String resourceKey) {
    return getByIndexSync(r'resourceKey', [resourceKey]);
  }

  Future<bool> deleteByResourceKey(String resourceKey) {
    return deleteByIndex(r'resourceKey', [resourceKey]);
  }

  bool deleteByResourceKeySync(String resourceKey) {
    return deleteByIndexSync(r'resourceKey', [resourceKey]);
  }

  Future<List<ResourceCacheEntity?>> getAllByResourceKey(
    List<String> resourceKeyValues,
  ) {
    final values = resourceKeyValues.map((e) => [e]).toList();
    return getAllByIndex(r'resourceKey', values);
  }

  List<ResourceCacheEntity?> getAllByResourceKeySync(
    List<String> resourceKeyValues,
  ) {
    final values = resourceKeyValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'resourceKey', values);
  }

  Future<int> deleteAllByResourceKey(List<String> resourceKeyValues) {
    final values = resourceKeyValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'resourceKey', values);
  }

  int deleteAllByResourceKeySync(List<String> resourceKeyValues) {
    final values = resourceKeyValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'resourceKey', values);
  }

  Future<Id> putByResourceKey(ResourceCacheEntity object) {
    return putByIndex(r'resourceKey', object);
  }

  Id putByResourceKeySync(ResourceCacheEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'resourceKey', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByResourceKey(List<ResourceCacheEntity> objects) {
    return putAllByIndex(r'resourceKey', objects);
  }

  List<Id> putAllByResourceKeySync(
    List<ResourceCacheEntity> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'resourceKey', objects, saveLinks: saveLinks);
  }
}

extension ResourceCacheEntityQueryWhereSort
    on QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QWhere> {
  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ResourceCacheEntityQueryWhere
    on QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QWhereClause> {
  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhereClause>
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhereClause>
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhereClause>
  resourceKeyEqualTo(String resourceKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'resourceKey',
          value: [resourceKey],
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhereClause>
  resourceKeyNotEqualTo(String resourceKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'resourceKey',
                lower: [],
                upper: [resourceKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'resourceKey',
                lower: [resourceKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'resourceKey',
                lower: [resourceKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'resourceKey',
                lower: [],
                upper: [resourceKey],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhereClause>
  accountKeyEqualTo(String accountKey) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'accountKey', value: [accountKey]),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhereClause>
  accountKeyNotEqualTo(String accountKey) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'accountKey',
                lower: [],
                upper: [accountKey],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'accountKey',
                lower: [accountKey],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'accountKey',
                lower: [accountKey],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'accountKey',
                lower: [],
                upper: [accountKey],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhereClause>
  namespaceEqualTo(String namespace) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'namespace', value: [namespace]),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterWhereClause>
  namespaceNotEqualTo(String namespace) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'namespace',
                lower: [],
                upper: [namespace],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'namespace',
                lower: [namespace],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'namespace',
                lower: [namespace],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'namespace',
                lower: [],
                upper: [namespace],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension ResourceCacheEntityQueryFilter
    on
        QueryBuilder<
          ResourceCacheEntity,
          ResourceCacheEntity,
          QFilterCondition
        > {
  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  accountKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'accountKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  accountKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'accountKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  accountKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'accountKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  accountKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'accountKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  accountKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'accountKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  accountKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'accountKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  accountKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'accountKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  accountKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'accountKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  accountKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'accountKey', value: ''),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  accountKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'accountKey', value: ''),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  expiryTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'expiryTime', value: value),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  expiryTimeGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'expiryTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  expiryTimeLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'expiryTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  expiryTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'expiryTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  isAccountRelatedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isAccountRelated', value: value),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  isExpiredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isExpired', value: value),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  lastLoadTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'lastLoadTime', value: value),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  lastLoadTimeGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'lastLoadTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  lastLoadTimeLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'lastLoadTime',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  lastLoadTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'lastLoadTime',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  nameEqualTo(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  nameLessThan(
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  nameBetween(
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  nameMatches(String pattern, {bool caseSensitive = true}) {
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

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  namespaceEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'namespace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  namespaceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'namespace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  namespaceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'namespace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  namespaceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'namespace',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  namespaceStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'namespace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  namespaceEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'namespace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  namespaceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'namespace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  namespaceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'namespace',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  namespaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'namespace', value: ''),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  namespaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'namespace', value: ''),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  resourceKeyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'resourceKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  resourceKeyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'resourceKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  resourceKeyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'resourceKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  resourceKeyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'resourceKey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  resourceKeyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'resourceKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  resourceKeyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'resourceKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  resourceKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'resourceKey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  resourceKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'resourceKey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  resourceKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'resourceKey', value: ''),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  resourceKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'resourceKey', value: ''),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'scope'),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'scope'),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'scope',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'scope',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'scope',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'scope',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'scope',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'scope',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'scope',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'scope',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'scope', value: ''),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  scopeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'scope', value: ''),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  ttlSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ttlSeconds', value: value),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  ttlSecondsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ttlSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  ttlSecondsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ttlSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterFilterCondition>
  ttlSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ttlSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension ResourceCacheEntityQueryObject
    on
        QueryBuilder<
          ResourceCacheEntity,
          ResourceCacheEntity,
          QFilterCondition
        > {}

extension ResourceCacheEntityQueryLinks
    on
        QueryBuilder<
          ResourceCacheEntity,
          ResourceCacheEntity,
          QFilterCondition
        > {}

extension ResourceCacheEntityQuerySortBy
    on QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QSortBy> {
  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByAccountKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountKey', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByAccountKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountKey', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByExpiryTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryTime', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByExpiryTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryTime', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByIsAccountRelated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAccountRelated', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByIsAccountRelatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAccountRelated', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByIsExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByIsExpiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByLastLoadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLoadTime', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByLastLoadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLoadTime', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByNamespace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namespace', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByNamespaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namespace', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByResourceKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceKey', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByResourceKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceKey', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByScope() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scope', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByScopeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scope', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByTtlSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttlSeconds', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  sortByTtlSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttlSeconds', Sort.desc);
    });
  }
}

extension ResourceCacheEntityQuerySortThenBy
    on QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QSortThenBy> {
  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByAccountKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountKey', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByAccountKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accountKey', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByExpiryTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryTime', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByExpiryTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryTime', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByIsAccountRelated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAccountRelated', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByIsAccountRelatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isAccountRelated', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByIsExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByIsExpiredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isExpired', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByLastLoadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLoadTime', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByLastLoadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastLoadTime', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByNamespace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namespace', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByNamespaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namespace', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByResourceKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceKey', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByResourceKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'resourceKey', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByScope() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scope', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByScopeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scope', Sort.desc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByTtlSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttlSeconds', Sort.asc);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QAfterSortBy>
  thenByTtlSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ttlSeconds', Sort.desc);
    });
  }
}

extension ResourceCacheEntityQueryWhereDistinct
    on QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QDistinct> {
  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QDistinct>
  distinctByAccountKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accountKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QDistinct>
  distinctByExpiryTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryTime');
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QDistinct>
  distinctByIsAccountRelated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isAccountRelated');
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QDistinct>
  distinctByIsExpired() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isExpired');
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QDistinct>
  distinctByLastLoadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastLoadTime');
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QDistinct>
  distinctByNamespace({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namespace', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QDistinct>
  distinctByResourceKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'resourceKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QDistinct>
  distinctByScope({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scope', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QDistinct>
  distinctByTtlSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ttlSeconds');
    });
  }
}

extension ResourceCacheEntityQueryProperty
    on QueryBuilder<ResourceCacheEntity, ResourceCacheEntity, QQueryProperty> {
  QueryBuilder<ResourceCacheEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ResourceCacheEntity, String, QQueryOperations>
  accountKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accountKey');
    });
  }

  QueryBuilder<ResourceCacheEntity, DateTime, QQueryOperations>
  expiryTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryTime');
    });
  }

  QueryBuilder<ResourceCacheEntity, bool, QQueryOperations>
  isAccountRelatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isAccountRelated');
    });
  }

  QueryBuilder<ResourceCacheEntity, bool, QQueryOperations>
  isExpiredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isExpired');
    });
  }

  QueryBuilder<ResourceCacheEntity, DateTime, QQueryOperations>
  lastLoadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastLoadTime');
    });
  }

  QueryBuilder<ResourceCacheEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ResourceCacheEntity, String, QQueryOperations>
  namespaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namespace');
    });
  }

  QueryBuilder<ResourceCacheEntity, String, QQueryOperations>
  resourceKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'resourceKey');
    });
  }

  QueryBuilder<ResourceCacheEntity, String?, QQueryOperations> scopeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scope');
    });
  }

  QueryBuilder<ResourceCacheEntity, int, QQueryOperations>
  ttlSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ttlSeconds');
    });
  }
}

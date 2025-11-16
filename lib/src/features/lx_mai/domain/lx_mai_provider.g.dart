// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lx_mai_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lxMaiRepositoryHash() => r'76819d60cffa09db85b0676a2b2feaa2124963fb';

/// See also [lxMaiRepository].
@ProviderFor(lxMaiRepository)
final lxMaiRepositoryProvider =
    AutoDisposeFutureProvider<LxMaiRepository>.internal(
  lxMaiRepository,
  name: r'lxMaiRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lxMaiRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LxMaiRepositoryRef = AutoDisposeFutureProviderRef<LxMaiRepository>;
String _$filteredRecordsHash() => r'0773806742ed184177dc3c72d5626b303930afa3';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [filteredRecords].
@ProviderFor(filteredRecords)
const filteredRecordsProvider = FilteredRecordsFamily();

/// See also [filteredRecords].
class FilteredRecordsFamily extends Family<AsyncValue<List<SongScore>>> {
  /// See also [filteredRecords].
  const FilteredRecordsFamily();

  /// See also [filteredRecords].
  FilteredRecordsProvider call(
    List<SongScore> records,
    MaiSongFilterData filterData,
  ) {
    return FilteredRecordsProvider(
      records,
      filterData,
    );
  }

  @override
  FilteredRecordsProvider getProviderOverride(
    covariant FilteredRecordsProvider provider,
  ) {
    return call(
      provider.records,
      provider.filterData,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'filteredRecordsProvider';
}

/// See also [filteredRecords].
class FilteredRecordsProvider
    extends AutoDisposeFutureProvider<List<SongScore>> {
  /// See also [filteredRecords].
  FilteredRecordsProvider(
    List<SongScore> records,
    MaiSongFilterData filterData,
  ) : this._internal(
          (ref) => filteredRecords(
            ref as FilteredRecordsRef,
            records,
            filterData,
          ),
          from: filteredRecordsProvider,
          name: r'filteredRecordsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredRecordsHash,
          dependencies: FilteredRecordsFamily._dependencies,
          allTransitiveDependencies:
              FilteredRecordsFamily._allTransitiveDependencies,
          records: records,
          filterData: filterData,
        );

  FilteredRecordsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.records,
    required this.filterData,
  }) : super.internal();

  final List<SongScore> records;
  final MaiSongFilterData filterData;

  @override
  Override overrideWith(
    FutureOr<List<SongScore>> Function(FilteredRecordsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredRecordsProvider._internal(
        (ref) => create(ref as FilteredRecordsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        records: records,
        filterData: filterData,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SongScore>> createElement() {
    return _FilteredRecordsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredRecordsProvider &&
        other.records == records &&
        other.filterData == filterData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, records.hashCode);
    hash = _SystemHash.combine(hash, filterData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilteredRecordsRef on AutoDisposeFutureProviderRef<List<SongScore>> {
  /// The parameter `records` of this provider.
  List<SongScore> get records;

  /// The parameter `filterData` of this provider.
  MaiSongFilterData get filterData;
}

class _FilteredRecordsProviderElement
    extends AutoDisposeFutureProviderElement<List<SongScore>>
    with FilteredRecordsRef {
  _FilteredRecordsProviderElement(super.provider);

  @override
  List<SongScore> get records => (origin as FilteredRecordsProvider).records;
  @override
  MaiSongFilterData get filterData =>
      (origin as FilteredRecordsProvider).filterData;
}

String _$getB15RecordsHash() => r'ca13014a2008373b1cba101cec5934b64b1eeead';

/// See also [getB15Records].
@ProviderFor(getB15Records)
const getB15RecordsProvider = GetB15RecordsFamily();

/// See also [getB15Records].
class GetB15RecordsFamily extends Family<AsyncValue<List<SongScore>>> {
  /// See also [getB15Records].
  const GetB15RecordsFamily();

  /// See also [getB15Records].
  GetB15RecordsProvider call(
    String uuid,
  ) {
    return GetB15RecordsProvider(
      uuid,
    );
  }

  @override
  GetB15RecordsProvider getProviderOverride(
    covariant GetB15RecordsProvider provider,
  ) {
    return call(
      provider.uuid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getB15RecordsProvider';
}

/// See also [getB15Records].
class GetB15RecordsProvider extends AutoDisposeFutureProvider<List<SongScore>> {
  /// See also [getB15Records].
  GetB15RecordsProvider(
    String uuid,
  ) : this._internal(
          (ref) => getB15Records(
            ref as GetB15RecordsRef,
            uuid,
          ),
          from: getB15RecordsProvider,
          name: r'getB15RecordsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getB15RecordsHash,
          dependencies: GetB15RecordsFamily._dependencies,
          allTransitiveDependencies:
              GetB15RecordsFamily._allTransitiveDependencies,
          uuid: uuid,
        );

  GetB15RecordsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
  }) : super.internal();

  final String uuid;

  @override
  Override overrideWith(
    FutureOr<List<SongScore>> Function(GetB15RecordsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetB15RecordsProvider._internal(
        (ref) => create(ref as GetB15RecordsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SongScore>> createElement() {
    return _GetB15RecordsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetB15RecordsProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetB15RecordsRef on AutoDisposeFutureProviderRef<List<SongScore>> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _GetB15RecordsProviderElement
    extends AutoDisposeFutureProviderElement<List<SongScore>>
    with GetB15RecordsRef {
  _GetB15RecordsProviderElement(super.provider);

  @override
  String get uuid => (origin as GetB15RecordsProvider).uuid;
}

String _$getB35RecordsHash() => r'975193a13c8f39a962c2ffbb8d169fed10f0c380';

/// See also [getB35Records].
@ProviderFor(getB35Records)
const getB35RecordsProvider = GetB35RecordsFamily();

/// See also [getB35Records].
class GetB35RecordsFamily extends Family<AsyncValue<List<SongScore>>> {
  /// See also [getB35Records].
  const GetB35RecordsFamily();

  /// See also [getB35Records].
  GetB35RecordsProvider call(
    String uuid,
  ) {
    return GetB35RecordsProvider(
      uuid,
    );
  }

  @override
  GetB35RecordsProvider getProviderOverride(
    covariant GetB35RecordsProvider provider,
  ) {
    return call(
      provider.uuid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getB35RecordsProvider';
}

/// See also [getB35Records].
class GetB35RecordsProvider extends AutoDisposeFutureProvider<List<SongScore>> {
  /// See also [getB35Records].
  GetB35RecordsProvider(
    String uuid,
  ) : this._internal(
          (ref) => getB35Records(
            ref as GetB35RecordsRef,
            uuid,
          ),
          from: getB35RecordsProvider,
          name: r'getB35RecordsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getB35RecordsHash,
          dependencies: GetB35RecordsFamily._dependencies,
          allTransitiveDependencies:
              GetB35RecordsFamily._allTransitiveDependencies,
          uuid: uuid,
        );

  GetB35RecordsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
  }) : super.internal();

  final String uuid;

  @override
  Override overrideWith(
    FutureOr<List<SongScore>> Function(GetB35RecordsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetB35RecordsProvider._internal(
        (ref) => create(ref as GetB35RecordsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SongScore>> createElement() {
    return _GetB35RecordsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetB35RecordsProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetB35RecordsRef on AutoDisposeFutureProviderRef<List<SongScore>> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _GetB35RecordsProviderElement
    extends AutoDisposeFutureProviderElement<List<SongScore>>
    with GetB35RecordsRef {
  _GetB35RecordsProviderElement(super.provider);

  @override
  String get uuid => (origin as GetB35RecordsProvider).uuid;
}

String _$getB50DataHash() => r'30a2931e51527776be54f789f9648e44c5af1cdb';

/// See also [getB50Data].
@ProviderFor(getB50Data)
const getB50DataProvider = GetB50DataFamily();

/// See also [getB50Data].
class GetB50DataFamily extends Family<
    AsyncValue<
        ({
          PlayerData player,
          List<SongScore> b15Records,
          List<SongScore> b35Records,
          int b15Rating,
          int b35Rating
        })>> {
  /// See also [getB50Data].
  const GetB50DataFamily();

  /// See also [getB50Data].
  GetB50DataProvider call(
    String uuid,
  ) {
    return GetB50DataProvider(
      uuid,
    );
  }

  @override
  GetB50DataProvider getProviderOverride(
    covariant GetB50DataProvider provider,
  ) {
    return call(
      provider.uuid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getB50DataProvider';
}

/// See also [getB50Data].
class GetB50DataProvider extends AutoDisposeFutureProvider<
    ({
      PlayerData player,
      List<SongScore> b15Records,
      List<SongScore> b35Records,
      int b15Rating,
      int b35Rating
    })> {
  /// See also [getB50Data].
  GetB50DataProvider(
    String uuid,
  ) : this._internal(
          (ref) => getB50Data(
            ref as GetB50DataRef,
            uuid,
          ),
          from: getB50DataProvider,
          name: r'getB50DataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getB50DataHash,
          dependencies: GetB50DataFamily._dependencies,
          allTransitiveDependencies:
              GetB50DataFamily._allTransitiveDependencies,
          uuid: uuid,
        );

  GetB50DataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
  }) : super.internal();

  final String uuid;

  @override
  Override overrideWith(
    FutureOr<
                ({
                  PlayerData player,
                  List<SongScore> b15Records,
                  List<SongScore> b35Records,
                  int b15Rating,
                  int b35Rating
                })>
            Function(GetB50DataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetB50DataProvider._internal(
        (ref) => create(ref as GetB50DataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<
      ({
        PlayerData player,
        List<SongScore> b15Records,
        List<SongScore> b35Records,
        int b15Rating,
        int b35Rating
      })> createElement() {
    return _GetB50DataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetB50DataProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetB50DataRef on AutoDisposeFutureProviderRef<
    ({
      PlayerData player,
      List<SongScore> b15Records,
      List<SongScore> b35Records,
      int b15Rating,
      int b35Rating
    })> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _GetB50DataProviderElement extends AutoDisposeFutureProviderElement<
    ({
      PlayerData player,
      List<SongScore> b15Records,
      List<SongScore> b35Records,
      int b15Rating,
      int b35Rating
    })> with GetB50DataRef {
  _GetB50DataProviderElement(super.provider);

  @override
  String get uuid => (origin as GetB50DataProvider).uuid;
}

String _$playerDataHash() => r'892c334449f1ad45c781b0bd197350c0f4489fe9';

/// See also [playerData].
@ProviderFor(playerData)
const playerDataProvider = PlayerDataFamily();

/// See also [playerData].
class PlayerDataFamily extends Family<AsyncValue<PlayerData>> {
  /// See also [playerData].
  const PlayerDataFamily();

  /// See also [playerData].
  PlayerDataProvider call(
    String uuid,
  ) {
    return PlayerDataProvider(
      uuid,
    );
  }

  @override
  PlayerDataProvider getProviderOverride(
    covariant PlayerDataProvider provider,
  ) {
    return call(
      provider.uuid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'playerDataProvider';
}

/// See also [playerData].
class PlayerDataProvider extends AutoDisposeFutureProvider<PlayerData> {
  /// See also [playerData].
  PlayerDataProvider(
    String uuid,
  ) : this._internal(
          (ref) => playerData(
            ref as PlayerDataRef,
            uuid,
          ),
          from: playerDataProvider,
          name: r'playerDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerDataHash,
          dependencies: PlayerDataFamily._dependencies,
          allTransitiveDependencies:
              PlayerDataFamily._allTransitiveDependencies,
          uuid: uuid,
        );

  PlayerDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
  }) : super.internal();

  final String uuid;

  @override
  Override overrideWith(
    FutureOr<PlayerData> Function(PlayerDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerDataProvider._internal(
        (ref) => create(ref as PlayerDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PlayerData> createElement() {
    return _PlayerDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerDataProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlayerDataRef on AutoDisposeFutureProviderRef<PlayerData> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _PlayerDataProviderElement
    extends AutoDisposeFutureProviderElement<PlayerData> with PlayerDataRef {
  _PlayerDataProviderElement(super.provider);

  @override
  String get uuid => (origin as PlayerDataProvider).uuid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

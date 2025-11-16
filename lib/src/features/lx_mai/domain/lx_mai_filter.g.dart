// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lx_mai_filter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredRecordListHash() =>
    r'43a0f2bbfe722ca49a9b709b9e6ed0bccb88728a';

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

/// See also [filteredRecordList].
@ProviderFor(filteredRecordList)
const filteredRecordListProvider = FilteredRecordListFamily();

/// See also [filteredRecordList].
class FilteredRecordListFamily extends Family<AsyncValue<List<SongScore>>> {
  /// See also [filteredRecordList].
  const FilteredRecordListFamily();

  /// See also [filteredRecordList].
  FilteredRecordListProvider call(
    String uuid,
  ) {
    return FilteredRecordListProvider(
      uuid,
    );
  }

  @override
  FilteredRecordListProvider getProviderOverride(
    covariant FilteredRecordListProvider provider,
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
  String? get name => r'filteredRecordListProvider';
}

/// See also [filteredRecordList].
class FilteredRecordListProvider
    extends AutoDisposeFutureProvider<List<SongScore>> {
  /// See also [filteredRecordList].
  FilteredRecordListProvider(
    String uuid,
  ) : this._internal(
          (ref) => filteredRecordList(
            ref as FilteredRecordListRef,
            uuid,
          ),
          from: filteredRecordListProvider,
          name: r'filteredRecordListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filteredRecordListHash,
          dependencies: FilteredRecordListFamily._dependencies,
          allTransitiveDependencies:
              FilteredRecordListFamily._allTransitiveDependencies,
          uuid: uuid,
        );

  FilteredRecordListProvider._internal(
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
    FutureOr<List<SongScore>> Function(FilteredRecordListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilteredRecordListProvider._internal(
        (ref) => create(ref as FilteredRecordListRef),
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
    return _FilteredRecordListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredRecordListProvider && other.uuid == uuid;
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
mixin FilteredRecordListRef on AutoDisposeFutureProviderRef<List<SongScore>> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _FilteredRecordListProviderElement
    extends AutoDisposeFutureProviderElement<List<SongScore>>
    with FilteredRecordListRef {
  _FilteredRecordListProviderElement(super.provider);

  @override
  String get uuid => (origin as FilteredRecordListProvider).uuid;
}

String _$filteredSongListHash() => r'57308891f7ab8fa764a01fed8ab0e2add595dc86';

/// See also [filteredSongList].
@ProviderFor(filteredSongList)
final filteredSongListProvider =
    AutoDisposeFutureProvider<List<SongInfo>>.internal(
  filteredSongList,
  name: r'filteredSongListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredSongListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredSongListRef = AutoDisposeFutureProviderRef<List<SongInfo>>;
String _$lxMaiFilterHash() => r'7b3047c7d42a528eee556cfc48eae6af019da042';

/// See also [LxMaiFilter].
@ProviderFor(LxMaiFilter)
final lxMaiFilterProvider =
    AutoDisposeNotifierProvider<LxMaiFilter, MaiSongFilterData>.internal(
  LxMaiFilter.new,
  name: r'lxMaiFilterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$lxMaiFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LxMaiFilter = AutoDisposeNotifier<MaiSongFilterData>;
String _$lxMaiRecordSearchKeywordHash() =>
    r'7f237305825f592410d71d19f6342d7a4f66dc55';

/// See also [LxMaiRecordSearchKeyword].
@ProviderFor(LxMaiRecordSearchKeyword)
final lxMaiRecordSearchKeywordProvider =
    AutoDisposeNotifierProvider<LxMaiRecordSearchKeyword, String>.internal(
  LxMaiRecordSearchKeyword.new,
  name: r'lxMaiRecordSearchKeywordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lxMaiRecordSearchKeywordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LxMaiRecordSearchKeyword = AutoDisposeNotifier<String>;
String _$lxMaiSongSearchKeywordHash() =>
    r'bcafb32a137914dbc7b7ca6de058fa98f593c853';

/// See also [LxMaiSongSearchKeyword].
@ProviderFor(LxMaiSongSearchKeyword)
final lxMaiSongSearchKeywordProvider =
    AutoDisposeNotifierProvider<LxMaiSongSearchKeyword, String>.internal(
  LxMaiSongSearchKeyword.new,
  name: r'lxMaiSongSearchKeywordProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lxMaiSongSearchKeywordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LxMaiSongSearchKeyword = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

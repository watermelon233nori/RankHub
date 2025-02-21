// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_source_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dataSourceManagerHash() => r'585110a4c9f769528c9b688ade67f958667aadab';

/// See also [DataSourceManager].
@ProviderFor(DataSourceManager)
final dataSourceManagerProvider = AutoDisposeAsyncNotifierProvider<
    DataSourceManager,
    ({Map<String, DataSourceProvider> sources, String? activeSource})>.internal(
  DataSourceManager.new,
  name: r'dataSourceManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dataSourceManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DataSourceManager = AutoDisposeAsyncNotifier<
    ({Map<String, DataSourceProvider> sources, String? activeSource})>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

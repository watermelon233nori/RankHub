// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strategy_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$strategyManagerHash() => r'90e37f933c0fc35a98422efd549c695f3b73a8b4';

/// See also [StrategyManager].
@ProviderFor(StrategyManager)
final strategyManagerProvider = AutoDisposeAsyncNotifierProvider<
    StrategyManager,
    ({Map<String, ModeStrategy> strategies, String? activeStrategy})>.internal(
  StrategyManager.new,
  name: r'strategyManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$strategyManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StrategyManager = AutoDisposeAsyncNotifier<
    ({Map<String, ModeStrategy> strategies, String? activeStrategy})>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

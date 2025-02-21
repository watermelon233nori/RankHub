// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerManagerHash() => r'b5ec9dd6dffeb3477c92023be4c0bca0f7a092d2';

/// See also [PlayerManager].
@ProviderFor(PlayerManager)
final playerManagerProvider = AutoDisposeAsyncNotifierProvider<PlayerManager,
    (List<Player> players, String? activePlayerId)>.internal(
  PlayerManager.new,
  name: r'playerManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playerManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayerManager
    = AutoDisposeAsyncNotifier<(List<Player> players, String? activePlayerId)>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

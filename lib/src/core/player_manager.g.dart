// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sharedPreferencesHash() => r'6c03b929f567eb6f97608f6208b95744ffee3bfd';

/// See also [sharedPreferences].
@ProviderFor(sharedPreferences)
final sharedPreferencesProvider =
    AutoDisposeFutureProvider<SharedPreferences>.internal(
  sharedPreferences,
  name: r'sharedPreferencesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sharedPreferencesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SharedPreferencesRef = AutoDisposeFutureProviderRef<SharedPreferences>;
String _$playerBoxHash() => r'2828a4af2c34792cf0bf7679cd9e5f5b78988195';

/// See also [playerBox].
@ProviderFor(playerBox)
final playerBoxProvider = AutoDisposeFutureProvider<Box<Player>>.internal(
  playerBox,
  name: r'playerBoxProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playerBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PlayerBoxRef = AutoDisposeFutureProviderRef<Box<Player>>;
String _$playerManagerHash() => r'4fc5ccb9488b567ebd25682e949019a6e230d4e3';

/// See also [PlayerManager].
@ProviderFor(PlayerManager)
final playerManagerProvider = AutoDisposeAsyncNotifierProvider<PlayerManager,
    ({List<Player> players, String? activePlayerId})>.internal(
  PlayerManager.new,
  name: r'playerManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playerManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayerManager = AutoDisposeAsyncNotifier<
    ({List<Player> players, String? activePlayerId})>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

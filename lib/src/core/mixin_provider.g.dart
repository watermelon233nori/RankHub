// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixin_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playerStrategyMixinHash() =>
    r'1171dde38dc28a90a7e65198557759b7d1495c67';

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

/// See also [playerStrategyMixin].
@ProviderFor(playerStrategyMixin)
const playerStrategyMixinProvider = PlayerStrategyMixinFamily();

/// See also [playerStrategyMixin].
class PlayerStrategyMixinFamily
    extends Family<AsyncValue<({ModeStrategy strategy, Player player})>> {
  /// See also [playerStrategyMixin].
  const PlayerStrategyMixinFamily();

  /// See also [playerStrategyMixin].
  PlayerStrategyMixinProvider call(
    String? playerId,
  ) {
    return PlayerStrategyMixinProvider(
      playerId,
    );
  }

  @override
  PlayerStrategyMixinProvider getProviderOverride(
    covariant PlayerStrategyMixinProvider provider,
  ) {
    return call(
      provider.playerId,
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
  String? get name => r'playerStrategyMixinProvider';
}

/// See also [playerStrategyMixin].
class PlayerStrategyMixinProvider extends AutoDisposeFutureProvider<
    ({ModeStrategy strategy, Player player})> {
  /// See also [playerStrategyMixin].
  PlayerStrategyMixinProvider(
    String? playerId,
  ) : this._internal(
          (ref) => playerStrategyMixin(
            ref as PlayerStrategyMixinRef,
            playerId,
          ),
          from: playerStrategyMixinProvider,
          name: r'playerStrategyMixinProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$playerStrategyMixinHash,
          dependencies: PlayerStrategyMixinFamily._dependencies,
          allTransitiveDependencies:
              PlayerStrategyMixinFamily._allTransitiveDependencies,
          playerId: playerId,
        );

  PlayerStrategyMixinProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.playerId,
  }) : super.internal();

  final String? playerId;

  @override
  Override overrideWith(
    FutureOr<({ModeStrategy strategy, Player player})> Function(
            PlayerStrategyMixinRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PlayerStrategyMixinProvider._internal(
        (ref) => create(ref as PlayerStrategyMixinRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        playerId: playerId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<({ModeStrategy strategy, Player player})>
      createElement() {
    return _PlayerStrategyMixinProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerStrategyMixinProvider && other.playerId == playerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, playerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PlayerStrategyMixinRef
    on AutoDisposeFutureProviderRef<({ModeStrategy strategy, Player player})> {
  /// The parameter `playerId` of this provider.
  String? get playerId;
}

class _PlayerStrategyMixinProviderElement
    extends AutoDisposeFutureProviderElement<
        ({ModeStrategy strategy, Player player})> with PlayerStrategyMixinRef {
  _PlayerStrategyMixinProviderElement(super.provider);

  @override
  String? get playerId => (origin as PlayerStrategyMixinProvider).playerId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

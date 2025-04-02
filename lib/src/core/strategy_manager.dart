import 'package:rank_hub/src/core/abstract/mode_strategy.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_strategy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'strategy_manager.g.dart';

@riverpod
class StrategyManager extends _$StrategyManager {
  static const _currentStrategyKey = 'currentStrategy';

  @override
  Future<({Map<String, ModeStrategy> strategies, String? activeStrategy})>
      build() async {
    final prefs = await SharedPreferences.getInstance();
    final savedActiveStrategy = prefs.getString(_currentStrategyKey);

    return (
      strategies: {"LxMai": LxMaiStrategy()},
      activeStrategy: savedActiveStrategy
    );
  }

  void registerDataSource(ModeStrategy strategy,
      {bool setActiveIfNone = false}) {
    final currentState = state.asData?.value;
    if (currentState == null) return;

    if (currentState.strategies.containsKey(strategy.getModeName())) {
      return;
    }

    final updatedStrategy = currentState.activeStrategy ??
        (setActiveIfNone ? strategy.getModeName() : null);

    state = AsyncValue.data((
      strategies: {
        ...currentState.strategies,
        strategy.getModeName(): strategy,
      },
      activeStrategy: updatedStrategy,
    ));

    if (updatedStrategy != null) {
      _saveActiveStrategy(updatedStrategy);
    }
  }

  void unregisterStrategy(String strategyName) {
    final currentState = state.asData?.value;
    if (currentState == null || !currentState.strategies.containsKey(strategyName)) {
      return;
    }

    final newStrategy = {...currentState.strategies}..remove(strategyName);
    final newActiveStrategy = currentState.activeStrategy == strategyName
        ? (newStrategy.isNotEmpty ? newStrategy.keys.first : null)
        : currentState.activeStrategy;

    state =
        AsyncValue.data((strategies: newStrategy, activeStrategy: newActiveStrategy));

    if (newActiveStrategy != null) {
      _saveActiveStrategy(newActiveStrategy);
    } else {
      _removeActiveStrategy();
    }
  }

  void setActiveStrategy(String strategyName) {
    final currentState = state.asData?.value;
    if (currentState == null || !currentState.strategies.containsKey(strategyName)) {
      return;
    }

    state = AsyncValue.data(
        (strategies: currentState.strategies, activeStrategy: strategyName));

    _saveActiveStrategy(strategyName);
  }

  bool isRegistered(String strategyName) {
    final currentState = state.asData?.value;
    return currentState?.strategies.containsKey(strategyName) ?? false;
  }

  ModeStrategy? getStrategy(String strategyName) {
    final currentState = state.asData?.value;
    return currentState?.strategies[strategyName];
  }
  
  Future<void> _saveActiveStrategy(String strategyName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentStrategyKey, strategyName);
  }

  Future<void> _removeActiveStrategy() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentStrategyKey);
  }
}

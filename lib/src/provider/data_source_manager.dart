import 'package:rank_hub/src/core/abstract/data_source_provider.dart';
import 'package:rank_hub/src/provider/lx_mai_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'data_source_manager.g.dart';

@riverpod
class DataSourceManager extends _$DataSourceManager {
  static const _currentProviderKey = 'currentProvider';

  @override
  Future<({Map<String, DataSourceProvider> sources, String? activeSource})>
      build() async {
    final prefs = await SharedPreferences.getInstance();
    final savedActiveSource = prefs.getString(_currentProviderKey);

    return (
      sources: {"LxMai": LxMaiProvider()},
      activeSource: savedActiveSource
    );
  }

  void registerDataSource(DataSourceProvider provider,
      {bool setActiveIfNone = false}) {
    final currentState = state.asData?.value;
    if (currentState == null) return;

    if (currentState.sources.containsKey(provider.getProviderName())) {
      return;
    }

    final updatedActiveSource = currentState.activeSource ??
        (setActiveIfNone ? provider.getProviderName() : null);

    state = AsyncValue.data((
      sources: {
        ...currentState.sources,
        provider.getProviderName(): provider,
      },
      activeSource: updatedActiveSource,
    ));

    if (updatedActiveSource != null) {
      _saveActiveSource(updatedActiveSource);
    }
  }

  void unregisterDataSource(String providerName) {
    final currentState = state.asData?.value;
    if (currentState == null || !currentState.sources.containsKey(providerName)) {
      return;
    }

    final newSources = {...currentState.sources}..remove(providerName);
    final newActiveSource = currentState.activeSource == providerName
        ? (newSources.isNotEmpty ? newSources.keys.first : null)
        : currentState.activeSource;

    state =
        AsyncValue.data((sources: newSources, activeSource: newActiveSource));

    if (newActiveSource != null) {
      _saveActiveSource(newActiveSource);
    } else {
      _removeActiveSource();
    }
  }

  void setActiveDataSource(String providerName) {
    final currentState = state.asData?.value;
    if (currentState == null || !currentState.sources.containsKey(providerName)) {
      return;
    }

    state = AsyncValue.data(
        (sources: currentState.sources, activeSource: providerName));

    _saveActiveSource(providerName);
  }

  bool isRegistered(String providerName) {
    final currentState = state.asData?.value;
    return currentState?.sources.containsKey(providerName) ?? false;
  }

  DataSourceProvider? getDataSource(String providerName) {
    final currentState = state.asData?.value;
    return currentState?.sources[providerName];
  }
  
  Future<void> _saveActiveSource(String providerName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentProviderKey, providerName);
  }

  Future<void> _removeActiveSource() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentProviderKey);
  }
}

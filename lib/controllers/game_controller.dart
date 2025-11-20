import 'package:get/get.dart';
import 'package:rank_hub/models/platform.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/data/platforms_data.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 游戏控制器 - 管理游戏选择和平台关联
class GameController extends GetxController {
  final PlatformRegistry _platformRegistry = PlatformRegistry();
  final AccountController _accountController = Get.find<AccountController>();

  static const String _selectedWikiGameKey = 'selected_wiki_game_id';
  static const String _selectedRankGameKey = 'selected_rank_game_id';

  // 当前选中的游戏
  final Rx<IGame?> _selectedWikiGame = Rx<IGame?>(null);
  final Rx<IGame?> _selectedRankGame = Rx<IGame?>(null);

  IGame? get selectedWikiGame => _selectedWikiGame.value;
  IGame? get selectedRankGame => _selectedRankGame.value;

  @override
  void onInit() {
    super.onInit();

    // 监听当前账号变化，自动更新游戏列表
    ever(_accountController.currentAccountRx, (Account? account) {
      _onAccountChanged(account);
    });

    // 初始化
    _onAccountChanged(_accountController.currentAccount);
  }

  /// 账号变化时的处理
  Future<void> _onAccountChanged(Account? account) async {
    if (account == null) {
      // 没有账号，清空选择
      _selectedWikiGame.value = null;
      _selectedRankGame.value = null;
      return;
    }

    // 获取账号对应的平台
    final platform = _platformRegistry.getPlatformByType(account.platform);
    if (platform == null) {
      _selectedWikiGame.value = null;
      _selectedRankGame.value = null;
      return;
    }

    // 获取平台的游戏列表
    final games = platform.getEnabledGames();
    if (games.isEmpty) {
      _selectedWikiGame.value = null;
      _selectedRankGame.value = null;
      return;
    }

    // 尝试从 SharedPreferences 恢复上次选择的游戏
    final prefs = await SharedPreferences.getInstance();
    final savedWikiGameId = prefs.getString(_selectedWikiGameKey);
    final savedRankGameId = prefs.getString(_selectedRankGameKey);

    // 恢复 Wiki 游戏
    if (savedWikiGameId != null) {
      final savedGame = games.firstWhereOrNull((g) => g.id == savedWikiGameId);
      if (savedGame != null) {
        _selectedWikiGame.value = savedGame;
      }
    }

    // 如果没有恢复成功，默认选择第一个游戏
    if (_selectedWikiGame.value == null ||
        !games.contains(_selectedWikiGame.value)) {
      _selectedWikiGame.value = games.first;
      await _saveWikiGameId(games.first.id);
    }

    // 恢复 Rank 游戏
    if (savedRankGameId != null) {
      final savedGame = games.firstWhereOrNull((g) => g.id == savedRankGameId);
      if (savedGame != null) {
        _selectedRankGame.value = savedGame;
      }
    }

    // 如果没有恢复成功，默认选择第一个游戏
    if (_selectedRankGame.value == null ||
        !games.contains(_selectedRankGame.value)) {
      _selectedRankGame.value = games.first;
      await _saveRankGameId(games.first.id);
    }
  }

  /// 获取当前可用的游戏列表（基于当前账号的平台）
  List<IGame> getAvailableGames() {
    final account = _accountController.currentAccount;
    if (account == null) return [];

    final platform = _platformRegistry.getPlatformByType(account.platform);
    if (platform == null) return [];

    return platform.getEnabledGames();
  }

  /// 选择Wiki游戏
  Future<void> selectWikiGame(IGame? game) async {
    if (game == null) return;
    _selectedWikiGame.value = game;
    await _saveWikiGameId(game.id);
    game.onSelected();
  }

  /// 选择Rank游戏
  Future<void> selectRankGame(IGame? game) async {
    if (game == null) return;
    _selectedRankGame.value = game;
    await _saveRankGameId(game.id);
    game.onSelected();
  }

  /// 保存Wiki游戏ID
  Future<void> _saveWikiGameId(String gameId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedWikiGameKey, gameId);
  }

  /// 保存Rank游戏ID
  Future<void> _saveRankGameId(String gameId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_selectedRankGameKey, gameId);
  }

  /// 获取当前账号的平台
  IPlatform? getCurrentPlatform() {
    final account = _accountController.currentAccount;
    if (account == null) return null;
    return _platformRegistry.getPlatformByType(account.platform);
  }
}

import 'package:get/get.dart';
import 'package:rank_hub/models/platform.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/data/platforms_data.dart';
import 'package:rank_hub/controllers/account_controller.dart';

/// 游戏控制器 - 管理游戏选择和平台关联
class GameController extends GetxController {
  final PlatformRegistry _platformRegistry = PlatformRegistry();
  final AccountController _accountController = Get.find<AccountController>();

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
  void _onAccountChanged(Account? account) {
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

    // 默认选择第一个游戏（如果当前没有选择或选择不在列表中）
    if (_selectedWikiGame.value == null ||
        !games.contains(_selectedWikiGame.value)) {
      _selectedWikiGame.value = games.first;
    }

    if (_selectedRankGame.value == null ||
        !games.contains(_selectedRankGame.value)) {
      _selectedRankGame.value = games.first;
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
  void selectWikiGame(IGame? game) {
    if (game == null) return;
    _selectedWikiGame.value = game;
    game.onSelected();
  }

  /// 选择Rank游戏
  void selectRankGame(IGame? game) {
    if (game == null) return;
    _selectedRankGame.value = game;
    game.onSelected();
  }

  /// 获取当前账号的平台
  IPlatform? getCurrentPlatform() {
    final account = _accountController.currentAccount;
    if (account == null) return null;
    return _platformRegistry.getPlatformByType(account.platform);
  }
}

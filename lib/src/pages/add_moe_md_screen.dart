import 'package:flutter/material.dart';
import 'package:rank_hub/src/model/musedash/md_player_info.dart';
import 'package:rank_hub/src/provider/moe_md_provider.dart';

class AddMoeMdScreen extends StatefulWidget {
  final MoeMdProvider provider;

  const AddMoeMdScreen({super.key, required this.provider});

  @override
  State<AddMoeMdScreen> createState() => _AddMoeMdScreenState();
}

class _AddMoeMdScreenState extends State<AddMoeMdScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  bool _isLoading = false;
  bool _isSuccess = false;
  MdPlayerInfo? _playerData;

  Future<void> _addPlayer() async {
    setState(() => _isLoading = true);
    try {
      final player =
          await widget.provider.addPlayer(_textEditingController.text);
      setState(() {
        _playerData = player;
        _isSuccess = true;
      });
    } on Exception catch (e) {
      _showErrorDialog(e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('错误'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 251, 1, 1),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // 头部 Banner
            const SizedBox(
              width: double.infinity,
              child: Image(
                image: AssetImage("assets/images/musedash_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(32)), color: Theme.of(context).cardColor),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _isSuccess
                          ? Text(
                              '玩家数据已添加：${_playerData?.nickname ?? ''}',
                              key: const ValueKey('successText'),
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )
                          : const Text(
                              '绑定玩家到 RankHub',
                              key: ValueKey('titleText'),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                    ),
                    const SizedBox(height: 32),
                    if (!_isSuccess)
                      TextField(
                        enabled: !_isLoading,
                        controller: _textEditingController,
                        focusNode: _focusNode,
                        textInputAction: TextInputAction.go,
                        onSubmitted: (_) => _addPlayer(),
                        decoration: const InputDecoration(
                          labelText: '玩家 UUID',
                          filled: true,
                        ),
                      )
                    else
                      ElevatedButton(
                        onPressed: () => Navigator.of(context)
                            .popUntil(ModalRoute.withName('/')),
                        child: const Text('完成'),
                      ),
                    const SizedBox(height: 32),
                    if (!_isSuccess)
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _addPlayer,
                          child: _isLoading
                              ? const SizedBox(
                                  height: 16,
                                  width: 16,
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2),
                                )
                              : const Text('添加'),
                        ),
                      ),
                    Spacer(),
                    SafeArea(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.arrow_back),
                              SizedBox(width: 8),
                              Text("返回"),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).popUntil(ModalRoute.withName('/')),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("通过玩家名搜索"),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

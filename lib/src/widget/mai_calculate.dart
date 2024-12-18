import 'package:flutter/material.dart';
import 'package:rank_hub/src/model/maimai/song_notes.dart';

class MaiTapGreatCalculator extends StatefulWidget {
  const MaiTapGreatCalculator({super.key, required this.notes});

  final SongNotes notes;

  @override
  _MaiTapGreatCalculatorState createState() => _MaiTapGreatCalculatorState();
}

class _MaiTapGreatCalculatorState extends State<MaiTapGreatCalculator> {
  final TextEditingController _targetRateController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double? _tapGreatTolerance;
  late final double _perfectBreakInTapGreat;
  late final double _greatBreakInTapGreat;

  @override
  void initState() {
    super.initState();

    final totalNotes =
        widget.notes.tap + widget.notes.touch + (2 * widget.notes.hold) + (3 * widget.notes.slide) + (5 * widget.notes.breakCount);
    final x = 1 / totalNotes;
    final y = 1 / widget.notes.breakCount / 100;

    _perfectBreakInTapGreat =
        (((5 * x + y) - (5 * x + 0.5 * y)) / (0.2 * x)) / 2;
    _greatBreakInTapGreat =
        (((5 * x + y) - (3 * x + 0.4 * y)) / (0.2 * x)) / 2; //Sorry I will fix this
  }

  void _setTargetRate(String rate) {
    _targetRateController.text = rate;
    _calculate();
  }

  void _clearInput() {
    _targetRateController.clear();
    setState(() {
      _tapGreatTolerance = null;
    });
  }

  void _calculate() {
    focusNode.unfocus();
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final targetRate = double.parse(_targetRateController.text);

    final totalNotes =
        widget.notes.tap + widget.notes.touch + (2 * widget.notes.hold) + (3 * widget.notes.slide) + (5 * widget.notes.breakCount);
    final x = 1 / totalNotes;

    setState(() {
      _tapGreatTolerance = ((1.01 - targetRate / 100) / x) * 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              onTapOutside: (event) {
                focusNode.unfocus();
              },
              focusNode: focusNode,
              controller: _targetRateController,
              decoration: InputDecoration(
                labelText: '目标达成率 (%)',
                border: OutlineInputBorder(),
                suffixIcon: _targetRateController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: _clearInput,
                      )
                    : null,
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: (value) {
                final targetRate = double.tryParse(value ?? '');
                if (value == null || value.isEmpty) {
                  return '请输入目标达成率';
                } else if (targetRate == null ||
                    targetRate < 0 ||
                    targetRate > 101) {
                  return '目标达成率必须在 0 到 101 之间';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            // Adding chips for quick fill
            Wrap(
              spacing: 8.0,
              children: [
                _buildChip('SSS+', 100.5),
                _buildChip('SSS', 100.0),
                _buildChip('SS+', 99.5),
                _buildChip('SS', 99.0),
                _buildChip('S+', 98.0),
                _buildChip('S', 97.0),
              ],
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: _calculate,
              child: Text('计算'),
            ),
            SizedBox(height: 16),
            if (_tapGreatTolerance != null)
              Text(
                'TAP GREAT 容错: ${_tapGreatTolerance!.toStringAsFixed(2)}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            Text(
              '一个 BREAK PERFECT (50落) 相当于: ${_perfectBreakInTapGreat.toStringAsFixed(2)} 个 TAP GREAT',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '一个 BREAK GREAT (2000粉) 相当于: ${_greatBreakInTapGreat.toStringAsFixed(2)} 个 TAP GREAT',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text(
              '结果仅供参考, 实际数据以游戏内为准',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 8, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, double value) {
    return GestureDetector(
        onTap: () {
          _setTargetRate(value.toStringAsFixed(1));
        },
        child: Chip(
          label: Text(label),
        ));
  }
}

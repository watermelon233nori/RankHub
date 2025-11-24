import 'dart:typed_data';

import 'package:rank_hub/modules/phigros/services/ase_decrypt.dart';
import 'package:rank_hub/modules/phigros/services/byte_reader.dart';
import 'package:rank_hub/modules/phigros/services/save_file_reader.dart';

class DecryptSave {
  final SaveFileReader saveFile;
  final Uint8List key;
  final Uint8List iv;

  final Map<String, List<double>> chartConstantList;
  final Map<String, dynamic> songInfoList;

  DecryptSave(
    String url,
    this.key,
    this.iv,
    this.chartConstantList,
    this.songInfoList,
  ) : saveFile = SaveFileReader(url);

  List<Map<String, dynamic>> decryptRecords() {
    final encrypted = saveFile.readRecord();
    final decrypted = aesCbcDecrypt(key, iv, encrypted);

    final reader = ByteReader(decrypted);

    final count = reader.readVarShort();
    List<Map<String, dynamic>> records = [];

    for (int i = 0; i < count; i++) {
      String songId = reader.readString();
      songId = songId.substring(0, songId.length - 2);

      final r = reader.readRecord(songId, chartConstantList, songInfoList);
      if (r != null) records.addAll(r);
    }

    return records;
  }

  Map<String, dynamic> decryptProgress() {
    final encrypted = saveFile.readProgress().sublist(1);
    final decrypted = aesCbcDecrypt(key, iv, encrypted);

    final reader = ByteReader(decrypted);
    return reader.readProgress();
  }
}

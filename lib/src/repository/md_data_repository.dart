import 'package:rank_hub/src/abstract/data_repository.dart';
import 'package:rank_hub/src/model/musedash/md_album.dart';
import 'package:rank_hub/src/model/musedash/md_music.dart';

class MdAlbumRepository extends DataRepository<MdAlbum> {
  MdAlbumRepository(super.box);


  List<MdMusic> getAllMusic() {
    return box.values.expand<MdMusic>((album) => album.musicList).toList();
  }

  MdMusic? getMusicByUid(String uid) {
    return box.values.expand<MdMusic>((album) => album.musicList).where((music) => music.uid == uid).toList().firstOrNull;
  }

  List<MdMusic> searchMusicByName(String name) {
    return box.values.expand<MdMusic>((album) => album.musicList).where((music) => music.name.contains(name)).toList();
  }

  List<MdAlbum> getAllAlbums() {
    return box.values.toList();
  }

  List<MdAlbum> getAlbumsByTag(String tag) {
    return box.values.where((album) => album.tag == tag).toList();
  }

  MdAlbum? getAlbumById(String id) {
    return box.get(id);
  }

  List<MdAlbum> getAlbumListWithoutMusic() {
    return box.values.map((album) => MdAlbum(jsonKey: album.jsonKey, tag: album.tag, title: album.title, localized: album.localized, musicList: [])).toList();
  }
}
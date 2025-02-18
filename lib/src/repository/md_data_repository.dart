import 'package:hive/hive.dart';
import 'package:rank_hub/src/abstract/data_repository.dart';
import 'package:rank_hub/src/model/musedash/md_album.dart';
import 'package:rank_hub/src/model/musedash/md_music.dart';

class MdAlbumRepository extends DataRepository<MdAlbum> {
  final Box<MdAlbum> albumBox;

  MdAlbumRepository(this.albumBox) : super(albumBox);

  List<MdMusic> getAllMusic() {
    return albumBox.values.expand<MdMusic>((album) => album.musicList).toList();
  }

  List<MdAlbum> getAllAlbums() {
    return albumBox.values.toList();
  }

  List<MdAlbum> getAlbumsByTag(String tag) {
    return albumBox.values.where((album) => album.tag == tag).toList();
  }

  MdAlbum? getAlbumById(String id) {
    return albumBox.get(id);
  }

  List<MdAlbum> getAlbumListWithoutMusic() {
    return albumBox.values.map((album) => MdAlbum(jsonKey: album.jsonKey, tag: album.tag, title: album.title, localized: album.localized, musicList: [])).toList();
  }
}
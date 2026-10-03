import 'package:appwordcup2026/data/services/api/mappers/album_position_api_model_mapper.dart';
import 'package:appwordcup2026/data/services/api/mappers/team_album_group_api_model_mapper.dart';
import 'package:appwordcup2026/data/services/api/model/album/album_api_model.dart';
import 'package:appwordcup2026/domain/models/album/album.dart';

extension AlbumApiModelMapper on AlbumApiModel {
  Album toDomain() => Album(
    teams: teams.map((t) => t.toDomain()).toList(),
    loose: loose.map((l) => l.toDomain()).toList(),
  );
}

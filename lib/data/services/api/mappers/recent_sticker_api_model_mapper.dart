import 'package:appwordcup2026/data/services/api/mappers/team_api_model_maooer.dart';
import 'package:appwordcup2026/data/services/api/model/album/recent_sticker_api_model.dart';
import 'package:appwordcup2026/domain/models/album/recent_sticker.dart';

extension RecentStickerApiModelMapper on RecentStickerApiModel {
  RecentSticker toDomain() => RecentSticker(
    code: code,
    number: number,
    repeated: repeated,
    team: team?.toDomain(),
  );
}
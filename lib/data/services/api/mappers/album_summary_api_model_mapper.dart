import 'package:appwordcup2026/data/services/api/model/album/album_summary_api_model.dart';
import 'package:appwordcup2026/domain/models/album/album_summary.dart';

extension AlbumSummaryApiModelMapper on AlbumSummaryApiModel {
  AlbumSummary toDomain() =>
      AlbumSummary(total: total, missing: missing, repeated: repeated);
}
import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/domain/models/album/album_summary.dart';
import 'package:appwordcup2026/domain/models/album/recent_sticker.dart';

abstract interface class AlbumRepository {
  Future<Result<AlbumSummary>> getSummary();

  Future<Result<List<RecentSticker>>> getRecentStickers();
}
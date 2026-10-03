import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/domain/models/album/album.dart';
import 'package:appwordcup2026/domain/models/album/album_summary.dart';
import 'package:appwordcup2026/domain/models/album/recent_sticker.dart';
import 'package:appwordcup2026/domain/models/album/sticker_status.dart';

abstract interface class AlbumRepository {
  Future<Result<Album>> getAlbum({StickerStatus? status, String? team});

  Future<Result<AlbumSummary>> getSummary();

  Future<Result<List<RecentSticker>>> getRecentStickers();

  Future<Result<void>> registerSticker({
    required String code,
    required int quantity,
  });

  Future<Result<void>> updateStickerQuantity({
    required String code,
    required int quantity,
  });

  Future<Result<void>> removeSticker(String code);
}

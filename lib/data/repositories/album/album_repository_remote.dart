import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/data/repositories/album/album_repository.dart';
import 'package:appwordcup2026/data/services/api/album_api.dart';
import 'package:appwordcup2026/data/services/api/mappers/album_summary_api_model_mapper.dart';
import 'package:appwordcup2026/data/services/api/mappers/dio_exception_mapper.dart';
import 'package:appwordcup2026/data/services/api/mappers/recent_sticker_api_model_mapper.dart';
import 'package:appwordcup2026/domain/models/album/album_summary.dart';
import 'package:appwordcup2026/domain/models/album/recent_sticker.dart';
import 'package:dio/dio.dart';

class AlbumRepositoryRemote({required final AlbumApi _albumApi})
    implements AlbumRepository {
  @override
  Future<Result<List<RecentSticker>>> getRecentStickers() async {
    try {
      final response = await _albumApi.getRecent();
      return Result.ok(response.stickers.map((sticker) => sticker.toDomain()).toList());
    } on DioException catch (error, stackTrace) {
      return Result.error(error.toAppException(stackTrace));
    }
  }

  @override
  Future<Result<AlbumSummary>> getSummary() async {
    try {
      final summary = await _albumApi.getSummary();
      return Result.ok(summary.toDomain());
    } on DioException catch (error, stackTrace) {
      return Result.error(error.toAppException(stackTrace));
    }
  }
}
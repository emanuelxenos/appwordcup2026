import 'package:equatable/equatable.dart';
import 'package:appwordcup2026/domain/models/album/album_position.dart';
import 'package:appwordcup2026/domain/models/team/team.dart';

class const TeamAlbumGroup({
  required final Team team,
  required final List<AlbumPosition> stickers,
}) extends Equatable {
  @override
  List<Object?> get props => [team, stickers];
}

import 'package:appwordcup2026/data/services/api/model/team/team_api_model.dart';
import 'package:appwordcup2026/domain/models/team/team.dart';

extension TeamApiModelMapper on TeamApiModel {
  Team toDomain() => Team(
    code: code,
    name: name,
    flagUrl: flagUrl,
    primaryColor: int.parse(primaryColor.replaceFirst('#', 'FF'), radix: 16),
  );
}

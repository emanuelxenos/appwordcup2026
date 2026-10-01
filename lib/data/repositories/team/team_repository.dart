import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/domain/models/team/team.dart';

abstract interface class TeamRepository {
  Future<Result<List<Team>>>  getTeams();
}
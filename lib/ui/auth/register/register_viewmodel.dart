
import 'package:appwordcup2026/core/exceptions/command.dart';
import 'package:appwordcup2026/core/logging/app_logger.dart';
import 'package:appwordcup2026/core/result.dart';
import 'package:appwordcup2026/core/view_model_initializable.dart';
import 'package:appwordcup2026/data/repositories/auth/auth_repository.dart';
import 'package:appwordcup2026/data/repositories/team/team_repository.dart';
import 'package:appwordcup2026/domain/models/team/team.dart';
import 'package:material_ui/material_ui.dart';

class  RegisterViewModel({
 required final AuthRepository _authRepository, 
 required final TeamRepository _teamRepository
 })
 extends ChangeNotifier implements ViewModelInitializable{
  final _log = AppLogger('RegisterViewModel');

  late final loadTeams = Command0(_loadTeams);

  List<Team> _teams = [];

  List<Team> get teams => _teams;

  
  @override
  void init() {
    loadTeams.execute();
  }

  List<Team> teamMatching(String term){
    final query = term.trim().toLowerCase();
    if(query.isEmpty) return _teams;
    return _teams
        .where(
          (team) =>
              team.name.toLowerCase().contains(query) ||
              team.code.toLowerCase().contains(query),
        )
        .toList();
  }

  Future<Result<void>> _loadTeams() async{
    final teams = await _teamRepository.getTeams();
    switch(teams) {
      case Ok<List<Team>>(:final value):
        _teams = value;
        return Result.done;
      case Error<List<Team>>(:final error):
        _log.error(
          'Falha ao carregar catalogo de seleção',
          error: error,
          stackTrace: error.stackTrace, 
        );
        return Result.error(error);
    }
  }

}
import 'package:material_ui/material_ui.dart';
import 'package:appwordcup2026/ui/home/widgets/header.dart';
import 'package:appwordcup2026/ui/home/widgets/album_hero.dart';
import 'package:appwordcup2026/ui/core/theme/app_dimens.dart';

class const HomeScreen({
  super.key,
  required final String name,
  required final String initials,
}) extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(name: name, initials: initials),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.gridMargin,
            ),
            child: AlbumHero(),
          ),
        ],
      ),
    );
  }
}
import 'package:material_ui/material_ui.dart';
import 'package:appwordcup2026/ui/home/widgets/header.dart';
import 'package:appwordcup2026/ui/home/widgets/album_hero.dart';
import 'package:appwordcup2026/ui/core/theme/app_dimens.dart';
import 'package:appwordcup2026/ui/core/theme/appcolors.dart';
import 'package:appwordcup2026/ui/home/widgets/action_card.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.gridMargin,
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Row(
                  spacing: 16,
                  children: [
                    Expanded(
                      child: ActionCard(
                        icon: Icons.add_rounded,
                        bubbleColor: AppColors.red,
                        iconColor: AppColors.white,
                        title: 'ADICIONAR',
                        subTitle: 'figurinha',
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: ActionCard(
                        icon: Icons.swap_horiz_rounded,
                        bubbleColor: AppColors.yellow,
                        iconColor: AppColors.ink,
                        title: 'TROCAR',
                        subTitle: 'com amigos',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
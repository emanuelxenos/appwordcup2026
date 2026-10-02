import 'package:material_ui/material_ui.dart';
import 'package:appwordcup2026/ui/home/widgets/header.dart';
import 'package:appwordcup2026/ui/home/widgets/album_hero.dart';
import 'package:appwordcup2026/ui/core/theme/app_dimens.dart';
import 'package:appwordcup2026/ui/core/theme/appcolors.dart';
import 'package:appwordcup2026/ui/core/theme/app_text_styles.dart';
import 'package:appwordcup2026/ui/home/widgets/action_card.dart';
import 'package:appwordcup2026/ui/home/home_viewmodel.dart';
import 'package:appwordcup2026/ui/home/widgets/recent_stickers.dart';

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
              crossAxisAlignment: .start,
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
                const SizedBox(height: 36),
                Text('COLADAS RECENTEMENTE', style: AppTextStyles.overline),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _Recent(onStickerTap: (sticker) {}),
        ],
      ),
    );
  }
}

class const _Recent({
  required final ValueChanged<RecentStickerView> onStickerTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RecentStickers(
      stickers: [
        (
          code: 'BRA',
          number: 1,
          flagCode: 'BRA',
          label: 'BRA',
          teamColor: Color(0xFFFFDF00),
          teamName: 'Brasil',
          count: 1,
        ),
      ],
      onStickerTap: onStickerTap,
    );
  }
}
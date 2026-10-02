import 'package:appwordcup2026/ui/core/theme/theme.dart';
import 'package:appwordcup2026/ui/home/home_viewmodel.dart';
import 'package:appwordcup2026/ui/home/widgets/sticker_card.dart';
import 'package:material_ui/material_ui.dart';

class const RecentStickers({
  super.key,
  required final List<RecentStickerView> stickers,
  required final ValueChanged<RecentStickerView> onStickerTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138,
      child: stickers.isEmpty
          ? _Empty()
          : ListView.separated(
              scrollDirection: .horizontal,
              padding: .only(left: AppDimens.gridMargin),
              itemBuilder: (context, index) {
                final sticker = stickers[index];
                return StickerCard(
                  number: sticker.number,
                  label: sticker.label,
                  teamColor: sticker.teamColor,
                  flagCode: sticker.flagCode,
                  rare: false,
                  onTap: () => onStickerTap(sticker),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemCount: stickers.length,
            ),
    );
  }
}

class const _Empty() extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.gridMargin),
      child: Align(
        alignment: .centerLeft,
        child: Text(
          'Você ainda não colou nenhuma figurinha',
          style: AppTextStyles.footnote.copyWith(color: AppColors.grayText),
        ),
      ),
    );
  }
}

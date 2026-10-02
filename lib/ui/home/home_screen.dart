import 'package:material_ui/material_ui.dart';
import 'package:appwordcup2026/core/auth/auth_session_notifier.dart';
import 'package:appwordcup2026/ui/home/widgets/header.dart';
import 'package:appwordcup2026/ui/home/widgets/album_hero.dart';
import 'package:appwordcup2026/ui/core/theme/app_dimens.dart';
import 'package:appwordcup2026/ui/core/theme/appcolors.dart';
import 'package:appwordcup2026/ui/core/theme/app_text_styles.dart';
import 'package:appwordcup2026/ui/home/widgets/action_card.dart';
import 'package:appwordcup2026/ui/home/home_viewmodel.dart';
import 'package:appwordcup2026/ui/home/widgets/recent_stickers.dart';
import 'package:appwordcup2026/ui/home/widgets/repeated_strip.dart';
import 'package:appwordcup2026/ui/core/share/command_builder.dart';

class const HomeScreen({
  super.key,
  required final HomeViewModel viewModel,
  required final AuthSessionNotifier session,
  required final String name,
  required final String initials,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: session,
      builder: (context, _) => Scaffold(
        appBar: Header(
          name: session.user?.name ?? name,
          initials: session.isSignedIn ? session.initials : initials,
        ),
        body: RefreshIndicator(
          onRefresh: viewModel.refresh,
          child: ListenableBuilder(
            listenable: viewModel,
            builder: (context, _) => ListView(
              padding: const EdgeInsets.only(top: 8, bottom: 24),
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.gridMargin,
                  ),
                  child: _Progress(viewModel: viewModel),
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
                      Text(
                        'COLADAS RECENTEMENTE',
                        style: AppTextStyles.overline,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _Recent(viewModel: viewModel, onStickerTap: (value) {}),
                const SizedBox(height: 22),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.gridMargin,
                  ),
                  child: _Repeated(viewModel: viewModel, onTap: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class const _Recent({
  required final HomeViewModel viewModel,
  required final ValueChanged<RecentStickerView> onStickerTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommandBuilder<List<RecentStickerView>>(
      asyncCommand: viewModel.loadRecent,
      data: () => viewModel.recentStickers,
      loading: (context, loaderWidget) =>
          SizedBox(height: 138, child: loaderWidget),
      retry: () => viewModel.loadRecent.execute(),
      builder: (data) {
        return RecentStickers(stickers: data, onStickerTap: onStickerTap);
      },
    );
  }
}

class const _Progress({required final HomeViewModel viewModel})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommandBuilder(
      asyncCommand: viewModel.loadSummary,
      data: () => viewModel.progress,
      retry: () => viewModel.loadSummary.execute(),
      builder: (result) =>
          AlbumHero(collected: result.collected, total: result.total),
    );
  }
}

class const _Repeated({
  required final HomeViewModel viewModel,
  required final VoidCallback onTap,
}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel.loadSummary,
      builder: (context, _) {
        if (viewModel.progress case final progress?) {
          return RepeatedStrip(count: progress.repeated, onTap: onTap);
        }

        return const SizedBox.shrink();
      },
    );
  }
}

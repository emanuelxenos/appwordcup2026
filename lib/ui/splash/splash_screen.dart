import 'package:appwordcup2026/core/auth/auth_session_notifier.dart';
import 'package:appwordcup2026/routing/routes.dart';
import 'package:appwordcup2026/ui/core/share/app_assets.dart';
import 'package:appwordcup2026/ui/core/share/licensed_badge.dart';
import 'package:appwordcup2026/ui/core/share/logo_card.dart';
import 'package:appwordcup2026/ui/core/theme/app_text_styles.dart';
import 'package:appwordcup2026/ui/core/theme/appcolors.dart';
import 'package:appwordcup2026/ui/splash/widgets/boot_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class const SplashScreen({super.key, required final AuthSessionNotifier _sessionNotifier}) extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

late final  _boot = AnimationController(
  vsync: this,
  duration:  Duration(milliseconds: 2400),
);

@override
initState() {
  super.initState();
  widget._sessionNotifier.addListener(_exitWhenReady);
  _boot.forward().then((_) {
    _exitWhenReady();
  });
}

@override
  void dispose() {
    widget._sessionNotifier.removeListener(_exitWhenReady);
    _boot.dispose();
    super.dispose();
  }

  void _exitWhenReady() {
    if (!mounted || !_boot.isCompleted || !widget._sessionNotifier.isRestored) return; 

    widget._sessionNotifier.removeListener(_exitWhenReady);

    context.go(Routes.welcome);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: .expand,
        children: [
          SvgPicture.asset(AppAssets.patterns.paniniArcSplashSvg, fit: .cover),
          ColoredBox(color: AppColors.cream.withValues(alpha: .35)),
          Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    const LicensedBadge(),
                    const SizedBox(height: 40),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 290,
                        maxHeight: 380,
                      ),
                      child: LogoCard(),
                    ),
                    const SizedBox(height: 36),
                    Text('SEU ÁLBUM', style: AppTextStyles.display),
                    Text(
                      'OFICIAL',
                      style: AppTextStyles.display.copyWith(
                        color: AppColors.red,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 290),
                      child: SizedBox(
                        height: 72,
                        child: AnimatedBuilder(
                          animation: _boot,
                          builder: (_,_) {
                            return BootBar(progress: _boot.value);
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text('V1.0.0 - Fifa World Cup 26', style: AppTextStyles.overline),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
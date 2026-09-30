import 'package:appwordcup2026/ui/core/theme/app_text_styles.dart';
import 'package:appwordcup2026/ui/core/theme/appcolors.dart';
import 'package:material_ui/material_ui.dart';

class const LicensedBadge({ super.key }) extends StatelessWidget {

   @override
   Widget build(BuildContext context) {
       return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        decoration:ShapeDecoration(shape: StadiumBorder(), color: AppColors.ink),
        child: Text(' OFFICIAL LICENSED PRODUCT ', style: AppTextStyles.overline.copyWith(color: AppColors.cream)),
      );
  }
}
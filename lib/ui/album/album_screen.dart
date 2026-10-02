import 'package:material_ui/material_ui.dart';
import 'package:appwordcup2026/ui/album/widgets/header.dart';
import 'package:appwordcup2026/ui/album/widgets/filter_tabs.dart';

class const AlbumScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(onBack: () => Navigator.pop(context)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FilterTabs(
            total: 10,
            missing: 20,
            repeated: 30,
            selected: null,
            onSelected: (value) {
              debugPrint('Alterando a tab $value');
            },
          ),
        ),
      ),
    );
  }
}
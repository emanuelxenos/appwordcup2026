import 'package:material_ui/material_ui.dart';
import 'package:appwordcup2026/ui/album/widgets/header.dart';

class const AlbumScreen({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(onBack: () => Navigator.pop(context)),
      body: Center(child: Text('Álbum')),
    );
  }
}
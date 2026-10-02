import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';
import 'package:appwordcup2026/ui/home/widgets/header.dart';

class const HomeScreen({
  super.key,
  required final String name,
  required final String initials,
}) extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(name: name, initials: initials),
      body:  Center(
        child: Text(name),
      ),
    );
  }
}
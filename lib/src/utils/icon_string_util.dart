import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alter': Icons.add_alert,
  'acceibility': Icons.accessibility,
  'folder_open': Icons.folder_open
};
Icon getIcont(String nombreIcon) {
  return Icon(
    _icons[nombreIcon],
    color: Colors.blue,
  );
}

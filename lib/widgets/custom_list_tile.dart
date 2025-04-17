import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? subtitle;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    required this.title,
    this.leading,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: leading,
      subtitle: subtitle,
      trailing: const Icon(CupertinoIcons.forward),
      onTap: onTap,
    );
  }
}
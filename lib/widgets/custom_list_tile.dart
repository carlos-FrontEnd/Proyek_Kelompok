import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget trailing ;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    required this.title,
    this.trailing = const Icon(Icons.arrow_forward_ios),
    this.leading,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListTile(
          title: Text(title),
          leading: leading,
          trailing: trailing,
          onTap: onTap,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 1,
          color: const Color.fromARGB(255, 213, 213, 219),
        ),
      ],
    );
  }
}

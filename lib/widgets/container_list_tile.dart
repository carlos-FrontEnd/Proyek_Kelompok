import 'package:flutter/material.dart';

class ContainerListTile extends StatelessWidget {
  // Nama class harus sama
  final List<Widget> children;

  const ContainerListTile({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 15,
          right: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(children: children),
      ),
    );
  }
}

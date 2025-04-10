import 'package:flutter/material.dart';

class _CustomCardListTile extends StatelessWidget {
  const _CustomCardListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({Key? key, required this.title, required this.children})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(children: children),
        ),
      ],
    );
  }
}

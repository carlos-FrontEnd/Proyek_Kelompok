import 'package:flutter/material.dart';

// view all
class SectionHeaderCompleted extends StatelessWidget {
  final String title;

  const SectionHeaderCompleted({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            children: [
              const Text(
                'All',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 19, 19, 19),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                '| COmpleted',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(
                    29,
                    0,
                    0,
                    0,
                  ), // Adjust opacity for transparency
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

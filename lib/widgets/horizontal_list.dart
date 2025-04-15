import 'package:flutter/material.dart';
import 'package:home/screens/detail_screen.dart';
import '../models/anime_model.dart';
import 'anime_card.dart';

class HorizontalList extends StatelessWidget {
  final List<Anime> animeList;
  const HorizontalList({super.key, required this.animeList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          final anime = animeList[index];
          return Container(
            width: 150,
            margin: const EdgeInsets.only(right: 12),
            child: AnimeCard(
              anime: anime,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(anime: anime),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

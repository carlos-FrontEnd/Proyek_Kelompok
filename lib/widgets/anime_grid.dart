import 'package:flutter/material.dart';
import 'package:home/screens/detail_screen.dart';
import '../models/anime_model.dart';
import 'anime_card.dart';

class AnimeGrid extends StatelessWidget {
  final List<Anime> animeList;

  const AnimeGrid({super.key, required this.animeList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: animeList.length,
      itemBuilder: (context, index) {
        final anime = animeList[index];
        return AnimeCard(
          anime: anime,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(anime: anime),
              ),
            );
          },
        );
      },
    );
  }
}
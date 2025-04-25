import 'package:flutter/material.dart';
import 'package:home/screens/detail_screen.dart';
import '../models/anime_model.dart';
import 'anime_card.dart';

class AnimeGrid extends StatelessWidget {
  final List<Anime> animeList;

  const AnimeGrid({super.key, required this.animeList});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final AspectRatio =
        screenWidth >= 1000
            ? 1.5
            : screenWidth >= 600
            ? 1.2
            : 0.7;
    final crossAxisCount =
        screenWidth >= 1000
            ? 7
            : screenWidth >= 600
            ? 4
            : 2;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: AspectRatio,
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
      ),
    );
  }
}

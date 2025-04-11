import 'package:flutter/material.dart';
import 'package:home/data/person.dart';

class AnimeListView extends StatelessWidget {
  final List<Person> filteredAnime;
  const AnimeListView({super.key, required this.filteredAnime});

  @override
  Widget build(BuildContext context) {
    final filteredList =
        // recomended filter
        filteredAnime.where((anime) => anime.view > 100).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                'Mangatsu adalah aplikasi situs manga yang menyediakan berbagai manga yang cukup populer saat ini dan juga manga yang sudah lama tayang.',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const SizedBox(width: 5),
            const Text(
              'Baca Maanga Terpopuler saat ini',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Color.fromRGBO(255, 117, 117, 1),
        ),
        SizedBox(                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredList.length,
            itemBuilder: (context, index) {
              final anime = filteredList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: AnimeCard(anime: anime),
              );
            },
          ),
        ),
      ],
    );
  }
}

class AnimeCard extends StatelessWidget {
  final Person anime;

  const AnimeCard({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(anime.image),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      child: Text(
                        anime.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'chapter ' + anime.chapter.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:home/data/person.dart';

class AnimeListView extends StatelessWidget {
  final List<Person> filteredAnime;

  const AnimeListView({super.key, required this.filteredAnime});

  @override
  Widget build(BuildContext context) {
    final filteredList =
        filteredAnime.where((anime) => anime.view > 100).toList();

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final anime = filteredList[index];
          return AnimeCard(anime: anime);
        },
      ),
    );
  }
}

class AnimeCard extends StatelessWidget {
  final Person anime;

  const AnimeCard({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const,
    );
  }
}

    // return Card(
    //   elevation: 4,
    //   margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   child: Container(
    //     width: 120,
    //     padding: const EdgeInsets.all(5),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           width: 100,
    //           height: 100,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(8.0),
    //             image:
    //                 anime.image.isNotEmpty
    //                     ? DecorationImage(
    //                       image: NetworkImage(anime.image),
    //                       fit: BoxFit.cover,
    //                     )
    //                     : null,
    //             color: anime.image.isEmpty ? Colors.grey : null,
    //           ),
    //           child:
    //               anime.image.isEmpty
    //                   ? const Icon(Icons.broken_image, color: Colors.white)
    //                   : null,
    //         ),
    //         const SizedBox(height: 8),
    //         Text(
    //           anime.title,
    //           style: const TextStyle(
    //             fontSize: 14,
    //             fontWeight: FontWeight.bold,
    //             overflow: TextOverflow.ellipsis,
    //           ),
    //           maxLines: 1,
    //         ),
    //         const SizedBox(height: 4),
    //         Text(
    //           'Chapters: ${anime.chapter}',
    //           style: const TextStyle(fontSize: 12, color: Colors.grey),
    //         ),
    //         Text(
    //           'Rating: ${anime.rating}',
    //           style: const TextStyle(fontSize: 12, color: Colors.grey),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
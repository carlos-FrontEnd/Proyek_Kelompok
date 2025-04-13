import 'package:flutter/material.dart';
import 'package:home/providers/anime_providers.dart';
import 'package:provider/provider.dart';
import '../models/anime_model.dart';

class DetailScreen extends StatelessWidget {
  final Anime anime;

  const DetailScreen({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    final animeProvider = Provider.of<AnimeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
        actions: [
          IconButton(
            icon: Icon(
              animeProvider.isFavorite(anime)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () => animeProvider.toggleFavorite(anime),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'anime-image-${anime.id}',
              child: Image.network(
                anime.image,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        anime.rating.toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      Chip(
                        label: Text(anime.status),
                        backgroundColor:
                            anime.status == 'Ongoing'
                                ? Colors.blue[100]
                                : Colors.green[100],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Chapter ${anime.chapter}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'By ${anime.author}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        anime.genre
                            .map((genre) => Chip(label: Text(genre)))
                            .toList(),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Synopsis',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(anime.sinopsis, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  const Text(
                    'Chapters',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: anime.chapter,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Chapter ${index + 1}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

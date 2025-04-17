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
    final totalChapters = anime.chapter;
    const chaptersPerPage = 9; // 3x3 grid per page
    final pageCount = (totalChapters / chaptersPerPage).ceil();

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
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      height: 300,
                      color: Colors.grey[300],
                      child: const Icon(Icons.broken_image, size: 50),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderSection(),
                  const SizedBox(height: 16),
                  _buildGenreChips(),
                  const SizedBox(height: 24),
                  _buildSynopsisSection(),
                  const SizedBox(height: 24),
                  _buildChapterListHeader(),
                  const SizedBox(height: 12),
                  _buildChapterPageView(
                    pageCount,
                    chaptersPerPage,
                    totalChapters,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 4),
        Text(anime.rating.toString(), style: const TextStyle(fontSize: 18)),
        const Spacer(),
        Chip(
          label: Text(anime.status),
          backgroundColor:
              anime.status == 'Ongoing' ? Colors.blue[100] : Colors.green[100],
        ),
      ],
    );
  }

  Widget _buildGenreChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: anime.genre.map((genre) => Chip(label: Text(genre))).toList(),
    );
  }

  Widget _buildSynopsisSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Synopsis',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(anime.sinopsis, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildChapterListHeader() {
    return const Text(
      'Chapters',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildChapterPageView(
    int pageCount,
    int chaptersPerPage,
    int totalChapters,
  ) {
    return SizedBox(
      height: 140, // Fixed height for the PageView
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        padEnds: false,
        itemCount: pageCount,
        itemBuilder: (context, pageIndex) {
          final startChapter = pageIndex * chaptersPerPage + 1;
          final endChapter = (startChapter + chaptersPerPage - 1).clamp(
            1,
            totalChapters,
          );

          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  childAspectRatio: 3.5,
                ),
                itemCount: endChapter - startChapter + 1,
                itemBuilder: (context, index) {
                  final chapterNumber = startChapter + index;
                  return _buildChapterCard(chapterNumber);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChapterCard(int chapterNumber) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          // Handle chapter tap
          debugPrint('Chapter $chapterNumber tapped');
        },
        child: Center(
          child: Text(
            'Ch. $chapterNumber',
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}

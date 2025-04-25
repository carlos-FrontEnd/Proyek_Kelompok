import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:home/screens/detail_screen.dart';
import '../models/anime_model.dart';

class AnimeSlideList extends StatelessWidget {
  final List<Anime> animeList;

  const AnimeSlideList({super.key, required this.animeList});

  @override
  Widget build(BuildContext context) {
    final pageCount = (animeList.length / 3).ceil();

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3,
            ),
            itemCount: animeList.length,
            itemBuilder: (context, index) {
              final anime = animeList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(anime: anime),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                          anime.image,
                          width: 100,
                          height: 140,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Container(
                                width: 100,
                                height: 140,
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 140,
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                anime.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Chapter: ${anime.chapter}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 14,
                                      color: Colors.amber,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      anime.rating.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Wrap(
                                  spacing: 4,
                                  runSpacing: 4,
                                  children:
                                      (anime.genre)
                                          .take(5)
                                          .map(
                                            (genre) => Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                    vertical: 2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Text(
                                                genre,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }

        // Jika lebar layar kecil, gunakan CarouselSlider dengan snap scroll
        return CarouselSlider.builder(
          itemCount: pageCount,
          options: CarouselOptions(
            height: 560,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
          ),
          itemBuilder: (context, pageIndex, _) {
            final startIndex = pageIndex * 3;
            final endIndex = (pageIndex + 1) * 3;
            final pageItems = animeList.sublist(
              startIndex,
              endIndex > animeList.length ? animeList.length : endIndex,
            );

            return Column(
              children:
                  pageItems.map((anime) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(anime: anime),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: Image.network(
                                anime.image,
                                width: 100,
                                height: 140,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) => Container(
                                      width: 100,
                                      height: 140,
                                      child: const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                    ),
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 140,
                              alignment: Alignment.center,
                              child: Text(
                                '${startIndex + pageItems.indexOf(anime) + 1}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      anime.title,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Chapter: ${anime.chapter}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            size: 14,
                                            color: Colors.amber,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            anime.rating.toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Wrap(
                                        spacing: 4,
                                        runSpacing: 4,
                                        children:
                                            (anime.genre)
                                                .take(5)
                                                .map(
                                                  (genre) => Container(
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 6,
                                                          vertical: 2,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      genre,
                                                      style: const TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.blueGrey,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
            );
          },
        );
      },
    );
  }
}

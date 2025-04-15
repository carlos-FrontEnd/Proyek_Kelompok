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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 14)),
        CarouselSlider.builder(
          itemCount: pageCount,
          options: CarouselOptions(
            height: 560,
            viewportFraction: 1.0,
            autoPlay: true,
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
                          vertical: 8,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: Image.network(
                                anime.image,
                                width: 120,
                                height: 160,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) => Container(
                                      width: 120,
                                      height: 160,
                                      color: Colors.red,
                                      child: Icon(Icons.error),
                                    ),
                              ),
                            ),

                            // Ranking
                            Container(
                              width: 40,
                              height: 160,
                              alignment: Alignment.center,
                              child: Text(
                                '${startIndex + pageItems.indexOf(anime) + 1}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            // Content
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      anime.title,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Chapter: ${anime.chapter}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 16,
                                            color: Colors.amber,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            anime.rating.toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Wrap(
                                        spacing: 4,
                                        runSpacing: 4,
                                        children:
                                            (anime.genre)
                                                .map(
                                                  (genre) => Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                      style: TextStyle(
                                                        fontSize: 12,
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
        ),
      ],
    );
  }
}

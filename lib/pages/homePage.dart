import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home/data/data.dart';
import 'package:home/data/person.dart';
import 'package:home/model/drawer.dart';
import 'package:home/model/login.dart' show SettingsPage1;
import 'package:home/view/anime_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DataCard dataCart = DataCard();
  late List<Person> allAnime;
  List<Person> filteredAnime = [];
  final TextEditingController _searchController = TextEditingController();
  bool _showSearchField = false;

  @override
  void initState() {
    super.initState();
    allAnime = dataCart.getAnime();
    filteredAnime = allAnime;
    _searchController.addListener(_performSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredAnime =
          allAnime.where((anime) {
            final titleMatch = anime.title.toLowerCase().contains(query);
            final genreMatch = anime.genre.any(
              (genre) => genre.toLowerCase().contains(query),
            );
            return titleMatch || genreMatch;
          }).toList();
    });
  }

  Widget _buildSearchResults() {
    if (filteredAnime.isEmpty) {
      return const Center(child: Text('No results found'));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: filteredAnime.length,
      itemBuilder: (context, index) {
        final anime = filteredAnime[index];
        return Card(
          elevation: 3,
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  anime.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder:
                      (context, error, stackTrace) => const Icon(Icons.error),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Chapter: ${anime.chapter}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        title: Row(
          children: [
            Container(
              color: const Color(0xFF0C112E),
              child: SvgPicture.asset(
                'assets/vector.svg',
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child:
                  _showSearchField
                      ? TextField(
                        controller: _searchController,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: const TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                _showSearchField = false;
                                filteredAnime = allAnime;
                              });
                            },
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      )
                      : Text(
                        widget.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
            ),
            if (!_showSearchField) ...[
              const SizedBox(width: 12),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _showSearchField = true;
                  });
                },
              ),
            ],
            Container(
              color: const Color(0xFF1A1A1A),
              child: IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage1(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            'Anime List',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child:
                _searchController.text.isNotEmpty
                    ? _buildSearchResults()
                    : AnimeListView(filteredAnime: filteredAnime),
          ),
        ],
      ),
    );
  }
}

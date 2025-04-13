import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/anime_providers.dart';
import '../widgets/anime_grid.dart';
import '../widgets/horizontal_list.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _showSearchField = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AnimeProvider>(context, listen: false);
      provider.loadAnimeData();
    });

    _searchController.addListener(_performSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    final provider = Provider.of<AnimeProvider>(context, listen: false);
    provider.performSearch(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final animeProvider = Provider.of<AnimeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
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
                                _performSearch();
                              });
                            },
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      )
                      : const Text(
                        'Anime App',
                        style: TextStyle(
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
                  // Navigate to profile or settings screen
                },
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body:
          animeProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : _searchController.text.isNotEmpty
              ? AnimeGrid(animeList: animeProvider.filteredAnime)
              : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    SectionHeader(title: 'Trending Now', onViewAll: () {}),
                    HorizontalList(animeList: animeProvider.animeList),
                    SectionHeader(title: 'Ongoing Anime', onViewAll: () {}),
                    AnimeGrid(animeList: animeProvider.ongoingAnime),
                    SectionHeader(title: 'Completed Stories', onViewAll: () {}),
                    AnimeGrid(animeList: animeProvider.completedAnime),
                  ],
                ),
              ),
    );
  }
}

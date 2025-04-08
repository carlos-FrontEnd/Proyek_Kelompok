import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home/data/data.dart';
import 'package:home/data/person.dart';
import 'package:home/model/drawer.dart';
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
  bool _isSearchActive = false;

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

  void _toggleSearch() {
    setState(() {
      _isSearchActive = !_isSearchActive;
      if (!_isSearchActive) {
        _searchController.clear();
        filteredAnime = allAnime;
      }
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
          AnimeListView(filteredAnime: filteredAnime),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
            child: SvgPicture.asset('assets/vector.svg', width: 30, height: 30),
          ),
          const SizedBox(width: 5),
          Expanded(
            child:
                _isSearchActive
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
                          onPressed: _toggleSearch,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    )
                    : Text(
                      widget.title,
                      style: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
          ),
          const SizedBox(width: 12),
          if (!_isSearchActive)
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: _toggleSearch,
            ),
          Container(
            color: const Color(0xFF1A1A1A),
            child: IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      elevation: 0,
    );
  }
}

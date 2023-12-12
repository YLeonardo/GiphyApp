// home_screen.dart

import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';
import 'package:provider/provider.dart';
import '../providers/giphy_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final giphyProvider = Provider.of<GiphyProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giphy Picker App'),
      ),
      body: const Column(
        children: [
          GifSearchBar(),
          Expanded(
            child: GifGrid(),
          ),
        ],
      ),
    );
  }
}

class GifGrid extends StatelessWidget {
  const GifGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final giphyProvider = Provider.of<GiphyProvider>(context);

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: giphyProvider.gifs.length,
      itemBuilder: (context, index) {
        final gif = giphyProvider.gifs[index];
        return GiphyImage.original(gif: gif);
      },
    );
  }
}

class GifSearchBar extends StatelessWidget {
  const GifSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final giphyProvider = Provider.of<GiphyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (query) {
          giphyProvider.searchGifs(query);
        },
        decoration: const InputDecoration(
          labelText: 'Buscar GIFs',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

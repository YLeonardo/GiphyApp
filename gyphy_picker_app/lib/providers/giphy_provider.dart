// giphy_provider.dart
import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';
import '../services/giphy_service.dart';

class GiphyProvider extends ChangeNotifier {
  final GiphyService _giphyService;
  List<GiphyGif> _gifs = [];

  List<GiphyGif> get gifs => _gifs;

  GiphyProvider(this._giphyService);

  Future<void> searchGifs(String query) async {
    if (query.isEmpty) {
      _gifs = await _giphyService.getDefaultGifs();
    } else {
      _gifs = await _giphyService.searchGifs(query);
    }
    notifyListeners();
  }
}

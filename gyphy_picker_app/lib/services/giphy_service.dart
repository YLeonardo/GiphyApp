import 'package:giphy_picker/giphy_picker.dart';
import 'package:http/http.dart' as http;
import '../models/giphy_model.dart';
import 'dart:convert';

// GiphyService

class GiphyService {
  final String apiKey;

  GiphyService(this.apiKey);

  Future<List<GiphyGif>> searchGifs(String query) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$query&limit=20'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> data = responseData['data'] ?? [];

        return GiphyList.fromMapList(data).toList();
      } else {
        print('Error en la respuesta: ${response.statusCode}');
        throw Exception('Error al cargar los gifs');
      }
    } catch (error) {
      print('Error en la búsqueda de gifs: $error');
      throw Exception('Error al cargar los gifs');
    }
  }

  Future<List<GiphyGif>> getDefaultGifs() async {
    final List<dynamic> defaultGifData = [];
    return GiphyList.fromMapList(defaultGifData).toList();
  }
}

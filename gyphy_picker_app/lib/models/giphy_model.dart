// giphy_model.dart
import 'package:giphy_picker/giphy_picker.dart' as giphy_picker;

class GiphyList {
  final List<dynamic> list;

  GiphyList(this.list);

  factory GiphyList.fromMapList(List<dynamic> body) {
    return GiphyList(body);
  }

  List<giphy_picker.GiphyGif> toList() {
    return list
        .map((item) => giphy_picker.GiphyGif(
              id: item['id'] as String,
              user: giphy_picker.GiphyUser(),
              images: giphy_picker.GiphyImages(),
              url: item['url'] as String,
            ))
        .toList();
  }
}

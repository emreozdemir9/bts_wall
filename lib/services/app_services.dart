import 'package:bts_wall/models/items.dart';
import 'package:bts_wall/services/client.dart';

class AppServices {
  // get Images in Board
  static Future<List<Items>> getImages(String boardId) async {
    List<Items> items = [];
    // init params
    final params = {
      'page': "1",
    };
    var data = await Client.dioGet('/v5/boards/$boardId/pins', params);
    if (data != null && data['items'] != null) {
      // Add Images Data
      for (var item in data['items']) {
        items.add(Items.fromJson(item));
      }
      return items;
    }
    return null;
  }
}

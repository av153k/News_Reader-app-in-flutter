import "dart:async";
import "package:http/http.dart" as http;
import "dart:convert";
import "package:news_reader/api_models/base_model.dart";
import "package:news_reader/api_services/api_key.dart";

class NewsApiCallback {
  NewsApiCallback();

  Future<NewsClass> getNewsData(String countryCode, String category) async {
    String _category = "category=";

    if (category == "All") {
      _category = "";
    } else {
      _category += category.toLowerCase();
      _category += "&";
    }

    String _country = "country=";
    _country += countryCode + "&";

    String apiUrl = "http://newsapi.org/v2/top-headlines?" +
        _country +
        _category +
        "sortBy=popularity&language=en&pageSize=100&apiKey=" +
        apiKey;

    var res = await http.get(apiUrl);
    var decodedJson = jsonDecode(res.body);

    NewsClass newsData = NewsClass.fromJson(decodedJson);

    return newsData;
  }
}

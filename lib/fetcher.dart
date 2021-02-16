import 'dart:convert';
import 'package:http/http.dart' as http;

class Fetcher{
  String category;
  Fetcher({this.category});
  Future<List> fetchData() async{
    http.Response res = await http.get("https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=5b3784c38ccf4e99a23174d7ab0b80e4");
    if(res.statusCode == 200){
      String data = res.body;
      return jsonDecode(data)["articles"];
    }
    else return null;
  }
}
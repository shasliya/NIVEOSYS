import 'package:http/http.dart'as http;

import '../Model/modelalldetails.dart';

class HttpService {


 static Future<List<Alldetails>> fetchProductus() async {
   var response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
   if (response.statusCode == 200) {
     print(response.body); // Add this line to inspect the JSON
     var data = response.body;
     return alldetailsFromJson(data);
   } else {
     throw Exception('Failed to fetch data');
   }

 }
}

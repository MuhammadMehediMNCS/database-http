import 'package:http/http.dart' as http;

class DashboardService {
 Future<http.Response> getData( int id) async {
  
  String url = 'https://fakestoreapi.com/products?limit=${id.toString()}';

  http.Response response = await http.get(Uri.parse(url));

  return response;
 }
}
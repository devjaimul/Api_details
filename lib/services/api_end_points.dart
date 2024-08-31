import 'package:api/services/api_config.dart';

class ApiEndPoints{

  static String apiUrl='${ApiConfig.baseUrl}/users';
  static Uri getAllPost=Uri.parse('$apiUrl?page=2');
  static Uri getSinglePost=Uri.parse('$apiUrl/');
}

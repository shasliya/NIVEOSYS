import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Model/modelalldetails.dart';

class detailService {
  // Example API call to fetch users
  Future<List<dynamic>> fetchAllUsers() async {
    // Replace with actual API logic
    await Future.delayed(Duration(seconds: 2)); // Simulating network delay
    return [
      {'name': 'John Doe', 'email': 'john@example.com', 'id': 1},
      {'name': 'Jane Doe', 'email': 'jane@example.com', 'id': 2},
    ];
  }

  // Example API call to delete a user
  Future<void> deleteUser(String userId) async {
    // Replace with actual API logic
    await Future.delayed(Duration(seconds: 1)); // Simulating network delay
    print('User with ID $userId deleted');
  }
}

class ApiService {
  static const String baseUrl = "https://ceikerala.niveosys.org/api-project/public/api ";

  // Fetch all users
  static Future<List<Alldetails>> fetchAllUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/fetch-all-users"));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((user) => Alldetails.fromJson(user)).toList();
    } else {
      throw Exception("Failed to load users");
    }
  }

  // Create a new user
  static Future<bool> createUser(Alldetails user) async {
    final response = await http.post(
      Uri.parse("$baseUrl/create-user"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user.toJson()),
    );
    return response.statusCode == 200;  // Return true if successful, false otherwise
  }

  // Update a user
  static Future<bool> updateUser(int id, Alldetails user) async {
    final response = await http.post(
      Uri.parse("$baseUrl/update-user/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(user.toJson()),
    );
    return response.statusCode == 200;  // Return true if successful, false otherwise
  }

  // Delete a user
  static Future<bool> deleteUser(int id) async {
    final response = await http.post(
      Uri.parse("$baseUrl/delete-user/$id"),
    );
    return response.statusCode == 200;  // Return true if successful, false otherwise
  }
}




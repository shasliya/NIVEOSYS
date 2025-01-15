import 'package:get/get.dart';
import '../../Model/modelalldetails.dart';

import '../service/service.dart';

class AlldetailsController extends GetxController {
  var isLoading = false.obs;
  var userList = <Alldetails>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  // Fetch all users
  void fetchUsers() async {
    try {
      isLoading(true);
      var users = await ApiService.fetchAllUsers();
      if (users.isNotEmpty) {
        userList.assignAll(users);
      }
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading(false);
    }
  }

  // Add a new user
  void addUser(Alldetails user) async {
    try {
      isLoading(true);
      var success = await ApiService.createUser(user);
      if (success) {
        fetchUsers();
        Get.back(); // Close the Add User screen
      }
    } catch (e) {
      print("Error adding user: $e");
    } finally {
      isLoading(false);
    }
  }

  // Update a user
  void updateUser(int id, Alldetails user) async {
    try {
      isLoading(true);
      var success = await ApiService.updateUser(id, user);
      if (success) {
        fetchUsers();
        Get.back(); // Close the Update User screen
      }
    } catch (e) {
      print("Error updating user: $e");
    } finally {
      isLoading(false);
    }
  }

  // Delete a user
  void deleteUser(int id) async {
    try {
      isLoading(true);
      var success = await ApiService.deleteUser(id);
      if (success) {
        fetchUsers();
      }
    } catch (e) {
      print("Error deleting user: $e");
    } finally {
      isLoading(false);
    }
  }
}


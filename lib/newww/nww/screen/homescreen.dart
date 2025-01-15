import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../usercontroller/controller.dart';


class HomeScreen extends StatelessWidget {
  final AlldetailsController userController = Get.put(AlldetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Management"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){}
            // => Get.to(AddUserScreen()),
          )
        ],
      ),
      body: Obx(() {
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (userController.userList.isEmpty) {
          return Center(child: Text("No users available"));
        }
        return ListView.builder(
          itemCount: userController.userList.length,
          itemBuilder: (context, index) {
            var user = userController.userList[index];
            return ListTile(
              title: Text(user.name ?? "No Name"),
              subtitle: Text(user.email ?? "No Email"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Navigate to update user screen
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      userController.deleteUser(user.id!);
                    },
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}

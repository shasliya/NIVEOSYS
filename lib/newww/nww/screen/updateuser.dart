import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/modelalldetails.dart';
import '../usercontroller/controller.dart';

class UpdateUserScreen extends StatelessWidget {
  final Alldetails user;

  UpdateUserScreen({required this.user});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = user.name ?? "";
    phoneController.text = user.phone ?? "";
    emailController.text = user.email ?? "";
    addressController.text = user.address ?? "";
    genderController.text = user.gender ?? "";
    descriptionController.text = user.description ?? "";

    return Scaffold(
      appBar: AppBar(title: Text("Update User")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: nameController, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: phoneController, decoration: InputDecoration(labelText: "Phone")),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: addressController, decoration: InputDecoration(labelText: "Address")),
            TextField(controller: genderController, decoration: InputDecoration(labelText: "Gender")),
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: "Description")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    phoneController.text.isEmpty ||
                    emailController.text.isEmpty ||
                    addressController.text.isEmpty ||
                    genderController.text.isEmpty ||
                    descriptionController.text.isEmpty) {
                  Get.snackbar("Error", "Please fill in all fields");
                  return;
                }

                var updatedUser = Alldetails(
                  id: user.id, // Ensure the user id is valid
                  name: nameController.text,
                  phone: phoneController.text,
                  email: emailController.text,
                  address: addressController.text,
                  gender: genderController.text,
                  description: descriptionController.text,
                );
                Get.find<AlldetailsController>().updateUser(user.id!, updatedUser);
              },
              child: Text("Update User"),
            )

          ],
        ),
      ),
    );
  }
}

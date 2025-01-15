import 'package:flutter/material.dart';

import 'Service/servicepage.dart';



void main(){
  runApp(MaterialApp(home: MainScreen1(),));
}
class MainScreen1 extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen1> {
  final HttpService apiService = HttpService();
  late Future<List<dynamic>> users;

  @override
  void initState() {
    super.initState();
    users = HttpService.fetchProductus();
  }

  void refreshUsers() {
    setState(() {
      users = HttpService.fetchProductus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: FutureBuilder<List<dynamic>>(
          future: users,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No users found."));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final user = snapshot.data![index];
                  return ListTile(
                    title: Text(user['name']),
                    subtitle: Text(user['email']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/addUser',
                              arguments: user,
                            ).then((_) => refreshUsers());
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            // HttpService.deleteUser(user['id'].toString()).then((_) {
                            //   refreshUsers();
                            // });
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/addUser').then((_) => refreshUsers());
            },
          ),
        );
  }
}
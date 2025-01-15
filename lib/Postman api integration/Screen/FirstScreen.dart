
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';gi

import '../../newww/nww/usermodel/model.dart';
import '../Service/servicepage.dart';
import 'SecondScreen.dart';
void main()
{
  runApp(GetMaterialApp(initialRoute: '/', getPages: [GetPage(name: '/', page: ()=>CategoryScreen()),
    ],));
}
class CategoryScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final HttpService detailsview=HttpService();
    return Scaffold(
      appBar: AppBar(title: Text("All Dertails"),),
      body: FutureBuilder<List<Alldetails>>(future: HttpService.fetchProductus(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child:CircularProgressIndicator() );
            }
            else if(snapshot.hasError){
              return Center(child: Text('Error: ${snapshot.error}'),);
            }
            else
            {
              List<Alldetails>alldetailsview=snapshot.data!;
              return ListView.builder(
                  itemCount: alldetailsview.length,

                  itemBuilder: (context,index)
                  {
                  dynamic category=alldetailsview[index];
                  return ListTile(
                    title: Text(category.name ?? "Unknown"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => secondscreen()));
                    },
                  );

                  });

            }
          }),
    );
  }
}

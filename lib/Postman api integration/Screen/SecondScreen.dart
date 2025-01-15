import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(MaterialApp(home:secondscreen() ,));
}

class secondscreen extends StatefulWidget {
  const secondscreen({super.key});

  @override
  State<secondscreen> createState() => _seconsscreenState();
}

class _seconsscreenState extends State<secondscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
      //     Text("Second screen"),
      //     Table(
      //       border:TableBorder.all(width: 1.0,color: Colors.red),
      //       children: [
      //       dynamicTable.add(TableRow(
      //       children: [
      //           Text("test1"),
      //         Text("test2"),
      //         Text("test3"),
      //       ]
      //     ));
      //         ]
      //     ),
      //       // TableRow(
      //       //     children: [
      //       //       Text("",textScaleFactor: 1.5),
      //       //       Text("",textScaleFactor: 1.5),
      //       //       Text("",textScaleFactor: 1.5),
      //       //       Text("",textScaleFactor: 1.5),
      //       //     ])
      //   ],
      // ),
      ]
    )
    );
  }
}

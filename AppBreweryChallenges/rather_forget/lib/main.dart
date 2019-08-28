import 'package:flutter/material.dart';

//Even this has a main function, so that should be easy to remember
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Baby Trenton\'s Moto'),
          backgroundColor: Colors.blueGrey[600],
        ),
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://i.pinimg.com/originals/32/6c/e3/326ce343f055e31841d462e102a4d98f.jpg'),
          ),
        ),
      ),
    ),
  );
}

//import 'package:flutter/material.dart';
//
//// The main function is the starting point!:D
//void main() {
//  runApp(
//    MaterialApp(
//      home: Scaffold(
//        backgroundColor: Colors.teal[300],
//        appBar: AppBar(
//          title: Text("I Am Rich"),
//          backgroundColor: Colors.blueGrey[900],
//        ),
//        body: Center(
//          child: Image(
//            image: AssetImage('images/diamond.png'),
//          ),
//        ),
//      ),
//    ),
//  );
//}

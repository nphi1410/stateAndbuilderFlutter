import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: FutureDemo(),
      ),
    ),
  );
}

class FutureDemo extends StatelessWidget {
  Future<String> fetchData() async {
    // Simulating fetching data from a network call
    await Future.delayed(Duration(seconds: 2));
    return 'Data loaded successfully';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Text('Data: ${snapshot.data}');
          }
        },
      ),
    );
  }
}

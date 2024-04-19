import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: AsyncDataDemo(),
      ),
    ),
  );
}

class AsyncDataDemo extends StatefulWidget {
  @override
  _AsyncDataDemoState createState() => _AsyncDataDemoState();
}

class _AsyncDataDemoState extends State<AsyncDataDemo> {
  // Future to fetch initial data
  Future<String> fetchData() async {
    // Simulating fetching initial data from a network call
    await Future.delayed(Duration(seconds: 2));
    return 'Initial data loaded successfully';
  }

  // Stream to provide real-time updates
  Stream<int> counterStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<String>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text('Initial Data: ${snapshot.data}');
              }
            },
          ),
          SizedBox(height: 20),
          StreamBuilder<int>(
            stream: counterStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text('Real-Time Count: ${snapshot.data}');
              }
            },
          ),
        ],
      ),
    );
  }
}

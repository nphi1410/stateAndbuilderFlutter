import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MemoryCacheDemo(),
      ),
    ),
  );
}

class MemoryCacheDemo extends StatefulWidget {
  @override
  _MemoryCacheDemoState createState() => _MemoryCacheDemoState();
}

class _MemoryCacheDemoState extends State<MemoryCacheDemo> {
  MemoryCache cache = MemoryCache();
  String? cachedData;

  @override
  void initState() {
    super.initState();
    // Simulate fetching data from cache
    cachedData = cache.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Cached Data:',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          Text(
            cachedData ?? 'No data found',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class MemoryCache {
  // Simulated cache data
  String? getData() {
    // Simulate fetching data from cache
    return 'Cached data from MemoryCache';
  }
}

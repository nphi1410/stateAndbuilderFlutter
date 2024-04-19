import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,// or TextDirection.rtl
        body:  ParentWidget(),
      ),
    ),
  );
}

// Parent Widget
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String _input = '';
  late int _intValue=0;

  void updateVal(String newVal) {
    setState(() {
      if (int.tryParse(newVal) == null) {
        _input = 'NaN';
        _intValue = 0;
      } else {
        _input = newVal;
        _intValue = int.parse(newVal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter a number',
                  ),
                  onSubmitted: (value) {
                    updateVal(value);
                  },
                ),
              ),
              SizedBox(width: 10), // Spacer between TextField and ChildWidget
              Align(
                alignment: Alignment.bottomCenter,
                child: ChildWidget(col: _intValue ?? 0),
              ),
            ],
          ),
          SizedBox(height: 10), // Spacer between TextField/ChildWidget and Text
          Text(
            'number:$_input',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}



// Child Widget
class ChildWidget extends StatelessWidget {
  final int col;

  ChildWidget({required this.col});

  int maxVal(int col){
    if(col>10) {
      col =10;
    }
    if(col<0) {
      col=0;
    }
    return col;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: List.generate(
          maxVal(col),
              (index) => SizedBox(
            height: 30,
            width: 50,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
      ),

    );
  }
}

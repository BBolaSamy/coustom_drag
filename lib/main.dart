import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color postitiveColor = new Color(0xFFEF0078);
  Color negetiveColor = new Color(0xFFFFFFFF);
  double percentage = 0.0;
  double percentage2 = 0.0;
  double percentage3 = 0.0;

  double initial = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'CUSTOM SLIDER',
          style: TextStyle(color: postitiveColor),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              percentage.round().toString() + ' %',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: postitiveColor,
              ),
            ),
            GestureDetector(
              onPanStart: (DragStartDetails details) {
                initial = details.globalPosition.dx;
              },
              onPanUpdate: (DragUpdateDetails details) {
                double distance = details.globalPosition.dx - initial;
                double percentageAddition = distance / 200;

                // print('distance ' + distance.toString());
                setState(() {
                  // print('percentage ' +
                  // (percentage + percentageAddition)
                  // .clamp(0.0, 100.0)
                  // .toString());
                  percentage =
                      (percentage + percentageAddition).clamp(0.0, 100.0);
                });
              },
              onPanEnd: (DragEndDetails details) {
                initial = 0.0;
              },
              child: CustomSlider(
                percentage: this.percentage,
                positiveColor: postitiveColor,
                negetiveColor: negetiveColor,
                totalHeight: 30,
                totalWidth: 200,
              ),
            ),
            Container(
              height: 30,
            ),
            GestureDetector(
              onPanStart: (DragStartDetails details) {
                initial = details.globalPosition.dx;
              },
              onPanUpdate: (DragUpdateDetails details) {
                double distance = details.globalPosition.dx - initial;
                double percentageAddition = distance / 200;

                // print('distance ' + distance.toString());
                setState(() {
                  // print('percentage ' +
                  // (percentage + percentageAddition)
                  // .clamp(0.0, 100.0)
                  // .toString());
                  percentage2 =
                      (percentage2 + percentageAddition).clamp(0.0, 100.0);
                });
              },
              onPanEnd: (DragEndDetails details) {
                initial = 0.0;
              },
              child: CustomSlider(
                percentage: this.percentage2,
                positiveColor: postitiveColor,
                negetiveColor: negetiveColor,
                totalHeight: 30,
                totalWidth: 200,
              ),
            ),
            GestureDetector(
              onPanStart: (DragStartDetails details) {
                initial = details.globalPosition.dy;
              },
              onPanUpdate: (DragUpdateDetails details) {
                double distance = details.globalPosition.dy - initial;
                double percentageAddition = distance / 200;

                // print('distance ' + distance.toString());
                setState(() {
                  // print('percentage ' +
                  // (percentage + percentageAddition)
                  // .clamp(0.0, 100.0)
                  // .toString());
                  percentage3 =
                      (percentage3 + percentageAddition);
                });
              },
              onPanEnd: (DragEndDetails details) {
                initial = 0.0;
              },
              child: CustomSlidery(
                percentage: this.percentage3,
                positiveColor: postitiveColor,
                negetiveColor: negetiveColor,
                totalHeight: 200,
                totalWidth: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  final double totalWidth;
  final double totalHeight;

  final double percentage;
  final Color positiveColor;
  final Color negetiveColor;

  CustomSlider(
      {this.percentage,
      this.positiveColor,
      this.negetiveColor,
      this.totalWidth,
      this.totalHeight});

  @override
  Widget build(BuildContext context) {
    // print((percentage / 100) * totalWidth);
    // print((1 - percentage / 100) * totalWidth);
    return Container(
      width: totalWidth + 4.0,
      height: totalHeight + 4,
      decoration: BoxDecoration(
        color: negetiveColor,
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: positiveColor,
            height: totalHeight,
            width: (percentage / 100) * totalWidth,
          ),
        ],
      ),
    );
  }
}

class CustomSlidery extends StatelessWidget {
  final double totalWidth;
  final double totalHeight;

  final double percentage;
  final Color positiveColor;
  final Color negetiveColor;

  CustomSlidery(
      {this.percentage,
      this.positiveColor,
      this.negetiveColor,
      this.totalWidth,
      this.totalHeight});

  @override
  Widget build(BuildContext context) {
    // print((percentage / 100) * totalWidth);
    // print((1 - percentage / 100) * totalWidth);
    return Container(
      width: totalWidth + 4,
      height: totalHeight + 4,
      decoration: BoxDecoration(
        color: negetiveColor,
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            color: positiveColor,
            height: (percentage / 100) * totalHeight,
            width: totalWidth,
          ),
        ],
      ),
    );
  }
}
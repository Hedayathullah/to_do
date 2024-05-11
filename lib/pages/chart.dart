import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DistanceTrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff232941),
              Color(0xff171925),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Distance'),
          actions: [
            Icon(
              Icons.grid_view,
              size: 30,
            ),
            SizedBox(width: 10)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xff171925),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Day',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'Week',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'Month',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Text(
                            'Year',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '5 Dec - 20 Dec',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xff171925),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xff171925),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class StatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'Your Statistics Graph',
                  style: TextStyle(fontSize: 22, fontFamily: 'Ubuntu'),
                ),
              ],
            ),
            SizedBox(
                height: 250,
                width: 500,
                child: LineChart(LineChartData(
                    minX: 1,
                    maxX: 12,
                    minY: 0,
                    maxY: 5,
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                          spots: [
                            const FlSpot(1, 3),
                            const FlSpot(3, 1),
                            const FlSpot(5, 4),
                            const FlSpot(7, 2.2),
                            const FlSpot(9, 4),
                            const FlSpot(12, 1.8),
                          ],
                          isCurved: true,
                          color: Colors.pink.shade200,
                          barWidth: 5,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(
                              show: true, color: Colors.pink.withOpacity(.1)))
                    ]))),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Tasks(16)',
                  style: TextStyle(
                      color: Colors.black, fontFamily: 'Ubuntu', fontSize: 20),
                ),
                Text(
                  'See all',
                  style: TextStyle(fontSize: 18, color: Colors.pink.shade300),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Expanded(
            //     child: ListView.builder(
            //   itemBuilder: (context, index) => task_tile(),
            //   itemCount: 20,
            // )),
          ],
        ),
      ),
    );
  }
}

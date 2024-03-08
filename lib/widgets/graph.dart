import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 320,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 12,
          minY: 0,
          maxY: 12,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: _bottomTitles),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              spots: [
                FlSpot(0, 0),
                FlSpot(1, 3),
                FlSpot(2, 4),
                FlSpot(3, 6),
                FlSpot(4, 4),
                FlSpot(5, 6),
                FlSpot(6, 7),
                FlSpot(7, 8),
                FlSpot(8, 7),
                FlSpot(9, 9),
                FlSpot(10, 6),
                FlSpot(11, 8),
                FlSpot(12, 9),
              ],
            ),
          ],
        ),
      ),
    );
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 1:
              text = 'Jan';
              break;
            case 3:
              text = 'Mar';
              break;
            case 5:
              text = 'May';
              break;
            case 7:
              text = 'Jul';
              break;
            case 9:
              text = 'Sep';
              break;
            case 11:
              text = 'Nov';
              break;
          }

          return Text(text);
        },
      );
}

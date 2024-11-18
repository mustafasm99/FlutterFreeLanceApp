import 'package:finailtask/API/controllers/user_controller.dart';
import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardTaskCharts extends StatelessWidget {
  const DashboardTaskCharts({super.key});

  @override
  Widget build(BuildContext context) {
    // data will be fetched from the server
    // temp data
    final List<String> taskList = ['To Do', 'In Progress', 'Done'];
    final List<ChartData> chartData = [
      ChartData('To Do', 35),
      ChartData('In Progress', 12),
      ChartData('Done', 53), // 35 + 12 + 53 = 100
    ];
    final int total_taks = 10;

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
            // padding: const EdgeInsets.all(0),
            width: context.width * 0.45,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Tasks - $total_taks",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: context.fontFamily,
                  ),
                ),
                Expanded(
                  child: SfCircularChart(
                    series: <CircularSeries>[
                      RadialBarSeries<ChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        dataLabelMapper: (ChartData data, _) =>
                            '${data.x} : ${data.y}%',
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                        cornerStyle: CornerStyle.bothCurve,
                        maximumValue: 100,
                        gap: '10%',
                        // useSeriesColor: true,
                        pointColorMapper: (ChartData data, _) {
                          if (data.x == 'To Do') {
                            return const Color(0xFF3c97af);
                          } else if (data.x == 'In Progress') {
                            return const Color(0xFFd69e2e);
                          } else {
                            return const Color(0xFF1fad58);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              taskList.length,
              (item) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                  child: Column(children: [
                    Text("${taskList[item]} ${chartData[item].x}%"),
                    LinearPercentIndicator(
                      backgroundColor: const Color(0xFFCFCFCF),
                      width: context.width * 0.45,
                      lineHeight: 10,
                      percent: chartData[item].y / 100,
                      progressColor: item == 0
                          ? const Color(0xFF3c97af)
                          : item == 1
                              ? const Color(0xFFd69e2e)
                              : const Color(0xFF1fad58),
                    ),
                  ]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// Create the data base on the api endpoints
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final int y;
}

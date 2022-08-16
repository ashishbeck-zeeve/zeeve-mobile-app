import 'package:app_ui/app_ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zeeve/features/dashboard/provider/provider.dart';
import 'package:zeeve/features/marketplace/marketplace.dart';

/// {@template dashboard_body}
/// Body of the DashboardPage.
///
/// Add what it does
/// {@endtemplate}
class Chart extends StatefulWidget {
  /// {@macro dashboard_body}
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> with AutomaticKeepAliveClientMixin {
  bool isWaiting = true;

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 16,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isWaiting
              ? 0
              : isTouched
                  ? y + 1
                  : y,
          color: isTouched ? Colors.yellow : barColor,
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: Colors.yellow, width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 100,
            color: ZeeveColors.gray,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(5, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 31.2, barColor: const Color(0xFFFA8B8C));
          case 1:
            return makeGroupData(1, 11.5, barColor: const Color(0xFF3585FA));
          case 2:
            return makeGroupData(2, 23.1, barColor: const Color(0xFFFFCB55));
          case 3:
            return makeGroupData(3, 25.2, barColor: const Color(0xFF60CDA2));
          case 4:
            return makeGroupData(4, 9, barColor: const Color(0xFFF86A9D));
          default:
            return throw Error();
        }
      });

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      // color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('AWS', style: style);
        break;
      case 1:
        text = const Text('Azure', style: style);
        break;
      case 2:
        text = const Text('D.O', style: style);
        break;
      case 3:
        text = const Text('GCP', style: style);
        break;
      case 4:
        text = const Text('IBM', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8,
      child: text,
    );
  }

  FlTitlesData titlesData() => FlTitlesData(
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
      );

  BarTouchTooltipData touchToolTipData() => BarTouchTooltipData(
      tooltipBgColor: Colors.blueGrey,
      getTooltipItem: (group, groupIndex, rod, rodIndex) {
        return BarTooltipItem(
          '${rod.toY}%',
          const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        );
      });

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500)).then(
      (value) => setState(() => isWaiting = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardNotifier>(
      builder: (context, state, child) {
        return Column(
          children: [
            Text(
              'Cloud Usage Distribution',
              style: ZeeveTextStyle.headline6,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    barGroups: showingGroups(),
                    titlesData: titlesData(),
                    barTouchData:
                        BarTouchData(touchTooltipData: touchToolTipData()),
                    gridData: FlGridData(show: false),
                  ),
                  swapAnimationCurve: Curves.easeInOut,
                  swapAnimationDuration: const Duration(milliseconds: 1000),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    double value = 65; // 채워진 정도 (%)

    return Scaffold(
      backgroundColor: const Color(0xFF0E091C),
      body: Center(
        child: SizedBox(
          height: 250,
          width: 250,
          child: SfRadialGauge(
            axes: [
              RadialAxis(
                startAngle: 270,
                endAngle: 270,
                showLabels: false,
                showTicks: false,
                axisLineStyle: AxisLineStyle(
                  thickness: 35,
                  color: Colors.grey.shade300,
                ),
                pointers: [
                  RangePointer(
                    value: value,
                    width: 35,
                    cornerStyle: CornerStyle.bothCurve,
                    gradient: const SweepGradient(
                      colors: [
                        Color(0xFFFC4343),
                        Color(0xFFFF8209),
                      ],
                      stops: [0.1, 0.75],
                    ),
                  ),
                ],
                annotations: [
                  GaugeAnnotation(
                    widget: Text(
                      '${value.toInt()}%',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    angle: 0,        // 각도는 중앙 배치 시 큰 영향 없음
                    positionFactor: 0, // 중심에 정확히 위치하게 함
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

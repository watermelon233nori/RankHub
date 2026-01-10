
import 'dart:math';

double clamp(double x, double minVal, double maxVal) => min(maxVal, max(minVal, x));

double lerp(double t, double a, double b) => (1 - t) * a + t * b;

List<double> bezierAt(double t, List<List<double>> points) {
  if (points.length == 1) {
    return points[0];
  }
  final starts = points.sublist(0, points.length - 1);
  final ends = points.sublist(1);
  
  final nextPoints = <List<double>>[];
  for (int i = 0; i < starts.length; i++) {
    nextPoints.add([
      lerp(t, starts[i][0], ends[i][0]),
      lerp(t, starts[i][1], ends[i][1]),
    ]);
  }
  
  return bezierAt(t, nextPoints);
}

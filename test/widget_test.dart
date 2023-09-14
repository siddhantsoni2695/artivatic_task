// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:artivatic_task/controllers/dashboard_controller.dart';
import 'package:artivatic_task/modals/dashboard_data_response.dart';
import 'package:artivatic_task/providers/dashboard_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Group', () {
    final controller = DashboardController(provider: DashboardProvider());

    test('Test with data', () {
      expect(controller.dataResponse.value, isA<DashboardDataResponse>());
    });

    test('Test with no data', () {
      expect(controller.listOfRow, []);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';

import 'package:knowledge_dependency_graph_manager/knowledge_dependency_graph_manager.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });


  test("subtract one", () {
    expect(Calculator().addOne(2), 4);
  },);
}




import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_parameter.freezed.dart';

@freezed
class TestParameter with _$TestParameter {
  const factory TestParameter({
    required String name,
    required String shortName,
    required String units,
    required double minValue,
    required double maxValue,
    required double currentValue,
    required TrendDirection trendDirection,
  }) = _TestParameter;
}

enum TrendDirection { up, down }

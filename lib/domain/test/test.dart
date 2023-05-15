import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:longevity_ai/domain/test/test_parameter.dart';

part 'test.freezed.dart';

@freezed
class Test with _$Test {
  const factory Test({
    required DateTime loggingDate,
    required List<TestParameter> params,
    required TestType testType,
  }) = _Test;
}

enum TestType { bloodTest }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:longevity_ai/domain/test/test.dart';

part 'patient.freezed.dart';

@freezed
class Patient with _$Patient{
  const factory Patient(
    {
      required String firstName,
      required String lastName,
      required String avatar,
      required Map<TestType, List<Test>> tests,
      required DateTime birthDate,
    }
  ) = _Patient;
}
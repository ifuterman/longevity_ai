import 'package:longevity_ai/domain/patient.dart';
import 'package:longevity_ai/domain/test/test.dart';
import 'package:longevity_ai/domain/test/test_parameter.dart';
import 'package:longevity_ai/ui/common/app_icons.dart';

class Repository{
  Patient getPatient(){
    return Patient(
      firstName: 'John',
      lastName: 'Smith',
      avatar: AppIcons.imageStubAvatar,
      birthDate: DateTime(1978),
      tests: {
        TestType.bloodTest : [
          Test(
            testType: TestType.bloodTest,
            loggingDate: DateTime(2023, 4, 20),
            params: [
              const TestParameter(
                name: 'Alanine Aminotransferase',
                shortName: 'ALT',
                units: 'U/L',
                minValue: 0,
                maxValue: 45,
                currentValue: 17.9,
                trendDirection: TrendDirection.up
              ),
              const TestParameter(
                name: 'Alkaline Phosphatase',
                shortName: '',
                units: 'U/L',
                minValue: 30,
                maxValue: 120,
                currentValue: 90,
                trendDirection: TrendDirection.down
              ),
              const TestParameter(
                name: 'Aspartate Aminotransferase',
                shortName: 'AST',
                units: 'U/L',
                minValue: 0,
                maxValue: 35,
                currentValue: 19,
                trendDirection: TrendDirection.up
              ),
              const TestParameter(
                name: 'Glucose',
                shortName: '',
                units: 'mg/dL',
                minValue: 74,
                maxValue: 106,
                currentValue: 110,
                trendDirection: TrendDirection.up
              ),
              const TestParameter(
                name: 'Hemoglobin',
                shortName: 'HbA1c',
                units: 'mmol/mol',
                minValue: 13.5,
                maxValue: 18,
                currentValue: 17,
                trendDirection: TrendDirection.down
              ),
              const TestParameter(
                name: 'High Sensitivity C-Reactive Protein',
                shortName: 'HbA1c',
                units: 'mg/L',
                minValue: 0,
                maxValue: 5,
                currentValue: 0.02,
                trendDirection: TrendDirection.down
              ),
            ]
          )
        ]
      }
    );
  }
}
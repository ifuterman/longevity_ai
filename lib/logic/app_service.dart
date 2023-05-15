import 'package:longevity_ai/repository/repository.dart';

class AppService {
  static AppService? _instance;

  factory AppService() {
    _instance = _instance ?? AppService._();
    return _instance!;
  }

  AppService._();

  final _repository = Repository();

  Repository get repository => _repository;
}
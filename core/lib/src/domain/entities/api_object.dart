import 'package:equatable/equatable.dart';

abstract class ApiObject extends Equatable {
  Map<String, dynamic> toJson();
}
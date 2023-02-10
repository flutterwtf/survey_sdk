import 'package:flutter/material.dart';

abstract class LocaleRepository {
  Future<Locale?> getLocale() ;
  void saveLocale(Locale locale);
}

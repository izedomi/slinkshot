import 'package:flutter/material.dart';

class ServiceResponse {
  bool hasError;
  var data;
  String message;


  ServiceResponse({@required this.hasError, this.data, this.message});
}

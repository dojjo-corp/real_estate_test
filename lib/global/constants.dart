import 'package:flutter/material.dart';

double deviceHeight(BuildContext context) => MediaQuery.sizeOf(context).height;
double deviceWidth(BuildContext context) => MediaQuery.sizeOf(context).width;

enum AlertType { error, alert }

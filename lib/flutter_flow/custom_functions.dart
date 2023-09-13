import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String createPackageID() {
  // return a uniqe id
  var now = DateTime.now();
  var formatter = DateFormat('yyyyMMddHHmmss');
  String formattedDate = formatter.format(now);
  var random = math.Random().nextInt(10000);
  return 'Nazik-$formattedDate$random';
}

String? inProgressPackages(List<PackagesRecord>? docs) {
  docs = docs ?? [];
  int n = 0;
  docs.asMap().forEach((index, record) {
    if (record.packageState != 'Canceled' &&
        record.packageState != 'ملغاة' &&
        record.packageState != 'Delivered' &&
        record.packageState != 'تم التوصيل' &&
        record.packageState != 'تم التوصيل وتسليم الراجع للمكتب' &&
        record.packageState != 'Delivered and rev handed to office' &&
        record.packageState != 'تم التوصيل وتسليم الراجع للزبون' &&
        record.packageState != 'Delivered and rev handed to client') n++;
  });
  String count = n.toString();
  return count;
}

String? deliveredPackages(List<PackagesRecord>? docs) {
  docs = docs ?? [];
  int n = 0;
  docs.asMap().forEach((index, record) {
    if (record.packageState == 'Delivered' ||
        record.packageState == 'تم التوصيل وتسليم الراجع للمكتب' ||
        record.packageState == 'Delivered and rev handed to office' ||
        record.packageState == 'تم التوصيل وتسليم الراجع للزبون' ||
        record.packageState == 'Delivered and rev handed to client' ||
        record.packageState == 'تم التوصيل') n++;
  });
  String count = n.toString();
  return count;
}

String? revReady(List<PackagesRecord>? docs) {
  docs = docs ?? [];
  double n = 0;
  docs.asMap().forEach((index, record) {
    if (record.packageState == 'تم التوصيل وتسليم الراجع للمكتب' ||
        record.packageState == 'Delivered and rev handed to office')
      n += record.rev;
  });

  String count = n.toString();
  return count;
}

String? canceledPackages(List<PackagesRecord>? docs) {
  docs = docs ?? [];
  int n = 0;
  docs.asMap().forEach((index, record) {
    if (record.packageState == 'Canceled' || record.packageState == 'ملغاة')
      n++;
  });
  String count = n.toString();
  return count;
}

String? revHanded(List<PackagesRecord>? docs) {
  docs = docs ?? [];
  double n = 0;
  docs.asMap().forEach((index, record) {
    if (record.packageState == 'تم التوصيل وتسليم الراجع للزبون' ||
        record.packageState == 'Delivered and rev handed to client')
      n += record.rev;
  });
  String count = n.toString();
  return count;
}

String? revInProgress(List<PackagesRecord>? docs) {
  docs = docs ?? [];
  double n = 0;
  docs.asMap().forEach((index, record) {
    if (record.packageState != 'تم التوصيل وتسليم الراجع للزبون' &&
        record.packageState != 'Delivered and rev handed to client' &&
        record.packageState != 'Delivered and rev handed to office' &&
        record.packageState != 'تم التوصيل وتسليم الراجع للمكتب')
      n += record.rev;
  });

  String count = n.toString();
  return count;
}

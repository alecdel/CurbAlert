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

double latLongDistance(
  LatLng? locA,
  LatLng? locB,
) {
  if (locA == null || locB == null) return 0.0;

  const double earthRadiusMiles = 3958.8;
  // Convert degrees to radians
  double lat1 = locA.latitude * math.pi / 180;
  double lon1 = locA.longitude * math.pi / 180;
  double lat2 = locB.latitude * math.pi / 180;
  double lon2 = locB.longitude * math.pi / 180;

  // Haversine formula
  double dLat = lat2 - lat1;
  double dLon = lon2 - lon1;

  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1) * math.cos(lat2) * math.sin(dLon / 2) * math.sin(dLon / 2);

  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  // Distance in miles
  return earthRadiusMiles * c;
}

bool isLocationEnabled(LatLng location) {
  // write a function to check if the current device location is 0,0. if it is return false if it isnt return true
  return location.latitude != 0.0 && location.longitude != 0.0;
}

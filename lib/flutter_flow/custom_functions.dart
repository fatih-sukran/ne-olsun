import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int getProductCount(
  ProductsRecord productId,
  List<ProductsStruct> allProducts,
) {
  for (int i = 0; i < allProducts.length; i++) {
    if (allProducts[i].productDocumentId?.id == productId.reference.id) {
      return allProducts[i].count;
    }
  }

  return 0;
}

double getTotalPrice(List<ProductsStruct> allProducts) {
  double sum = 0;
  for (int i = 0; i < allProducts.length; i++) {
    int count = allProducts[i].count;
    double price = allProducts[i].price;
    sum = sum + (count * price);
  }

  return sum;
}

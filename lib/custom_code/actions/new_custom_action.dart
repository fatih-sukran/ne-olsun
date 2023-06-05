// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
Future newCustomAction() async {
  // Add your function code here!
  var a = await FirebaseFirestore.instance
      .collection('cafes')
      .where("name", isEqualTo: "Fatih Cafe")
      .get();

  print('a.size: ${a.size}');
  print('a.docs[0].id: ${a.docs[0].id}');
  print('a.docs[0].reference.id: ${a.docs[0].reference.id}');
  print('a.docs[0].data: ${a.docs[0].data()}');
  print('a.docs[0].get("name"): ${a.docs[0].get("name")}');
  print('a.docs[0].runtimeType: ${a.docs[0].runtimeType}');
  print(a);
}

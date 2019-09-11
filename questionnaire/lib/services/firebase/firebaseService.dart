
import 'dart:convert';
import 'package:flutter/services.dart';

class FirebaseService {
  
// MARK: - Appearance

  // just nor now
  Future<Map<String, dynamic>> fetchQuests() async {
    String responce = await _loadJSONResponce();
    return json.decode(responce).cast<String, dynamic>();
  }

  // MARK: - Private 

  Future<String> _loadJSONResponce() async {
    return await rootBundle.loadString("assets/responce.json");
  }
}
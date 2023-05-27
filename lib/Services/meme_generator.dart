import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<Map<String, dynamic>> generateMeme() async {
  Response response = await Dio().get("https://meme-api.com/gimme");

  return response.data;
}

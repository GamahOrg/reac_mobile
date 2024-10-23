import 'package:dio/dio.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class Files{

 static Future<void> downloadFile(String url, String fileName) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        Directory? directory = Directory('/storage/emulated/0/Download');
        String filePath = '${directory.path}/$fileName';
        Dio dio = Dio();
        await dio.download(url, filePath);
        print('File downloaded to $filePath');
            } catch (e) {
        print('Error: $e');
      }
    } else {
      print('Permission Denied');
    }
  }

 static Future<void> openFileFromUrl(String url) async {
   try {
     final tempDir = await getTemporaryDirectory();
     final filePath = '${tempDir.path}/${url.split('/').last}';
     final dio = Dio();
     final response = await dio.download(url, filePath);

     if (response.statusCode == 200) {
       final openFileResult = await OpenFile.open(filePath);
       if (openFileResult.type != ResultType.done) {
         print('Error opening file: ${openFileResult.message}');
       }
     } else {
       print('Error downloading file: Status code ${response.statusCode}');
     }
   } catch (e) {
     print('Error: $e');
   }
 }

}
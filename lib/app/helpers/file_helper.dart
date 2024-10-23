import 'dart:io';
import 'dart:math';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../function.dart';

class FileHelper {

  static bool isImageFile(File file) {
    final List<int> bytes = file.readAsBytesSync().take(12).toList();
    if (bytes.length >= 2 && bytes[0] == 0xFF && bytes[1] == 0xD8) {
      // The file starts with the JPEG magic number (FF D8).
      return false;
    }
    return true;
  }

  static String getFileExtension(String filePath) {
    return path.extension(filePath);
  }

  static bool isVideoFile(String filePath) {
    final videoExtensions = ['.mp4', '.mkv', '.avi', '.mov']; // Add more video extensions if needed

    final fileExtension = filePath.toLowerCase().split('.').last;

    return videoExtensions.contains('.$fileExtension');
  }



  static Future<String> copyFileToTemporaryDirectory(String sourceFilePath) async {
    try {
      // Get the temporary directory
      final tempDir = await getApplicationDocumentsDirectory();

      // Extract the filename (including extension) from the source path
      final sourceFileName = p.basename(sourceFilePath);

      // final time = DateTime.now().toIso8601String().replaceAll('.', ':');
      final time = Random().nextInt(1000000).toString();

      // Define the target path in the temporary directory
      final targetPath = "${tempDir.path}/${time}_$sourceFileName";

      // Copy the file from the source to the target path
      await File(sourceFilePath).copy(targetPath);

      // Return the path of the copied file
      dPrint("sourceFilePath:$sourceFilePath \n targetPath:$targetPath");
      return targetPath;
    } catch (e) {
      print("Error copying file: $e");
      throw Exception(
          "error in save file: $e"); // Return null in case of an error
    }
  }

  static removeFileFromLocal(String path) {
    var file = File(path);
    try {
      file.delete();
      dPrint('removeFileFromLocal removed');
      // listFilesInDocumentsDirectory();
    } catch (e) {
      dPrint('removeFileFromLocal error: $e');
    }
  }

  static void listFilesInDocumentsDirectory() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    if (appDocDir.existsSync()) {
      List<FileSystemEntity> files = appDocDir.listSync();
      for (var file in files) {
        if (file is File) {
          file.deleteSync();
          removeFileFromLocal(file.path);
          print("File11: ${file.path}");
        }
      }
    } else {
      print("Application documents directory does not exist.");
    }
  }
}
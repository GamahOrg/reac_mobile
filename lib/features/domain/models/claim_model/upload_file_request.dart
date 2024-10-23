import 'dart:io';
class UploadFileRequest{
  String Id;
  List<File> Files;
  UploadFileRequest({required this.Id,required this.Files});
}
import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reac/app/app_assets.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/design/widget/language_direction.dart';
import 'package:reac/my_app.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart' as sfPdf;

class ReplyReporterScreen extends StatefulWidget {
  const ReplyReporterScreen({super.key});

  static const String id = "ReplyReporterScreen";

  @override
  State<ReplyReporterScreen> createState() => _ReplyReporterScreenState();
}

class _ReplyReporterScreenState extends State<ReplyReporterScreen> {
  bool _showEmojiPicker = false;
  TextEditingController chatController = TextEditingController();
  PlatformFile? result;
  int? totalPages;
  final ImagePicker _picker = ImagePicker();
  List<String> selectedEmojis = [];

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      print("Camera image path: ${image.path}");
    }
  }

  void _toggleEmojiPicker() {
    setState(() {
      _showEmojiPicker = !_showEmojiPicker;
    });
  }

  void _onEmojiSelected(Category? category, Emoji? emoji) {
    if (emoji != null) {
      final emojiText = emoji.emoji;
      selectedEmojis.add(emojiText);
      print('Selected emojis: $selectedEmojis');
      setState(() {});
    }
  }

  Future<void> pickFile() async {
    try {
      final pickedFiles =
          await FilePicker.platform.pickFiles(type: FileType.any);
      if (pickedFiles != null && pickedFiles.files.isNotEmpty) {
        result = pickedFiles.files.first;
        getPageCountForFile(File(result!.path.toString()));
        setState(() {});
        print('Picked file path: ${result!.path}');
        print('File name: ${result!.name}');
        print('File size: ${result!.size}');
      } else {
        print('No file selected.');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  Future<int> getPageCountForFile(File file) async {
    final String extension = file.path.split('.').last.toLowerCase();

    switch (extension) {
      case 'pdf':
        return await getPdfPageCount(file);
      // case 'xls':
      //   return await getExcelSheetCount(file);
      default:
        throw UnsupportedError('File type not supported for page counting');
    }
  }

  Future<int> getPdfPageCount(File file) async {
    final bytes = await file.readAsBytes();
    final sfPdf.PdfDocument document = sfPdf.PdfDocument(inputBytes: bytes);
    totalPages = document.pages.count;
    setState(() {});
    return document.pages.count;
  }

  // Future<int> getExcelSheetCount(File file) async {
  //   // var bytes = file.readAsBytesSync();
  //   // var excel = Excel.decodeBytes(bytes);
  //    totalPages=excel.tables.keys.length;
  //   return excel.tables.keys.length;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
        child: Column(
          children: [
            Expanded(
                child: ListView(children: [
              const ChatBubble(
                content: 'محتوى الرسالة',
                isRead: true,
                isSent: true,
                time: '11:46 PM',
              ),
              result != null
                  ? AttachmentBubble(
                      extention: result!.extension.toString(),
                      fileName: result!.name.toString(),
                      fileSize:
                          '${(result!.size / 1024).floor().toString()} Mb',
                      filePages: '$totalPages Pages',
                      isSent: true,
                      time: '11:46 PM',
                    )
                  : const SizedBox(),
              const ChatBubble(
                content: 'محتوى الرسالة',
                isRead: true,
                isSent: true,
                time: '11:46 PM',
              ),
              const AttachmentBubble(
                extention: "pdf",
                fileName: 'مرفقات',
                fileSize: '4.2MB',
                filePages: '12 Pages',
                isSent: true,
                time: '11:46 PM',
              ),
            ])),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              width: 1, color: const Color(0xffE6E7EC)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    _toggleEmojiPicker();
                                    FocusScope.of(context).unfocus();
                                  },
                                  child:
                                      SvgPicture.asset(AppAssets.icHappyEmoji),
                                ),
                                SizedBox(width: 3.w),
                                Expanded(
                                  child: TextFormField(
                                    onTap: () {
                                      _showEmojiPicker = false;
                                      setState(() {});
                                    },
                                    cursorColor: AppColors.selectedTextTab,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.start,
                                    controller: chatController,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      hintText: MyApp.tr.writeMessage,
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: const Color(0xff000000),
                                      ),
                                    ),
                                    maxLines: null,
                                    minLines: 1,
                                  ),
                                ),
                                SizedBox(width: 3.w),
                                InkWell(
                                  onTap: _openCamera,
                                  child: SvgPicture.asset(AppAssets.icCamera),
                                ),
                                SizedBox(width: 3.w),
                                InkWell(
                                  onTap: () {
                                    pickFile();
                                  },
                                  child: SvgPicture.asset(
                                      AppAssets.icAttachCircle),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: LanguageDirection(
                            child: InkWell(
                                onTap: () {
                                  dPrint(MyApp.tr.send);
                                },
                                child: SvgPicture.asset(AppAssets.icSend)))),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                _showEmojiPicker ? EmojiIcon() : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  EmojiPicker EmojiIcon() {
    return EmojiPicker(
      onEmojiSelected: _onEmojiSelected,
      onBackspacePressed: () {},
      textEditingController: chatController,
      config: const Config(
        height: 300,
        checkPlatformCompatibility: true,
        emojiViewConfig: EmojiViewConfig(
          emojiSizeMax: 25,
          columns: 9,
          buttonMode: ButtonMode.MATERIAL,
          recentsLimit: 28,
          backgroundColor: Colors.white,
        ),
        swapCategoryAndBottomBar: false,
        skinToneConfig: SkinToneConfig(enabled: true),
        categoryViewConfig: CategoryViewConfig(
          tabBarHeight: 40,
          iconColorSelected: AppColors.selectedTextTab,
          indicatorColor: AppColors.selectedTextTab,
        ),
        bottomActionBarConfig: BottomActionBarConfig(
            buttonIconColor: AppColors.selectedTextTab,
            backgroundColor: Color(0xFFEBEFF2),
            buttonColor: Colors.grey),
        searchViewConfig: SearchViewConfig(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: LanguageDirection(
            child: SvgPicture.asset(
              AppAssets.icArrowSquareRight,
            ),
          ),
        ),
      ),
      leadingWidth: 16.w,
      titleSpacing: 0,
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              AppAssets.bgOwner,
            ),
            radius: 25,
          ),
          SizedBox(
            width: 3.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "صالح سعد العتيبي",
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffFFFFFF)),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                "محكم",
                style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFFFF)),
              )
            ],
          ),
        ],
      ),
      toolbarHeight: MediaQuery.sizeOf(context).height * 0.11,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff03598D),
              Color(0xff002F56),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String content;
  final bool isRead;
  final bool isSent;
  final String time;

  const ChatBubble({
    super.key,
    required this.content,
    required this.isRead,
    required this.isSent,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: isSent ? Colors.white : Colors.grey[300],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              content,
              style: TextStyle(
                  fontSize: 11.sp,
                  color: const Color(0xff222325),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 9.0.sp,
                      color: const Color(0xffA5AEB1),
                      fontWeight: FontWeight.w400),
                ),
                isRead
                    ? Row(
                        children: [
                          Text(
                            MyApp.tr.readDone,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 9.sp,
                                color: const Color(0xff719B37)),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          SvgPicture.asset(AppAssets.icCheckMark)
                        ],
                      )
                    : const Row()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AttachmentBubble extends StatelessWidget {
  final String fileName;
  final String fileSize;
  final String filePages;
  final bool isSent;
  final String time;
  final String extention;

  const AttachmentBubble(
      {super.key,
      required this.fileName,
      required this.fileSize,
      required this.filePages,
      required this.isSent,
      required this.time,
      required this.extention});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 4.h),
        width: 70.w,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 1.h, top: 2.5.h),
              padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
              decoration: BoxDecoration(
                color: isSent ? const Color(0xff002F56) : Colors.grey[300],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppAssets.icPdf),
                      SizedBox(width: 3.w),
                      Text(
                        fileName,
                        style: TextStyle(
                            fontSize: 11.0.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xffFFFFFF)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    '$extention  •  $fileSize  •  $filePages',
                    style: TextStyle(
                        fontSize: 9.0.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SvgPicture.asset(AppAssets.icCheckMarkGray),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "تم الإرسال",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: Color(0xff879094)),
                ),
                Spacer(),
                Text(
                  "11:46 PM",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffA5AEB1)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

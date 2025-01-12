import 'dart:ui';
import '../../../../app/app_enums.dart';

class LitigationStatusHelper {
  static Color getStatusColorById(int? id) {
    switch (id) {
      case 24:
      case 23:
      case 9:
      case 12:
        return const Color(0xffF8D8D7);
      case 3:
      case 15:
      case 21:
        return const Color(0xffFCF6AE);
      case 10:
      case 2:
      case 11:
      case 1:
        return const Color(0xffE6F2FB);
      case 7:
      case 8:
        return const Color(0xffFFFFFF);
      case 6:
      case 20:
      case 22:
      case 18:
        return const Color(0xffE5F4D4);
      case 13:
      case 14:
        return const Color(0xff4DC1BB).withOpacity(0.1);
      default:
        return const Color(0xffffffff);
    }
  }
  static Color getTextColorById(int? id) {
    switch (id) {
      case 10:
      case 2:
      case 11:
      case 1:
        return const Color(0xff002F56);
      case 6:
      case 20:
      case 22:
      case 18:
        return const Color(0xff719B37);case 24:
      case 23:
      case 9:
      case 12:
        return const Color(0xffDC1D35);
      case 15:
      case 21:
      case 3:
        return const Color(0xffBC9711);
      case 7:
      case 8:
        return const Color(0xff002F56);
      case 13:
      case 14:
        return const Color(0xff4DC1BB);
      default:
        return const Color(0xffffffff);
    }
  }
  static String getRequestStatusTitleById(int id) {
    LitigationStatus? status = LitigationStatus.values.firstWhere(
          (status) => status.value == id,
      orElse: () => LitigationStatus.New,
    );
    return status.name;
  }
}

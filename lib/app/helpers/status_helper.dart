import '../../my_app.dart';

class StatusHelper {
  static String getStatusName(int status) {
    switch (status) {
      case 11:
        return MyApp.tr.draft;
      case 13:
        return MyApp.tr.re_edit;
      case 14:
        return MyApp.tr.under_audit;
      case 1:
      case 2:
      case 16:
      case 17:
      case 6:
        return MyApp.tr.under_reconciliation;
      case 24:
        return MyApp.tr.cancelled;
      case 18:
        return MyApp.tr.reconciliationWasMade;
      case 7:
        return MyApp.tr.waiverOfRight;
      case 8:
        return MyApp.tr.waiverOfTheLitigation;
      case 9:
        return MyApp.tr.reconciliationWasNotMade;
      case 10:
        return MyApp.tr.reconciliationWasNotMade;
    }
    return "";
  }
  /*static int getStatus(String name) {
    switch (name) {
      case MyApp.tr.draft:
        return 11;
      case MyApp.tr.re_edit:
        return 13;
      case MyApp.tr.under_audit:
        return 14;
      case MyApp.tr.under_reconciliation:
        return 1;
      case MyApp.tr.cancelled:
        return 24;
      case MyApp.tr.reconciliationWasMade:
        return 18;
      case MyApp.tr.waiverOfRight:
        return 7;
      case MyApp.tr.waiverOfTheLitigation:
        return 8;
      case MyApp.tr.reconciliationWasNotMade:
        return 9;
      case MyApp.tr.save_closed:
        return 10;
    }
    return 0;
  }*/
}

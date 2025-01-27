import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:reac/app/app_colors.dart';
import 'package:reac/app/di/di.dart';
import 'package:reac/app/extensions.dart';
import 'package:reac/app/function.dart';
import 'package:reac/app_cubit.dart';
import 'package:reac/features/presentation/auth_screens/login/login_cubit.dart';
import 'package:reac/my_app.dart';

import '../../../../app/app_assets.dart';
import '../../home/claims_screen.dart';
import '../login/login_state.dart';

class VerifyArgument {
  String? transactionID;
  String? code;
  VerifyArgument({this.transactionID, this.code});
}

class VerifyLoginScreen extends StatefulWidget {
  VerifyArgument? arg;
  VerifyLoginScreen({super.key, this.arg});

  static const String id = "VerifyLoginCitizenScreen";

  @override
  State<VerifyLoginScreen> createState() => _VerifyLoginScreenState();
}

class _VerifyLoginScreenState extends State<VerifyLoginScreen> {
//  late SignalRService _signalRService;

  final myCubit = getIt<LoginCubit>();
  @override
  void initState() {
    super.initState();
    myCubit.checkStatusUser(widget.arg!.transactionID.toString());

  }

  @override
  Widget build(BuildContext context) {
    print("arg${widget.arg?.transactionID??""}");
  //  _signalRService = SignalRService(widget.arg?.transactionID??"");
  //  _signalRService.connect();

    return BlocProvider(
      create: (context)=>myCubit,
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){{
            if (state is SuccessState) {
              Navigator.pushNamed(context, ClaimsScreen.id, arguments: "login");
            }
          }
        },
        builder: (context,state){
          return Scaffold(
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(image: AssetImage(AppAssets.bgLoginShape)),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height,
                      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 7.h,
                          ),
                          Center(
                              child: Image(image: AssetImage(AppAssets.bgLoginLogo))),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            MyApp.tr
                                .pleaseOpenTheApplicationAndConfirmTheRequestByChoosingTheNumber,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 11.sp,
                                color: AppColors.selectedTextTab),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                          Center(
                            child: Container(
                              width: 27.w,
                              padding: EdgeInsets.symmetric(vertical: 0.7.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      width: 1, color: AppColors.lightGray)),
                              child: Text(
                                AppCubit.get(context).isArSelected
                                    ? (widget.arg?.code) ?? "".toFarsi()
                                    : (widget.arg?.code) ?? "",
                                style: TextStyle(
                                    fontSize: 34.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.selectedTextTab),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },

      ),
    );
  }

  /*setUpSignalR() sync*{
    //var transportProtLogger = Logger("SignalR - transport")
  }*/

  //HubConnection? _hubConnection;
  //late Logger _logger;
/*
  Future<void> openChatConnection() async {
    Logger.root.level = Level.ALL;
    _logger = Logger("ChatPageViewModel");
    final logger = _logger;

    if (_hubConnection == null) {
      final httpConnectionOptions =
          new HttpConnectionOptions(logger: logger, logMessageContent: true);

      _hubConnection = HubConnectionBuilder()
          .withUrl("http://192.168.194.171:3333/identity-hub",
              options: httpConnectionOptions)
          .withAutomaticReconnect(retryDelays: [2000, 5000, 10000, 20000])
          .configureLogging(logger)
          .build();
      _hubConnection!.on("ReceivedIdentityStatus", _handleIncommingChatMessage);
      _hubConnection!.onclose(({error}) => "connectionIsOpen = false");
      _hubConnection!.onreconnecting(({error}) {
        print("onreconnecting called");
      });
      _hubConnection!.onreconnected(({connectionId}) {
        print("onreconnected called");
      });
      // _hubConnection!.on("OnMessage", _handleIncommingChatMessage);
    }

    if (_hubConnection!.state != HubConnectionState.Connected) {
      await _hubConnection!.start();
    }
    _hubConnection!
        .invoke("Register", args: <Object>[widget.arg?.transactionID ?? ""]);
  }
*/
  /*void _handleIncommingChatMessage(List<Object?>? args) {
    print(
        "priiiiiiiiiiiiiint${(args?[0] as IdentityStatus).transactionId ?? ""}");
  }*/
}

class IdentityStatus {
  String? transactionId;
  String? token;
  String? refreshToken;
  bool? isValid;

  IdentityStatus(
      {this.transactionId, this.token, this.refreshToken, this.isValid});
}

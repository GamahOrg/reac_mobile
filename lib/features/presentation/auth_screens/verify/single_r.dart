import 'dart:io';

import 'package:logging/logging.dart';
import 'package:reac/app/api_urls.dart';
import 'package:signalr_netcore/json_hub_protocol.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SignalRService {
  HubConnection? _hubConnection;
  String transID = "";
  SignalRService(this.transID);

  Future<void> connect() async {
// If youn want to also to log out transport messages:
    final transportProtLogger = Logger("SignalR - transport");
    final options = HttpConnectionOptions(logger: transportProtLogger);
    final hubProtLogger = Logger("SignalR - hub");

    _hubConnection = HubConnectionBuilder()
        .withUrl(ApiUrls.identityHub,
            options: options) // Replace with your SignalR server URL
        .withAutomaticReconnect(retryDelays: [10000, 20000])
        .withHubProtocol(JsonHubProtocol())
        .configureLogging(hubProtLogger)
        .build();

    // Listen for connection state changes
    _hubConnection!.onreconnected(({connectionId}) {
      print('Reconnected to SignalR server');
    });
    _hubConnection!.onreconnecting(({error}) {
      print('Reconnecting to SignalR server');
    });
    _hubConnection!.onclose(({error}) {
      print('Connection closed');
    });

    _hubConnection!.on("Register", (items) {
      print("Register");
    });

    _hubConnection!.on("ReceivedIdentityStatus", (items) {
      print("ReceivedIdentityStatus");
    });
    // Start connection
    try {
      _hubConnection!.start()?.then((value) {
        print('connected');
        sendMessage(transID);
      });
      _hubConnection!.on(
        'ReceivedIdentityStatus',
        (arguments) {
          print('notification');
          print(arguments);
        },
      );
      /*
      hubConnection.on('ReceiveNotificationMessage',_newmessages);
      await _hubConnection!.start()?.catchError((error)=>{
        print("error$error")
      });
      print('Connected to SignalR server');*/
    } catch (e) {
      print('Connection failed: $e');
    }
  }

  void ReceivedIdentityStatus(List<Object?>? arguments) {
    print("ReceivedIdentityStatus");
  }

  Future<void> sendMessage(String message) async {
    if (isConnected()) {
      try {
        await _hubConnection!.invoke('Register', args: [message]);
        print('Message sent: $message');
      } catch (e) {
        print('Invoke failed: $e');
      }
    } else {
      print('Not connected to SignalR server');
    }
  }

  bool isConnected() {
    return _hubConnection?.state == HubConnectionState.Connected;
  }
}

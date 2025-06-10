import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ApiLoggerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API Logs")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: ApiLogger.getLogs().length,
          itemBuilder: (context, index) {
            return _buildLogEntry(ApiLogger.getLogs()[index]);
          },
        ),
      ),
    );
  }

  Widget _buildLogEntry(String logEntry) {
    List<String> lines = logEntry.split("\n");
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: lines.map((line) {
            Color textColor = Colors.black;
            if (line.startsWith("API Called:")) {
              textColor = Colors.blue;
            } else if (line.startsWith("Params:")) {
              textColor = Colors.orange;
            } else if (line.startsWith("Response:")) {
              textColor = Colors.green;
            }
            return Text(line, style: TextStyle(color: textColor, fontWeight: FontWeight.w500));
          }).toList(),
        ),
      ),
    );
  }
}

void showApiLogsScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => ApiLoggerScreen()),
  );
}



class ApiLogger {
  static final List<String> _apiLogs = [];
  static final Logger _logger = Logger();

  static void logApiCall(String apiUrl, Map<String, dynamic> params, [dynamic response, dynamic failure]) {
    String logEntry = "API Called: $apiUrl\nParams: ${params.toString()}";

    if (response != null) {
      logEntry += "\nResponse: ${response.toString()}";
    }

    if (failure != null) {
      // Try to extract a useful message from the failure
      String failureMessage = failure.toString();

      // If it has a `message` field, use that
      if (failure is dynamic && failure?.message != null) {
        failureMessage = failure.message.toString();
      }

      logEntry += "\nFailure: $failureMessage";
    }

    logEntry += "\n----------------------------";

    _apiLogs.add(logEntry);
    _logger.d(logEntry);
  }


  static List<String> getLogs() {
    return _apiLogs;
  }
}
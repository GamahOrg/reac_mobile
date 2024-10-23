import 'package:flutter/material.dart';
import 'package:reac/app/state_render/state_render.dart';

import '../../features/presentation/auth_screens/login/login_state.dart';
import '../views.dart';


class StateRenderImpl extends StateRender {
  final BuildContext context;

  StateRenderImpl(this.context);

  @override
  void render(AppState state) {
    if (state is LoadingState) {
      _showLoading();
    } else if (state is SuccessState) {
      _showSuccess(state.data);
    } else if (state is ErrorState) {
      _showError(state.error);
    }
  }

  void _showLoading() {
    //loadingView();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text('Loading...'),
            ],
          ),
        ),
      );
    });
  }
  void dismissDialog(){
    Navigator.of(context).pop();
  }

  void _showSuccess(dynamic data) {
    Navigator.of(context).pop(); // Close loading dialog if open
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Success: $data')),
      );
    });
  }

  void _showError(String error) {
    //Navigator.of(context).pop(); // Close loading dialog if open
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Error: $error'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
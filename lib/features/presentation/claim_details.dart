import 'package:flutter/material.dart';
import 'package:reac/features/presentation/widgets/my_app_bar.dart';

class ClaimDetailsScreen extends StatefulWidget {
  const ClaimDetailsScreen({super.key});

  @override
  State<ClaimDetailsScreen> createState() => _ClaimDetailsScreenState();
}

class _ClaimDetailsScreenState extends State<ClaimDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: const Center(child: Text('text')),
    );
  }
}

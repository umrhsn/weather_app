import 'package:flutter/material.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/main_page_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const MainPageWidget();
  }
}

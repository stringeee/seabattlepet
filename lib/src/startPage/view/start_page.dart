import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webpetgame/src/utils/background_widget.dart';
import 'package:webpetgame/src/widgets/buttons.dart';

class StartPage extends StatefulWidget {
  static const String endpoint = "/";
  const StartPage({Key key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  TextStyle font = TextStyle();
  @override
  void initState() {
    font = GoogleFonts.getFont("Comforter Brush",
        textStyle: TextStyle(fontSize: 90, color: Colors.white));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundWidget(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Text("SeaBattle Online", style: font), DefaultButton()],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:test_packages_app/widgets/text_view.dart';

import '../../widgets/icon_view.dart';

class PieMenuPage extends StatefulWidget {
  const PieMenuPage({Key? key}) : super(key: key);

  @override
  State<PieMenuPage> createState() => _PieMenuPageState();
}

class _PieMenuPageState extends State<PieMenuPage> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return PieCanvas(
      theme: const PieTheme(
          delayDuration: Duration.zero,
          buttonSize: 50,
          pointerSize: 1),
      onMenuToggle: (isActivee) {
        setState(() {
          isActive = !isActivee;
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const TextView(
            text: "Pie Menu",
            fontSize: 16,
          ),
        ),
        body: PieMenu(
          // onTap: () => print("tapped"),
          actions: [
            PieAction(
              tooltip: "Like",
              onSelect: () => showAlertDialog(context, "Like button tapped!"),
              child: IconView(icon: Icons.thumb_up_alt_outlined),
            ),
            PieAction(
              tooltip: "Heart",
              onSelect: () => showAlertDialog(context, "Heart button tapped!"),
              child: IconView(icon: Icons.heart_broken),
            ),
            PieAction(
              tooltip: "Heart",
              onSelect: () => showAlertDialog(context, "Heart button tapped!"),
              child: IconView(icon: Icons.heart_broken),
            ),
          ],
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
              width: 50,
              color: Colors.amber,
              child: const Icon(Icons.all_inclusive_rounded),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showAlertDialog(BuildContext context, String title) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: TextView(text: title),
      ),
    );
  }
}

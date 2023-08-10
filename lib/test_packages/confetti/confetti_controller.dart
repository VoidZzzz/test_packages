import 'package:confetti/confetti.dart';
import 'package:get/get.dart';
import 'package:test_packages_app/test_packages/confetti/confetti.dart';

class TestConfettiController extends GetxController {
  bool isPlaying = true;
  late ConfettiController confettiController;
  bool xCongrats = false;

  @override
  void onInit() {
    super.onInit();
    confettiController = ConfettiController();
  }

  void onTap() {
    isPlaying = !isPlaying;
    if (isPlaying) {
      confettiController.stop();
    } else {
      confettiController.play();
    }
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

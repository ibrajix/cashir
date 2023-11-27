import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterProvider extends StateNotifier<String>{
  RegisterProvider(super.state);

}

final passwordVisibleProvider = StateProvider((ref) => false);
final termsCheckedProvider = StateProvider((ref) => false);
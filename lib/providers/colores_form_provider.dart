import 'package:flutter/material.dart';
import 'package:logginapp2/models/models.dart';

class ColorsFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkeyColors = new GlobalKey<FormState>();

  ColorModel color;

  ColorsFormProvider(this.color);

  // updateAvailability( bool value ){
  //   print(value);
  //   this.color.disponible = value;
  //   notifyListeners();

  // }

  bool isValidForm() {
    print(color.nombreColor);
    print(color.id);
    print(color.fotoColor);

    return formkeyColors.currentState?.validate() ?? false;
  }
}

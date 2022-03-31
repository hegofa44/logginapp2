import 'package:flutter/material.dart';
import 'package:logginapp2/models/models.dart';
import 'package:logginapp2/widgets/product_card.dart';

class ProductFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  Product product;

  ProductFormProvider(this.product);

  updateAvailability( bool value ){
    print(value);
    this.product.disponible = value;
    notifyListeners();

  }

  bool isValidForm(){

    print( product.referencia);
    print(product.valorUnidad);
    print(product.disponible);

    return formKey.currentState?.validate() ?? false;
  }

  

}
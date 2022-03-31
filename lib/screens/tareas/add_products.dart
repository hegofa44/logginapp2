// import 'dart:async';
// import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logginapp2/providers/product_form_provider.dart';
import 'package:logginapp2/services/services.dart';
import 'package:logginapp2/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AddProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsServices>(context);
    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _AddProductScreenBody(productService: productService),
    );
  }
}

class _AddProductScreenBody extends StatelessWidget {
  const _AddProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsServices productService;

  @override
  Widget build(BuildContext context) {
    // final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
    final productForm = Provider.of<ProductFormProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    // width: double.infinity,
                    // height: double.infinity,
                    color: Colors.white,
                  ),
                  FadeInLeft(
                    child: ProductImage(
                      url: productService.selectedProduct.fotoUrl,
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 130),
                          borderRadius: BorderRadius.circular(25)),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => {Navigator.of(context).pop()},
                        icon: Icon(Icons.arrow_back_ios_rounded,
                            size: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 130),
                          borderRadius: BorderRadius.circular(25)),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          final picker = new ImagePicker();
                          final PickedFile? pickedFile = await picker.getImage(
                            source: ImageSource.camera,
                            imageQuality: 100,
                          );

                          if (pickedFile == null) {
                            print('No selecciono nada');
                            return;
                          }
                          productService
                              .updateSelectedProductImage(pickedFile.path);
                          print('Tenemos imagen ${pickedFile.path}');
                        },
                        icon: FaIcon(FontAwesomeIcons.camera,
                            size: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 130),
                          borderRadius: BorderRadius.circular(25)),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () async {
                          final picker = new ImagePicker();
                          final PickedFile? pickedFile = await picker.getImage(
                            source: ImageSource.gallery,
                            imageQuality: 100,
                          );

                          if (pickedFile == null) {
                            print('No selecciono nada');
                            return;
                          }
                          productService
                              .updateSelectedProductImage(pickedFile.path);
                          print('Tenemos imagen ${pickedFile.path}');
                        },
                        icon: FaIcon(FontAwesomeIcons.image,
                            size: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 30,
              // ),

              FadeInRight(child: _FormAddProduct())
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
          // style: ElevatedButton.styleFrom(minimumSize: Size(150, 40)),
          onPressed: productService.isSaving
              ? null
              : () async {
                  if (!productForm.isValidForm()) return;
                  final String? imageUrl = await productService.uploadImage();
                  // print(imageUrl);
                  if (imageUrl != null) productForm.product.fotoUrl = imageUrl;
                  await productService.saveOrCreateProduct(productForm.product);
                  Navigator.pop(context);
                },
          child: Text('Registrar'),
        ),
      ),
    );
  }
}

class _FormAddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;
    final ProductsServices productsServices;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Form(
        key: productForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Ingresa los datos del nuevo modelo',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: product.referencia,
                    onChanged: (value) => {
                      product.referencia = value,
                      // product.colores!.comodin = 'colores',
                    },
                    validator: (value) {
                      if (value == null || value.length < 1)
                        return 'La referencia es obligatoria';
                    },
                    decoration: InputDecoration(
                        helperText: 'Nombre del modelo',
                        // hintText: 'Referencia',
                        labelText: 'Referencia',
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    initialValue: '${product.valorUnidad}',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    onChanged: (value) {
                      if (double.tryParse(value) == null) {
                        product.valorUnidad = 0;
                      } else {
                        product.valorUnidad = double.parse(value);
                      }
                    },

                    // validator: '',
                    decoration: InputDecoration(
                        helperText: 'Precio por mayor',
                        // hintText: 'Referencia',
                        labelText: 'Precío',
                        border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 130,
                  child: Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          helperText: 'Fecha de registro',
                          // hintText: 'Referencia',
                          labelText: 'Fecha',
                          border: OutlineInputBorder()),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: SwitchListTile.adaptive(
                    value: product.disponible,
                    title: Text('Disponible'),
                    // activeColor: ,
                    onChanged: (value) async {
                      productForm.updateAvailability(value);
                    },
                  ),
                ),
                // Expanded(
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //         helperText: 'Describe el calzado',
                //         // hintText: 'Referencia',
                //         labelText: 'Fecha',
                //         border: OutlineInputBorder()),
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              initialValue: product.descripcion,
              onChanged: (value) => product.descripcion = value,
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'La descripcion es obligatoria';
              },
              decoration: InputDecoration(
                  helperText: 'Describe el producto',
                  // hintText: 'Referencia',
                  labelText: 'Descripcion',
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(minimumSize: Size(150, 40)),
            //   onPressed: () async {
            //     if (!productForm.isValidForm()) return;
            //     await productsServices.saveOrCreateProduct(productForm.product);
            //   },
            //   child: Text('Siguiente'),
            // ),
          ],
        ),
      ),
    );
  }
}

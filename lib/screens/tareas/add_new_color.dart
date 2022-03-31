// import 'dart:async';
// import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logginapp2/models/models.dart';
import 'package:logginapp2/providers/product_form_provider.dart';
import 'package:logginapp2/services/services.dart';
import 'package:logginapp2/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/colores_form_provider.dart';
import '../../providers/tallas_form_provider.dart';

class AddNewColorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorService = Provider.of<ColorsService>(context);
    // final sizeService = Provider.of<SizesService>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ColorsFormProvider(colorService.selectedColor)),
        // ChangeNotifierProvider(
        //     create: (_) => SizesFormProvider(sizeService.selectedSize)),
      ],
      child: _AddNewColorScreenBody(
        colorService: colorService,
        // sizeService: sizeService,
      ),
    );
  }
}

class _AddNewColorScreenBody extends StatelessWidget {
  const _AddNewColorScreenBody({
    Key? key,
    required this.colorService,
    // required this.sizeService,
  }) : super(key: key);

  final ColorsService colorService;
  // final SizesService sizeService;

  @override
  Widget build(BuildContext context) {
    // final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
    final colorForm = Provider.of<ColorsFormProvider>(context);
    // final sizeForm = Provider.of<SizesFormProvider>(context);
    final sizeService = Provider.of<SizesService>(context);
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
                      url: colorService.selectedColor.fotoColor,
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
                          colorService
                              .updateSelectedColorImage(pickedFile.path);
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
                          colorService
                              .updateSelectedColorImage(pickedFile.path);
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

              FadeInRight(child: _FormAddNewColor())
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
          // style: ElevatedButton.styleFrom(minimumSize: Size(150, 40)),
          onPressed: colorService.isSaving
              ? null
              : () async {
                  if (!colorForm.isValidForm()) return;
                  final String? imageUrl = await colorService.uploadImage();
                  // print(imageUrl);
                  if (imageUrl != null) colorForm.color.fotoColor = imageUrl;
                  await colorService.saveOrCreateColor(colorForm.color);
                  print('El id es: ' + colorForm.color.id.toString());
                  final prueba2 =
                      Provider.of<SizesService>(context, listen: false);
                  prueba2.idColor = colorForm.color.id;
                  for (int i = 4; i < 13; i++) {
                    sizeService.selectedSize = new SizeModel(
                      // id: 'talla' + (i - 3).toString(),
                      nombreTalla: 30 + i,
                      paresTalla: 0,
                    );
                    // sizeService.selectedSize.nombreTalla = 26;
                    await sizeService.createSize(sizeService.selectedSize);
                  }
                  Navigator.pop(context);
                },
          child: Text('Registrar'),
        ),
      ),
    );
  }
}

class _FormAddNewColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorForm = Provider.of<ColorsFormProvider>(context);
    final color = colorForm.color;
    // final ProductsServices productsServices;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Form(
        key: colorForm.formkeyColors,
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
                    initialValue: color.nombreColor,
                    onChanged: (value) => {
                      color.nombreColor = value,
                      // color.id = color.nombreColor,
                      // product.colores!.comodin = 'colores',
                    },
                    validator: (value) {
                      if (value == null || value.length < 1)
                        return 'El nombre del color es obligatorio';
                    },
                    decoration: InputDecoration(
                        helperText: 'Nombre del color',
                        // hintText: 'Referencia',
                        labelText: 'Color',
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        helperText: 'NO LLENAR',
                        // hintText: 'Referencia',
                        labelText: 'NO LLENAR',
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
                  child: TextFormField(
                    decoration: InputDecoration(
                        helperText: 'Fecha de registro',
                        // hintText: 'Referencia',
                        labelText: 'Fecha',
                        border: OutlineInputBorder()),
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
            // TextFormField(
            //   initialValue: product.descripcion,
            //   onChanged: (value) => product.descripcion = value,
            //   validator: (value) {
            //     if (value == null || value.length < 1)
            //       return 'La descripcion es obligatoria';
            //   },
            //   decoration: InputDecoration(
            //     helperText: 'Describe el producto',
            //     // hintText: 'Referencia',
            //     labelText: 'Descripcion',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_field.dart';

class UpdateProductScreen extends StatefulWidget {
  UpdateProductScreen({super.key});
  static String id = "UpdateProductScreen";
  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, description, image;
  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text("update ", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(0, 169, 161, 161),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomFormTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: "product name",
                ),
                SizedBox(height: 10),
                CustomFormTextField(
                  onChanged: (data) {
                    description = data;
                  },
                  hintText: "description",
                ),
                SizedBox(height: 10),
                CustomFormTextField(
                  onChanged: (data) {
                    price = data;
                  },
                  inputType: TextInputType.number,
                  hintText: "price",
                ),
                SizedBox(height: 10),
                CustomFormTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: "image",
                ),
                SizedBox(height: 50),
                CustomButton(
                  text: "update",
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print("Success");
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}

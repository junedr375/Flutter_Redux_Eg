import 'package:flutter/material.dart';
import 'package:reduxeg/model/ViewModel.dart';
import 'package:reduxeg/model/model.dart';

class AddItemWidget extends StatefulWidget {
  final ViewModel model;
  AddItemWidget(this.model);
  @override
  _AddItemWidgetState createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final TextEditingController controller = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double mainAxisHeight = height > width ? height : width;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('Add Item'),
              centerTitle: true,
            ),
            body: Container(
              height: mainAxisHeight,
              width: width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: nameController,
                      cursorColor: Colors.black,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Name'),
                    ),
                    Row(
                      children: [
                        Container(
                          width: width * 0.30,
                          child: TextFormField(
                            controller: sizeController,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Size'),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: width * 0.30,
                          child: TextFormField(
                            controller: quantityController,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Quantity'),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: addressController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Address'),
                    ),
                    SizedBox(height: 200),
                    InkWell(
                        onTap: () {
                          Item item = new Item(
                              name: nameController.text,
                              address: addressController.text,
                              size: int.parse(sizeController.text.trim()),
                              quantity:
                                  int.parse(quantityController.text.trim()));
                          widget.model.onAddItem(item);

                          print(nameController.text + 'Added');
                        },
                        child: Container(
                          height: 40,
                          alignment: Alignment.center,
                          color: Colors.black,
                          child: Text(
                            'Add Item',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        )),
                  ],
                ),
              ),
            )));
  }
}

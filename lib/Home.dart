import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxeg/AddNewItem.dart';
import 'package:reduxeg/model/ViewModel.dart';
import 'package:reduxeg/model/model.dart';

import 'package:reduxeg/redux/actions.dart';
import 'package:redux/redux.dart';

class NewHomePage extends StatefulWidget {
  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      converter: (Store<AppState> store) => ViewModel.create(store),
      builder: (BuildContext context, ViewModel viewModel) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('My Redux App'),
        ),
        body: Column(
          children: [
            // AddItemWidget(viewModel),
            Expanded(child: ItemListWidget(viewModel)),
            //    RemoveItemsButton(viewModel),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => AddItemWidget(viewModel))));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ItemListWidget extends StatelessWidget {
  final ViewModel model;
  ItemListWidget(this.model);
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: model.items
            .map((Item item) => ListTile(
                  model: model,
                  item: item,
                ))
            .toList());
  }
}

class ListTile extends StatefulWidget {
  final ViewModel model;
  final Item item;
  ListTile({this.model, this.item});

  @override
  _ListTileState createState() => _ListTileState();
}

class _ListTileState extends State<ListTile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Dismissible(
        onDismissed: (_) {
          widget.model.onRemoveItem(widget.item);
        },
        background: Container(
          height: 100,
          width: width,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 5,
                    color: Colors.grey[400])
              ]),
          child: Center(
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        key: UniqueKey(),
        child: InkWell(
          child: Column(
            children: [
              Container(
                height: 100,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(5, 5),
                          blurRadius: 5,
                          color: Colors.grey[400])
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.item.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Quantity ${widget.item.quantity}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Size ${widget.item.size}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Deliver to : ${widget.item.address}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ));
  }
}

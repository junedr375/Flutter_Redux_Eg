import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxeg/model/model.dart';
import 'package:reduxeg/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

class ViewModel {
  final List<Item> items;
  final Function(Item) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  ViewModel(
      {this.items, this.onAddItem, this.onRemoveItem, this.onRemoveItems});

  factory ViewModel.create(Store<AppState> store) {
    _onAddItem(Item item) {
      store.dispatch(AddItemAction(Item(
          id: item.id,
          name: item.name,
          address: item.address,
          size: item.size,
          quantity: item.quantity)));
    }

    _onRemoveItem(Item item) {
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems() {
      store.dispatch(RemoveItemsAction());
    }

    return ViewModel(
      items: store.state.items,
      onAddItem: _onAddItem,
      onRemoveItem: _onRemoveItem,
      onRemoveItems: _onRemoveItems,
    );
  }
}

class RemoveItemsButton extends StatelessWidget {
  final ViewModel model;
  RemoveItemsButton(this.model);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text("delete All Items"),
        onPressed: () => model.onRemoveItems());
  }
}

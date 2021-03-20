import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String name;
  final String address;
  final int size;
  final int quantity;

  Item({this.id, this.name, this.address, this.size, this.quantity});

  Item copyWith({int id, String body}) {
    return Item(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        size: size ?? this.size,
        quantity: quantity ?? this.quantity);
  }
}

class AppState {
  final List<Item> items;
  AppState({
    this.items,
  });

  AppState.initialState() : items = List.unmodifiable(<Item>[]);
}

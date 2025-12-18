import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/shopping_item.dart';

class ShoppingListProvider with ChangeNotifier {
  final List<ShoppingItem> _items = [];
  static const String _storageKey = 'shopping_list_items';

  List<ShoppingItem> get items => List.unmodifiable(_items);

  double get total {
    return _items.fold(0.0, (sum, item) => sum + item.total);
  }

  int get itemCount => _items.length;

  // Carregar itens salvos
  Future<void> loadItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? itemsJson = prefs.getString(_storageKey);
      
      if (itemsJson != null) {
        final List<dynamic> decoded = json.decode(itemsJson);
        _items.clear();
        _items.addAll(decoded.map((item) => ShoppingItem.fromJson(item)));
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Erro ao carregar itens: $e');
    }
  }

  // Salvar itens
  Future<void> _saveItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String itemsJson = json.encode(_items.map((item) => item.toJson()).toList());
      await prefs.setString(_storageKey, itemsJson);
    } catch (e) {
      debugPrint('Erro ao salvar itens: $e');
    }
  }

  void addItem(String name, double price, {int quantity = 1}) {
    final item = ShoppingItem(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      price: price,
      quantity: quantity,
      addedAt: DateTime.now(),
    );
    _items.add(item);
    _saveItems();
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    _saveItems();
    notifyListeners();
  }

  void clearAll() {
    _items.clear();
    _saveItems();
    notifyListeners();
  }

  void updateItemName(String id, String newName) {
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      final oldItem = _items[index];
      _items[index] = ShoppingItem(
        id: oldItem.id,
        name: newName,
        price: oldItem.price,
        quantity: oldItem.quantity,
        addedAt: oldItem.addedAt,
      );
      _saveItems();
      notifyListeners();
    }
  }

  void updateItemQuantity(String id, int newQuantity) {
    if (newQuantity < 1) return;
    final index = _items.indexWhere((item) => item.id == id);
    if (index != -1) {
      final oldItem = _items[index];
      _items[index] = ShoppingItem(
        id: oldItem.id,
        name: oldItem.name,
        price: oldItem.price,
        quantity: newQuantity,
        addedAt: oldItem.addedAt,
      );
      _saveItems();
      notifyListeners();
    }
  }
}

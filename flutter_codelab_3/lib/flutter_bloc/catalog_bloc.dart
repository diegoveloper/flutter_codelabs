import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/common/data.dart';

abstract class MyCatalogEvent {}

class MyCatalogEventDelete extends MyCatalogEvent {}

class MyCatalogEventLoad extends MyCatalogEvent {}

class MyCatalogEventAdd extends MyCatalogEvent {
  final Item item;

  MyCatalogEventAdd(this.item);
}

class CatalogBloc extends Bloc<MyCatalogEvent, List<Item>> {
  final List<Item> cartItems = [];
  List<Item> allMyItems = [];
  bool loading = false;

  @override
  Stream<List<Item>> mapEventToState(MyCatalogEvent event) async* {
    if (event is MyCatalogEventLoad) {
      loading = true;
      yield allMyItems;

      await Future.delayed(const Duration(seconds: 3));
      allMyItems.clear();
      allMyItems.addAll(allItems);

      loading = false;
      yield List.from(allMyItems);
    } else if (event is MyCatalogEventAdd) {
      final item = event.item;
      cartItems.add(item);
      yield List.from(allMyItems);
    } else if (event is MyCatalogEventDelete) {
      cartItems.clear();
      yield List.from(allMyItems);
    }
  }

  @override
  List<Item> get initialState => [];
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/common/data.dart';

//states
abstract class MyCatalogState {}

class MyCatalogLoadingState extends MyCatalogState {}

class MyCatalogListState extends MyCatalogState {}

//events
abstract class MyCatalogEvent {}

class MyCatalogAddEvent extends MyCatalogEvent {
  final Item item;
  MyCatalogAddEvent(this.item);
}

class MyCatalogDeleteEvent extends MyCatalogEvent {}

class MyCatalogLoadEvent extends MyCatalogEvent {}

class CatalogBloc extends Bloc<MyCatalogEvent, MyCatalogState> {
  final List<Item> cartItems = [];
  List<Item> allMyItems = [];

  @override
  Stream<MyCatalogState> mapEventToState(MyCatalogEvent event) async* {
    if (event is MyCatalogLoadEvent) {
      await Future.delayed(const Duration(seconds: 3));
      allMyItems.clear();
      allMyItems.addAll(allItems);
      yield MyCatalogListState();
    } else if (event is MyCatalogAddEvent) {
      final item = event.item;
      cartItems.add(item);
      yield MyCatalogListState();
    } else if (event is MyCatalogDeleteEvent) {
      cartItems.clear();
      yield MyCatalogListState();
    }
  }

  @override
  MyCatalogState get initialState => MyCatalogLoadingState();
}

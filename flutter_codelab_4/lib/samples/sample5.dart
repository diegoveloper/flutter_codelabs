import 'package:flutter/material.dart';
import 'package:flutter_codelab_4/data/my_service.dart';
import 'package:flutter_codelab_4/data/person.dart';
//- 5 Paginate your api-calls when you have a lot of data

class Sample5 extends StatefulWidget {
  @override
  _Sample5State createState() => _Sample5State();
}

class _Sample5State extends State<Sample5> {
  List<Person> people = List();
  bool loading = false;
  final int pageSize = 10;
  final ScrollController controller = ScrollController();

  void _loadData() async {
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 2));

    String lastElement = people.isNotEmpty ? people.last.id : null;

    final newPeople = await MyService().getPeoplePaginated(
      pageSize,
      startFrom: lastElement,
    );
    people.addAll(newPeople);

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    _loadData();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            color: Colors.brown.withOpacity(0.5),
            child: ListView.builder(
              controller: controller,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (_, index) => ListTile(
                title: Text("$index => ${people[index].name}"),
              ),
              itemCount: people.length,
            ),
          ),
          if (loading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
/*
    String lastID;
    if (people.isNotEmpty) {
      lastID = people.last.id;
    }*/

/*
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        _loadData();
      }
    });*/

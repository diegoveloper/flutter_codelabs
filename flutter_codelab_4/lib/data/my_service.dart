import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_codelab_4/data/person.dart';
import 'package:connectivity/connectivity.dart';

const COLLECTION_PERSON = "Person";

class MyService {
  Future<String> addPerson(Person person) async {
    final docRef = Firestore.instance.collection(COLLECTION_PERSON).document();
    await docRef.setData(person.toJson);
    return docRef.documentID;
  }

  String addPersonOffline(
    Person person,
  ) {
    final docRef = Firestore.instance.collection(COLLECTION_PERSON).document();
    docRef.setData(person.toJson);
    return docRef.documentID;
  }

  Future<void> addPeople(List<Person> people) async {
    final batch = Firestore.instance.batch();
    for (Person person in people) {
      final docRef = Firestore.instance.collection(COLLECTION_PERSON).document();
      batch.setData(docRef, person.toJson);
    }
    await batch.commit();
    return;
  }

  Future<List<Person>> getPeople() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    Source source = Source.serverAndCache;
    if (connectivityResult == ConnectivityResult.none) {
      source = Source.cache;
    }
    final querySnapshot = await Firestore.instance.collection(COLLECTION_PERSON).getDocuments(
          source: source,
        );
    final people = List<Person>();
    if (querySnapshot != null && querySnapshot.documents.isNotEmpty) {
      for (DocumentSnapshot doc in querySnapshot.documents) {
        if (doc != null && doc.exists) {
          final data = doc.data;
          data["id"] = doc.documentID;
          people.add(Person.fromJson(data));
        }
      }
    }
    return people;
  }

  Stream<List<Person>> getPeopleStream() {
    return Firestore.instance.collection(COLLECTION_PERSON).snapshots().map((querysnapshot) {
      final documents = querysnapshot.documents;
      List<Person> people = List();
      for (DocumentSnapshot doc in documents) {
        final data = doc.data;
        data["id"] = doc.documentID;
        people.add(Person.fromJson(data));
      }
      return people;
    });
  }

  Future<List<Person>> getPeoplePaginated(int paginationSize, {String startFrom}) async {
    Query query = Firestore.instance.collection(COLLECTION_PERSON).limit(paginationSize);

    if (startFrom != null) {
      final docRef = await Firestore.instance.collection(COLLECTION_PERSON).document(startFrom).get();
      if (docRef != null && docRef.exists) {
        query = query.startAfterDocument(docRef);
      }
    }

    final querySnapshot = await query.getDocuments();

    final people = List<Person>();
    if (querySnapshot != null && querySnapshot.documents.isNotEmpty) {
      for (DocumentSnapshot doc in querySnapshot.documents) {
        if (doc != null && doc.exists) {
          final data = doc.data;
          data["id"] = doc.documentID;
          people.add(Person.fromJson(data));
        }
      }
    }
    return people;
  }
}

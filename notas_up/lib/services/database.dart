
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {

  final CollectionReference notas = Firestore.instance.collection('notas');

}
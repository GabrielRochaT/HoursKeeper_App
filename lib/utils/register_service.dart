
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hours_keeper/models/register.dart';

class RegisterService {
  String userId;
  RegisterService() : userId = FirebaseAuth.instance.currentUser!.uid;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createRegister(
      String? porjectId, RegisterModel registerModel) async {
    return await _firestore
        .collection(userId)
        .doc(porjectId)
        .collection('registers')
        .doc(registerModel.id)
        .set(registerModel.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getRegisters(String projectId){
    return _firestore.collection(userId).doc(projectId).collection('registers').orderBy('initialHour', descending: true).snapshots();
  }

  Future<void> deleteRegister(String projectId, String registerId) async {
    return await _firestore.collection(userId).doc(projectId).collection('registers').doc(registerId).delete();
  }
  
}
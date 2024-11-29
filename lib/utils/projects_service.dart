import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hours_keeper/models/project.dart';
import 'package:hours_keeper/models/register.dart';

class ProjectService {
  String userId;
  ProjectService() : userId = FirebaseAuth.instance.currentUser!.uid;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createProject(ProjectModel projectModel) async {
    return await _firestore
        .collection(userId)
        .doc(projectModel.id)
        .set(projectModel.toMap());
  }

  Future<void> createRegister(
      String porjectId, RegisterModel registerModel) async {
    return await _firestore
        .collection(userId)
        .doc(porjectId)
        .collection('registers')
        .doc(registerModel.id)
        .set(registerModel.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getProjects(){
    print(_firestore.collection(userId).snapshots());
    return _firestore.collection(userId).orderBy("startDate").snapshots();
  }

  Future<void> deleteProject(String projectId) async {
    return await _firestore.collection(userId).doc(projectId).delete();
  }
}

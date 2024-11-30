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
    return _firestore.collection(userId).orderBy("startDate", descending: true).snapshots();
  }

  Future<void> deleteProject(String projectId) async {
    return await _firestore.collection(userId).doc(projectId).delete();
  }

  Future<void> checkAndUpdateStatus() async {
  print("CHAMADO");
  final now = Timestamp.fromDate(DateTime.now());

  final projectsSnapshot = await _firestore
      .collection(userId)
      .where('status', isEqualTo: 'Em andamento')
      .get();
  print("PROJETOS ENCONTRADOS: ${projectsSnapshot.docs.length}");


  List<DocumentSnapshot> filteredProjects = [];
  for (var doc in projectsSnapshot.docs) {
    if (doc['endDate'] != null && doc['endDate'] is Timestamp) {
      final endDate = doc['endDate'] as Timestamp;
      if (endDate.compareTo(now) < 0) {
        filteredProjects.add(doc);
      }
    }
  }

  for (var doc in filteredProjects) {
    await _firestore.collection(userId).doc(doc.id).update({"status": "Pendente"});
    print('PROJETO ATUALIZADO');
  }
}

  Future<void> changeStatus(String projectId) async {
    final status = await _firestore.collection(userId).doc(projectId).get().then((value) => value.data()?['status']);
    if (status == "Em andamento" || status == "Pendente") {
      return await _firestore.collection(userId).doc(projectId).update({"status": "Concluído"});
    }else{
      return await _firestore.collection(userId).doc(projectId).update({"status": "Em andamento"});
    }
  }
}


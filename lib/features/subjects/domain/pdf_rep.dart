import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_tawsel/features/subjects/data/pdf_model.dart';

class PDFRepository {
  final _db = FirebaseFirestore.instance;



  // Fetch all PDFs once
  Future<List<PDFModel>> getAllPDFs() async {
    try {
      QuerySnapshot snapshot = await _db.collection('pdfs').get();
      List<PDFModel> pdfs = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
       
        return PDFModel.fromMap(data);
      }).toList();
      return pdfs;
    } catch (e) {
      print('Error fetching PDFs: $e');
      rethrow;
    }
  }

  // Delete a PDF document
  Future<void> deletePDF(String id) async {
    try {
      await _db.collection('pdfs').doc(id).delete();
    } catch (e) {
      print('Error deleting PDF: $e');
      rethrow;
    }
  }
}

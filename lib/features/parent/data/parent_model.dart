import 'package:cloud_firestore/cloud_firestore.dart';

class ParentModel {
  final String id; // Unique ID of the user (parent)
  final String name; // Name of the parent
  final String
      email; // Email of the parent (used for authentication and communication)
  final String role; // Role of the user (set to "parent" for parent users)
  final List<String>
      children; // List of child IDs (student users linked to this parent)
  final String phone; // Parent’s contact number (optional)
  final String address; // Parent’s address (optional)

  ParentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.children,
    this.phone = '', // Default value is empty string
    this.address = '', // Default value is empty string
  });

  // Factory method to create a ParentModel from Firestore data (DocumentSnapshot)
  factory ParentModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ParentModel(
      id: doc.id,
      name: data['name'] ?? '', // Provide default empty string if data is null
      email: data['email'] ?? '',
      role: data['role'] ?? '',
      children: List<String>.from(
          data['children'] ?? []), // Convert Firestore data to List<String>
      phone: data['phone'] ?? '',
      address: data['address'] ?? '',
    );
  }

  // Method to convert the ParentModel to Firestore data format (for saving to Firestore)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'role': role, // Include the role as "parent"
      'children': children, // Convert list of child IDs to Firestore format
      'phone': phone,
      'address': address,
    };
  }
}

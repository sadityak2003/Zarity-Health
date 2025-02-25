import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final blogsProvider = StreamProvider((ref) {
  return FirebaseFirestore.instance.collection('blogs').snapshots();
});

final blogDetailProvider = FutureProvider.family((ref, String blogId) async {
  final doc = await FirebaseFirestore.instance.collection('blogs').doc(blogId).get();
  return doc.exists ? doc : null;
});

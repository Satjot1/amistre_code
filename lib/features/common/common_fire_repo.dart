import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commonFirebaseStorageRepositoryProvider =
    Provider((ref) => CommonFirebaseStorageRepository(
          FirebaseStorage.instance,
        ));

class CommonFirebaseStorageRepository {
  final FirebaseStorage firebaseStorage;

  CommonFirebaseStorageRepository(this.firebaseStorage);

  Future<String> storeFileToFirebase(String ref, File file) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);
    TaskSnapshot sanp = await uploadTask;
    String downloadUrl = await sanp.ref.getDownloadURL();
    return downloadUrl;
  }
}

import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import '../function/time_date_function.dart';

class Storagemethod {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  int uuid = TimeStamp.timestamp;
  Future<String> uploadtostorage(String collection,String createrid, Uint8List file) async {
    Reference ref = _storage
        .ref()
        .child(collection)
        .child(createrid)
        .child(uuid.toString());
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadurl = await snap.ref.getDownloadURL();
    return downloadurl;
  }
}

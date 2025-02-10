import 'package:cloud_firestore/cloud_firestore.dart';

class Database{
  
  static Database instance = Database();

  Future<List> getAllData() async{
    //กำหนดตัวแปรอ้างอิงไปยังข้อมูล
    final reference = FirebaseFirestore.instance.collection('products');
    //กำหนดการคิวรี่ข้อมูลตาม id ผ่านตัวแปรอ้างอิง
    Query query = reference.orderBy('id');
    //ขอเอกสารตามเงื่อนไขในรูปแบบ snapshot
    final snapshot = query.snapshots();

    return snapshot.map(
      (snapshot){
        return snapshot.docs.map(
          (doc){
            if(doc.exists){
              return doc.data();
            }
            
          }
        );
      }
    ).toList();
  }
}
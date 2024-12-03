import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fiirebase_blog_app/data/model/post.dart';

class PostRepository {
  Future<List<Post>?> getAll() async {
    try {
      // 1. firestore 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬랙션 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3. 값 불러오기
      final result = await collectionRef.get();

      final docs = result.docs;
      return docs.map((doc) {
        final map = doc.data();
        final newMap = {
          'id': doc.id,
          ...map,
        };
        return Post.formJson(newMap);
      }).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 1. Create : 데이터 쓰기
  Future<bool> insert({
    required String title,
    required String content,
    required String writer,
    required String imageUrl,
  }) async {
    try {
      // 1) 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2) 컬렉션 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3) 문서 참조 만들기
      final docRef = collectionRef.doc();
      // 4) 값 쓰기
      await docRef.set({
        'title': title,
        'content': content,
        'writer': writer,
        'imageUrl': imageUrl,
        'createAt': DateTime.now().toIso8601String(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 2. Read : 특정 아이디로 하나의 도큐먼트 가져오기
  Future<Post?> getOne(String id) async {
    try {
      // 1) 파이어베이스 파이어스토어 인스턴스 가져오기
      final firestore = FirebaseFirestore.instance;
      // 2) 컬렉션 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3) 문서 참조 만들기
      final docRef = collectionRef.doc(id);
      // 4) 데이터 가져오기
      final doc = await docRef.get();
      return Post.formJson({
        'id': doc.id,
        ...doc.data()!,
      });
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 3. Update : 도큐먼트 수정
  Future<bool> update({
    required String id,
    required String writer,
    required String title,
    required String content,
    required String imageUrl,
  }) async {
    try {
      // 1) 파이어스토어 인스턴스 가져오기
      final firestore = FirebaseFirestore.instance;
      // 2) 컬렉션 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3) 문서 참조 만들기
      final docRef = collectionRef.doc(id);
      // 4) 값을 업데이트 해주기(set 메서드 => update 메서드)
      // 업데이트 할 값 Map 형태로 넣어주기 ; id 에 해당하는 문서가 없을 때 새로 생성
      // docRef.set(data);
      // 업데이트 할 값 Map 형태로 넣어주기 : id 에 해당하는 문서가 없을 때 에러 발생
      await docRef.set({
        'writer': writer,
        'title': title,
        'content': content,
        'imageUrl': imageUrl,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 4. Delete : 토큐먼트 삭제
  Future<bool> delete(String id) async {
    //
    try {
      // 1) 파이어스토어 인스턴스 가져오기
      final firestore = FirebaseFirestore.instance;
      // 2) 컬렉션 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3) 문서 참조 만들기
      final docRef = collectionRef.doc(id);
      // 4) 삭제
      await docRef.delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

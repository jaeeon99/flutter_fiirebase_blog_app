// 1. 상테 클래스 만들기
// posts 객체 사용할거라 만들지 않음

// 2. 뷰 모델 만들기
import 'package:flutter_fiirebase_blog_app/data/model/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailViewModel extends AutoDisposeFamilyNotifier<Post, Post> {
  @override
  Post build(Post arg) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

// 3. 뷰 모델 관리자 만들기

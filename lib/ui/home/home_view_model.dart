import 'package:flutter_fiirebase_blog_app/data/model/post.dart';
import 'package:flutter_fiirebase_blog_app/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 1. 상태 클래스 만들기
// List<Post>

// 2. 뷰 모델 만들기

class HomeViewModel extends Notifier<List<Post>> {
  @override
  List<Post> build() {
    getAllPosts();
    return [];
  }

  void getAllPosts() async {
    final postRepo = PostRepository();
    final posts = await postRepo.getAll();
    state = posts ?? [];
    //
  }
}

// 3. 뷰모델 관리자 만들기
final HomeViewModelProvider = NotifierProvider<HomeViewModel, List<Post>>(() {
  return HomeViewModel();
});

import 'package:flutter/material.dart';

class WritePage extends StatefulWidget {
  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  //제목 , 작성자, 내용
  TextEditingController writeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override // 이 dispose 를 안해주면 이 컨트롤러들은 화면에서 없어져도 계속 메모리 어딘가에서 떠돌게 됨.
  void dispose() {
    writeController.dispose();
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {
                print('완료 터치 됨');
                final result = formKey.currentState?.validate() ?? false;
              },
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  '완료',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              TextFormField(
                controller: writeController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: '작성자'),
                validator: (value) {
                  // trim() : 문자열 압뒤로 공백 제거
                  // null 일때도 이 문자열 줄력
                  if (value?.trim().isEmpty ?? true) {
                    return '작성자를 입력해주세요';
                  }
                  // 유효성 검사 성공
                  return null;
                },
              ),
              TextFormField(
                controller: titleController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(hintText: '제목'),
                validator: (value) {
                  // trim() : 문자열 압뒤로 공백 제거
                  // null 일때도 이 문자열 줄력
                  if (value?.trim().isEmpty ?? true) {
                    return '제목을 입력해주세요';
                  }
                  // 유효성 검사 성공
                  return null;
                },
              ),
              SizedBox(
                height: 200,
                child: TextFormField(
                  controller: contentController,
                  maxLines: null, // 반드시 null로 할당 (개행할 때)
                  expands: true, // TextformFeild 가 늘어나게 하려면 필수
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(hintText: '내용'),
                  validator: (value) {
                    // trim() : 문자열 압뒤로 공백 제거
                    // null 일때도 이 문자열 줄력
                    if (value?.trim().isEmpty ?? true) {
                      return '내용을 입력해주세요';
                    }
                    // 유효성 검사 성공
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,
                  child: Icon(Icons.image),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

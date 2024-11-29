import 'package:flutter/material.dart';
import 'package:flutter_fiirebase_blog_app/ui/write/write_page.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          iconButton(Icons.delete, () {
            print('삭제 아이콘 클릭');
          }),
          iconButton(Icons.edit, () {
            print('수정 아이콘 클릭');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return WritePage();
                },
              ),
            );
          }),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(bottom: 500),
        children: [
          Image.network(
            'https://picsum.photos/200/300',
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                Text(
                  'Today I Learned',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  '이재언',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '2024.11.19. 20:30',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'Flutter GridVeiw Study & firebase, 아 여럽다아아아아아아아아아아아아아아아아아아아아아아아ㅏ아아앙아ㅏㅇ아아ㅏ아아아아아아아아아앙ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ캌이ㅏㅣ아ㅣ릐ㅡㅂ쟈ㅜ언무러ㅕ뷻주압ㄴㅇㅂ' *
                      3,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget iconButton(IconData icon, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.transparent,
        child: Icon(icon),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          const FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  final imageList = [
    '김옥순',
    '제니',
    '라일락',
    'bee',
    'cat',
    'cow',
    'dog',
    'fox',
    'monkey',
    'pig',
    'wolf'
  ];
  StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: makePhotoList(imageList),
      ),
    );
  }

  List<Widget> makePhotoList(List<String> list) {
    return list.map((e) => makePhotoColumn(e)).toList();
  }

  Widget makePhotoColumn(String image) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40.0),
              child: Image.asset('images/$image.png',
                  width: 90, height: 90, fit: BoxFit.fill),
            ),
          ),
          const SizedBox(height: 8),
          Text(image, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final String image;
  final int likeCount;
  final String content;
  const FeedData({
    required this.userName,
    required this.image,
    required this.likeCount,
    required this.content,
  });
}

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    final feedDataList = [
      const FeedData(
          userName: '방문자1', image: '라일락', likeCount: 50, content: '정말 이뻐요.'),
      const FeedData(
          userName: '이뿐이', image: 'cow', likeCount: 20, content: '빨간 드레스 탐나요'),
      const FeedData(
          userName: '...', image: 'fox', likeCount: 30, content: '정말 이뻐요.'),
      const FeedData(
          userName: '남산',
          image: '김옥순',
          likeCount: 10,
          content: '돈까스 같이 먹고 싶어요'),
      const FeedData(
          userName: 'king', image: 'pig', likeCount: 60, content: '킹 제대로 받네요'),
      const FeedData(
          userName: '이방인', image: '제니', likeCount: 50, content: '정말 이뻐요.22'),
      const FeedData(
          userName: '@-@', image: '라일락', likeCount: 6, content: '감사합니다.'),
      const FeedData(
          userName: '# 수사대',
          image: 'monkey',
          likeCount: 17,
          content: '난 니가 여름에 한 일을 알고 있다.'),
      const FeedData(
          userName: '이쁜이', image: 'bee', likeCount: 6, content: '나만 징그러운 거야?'),
    ];

    return ListView.builder(
        shrinkWrap: true, // 스크롤 중첩될 경우
        physics: const NeverScrollableScrollPhysics(),
        itemCount: feedDataList.length,
        itemBuilder: (context, i) {
          final feedData = feedDataList[i];
          return Card(
            child: ListTile(
                leading: makeProfile(feedData.image, 40),
                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      const Icon(Icons.favorite, color: Colors.red),
                      const SizedBox(width: 5),
                      Text(feedData.likeCount.toString()),
                      const Icon(Icons.more_vert),
                    ],
                  ),
                ),
                title: Text(
                  feedData.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(feedData.content)),
          );
        });
  }

  Widget makeProfile(String image, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: Image.asset('images/$image.png',
            width: size, height: size, fit: BoxFit.fill),
      ),
    );
  }
}

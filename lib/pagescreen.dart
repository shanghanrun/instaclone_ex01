import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({super.key});

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
  final String image2;
  final int likeCount;
  final String content;
  const FeedData({
    required this.userName,
    required this.image,
    required this.image2,
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
          userName: '방문자1',
          image: '라일락',
          image2: '1',
          likeCount: 50,
          content: '정말 이뻐요. 혹시 어느 지하철 타시는 지 물어봐도 될까요? 한번 만나보고 싶어요..'),
      const FeedData(
          userName: '이뿐이',
          image: 'cow',
          image2: '2',
          likeCount: 20,
          content: '검정 미니스커트 탐나요'),
      const FeedData(
          userName: '...',
          image: 'fox',
          image2: '라일락',
          likeCount: 30,
          content: '정말 이뻐요.'),
      const FeedData(
          userName: '남산',
          image: '김옥순',
          image2: '3',
          likeCount: 10,
          content: '돈까스 같이 먹고 싶어요'),
      const FeedData(
          userName: 'king',
          image: 'pig',
          image2: '1',
          likeCount: 60,
          content: '킹 제대로 받네요'),
      const FeedData(
          userName: '이방인',
          image: '제니',
          image2: '제니',
          likeCount: 50,
          content: '정말 이뻐요.22'),
      const FeedData(
          userName: '@-@',
          image: '김옥순',
          image2: '3',
          likeCount: 6,
          content: '감사합니다.'),
      const FeedData(
          userName: '# 수사대',
          image: 'monkey',
          image2: '2',
          likeCount: 17,
          content: '난 니가 여름에 한 일을 알고 있다.'),
      const FeedData(
          userName: '이쁜이',
          image: 'bee',
          image2: '라일락',
          likeCount: 6,
          content: '나만 징그러운 거야?'),
    ];

    return ListView.builder(
        shrinkWrap: true, // 스크롤 중첩될 경우
        physics: const NeverScrollableScrollPhysics(),
        itemCount: feedDataList.length,
        itemBuilder: (context, i) {
          final feedData = feedDataList[i];
          return FeedItem(feedData: feedData);
        });
  }

  // makeCard(feedData); 로 하게 될 경우 코드
  // 하지만 제한적이라서 FeedItem(feedData) 위젯으로 만들었다.
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;
  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    makeProfile(feedData.image, 60),
                    const SizedBox(width: 8),
                    Text(feedData.userName),
                  ],
                ),
                const Icon(Icons.more_vert),
              ],
            )),
        const SizedBox(height: 8),
        Container(
          // 이미지 들어가는 공간
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
          child: Image.asset('images/${feedData.image2}.png',
              height: 200, fit: BoxFit.contain),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // icon 들이 있는 곳
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_outline),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.chat_bubble),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(CupertinoIcons.paperplane),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              icon: const Icon(CupertinoIcons.bookmark),
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            '좋아요  ${feedData.likeCount}개',
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.blue),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: feedData.userName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: '  '),
              TextSpan(text: feedData.content)
            ],
            style: const TextStyle(color: Colors.black),
          )),
        ),
        const SizedBox(height: 8),
      ],
    );
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

  // 아래 메소드는 사실 makeProfile()과 함께, FeedList클래스에
  // 들어가야 되는 것이다. 그냥 임시로 여기에 저장해 둔다.
  Card makeCard(FeedData feedData) {
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
  }
}

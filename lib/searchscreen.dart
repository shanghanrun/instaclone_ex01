import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          SearchTextBar(),
          SearchGrid(),
        ],
      ),
    );
  }
}

class SearchTextBar extends StatelessWidget {
  const SearchTextBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        // controller: ,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: '검색',
            // labelText:'Search',   hintText와 병립 안한다.
            filled: true,
            fillColor: const Color.fromARGB(255, 246, 224, 251),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                  color: Colors.transparent, width: 0), //비활성화 상태 테두리 안보이게
            ),
            // border: const OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.grey), // 비활성화된 상태의 테두리
            // ),
            // focusedBorder: const OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.blue), // 활성화된 상태의 테두리
            // ),
            contentPadding: const EdgeInsets.all(12)), //입력시 커서 위로 못 올라가게
      ),
    );
  }
}

//final gridItems = List.generate(30, (i) => Colors.green.shade300);

class SearchGrid extends StatelessWidget {
  const SearchGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const gridItems = [
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
      'wolf',
      '김옥순',
      '제니',
      '라일락',
      'bee',
    ];
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.8),
        itemCount: gridItems.length,
        itemBuilder: (context, i) {
          var item = gridItems[i];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: GridTile(
                header: Text(
                  '  $item',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                // footer: const Text(''),
                // child: const Text('그리드')
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset('images/$item.png',
                          width: 50, height: 50, fit: BoxFit.fill),
                    )),
              ),
            ),
          );
        });
  }
}

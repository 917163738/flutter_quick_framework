import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wanandroid_flutter_swc/common/entities/recommend.dart';
import 'package:wanandroid_flutter_swc/common/routes/goto.dart';
import 'package:wanandroid_flutter_swc/common/widgets/widgets.dart';

Widget itemView(Datas item) {
  return InkWell(
    onTap: () => {gotoWeb(item.link!,title: item.title!)},
    child: itemCardView(
      child: Row(
        children: [
          InkWell(
            onTap: () => {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.favorite,
                color: (item.collect != null && item.collect!)
                    ? Colors.red
                    : Colors.grey,
              ),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Html(
                data: '<a>${item.title}</a>',
                style: {
                  'a': Style(
                      fontSize: FontSize(18),
                      fontWeight: FontWeight.bold,
                      color: Colors.black)
                },
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (item.author != null && item.author!.isNotEmpty)
                          ? '作者：${item.author}'
                          : '分享人：${item.shareUser}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                        '分类：${item.superChapterName}/${item.chapterName}',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                ],
              )
            ],
          )),
        ],
      ),
    ),
  );
}
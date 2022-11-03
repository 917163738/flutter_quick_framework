import 'dart:async';

import 'package:flutter/material.dart';

class BannerView extends StatefulWidget {
  final List<Widget> children;

  final Duration switchDuration;
  const BannerView(
      {super.key, this.children = const <Widget>[],
      this.switchDuration = const Duration(seconds: 3)});

  @override
  State<BannerView> createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  late Timer _timer;
  late int _curPageIndex;
  static const Duration animateDuration = Duration(milliseconds: 500);

  List<Widget> children = [];

  @override
  void initState() {
    super.initState();
    _curPageIndex = 0;

    _tabController = TabController(length: widget.children.length, vsync: this);
    /// 添加所有的widget到新建的list中
    children.addAll(widget.children);
    /// 定时器完成自动翻页-只有在大于1时才会有翻页
    if (children.length > 1) {
      children.insert(0, widget.children.last);
      children.add(widget.children.first);
      ///如果大于一页，则会在前后都加一页， 初始页要是 1
      _curPageIndex = 1;
      _timer = Timer.periodic(widget.switchDuration, _nextBanner);
    }

    ///初始页面 指定
    _pageController = PageController(initialPage: _curPageIndex);
  }
  /// 进行翻页的动画
  _nextBanner(Timer timer) {
    _curPageIndex++;
    _curPageIndex = _curPageIndex == children.length ? 0 : _curPageIndex;

    //curve:和android一样 动画插值
    _pageController.animateToPage(_curPageIndex,
        duration: animateDuration, curve: Curves.linear);
  }


  @override
  void dispose() {
    /// 页面销毁时进行回收
    _pageController.dispose();
    _tabController.dispose();
    _timer.cancel();
    super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          /// 点击时取消timer效果
          onPointerDown: (_) => _timer.cancel(),
          onPointerUp: (_) {
            ///重新开启timer
            if (children.length > 1) {
              _timer = Timer.periodic(widget.switchDuration, _nextBanner);
            }
          },
          child: NotificationListener(
            onNotification: (notification){
              if(notification is ScrollUpdateNotification) {
                ScrollUpdateNotification n = notification;
                /// 判断是否是一次完整的翻页
                if (n.metrics.atEdge) {
                  if (_curPageIndex == children.length - 1) {
                    /// 如果是最后一页，那么就跳到第一页
                    _pageController.jumpToPage(1);
                  } else if (_curPageIndex == 0) {
                    /// 如果是第一页，再往前滑动，因为原来的list前后都加了一条数据，所以 -2
                    _pageController.jumpToPage(children.length - 2);
                  }
                }
              }
              return true;
            },
            child: PageView.builder(
              itemCount: children.length,
              itemBuilder: (context, index) {
                 /// banner设置点击监听
                return children[index];
              },
              onPageChanged: (index) {
                _curPageIndex = index;
                if (index == children.length - 1) {
                  /// 如果是最后一页，那么下面的指示器设置为0的位置
                  _tabController.animateTo(0);
                } else if(index == 0){
                  ///如果是第一页再往左滑，那么久设置为指示器最后的位置
                  _tabController.animateTo(_tabController.length-1);
                }else {
                  _tabController.animateTo(index-1);
                }
              },
              controller: _pageController,
            ),
          )
        ),
        Positioned(
          bottom: 8.0,
          right: 8.0,
          child: TabPageSelector(
           controller: _tabController,
            color: Colors.white,
            selectedColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
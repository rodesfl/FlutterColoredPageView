import 'package:flutter/material.dart';

class ColoredPageView extends StatelessWidget {
  final List<Widget> pages;
  final List<Color> colors;

  PageController _pageController;
  Animatable<Color> _background;

  ColoredPageView(this.pages, this.colors) {
    if (this.pages.length != this.colors.length) {
      throw ("The number of pages and colors are not the same.");
    }

    this._pageController = PageController();

    List<TweenSequenceItem<Color>> itemList = [];
    for (var i = 0; i < this.colors.length - 1; i++) {
      itemList.add(
        TweenSequenceItem(
            tween: ColorTween(
              begin: this.colors[i],
              end: this.colors[i + 1],
            ),
            weight: 1),
      );
    }
    this._background = TweenSequence<Color>(itemList);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: this._pageController,
      builder: (context, child) {
        final color = this._pageController.hasClients
            ? this._pageController.page / (this.pages.length - 1)
            : .0;

        return DecoratedBox(
          decoration: BoxDecoration(
            color: this._background.evaluate(AlwaysStoppedAnimation(color)),
          ),
          child: child,
        );
      },
      child: PageView(
        controller: this._pageController,
        children: this.pages,
      ),
    );
  }
}

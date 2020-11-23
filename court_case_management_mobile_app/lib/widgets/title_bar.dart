import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

class TitleBar extends StatelessWidget {
  final String title;
  TitleBar({this.title});
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _SliverDelegate(
        child: Card(
          shadowColor: Colors.white,
          margin: EdgeInsets.zero,
          elevation: 10,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: FlutterGradients.flyHigh(
                type: GradientType.linear,
                tileMode: TileMode.mirror,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverDelegate implements SliverPersistentHeaderDelegate {
  _SliverDelegate({
    this.minHeight = 55.0,
    this.maxHeight = 60.0,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;
  @override
  double get minExtent => minHeight;
  @override
  bool shouldRebuild(_SliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration => null;

  @override
  TickerProvider get vsync => null;
}

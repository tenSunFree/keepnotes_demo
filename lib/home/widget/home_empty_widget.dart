import 'package:flutter/material.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';

class HomeEmptyWidget extends StatelessWidget {
  const HomeEmptyWidget({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            HomeEmptyImageWidget(),
            Text('沒有資料'),
          ],
        ),
      ),
    );
  }
}

class HomeEmptyImageWidget extends StatelessWidget {
  const HomeEmptyImageWidget({
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.5,
      child: Image.asset(
        homeEmpty,
        fit: BoxFit.contain,
        width: 120,
        height: 200,
      ),
    );
  }
}

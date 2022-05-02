import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keepnotes_demo/common/model/common_export_model.dart';

class HomeListItemWidget extends StatelessWidget {
  const HomeListItemWidget({
    required this.item,
    this.onTap,
    final Key? key,
  }) : super(key: key);

  final Note item;
  final OnTap? onTap;

  @override
  Widget build(final BuildContext context) {
    final appTheme = AppTheme.values[AppTheme.black.index];
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: appTheme == AppTheme.light
                ? Theme.of(context).floatingActionButtonTheme.foregroundColor
                : Colors.black,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: appTheme == AppTheme.light
                  ? greyColor
                  : Colors.grey[900] ?? Colors.transparent,
            ),
          ),
          child: _buildTextWidget(),
        ),
      ),
    );
  }

  Widget _buildTextWidget() {
    return Row(
      children: <Widget>[
        Text(
          item.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: GoogleFonts.merriweather(
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const Spacer(),
        Text(
          item.strLastModifiedDate,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.openSans(
            textStyle: const TextStyle(
              wordSpacing: 1.3,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}

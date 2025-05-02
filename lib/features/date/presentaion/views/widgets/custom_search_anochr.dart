import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchAnchor extends StatelessWidget {
  const CustomSearchAnchor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (context, index) {
        return SizedBox(
          height: 50.h,
          child: SearchBar(
            shadowColor: WidgetStateProperty.all<Color>(
              Colors.white.withOpacity(0.30),
            ),
            textStyle: WidgetStateProperty.all<TextStyle>(
              TextStyle(color: Colors.white),
            ),
            hintText: "Search Date.....",
            hintStyle: WidgetStateProperty.all(
              TextStyle(fontSize: 16, color: Colors.white),
            ),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.sp),
              ),
            ),
            side: WidgetStateProperty.all<BorderSide>(
              BorderSide(
                color: Colors.white.withAlpha((0.40 * 255).toInt()),
                width: 1.0,
              ),
            ),
            backgroundColor: WidgetStateProperty.all<Color>(
              Colors.white.withOpacity(0.38),
            ),
            trailing: [Icon(Icons.search, color: Colors.white)],
          ),
        );
      },
      suggestionsBuilder: (context, index) => [],
    );
  }
}
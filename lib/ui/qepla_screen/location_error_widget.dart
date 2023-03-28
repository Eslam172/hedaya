import 'package:flutter/material.dart';
import 'package:mushaf/app/extensions.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const errorColor = Color(0xffb00020);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           Icon(
            Icons.location_off,
            size: 65.sp,
            color: errorColor,
          ),
           SizedBox(height: 5.h),
          Text(
            error!,
            style:  TextStyle(color: errorColor,
                fontWeight: FontWeight.bold,
              fontSize: 12.sp,
              fontFamily: 'Regular'
            ),
          ),
           SizedBox(height: 5.h),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor)
            ),
            onPressed: () {
              if (callback != null) callback!();
            },
            child:  Text("أعد المحاولة",
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Regular'
              ),
            ),
          )
        ],
      ),
    );
  }
}
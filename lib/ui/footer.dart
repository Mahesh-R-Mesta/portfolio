import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey.shade500,
      child: SizedBox(
        // height: 250,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 30),
          child: Column(
            spacing: 15,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("- Contact info: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white)),
              Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 15),
                  Icon(Icons.phone, color: Colors.white, size: 20),
                  Text("+91 8722469640", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200, color: Colors.white)),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  const SizedBox(width: 15),
                  Icon(Icons.email, color: Colors.white, size: 20),
                  Text("maheshmesta98@gmail.com", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w200, color: Colors.white)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

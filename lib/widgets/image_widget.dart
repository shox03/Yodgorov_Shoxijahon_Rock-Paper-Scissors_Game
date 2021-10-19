import 'package:flutter/material.dart';

Container buildimage() => Container(
      height: 250,
      width: double.infinity,
      child: Image(
        image: NetworkImage(
            "https://1gai.ru/uploads/posts/2020-03/1585556930_45544.jpg"),
        fit: BoxFit.contain,
      ),
    );

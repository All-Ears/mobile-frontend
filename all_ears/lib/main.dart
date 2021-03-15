// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'about_page.dart';
import 'carbon_calculate_page.dart';
import 'donation_page.dart';
import 'elephant_map_page.dart';
import 'faq_page.dart';
import 'app_drawer.dart';



void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(),
      '/second': (context) => AboutPage(),
      '/third': (context) => CarbonCalculatePage(),
      '/fourth': (context) => DonationPage(),
      '/fifth': (context) => ElephantPage(),
      '/sixth': (context) => FAQPage(),
    },
  ));
}

















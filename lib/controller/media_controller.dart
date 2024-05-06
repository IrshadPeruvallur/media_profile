import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:profile_page/model/user_model.dart';
import 'package:profile_page/service/api_service.dart';

class MediaController extends ChangeNotifier {
  MediaService mediaService = MediaService();
  List<MediaModel> allPost = [];

  Future<void> getMedia() async {
    try {
      allPost = await mediaService.getMedia();
      log('Data fetched successfully');
      notifyListeners();
    } catch (e) {
      log('Error fetching media: $e');
    }
  }
}

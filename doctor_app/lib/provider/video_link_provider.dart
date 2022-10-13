import 'package:doctor_app/provider/auth_provider.dart';
import 'package:doctor_app/repo/video_link_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class VideoLinkProvider extends ChangeNotifier {
  bool isLoading = false;
  VideoLinkRepo _videoLinkRepo = VideoLinkRepo();
  List<String> videoLink = [];

  Future<void> fetchLink(BuildContext context) async {
    isLoading=true;
    String doctorId = Provider.of<AuthProvider>(context,listen: false).doctorModel!.doctorId;
    videoLink= await _videoLinkRepo.fetchLink(doctorId);
    isLoading=false;
   notifyListeners();
  }
}
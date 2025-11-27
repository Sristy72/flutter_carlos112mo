import 'package:flutter/cupertino.dart';
import 'package:flutter_carlos112mo/core/base/base_controller.dart';
import 'package:flutter_carlos112mo/features/Owner/presentation/screens/client_booking_screen.dart';
import 'package:flutter_carlos112mo/features/wall/data/models/comment_request_model.dart';
import 'package:flutter_carlos112mo/features/wall/data/models/wall_post_model.dart';
import 'package:flutter_carlos112mo/features/wall/domain/repositories/wall_repository.dart';
import 'package:get/get.dart';

class WallController extends BaseController {
  final WallRepository _wallRepository;
  final RxList<WallPostModel?> _wallPost = RxList([]);
  RxList<WallPostModel?> get wallPost => _wallPost;
  final commentController = <String, TextEditingController>{}.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  WallController(this._wallRepository);

  @override
  void onInit() {
    super.onInit();
    fetchWallPost();
  }

  TextEditingController getCommentController(String postId){
    if(!commentController.containsKey(postId)){
      commentController[postId] = TextEditingController();
    }
    return commentController[postId]!;
  }

  Future<void> fetchWallPost() async {
    setError('');
    setLoading(true);

    final result = await _wallRepository.getWallPosts();

    result.fold(
          (failure) {
        setError(failure.message);
        setLoading(false);
      },
          (success) {
        _wallPost.value = success.data;

      },
    );
  }
  Future<void> postComment(String postId) async {
    setError('');
    setLoading(true);

    final requestModel = CommentRequestModel(
      text: getCommentController(postId).text.trim()
    );

    final result = await _wallRepository.postComment(requestModel, postId);

    result.fold(
          (failure) {
        setError(failure.message);
        setLoading(false);
        Get.snackbar('Error', failure.message, snackPosition: SnackPosition.BOTTOM);
      },
          (success) {
            setLoading(false);
            fetchWallPost();
      },
    );
  }
  Future<void> joinMatch(String teamId) async {
    setError('');
    setLoading(true);

    final result = await _wallRepository.joinMatch(teamId);

    result.fold(
          (failure) {
        setError(failure.message);
        setLoading(false);
        Get.snackbar('Error', 'Join Match Failed: ${failure.message}', snackPosition: SnackPosition.BOTTOM);
      },
          (success) async{
            setLoading(false);
            Get.to(() => BookingPageScreen());
            Get.snackbar('Success', 'Join Match Successful', snackPosition: SnackPosition.BOTTOM);
      },
    );
  }
}

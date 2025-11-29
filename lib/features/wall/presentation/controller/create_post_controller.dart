import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/core/base/base_controller.dart';
import 'package:flutter_carlos112mo/features/wall/data/models/create_post_request_model.dart';
import 'package:flutter_carlos112mo/features/wall/domain/repositories/create_post_repository.dart';
import 'package:flutter_carlos112mo/features/wall/presentation/controller/wall_controller.dart';
import 'package:get/get.dart';

class CreatePostController extends BaseController {
  final CreatePostRepository _createPostRepository;
  final WallController wallController = Get.find<WallController>();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController teamIdController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  RxString selectedDate = ''.obs;
  RxString selectedTime = ''.obs;
  RxBool isMatchInvitation = false.obs;

  CreatePostController(this._createPostRepository);

  Future<void> createPost() async {
    setError('');
    setLoading(true);
    final requestModel = CreatePostRequestModel(
      content: contentController.text.trim(),
      teamId: teamIdController.text.trim(),
    );
    final result = await _createPostRepository.createPost(requestModel);
    result.fold((failure){
      setError(failure.message);
      setLoading(false);
      Get.snackbar('Error', 'Create Post Failed:${failure.message}', snackPosition: SnackPosition.BOTTOM);
    },
            (success) async{
      setLoading(false);
      Get.back();
      Get.snackbar('Success', 'Successfully Created Post', snackPosition: SnackPosition.BOTTOM);
      await wallController.fetchWallPost();
    });
  }

  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value =
          '${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}';
    }
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if(picked != null){
      final hour = picked.hour.toString().padLeft(2, '0');
      final minute = picked.minute.toString().padLeft(2, '0');
      final period = picked.period == DayPeriod.am ? "AM" : "PM";
      selectedTime.value = '$hour : $minute $period';
    }
  }
}

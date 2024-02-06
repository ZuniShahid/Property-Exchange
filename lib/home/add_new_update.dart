import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/global_variables.dart';
import '../generated/assets.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_widgets.dart';

class AddNewUpdate extends StatelessWidget {
  const AddNewUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text('Add new update', style: bodyNormal),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('Deal Updates', style: bodyNormal),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 10,
                    style: bodyNormal,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add your note here',
                      hintStyle: bodyNormal.copyWith(
                        color: Color(0xFFFFFFFF).withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: CustomButton(
                    onTap: () {
                      showCustomDialog(
                          context,
                          Assets.imagesDone,
                          "Update Added Successfully",
                          'Your new update has been added to your deal',
                          "Okay", () {
                        Get.back();
                      });
                    },
                    buttonText: 'Add Update '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

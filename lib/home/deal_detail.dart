import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/global_variables.dart';
import '../models/property_detail_model.dart';
import '../widgets/custom_widgets.dart';
import 'add_new_update.dart';
import 'create_deal.dart';
import 'home_screen.dart';

class DealtDetail extends StatefulWidget {
  final PropertyDetails property;

  const DealtDetail({super.key, required this.property});

  @override
  State<DealtDetail> createState() => _DealtDetailState();
}

class _DealtDetailState extends State<DealtDetail> {
  int activeButton = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.white,
        ),
        title: Text(
          'A wonderful luxurious bungalow ',
          style: headingLarge,
          softWrap: true,
        ),
        actions: [
          IconButton(
            onPressed: () {
              PropertyDealDetails existingDealDetails = PropertyDealDetails();
              Get.to(() => CreateDeal(
                    existingDealDetails: existingDealDetails,
                  ));
            },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
              size: 16,
            ),
          ),
        ],
      ),
      floatingActionButton: activeButton == 1
          ? null
          : FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              shape: CircleBorder(),
              onPressed: () {
                Get.to(() => AddNewUpdate());
              },
              child: Icon(Icons.add),
            ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomButton(
                        buttonText: "Details",
                        onTap: () {
                          activeButton = 1;
                          setState(() {});
                        },
                        buttonColor:
                            activeButton == 1 ? null : Color(0xFF323232),
                        buttonTextColor:
                            activeButton == 1 ? null : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomButton(
                        buttonText: "Updates",
                        onTap: () {
                          activeButton = 2;
                          setState(() {});
                        },
                        buttonColor:
                            activeButton == 2 ? null : Color(0xFF323232),
                        buttonTextColor:
                            activeButton == 2 ? null : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              activeButton == 2
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Wed, Jan 24,24',
                              style: bodyNormal,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '3:15 PM',
                              style: bodySmall.copyWith(
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 100.w,
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "The property at 789 Willow Trace has dropped from \$330K to \$310K. Reply YES to this message to schedule a viewing.",
                            style: bodyNormal,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 1,
                          width: 100.w,
                          color: Color(0xFFFFFF).withOpacity(0.1),
                        ),
                        buildColumn('Date', 'Wed, Jan 24,24'),
                        buildColumn('Co-Agent', 'Internal'),
                        buildColumn('Priority', 'High'),
                        buildColumn('Developer', 'Emaar'),
                        SizedBox(height: 20),
                        Container(
                          height: 1,
                          width: 100.w,
                          color: Color(0xFFFFFF).withOpacity(0.1),
                        ),
                        buildColumn('Seller', 'Cameron Williamson'),
                        SizedBox(height: 10),
                        Text(
                          '(205) 555-0100',
                          style: headingSmall,
                        ),
                        buildColumn('Buyer', 'Jane cooper'),
                        SizedBox(height: 10),
                        Text(
                          '(303) 555-0105',
                          style: headingSmall,
                        ),
                        buildColumn('Inventory', 'Agent-Internal'),
                        buildColumn('Lead Source', 'Property Finder'),
                        buildColumn('Deposite', 'Booking Received'),
                        buildColumn('Form A', 'Complete'),
                        buildColumn('Form B', 'Complete'),
                        buildColumn('Tenancy', 'Manual MOU'),
                        buildColumn('Representing Side', 'Seller'),
                        buildColumn('Launch/Transfer Date', 'Feb 10, 2024'),
                        buildColumn('Transfer', 'Pending'),
                        buildColumn('Original Cheque Return', 'Pending'),
                        buildColumn('Commission', 'Pending'),
                        buildColumn('NOC', 'Received'),
                        buildColumn('Seller', 'Cameron Williamson'),
                        SizedBox(height: 20),
                        Container(
                          height: 1,
                          width: 100.w,
                          color: Color(0xFFFFFF).withOpacity(0.1),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Deal Value',
                              style: bodyNormal.copyWith(
                                  color: Colors.white.withOpacity(0.7)),
                            ),
                            Text(
                              'AED 2,000,000',
                              style: headingSmall,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Agency Fee',
                                  style: bodyNormal.copyWith(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '( 20% )',
                                  style: bodySmall.copyWith(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                              ],
                            ),
                            Text(
                              'AED 400,000',
                              style: headingSmall,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'VAT',
                                  style: bodyNormal.copyWith(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '( 5% of Agency fee )',
                                  style: bodySmall.copyWith(
                                      color: Colors.white.withOpacity(0.7)),
                                ),
                              ],
                            ),
                            Text(
                              'AED 2,000,000',
                              style: headingSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
              SizedBox(height: 20),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Column buildColumn(String title, String data) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          title,
          style: bodyNormal.copyWith(color: Colors.white.withOpacity(0.7)),
        ),
        SizedBox(height: 10),
        Text(
          data,
          style: headingSmall,
        ),
      ],
    );
  }
}

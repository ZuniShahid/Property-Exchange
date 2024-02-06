import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/global_variables.dart';
import '../widgets/circle_image.dart';
import 'deal_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleImage(imageUrl: ''),
        ),
        title: Text(
          'John',
          style: headingLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Deals',
              style: headingLarge,
            ),
            SizedBox(height: 2.h),
            // Align(
            //   alignment: Alignment.center,
            //   child: SizedBox(
            //     width: 30.h,
            //     child: Text(
            //       'You have created no deal, tap plus “+” icon to create a new deal',
            //       textAlign: TextAlign.center,
            //       style: TextStyle(color: Colors.white.withOpacity(0.5)),
            //     ),
            //   ),
            // ),
            Expanded(
              child: ListView.builder(
                // shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 14,
                itemBuilder: (context, index) {
                  PropertyDetails accepted = PropertyDetails(
                    title: "A Wonderful Luxurious Bungalow",
                    area: "Down Town",
                    date: "Wed, Jan 24,24",
                    currencyAndValue: "AED 2,000,000",
                    priority: "High",
                    seller: "Cameron Williamson",
                    buyer: "Jane Cooper",
                    status: "Accepted",
                  );
                  PropertyDetails successful = PropertyDetails(
                    title: "A Wonderful Luxurious Bungalow",
                    area: "Down Town",
                    date: "Wed, Jan 24,24",
                    currencyAndValue: "AED 2,000,000",
                    priority: "High",
                    seller: "Cameron Williamson",
                    buyer: "Jane Cooper",
                    status: "Successful",
                  );
                  PropertyDetails ongoing = PropertyDetails(
                    title: "A Wonderful Luxurious Bungalow",
                    area: "Down Town",
                    date: "Wed, Jan 24,24",
                    currencyAndValue: "AED 2,000,000",
                    priority: "High",
                    seller: "Cameron Williamson",
                    buyer: "Jane Cooper",
                    status: "Ongoing",
                  );
                  PropertyDetails failed = PropertyDetails(
                    title: "A Wonderful Luxurious Bungalow",
                    area: "Down Town",
                    date: "Wed, Jan 24,24",
                    currencyAndValue: "AED 2,000,000",
                    priority: "High",
                    seller: "Cameron Williamson",
                    buyer: "Jane Cooper",
                    status: "Failed",
                  );
                  if (index == 0) {
                    return PropertyCard(property: accepted);
                  } else if (index == 1) {
                    return PropertyCard(property: failed);
                  } else if (index == 2) {
                    return PropertyCard(property: ongoing);
                  } else if (index == 3) {
                    return PropertyCard(property: successful);
                  } else {
                    return PropertyCard(property: successful);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PropertyDetails {
  final String title;
  final String area;
  final String date;
  final String currencyAndValue;
  final String priority;
  final String seller;
  final String buyer;
  final String status;

  PropertyDetails({
    String title = '',
    String area = '',
    String date = '',
    String currencyAndValue = '',
    String priority = '',
    String seller = '',
    String buyer = '',
    String status = '',
  })  : title = title,
        area = area,
        date = date,
        currencyAndValue = currencyAndValue,
        priority = priority,
        seller = seller,
        buyer = buyer,
        status = status;
}

class PropertyCard extends StatelessWidget {
  final PropertyDetails property;

  PropertyCard({required this.property});

  @override
  Widget build(BuildContext context) {
    final TextStyle headingMediumShort =
        headingMedium.copyWith(fontSize: 10.sp);
    final TextStyle bodyNormalShort = bodyNormal.copyWith(fontSize: 8.sp);
    final TextStyle bodyLargeShort = bodyLarge.copyWith(fontSize: 10.sp);

    return GestureDetector(
      onTap: () {
        Get.to(() => DealtDetail(
              property: property,
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.h), // Use sizer for height
        width: 100.w,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(16.sp), // Use sizer for radius
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.sp), // Use sizer for padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: headingMediumShort,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Area: ',
                              style: bodyLargeShort,
                            ),
                            Text(
                              property.area,
                              style: bodyNormalShort.copyWith(
                                color: AppColors.greyIcon,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 2.w), // Use sizer for spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Date: ',
                              style: bodyLargeShort,
                            ),
                            Text(
                              property.date,
                              style: bodyNormalShort.copyWith(
                                color: AppColors.greyIcon,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        property.currencyAndValue,
                        style: headingMediumShort,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 0.3.h, // Use sizer for vertical padding
                          horizontal: 1.5.w, // Use sizer for horizontal padding
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(
                              2.4.h), // Use sizer for radius
                        ),
                        child: Text(property.priority, style: bodyNormalShort),
                      )
                    ],
                  ),
                  SizedBox(height: 0.5.h), // Use sizer for spacing
                  Container(
                    height: 1, // Use sizer for height
                    width: 100.w,
                    color: Color(0xFFFFFF).withOpacity(0.1),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Seller',
                              style: bodyNormalShort.copyWith(
                                color: AppColors.greyIcon,
                              ),
                            ),
                            Text(
                              property.seller,
                              style: bodyLargeShort,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Buyer',
                              style: bodyNormalShort.copyWith(
                                color: AppColors.greyIcon,
                              ),
                            ),
                            Text(
                              property.buyer,
                              style: bodyLargeShort,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 4.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: property.status == 'Accepted'
                    ? Color(0xFF0C8AFF)
                    : property.status == 'Ongoing'
                        ? Color(0xFFAE7A3D)
                        : property.status == 'Successful'
                            ? Color(0xFF038C00)
                            : Color(0xFFD50303),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16.sp), // Use sizer for radius
                  bottomRight: Radius.circular(16.sp), // Use sizer for radius
                ),
              ),
              child: Center(
                child: Text(
                  property.status,
                  style: headingMediumShort.copyWith(
                      fontSize: 8.sp), // Use sizer for font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

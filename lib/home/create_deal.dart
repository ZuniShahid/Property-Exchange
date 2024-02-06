import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/global_variables.dart';
import '../generated/assets.dart';
import '../models/property_detail_model.dart';
import '../widgets/country_picker_widget.dart';
import '../widgets/custom_dialog.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/date_picker.dart';
import '../widgets/drop_down_widget.dart';
import '../widgets/label_text_field.dart';
import '../widgets/text_form_fields.dart';

class CreateDeal extends StatefulWidget {
  final PropertyDealDetails? existingDealDetails;

  const CreateDeal({super.key, this.existingDealDetails});

  @override
  State<CreateDeal> createState() => _CreateDealState();
}

class _CreateDealState extends State<CreateDeal> {
  DateTime? selectedDate;

  final TextEditingController _phoneCont = TextEditingController();
  final TextEditingController _dealNameCont = TextEditingController();
  final TextEditingController _developerCont = TextEditingController();
  final TextEditingController _areaCont = TextEditingController();
  final TextEditingController _leadSourceCont = TextEditingController();
  final TextEditingController _sellerNameCont = TextEditingController();
  final TextEditingController _sellerPhoneCont = TextEditingController();
  final TextEditingController _buyerNameCont = TextEditingController();
  final TextEditingController _buyerPhoneCont = TextEditingController();
  final TextEditingController _dealValueCont = TextEditingController();
  final TextEditingController _agencyFeeCont = TextEditingController();
  final TextEditingController _vatCont = TextEditingController();
  final TextEditingController _depositCont = TextEditingController();
  final TextEditingController _tenancyCont = TextEditingController();
  final TextEditingController _representingSideCont = TextEditingController();
  final TextEditingController _launchTransferDateCont = TextEditingController();
  final TextEditingController _transferStatusCont = TextEditingController();
  final TextEditingController _originalChequeReturnCont =
      TextEditingController();
  final TextEditingController _commissionCont = TextEditingController();

  String formA = 'Complete';
  String formB = 'Complete';
  String NOC = 'Complete';

  final List<String> coAgents = [
    "External",
    "Internal",
    "None",
  ];
  String selectedAgent = 'Select co-agent';
  final List<String> priorities = [
    "External",
    "Internal",
    "None",
  ];
  final String selectedPriority = 'Select co-agent';

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
          widget.existingDealDetails != null
              ? 'Edit Deal' // Change title for edit mode
              : 'Create New Deal',
          style: headingSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the following details to create a new deal",
                  style: authSubHeading,
                ),
              ),
              SizedBox(height: 20),
              LabeledTextField(
                heading: 'Deal Name',
                child: CustomTextField(hintText: 'Enter the Deal Name'),
              ),
              LabeledTextField(
                heading: 'Date',
                child: DatePickerWidget(
                  onDateSelected: (DateTime? d) {
                    selectedDate = d;
                  },
                ),
              ),
              LabeledTextField(
                heading: 'Co-Agent',
                child: CustomDropDown(
                  dropDownTitle: 'Select co-agent',
                  items: coAgents,
                  onValueChanged: (value) {
                    selectedAgent = value!;
                    setState(() {});
                  },
                ),
              ),
              selectedAgent == 'Internal'
                  ? LabeledTextField(
                      heading: 'Select Co-Agent',
                      child: CustomDropDown(
                        dropDownTitle: 'Select Co-Agent',
                        items: coAgents,
                        onValueChanged: (value) {
                          // selectedAgent = value!;
                        },
                      ),
                    )
                  : selectedAgent == 'External'
                      ? LabeledTextField(
                          heading: 'Co-Agents Name',
                          child:
                              CustomTextField(hintText: 'Type Co-Agents Name'),
                        )
                      : SizedBox.shrink(),
              LabeledTextField(
                heading: 'Priority',
                child: CustomDropDown(
                  dropDownTitle: 'Select priority',
                  items: coAgents,
                  onValueChanged: (value) {},
                ),
              ),
              LabeledTextField(
                heading: 'Developer',
                child: CustomTextField(hintText: 'Developer Name'),
              ),
              LabeledTextField(
                heading: 'Area',
                child:
                    CustomTextField(hintText: 'Enter the area of the property'),
              ),
              LabeledTextField(
                heading: 'Inventory',
                child: CustomDropDown(
                  dropDownTitle: 'Select Inventory',
                  items: coAgents,
                  onValueChanged: (value) {},
                ),
              ),
              LabeledTextField(
                heading: 'Lead Source',
                child: CustomDropDown(
                  dropDownTitle: 'Select lead source',
                  items: coAgents,
                  onValueChanged: (value) {
                    // Handle the selected value here
                  },
                ),
              ),
              LabeledTextField(
                heading: 'Deals Status',
                child: CustomDropDown(
                  dropDownTitle: 'Deals Status',
                  items: coAgents,
                  onValueChanged: (value) {},
                ),
              ),
              LabeledTextField(
                heading: 'Seller Name',
                child: CustomTextField(hintText: 'Enter the Seller Name'),
              ),
              LabeledTextField(
                heading: 'Seller Phone Number',
                child: CountryCodePicker(phoneController: _phoneCont),
              ),
              LabeledTextField(
                heading: 'Buyer Name',
                child: CustomTextField(hintText: 'Enter the Buyer Name'),
              ),
              LabeledTextField(
                heading: 'Buyer Phone Number',
                child: CountryCodePicker(phoneController: _phoneCont),
              ),
              LabeledTextField(
                heading: 'Deal Value',
                child: CustomTextField(hintText: 'AED 00.00'),
              ),
              LabeledTextField(
                heading: 'Agency Fee',
                child: CustomTextField(hintText: '%'),
              ),
              LabeledTextField(
                heading: 'Deal Name',
                child: CustomTextField(hintText: 'Enter the Deal Name'),
              ),
              LabeledTextField(
                heading: 'VAT',
                child: CustomTextField(hintText: '5% of the agency fee '),
              ),
              LabeledTextField(
                heading: 'Deposit',
                child: CustomDropDown(
                  dropDownTitle: 'Select Deposit',
                  items: coAgents,
                  onValueChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Form A', style: headingMedium),
                    ),
                    SizedBox(height: 20),
                    buildFormOptions(
                        'Form A', 'Complete', Icons.circle, 'Complete'),
                    SizedBox(height: 20),
                    buildFormOptions('Form A', 'Not Applicable', Icons.cancel,
                        'Not Applicable'),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('Form B', style: headingMedium),
                    ),
                    SizedBox(height: 20),
                    buildFormOptions(
                        'Form B', 'Complete', Icons.circle, 'Complete'),
                    SizedBox(height: 20),
                    buildFormOptions('Form B', 'Not Applicable', Icons.cancel,
                        'Not Applicable'),
                  ],
                ),
              ),
              LabeledTextField(
                heading: 'Tenancy',
                child: CustomDropDown(
                  dropDownTitle: 'Select tenancy',
                  items: coAgents,
                  onValueChanged: (value) {},
                ),
              ),
              LabeledTextField(
                heading: 'Representing Side',
                child: CustomDropDown(
                  dropDownTitle: 'Select Representing Side',
                  items: coAgents,
                  onValueChanged: (value) {},
                ),
              ),
              LabeledTextField(
                heading: 'Launch/ Transfer Date',
                child: CustomTextField(hintText: 'ddd/mm/yyyy'),
              ),
              LabeledTextField(
                heading: 'Transfer Status',
                child: CustomDropDown(
                  dropDownTitle: 'Select transfer status',
                  items: coAgents,
                  onValueChanged: (value) {},
                ),
              ),
              LabeledTextField(
                heading: 'Original Cheque Return',
                child: CustomDropDown(
                  dropDownTitle: 'Select original cheque return status',
                  items: coAgents,
                  onValueChanged: (value) {},
                ),
              ),
              LabeledTextField(
                heading: 'Commission',
                child: CustomDropDown(
                  dropDownTitle: 'Select commission status',
                  items: coAgents,
                  onValueChanged: (value) {
                    // Handle the selected value here
                    print("Selected Co-Agent: $value");
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text('NOC', style: headingMedium),
                    ),
                    SizedBox(height: 20),
                    buildFormOptions(
                        'NOC', 'Complete', Icons.circle, 'Complete'),
                    SizedBox(height: 20),
                    buildFormOptions('NOC', 'Not Applicable', Icons.cancel,
                        'Not Applicable'),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomButton(
                  buttonText: widget.existingDealDetails != null
                      ? "Update Deal"
                      : "Create Deal",
                  onTap: () {
                    widget.existingDealDetails == null
                        ? showCustomDialog(
                            context,
                            Assets.imagesDone,
                            "Deal Created successfully",
                            'Congratulations! Your deal has been created successfully',
                            "Okay", () {
                            Get.back();
                          })
                        : showCustomDialog(
                            context,
                            Assets.imagesDone,
                            "Deal updated successfully",
                            'Your deal has been updated successfully.',
                            "Okay", () {
                            Get.back();
                          });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFormOptions(
      String form, String option, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        if (form == 'Form A') {
          formA = option;
        } else if (form == 'Form B') {
          formB = option;
        } else if (form == 'NOC') {
          NOC = option;
        }
        setState(() {});
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Icon(
                icon,
                color: (form == 'Form A' && formA == option) ||
                        (form == 'Form B' && formB == option) ||
                        (form == 'NOC' && NOC == option)
                    ? Colors.white
                    : Colors.transparent,
                size: 10,
              ),
            ),
            SizedBox(width: 10),
            Text(label, style: headingSmall),
          ],
        ),
      ),
    );
  }
}

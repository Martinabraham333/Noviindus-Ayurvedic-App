import 'package:ayurvedic_centre_patients/core/widgets/custom_button.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_dropdown.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_text.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_textfield.dart';
import 'package:ayurvedic_centre_patients/presentation/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _totalAmountController = TextEditingController();
  final TextEditingController _discountAmountController =
      TextEditingController();
  final TextEditingController _advanceAmountController =
      TextEditingController();
  final TextEditingController _balanceAmountController =
      TextEditingController();
  final TextEditingController _treatmentDateController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();

  int _maleCount = 2;
  int _femaleCount = 2;
  String? _paymentOption;
  String? _selectedHour;
  String? _selectedMinutes;

  @override
  void dispose() {
    _nameController.dispose();
    _whatsappController.dispose();
    _addressController.dispose();
    _totalAmountController.dispose();
    _discountAmountController.dispose();
    _advanceAmountController.dispose();
    _balanceAmountController.dispose();
    _treatmentDateController.dispose();
    _locationController.dispose();
    _branchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RegisterProvider>().fetchbranchList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.notifications_none_outlined),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: CustomText(
              text: 'Register',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Enter Your Full Name',
                      title: 'Name',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _whatsappController,
                      hintText: 'Enter your Whatsapp number',
                      title: 'Whatsapp Number',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _addressController,
                      hintText: 'Enter your full address',
                      title: 'Address',
                    ),

                    SizedBox(height: 20),

                    Consumer<RegisterProvider>(
                      builder: (context, registerProvider, _) {
                        return CustomDropDown(
                          controller: _branchController,
                          hintText: 'Select the branch',
                          title: 'Branch',
                          ontap: (data) {
                            _branchController.text = data;
                          },
                          dropDownList:
                              registerProvider.branchDropDownList == null
                              ? []
                              : registerProvider.branchDropDownList!,
                        );
                      },
                    ),


                    SizedBox(height: 20),
                    Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomText(text: 'Treatments'),
        ),
                    CustomButton(title: '+ Add Treatments', ontap: (){}),
                    SizedBox(height: 20),
                    
                    CustomTextField(
                      controller: _totalAmountController,
                      hintText: 'Enter total amount',
                      title: 'Total Amount',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _discountAmountController,
                      hintText: 'Enter discount amount',
                      title: 'Discount Amount',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _advanceAmountController,
                      hintText: 'Enter advance amount',
                      title: 'Advance Amount',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _balanceAmountController,
                      hintText: 'Enter balance amount',
                      title: 'Balance Amount',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _treatmentDateController,
                      hintText: 'Enter treatment date',
                      title: 'Treatment Date',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

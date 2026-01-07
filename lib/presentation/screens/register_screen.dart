import 'package:ayurvedic_centre_patients/core/helper/date_time_selection_helper.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_button.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_dropdown.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_text.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_textfield.dart';
import 'package:ayurvedic_centre_patients/presentation/providers/register_provider.dart';
import 'package:ayurvedic_centre_patients/presentation/screens/patient_list_screen.dart';
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
  final TextEditingController _treatmentController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();
  final TextEditingController _treatmentTimeController = TextEditingController();

  int? _treatmentId;
  int? _branchId;
  String? _paymentType;
 

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
    _treatmentController.dispose();
    super.dispose();
  }

 void _clearAllFields() {
  _nameController.clear();
  _whatsappController.clear();
  _addressController.clear();
  _totalAmountController.clear();
  _discountAmountController.clear();
  _advanceAmountController.clear();
  _balanceAmountController.clear();
  _treatmentDateController.clear();
  _treatmentController.clear();
  _locationController.clear();
  _branchController.clear();
  _hourController.clear();
  _minuteController.clear();
  _treatmentTimeController.clear();

  _treatmentId = null;
  _branchId = null;
  _paymentType = null;
}


  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RegisterProvider>().fetchbranchList();
      context.read<RegisterProvider>().fetchTreatmentList();
    
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
                            _branchController.text = data['val2'];
                            _branchId = data['val1'];
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
                    treatMentList(),
                    Consumer<RegisterProvider>(
                      builder: (context, provider, _) {
                        return CustomButton(
                          title: '+ Add Treatments',
                          ontap: () async {
                            

                            await addTreatmentDialogueBox(provider);
                          },
                          backGroundColor: Color(0x4D389A48),
                          textColor: Colors.black,
                        );
                      },
                    ),
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: CustomText(text: 'Payment Options'),
                    ),
                   
                    Consumer<RegisterProvider>(
                      builder: (context,provider,_) {

                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                  Radio(value: PaymentMethod.cash,
                                  groupValue:provider.paymentMethod ,
                                  onChanged: (value) {
                                    provider.selectPaymentMethod(paymentMethod: PaymentMethod.cash);
                                     _paymentType='Cash';
                                  },),
                                  CustomText(text: 'Cash'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                   Radio(value: PaymentMethod.card,
                                  groupValue:provider.paymentMethod ,
                                  onChanged: (value) {
                                    provider.selectPaymentMethod(paymentMethod: PaymentMethod.card);
                                      _paymentType='Card';
                                  },),
                                  CustomText(text: 'Card'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                children: [
                                Radio(value: PaymentMethod.upi,
                                  groupValue:provider.paymentMethod ,
                                  onChanged: (value) {
                                    provider.selectPaymentMethod(paymentMethod: PaymentMethod.upi);
                                   _paymentType='UPI';
                                  },),
                                  CustomText(text: 'UPI'),
                                ],
                              ),
                            ),
                           
                           
                          ],
                        );
                      }
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
                      hintText: 'Select treatment date',
                      title: 'Treatment Date',
                      icon: Icons.calendar_month,
                      ontap: ()async {
                      final date= await    selectDate(context);
                      _treatmentDateController.text=date;
                      },
                    ),

                     SizedBox(height: 20),
                      CustomTextField(
                      controller: _treatmentTimeController,
                      hintText: 'Select treatment Time',
                      title: 'Treatment Time',
                      icon: Icons.calendar_month,
                      ontap: ()async {
                      final time= await    selectTime(context);
                      _treatmentTimeController.text=time;
                      },
                    ),
                  //  Row(
                  //    children: [
                  //      Expanded(child: CustomDropDown(hintText: 'Hour', ontap: (){}, controller: _hourController, dropDownList: [], title: '')),
                  //     SizedBox(width: 20,),
                  //      Expanded(child: CustomDropDown(hintText: 'Minutes', ontap: (){}, controller: _minuteController, dropDownList: [], title: '')),
                  //    ],
                  //  ),
                    SizedBox(height: 20),
                    Consumer<RegisterProvider>(
                      builder: (context,provider,_) {
                        return provider.isLoading==true ?CircularProgressIndicator(color: Color(0xFF006837) ,):
                        
                        
                        CustomButton(title: 'Save', ontap: (){
                         provider.postRegisterDetails(
                            {
                          'name':_nameController.text,
                          'excecutive':'Admin',
                          'payment':_paymentType??'',
                        'phone':_whatsappController.text,
                        'address':_addressController.text,
                        'total_amount':_totalAmountController.text,
                        'discount_amount':_discountAmountController.text,
                        'advance_amount':_advanceAmountController.text,
                        'balance_amount':_balanceAmountController.text,
                        'date_nd_time':'${_treatmentDateController.text}-${_treatmentTimeController.text}',
                        'id':'',
                        'male':provider.listOfIdsAsString,
                        'female':provider.listOfIdsAsString,
                        'branch':_branchId.toString(),
                        'treatments':provider.listOfIdsAsString,
                          }
                          );

                          if (provider.isSuccess==true) {
                            provider.clearAllData();
                            _clearAllFields();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
return PatientListScreen();
                            }));
                            ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registraction successful!"),
          backgroundColor: Colors.green,
        ),
      );
                          } else {
                                 ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registraction failed!"),
          backgroundColor: Colors.red,
        ),
      );
                          }
                        });
                      }
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget treatMentList() {
    return Consumer<RegisterProvider>(
      builder: (context, provider, _) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: provider.treatmentList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                decoration: BoxDecoration(color: Color(0x1A000000)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  CustomText(
                                    text: "${index + 1}.  ",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    text: provider.treatmentList[index]['name'],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CustomText(
                                    text: 'Male',
                                    color: Color(0xFF006837),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF006837),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: provider
                                          .treatmentList[index]['maleCount']
                                          .toString(),
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF006837),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: CustomText(
                                    text: 'Female',
                                    color: Color(0xFF006837),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF006837),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: provider
                                          .treatmentList[index]['femaleCount']
                                          .toString(),
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF006837),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                provider.removeTreatment(index);
                              },
                              child: Icon(Icons.cancel, color: Colors.red),
                            ),
                            SizedBox(height: 10),
                            InkWell(
                              onTap: () {
                                updateTreatmentDialogueBox(
                                  provider: provider,
                                  index: index,
                                  data: provider.treatmentList[index],
                                );
                              },
                              child: Icon(
                                Icons.edit_outlined,
                                color: Color(0xFF006837),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  updateTreatmentDialogueBox({
    required RegisterProvider provider,
    required int index,
    required Map<String, dynamic> data,
  }) {
       _treatmentController.text = data['name'];
                    _treatmentId = data['id'];
 provider.clickEditIcon( data['maleCount'],data['femaleCount']);
                    
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomDropDown(
                  hintText: 'Choose prefered treatment',
                  ontap: (data) {
                    _treatmentController.text = data['val2'];
                    _treatmentId = data['val1'];
                  },
                  controller: _treatmentController,
                  dropDownList: provider.treatmenDropDownList,
                  title: 'Choose treatment',
                ),
                SizedBox(height: 10),
                CustomText(text: 'Add Patients'),
                SizedBox(height: 10),
                addGender(
                  gender: 'Male',
                  onTapIncrement: () {
                    provider.maleIncrement();
                  },
                  onTapDecrement: () {
                    provider.maleDecrement();
                  },
                ),
                SizedBox(height: 10),
                addGender(
                  gender: 'Female',
                  onTapIncrement: () {
                    provider.femaleIncrement();
                  },
                  onTapDecrement: () {
                    provider.femaleDecrement();
                  },
                ),
                SizedBox(height: 20),
                CustomButton(
                  title: 'Save',
                  ontap: () {
                    provider.updateTreatments(
                      index: index,
                      treatmentId: _treatmentId!,
                      treatmentName: _treatmentController.text,
                      maleCount: provider.maleNumber,
                      femaleCount: provider.femaleNumber,
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      provider.clearGenderNumber();
      _treatmentController.clear();
    });
    ;
  }

  addTreatmentDialogueBox(RegisterProvider provider) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomDropDown(
                  hintText: 'Choose prefered treatment',
                  ontap: (data) {
                    _treatmentController.text = data['val2'];
                    _treatmentId = data['val1'];
                  },
                  controller: _treatmentController,
                  dropDownList: provider.treatmenDropDownList,
                  title: 'Choose treatment',
                ),
                SizedBox(height: 10),
                CustomText(text: 'Add Patients'),
                SizedBox(height: 10),
                addGender(
                  gender: 'Male',
                  onTapIncrement: () {
                    provider.maleIncrement();
                  },
                  onTapDecrement: () {
                    provider.maleDecrement();
                  },
                ),
                SizedBox(height: 10),
                addGender(
                  gender: 'Female',
                  onTapIncrement: () {
                    provider.femaleIncrement();
                  },
                  onTapDecrement: () {
                    provider.femaleDecrement();
                  },
                ),
                SizedBox(height: 20),
                CustomButton(
                  title: 'Save',
                  ontap: () {
                    provider.addTreatments(
                      treatmentId: _treatmentId!,
                      treatmentName: _treatmentController.text,
                      maleCount: provider.maleNumber,
                      femaleCount: provider.femaleNumber,
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      provider.clearGenderNumber();
      _treatmentController.clear();
    });
    ;
  }

  Widget addGender({
    required String gender,
    required Function()? onTapIncrement,
    required Function()? onTapDecrement,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Container(
            width: 90,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10),
              color: Color(0x1A000000),
            ),
            child: Center(child: Text(gender)),
          ),
        ),

        InkWell(
          onTap: onTapIncrement,
          child: CircleAvatar(
            backgroundColor: Color(0xFF006837),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
        Consumer<RegisterProvider>(
          builder: (context, provider, _) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: CustomText(
                    text: gender == "Male"
                        ? provider.maleNumber.toString()
                        : provider.femaleNumber.toString(),
                  ),
                ),
              ),
            );
          },
        ),
        InkWell(
          onTap: onTapDecrement,
          child: CircleAvatar(
            backgroundColor: Color(0xFF006837),
            child: Icon(Icons.remove, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

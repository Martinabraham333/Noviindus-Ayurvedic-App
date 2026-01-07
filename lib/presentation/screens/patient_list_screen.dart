import 'package:ayurvedic_centre_patients/core/date_formatter.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_button.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_text.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custome_serachfield.dart';
import 'package:ayurvedic_centre_patients/presentation/providers/patient_provider.dart';
import 'package:ayurvedic_centre_patients/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  TextEditingController _searchController =TextEditingController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PatientProvider>().fetchPatientList();
    });
  }

  @override
  Widget build(BuildContext context) {
  

    return Consumer<PatientProvider>(builder: (context,patientProvider,_){
   return     patientProvider.isLoading==true?         Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.green),
                  SizedBox(height: 16),
                  CustomText(text: 'Please wait, data is loading...'),
                ],
              ),
            ),
          )
        :  patientProvider.filterPatientData==null ?     Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.green),
                  SizedBox(height: 16),
                  CustomText(text: 'No data found'),
                ],
              ),
            ),
          )
        
      :   Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: CustomSearchTextField(controller:_searchController , hintText: 'Search',icon: Icons.search,)),
                        SizedBox(width: 20,),
                      Flexible(
                        flex: 1,
                        child: CustomButton(title:'Search' , ontap: (){
                          patientProvider.filterPatientDataFunction(_searchController.text);
                        }))
                    ],
                  ),
                
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                                   
                      itemCount: patientProvider.filterPatientData!.length,
                      // itemCount: 5,
                     
                      itemBuilder: (context, index) {
                        var patient = patientProvider.filterPatientData![index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F1F1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: '${index + 1}.',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(width: 20),
                                
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomText(
                                              text: '${patient.name}.',
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                
                                            patient
                                                    .patientEntityDetailsSet
                                                    .isNotEmpty
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          top: 10,
                                                        ),
                                                    child: CustomText(
                                                      color: Colors.green,
                                                      text:
                                                          '${patient.patientEntityDetailsSet[0].treatmentName}',
                                                    ),
                                                  )
                                                : SizedBox(),
                                            SizedBox(height: 20),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                            right: 10,
                                                          ),
                                                      child: Icon(
                                                        Icons.calendar_month,
                                                        color: Colors.red,
                                                        size: 16,
                                                      ),
                                                    ),
                                                    CustomText(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                      text:
                                                          '${dateFormatter(patient.createdAt.toString())}',
                                                    ),
                                                  ],
                                                ),
                                
                                                SizedBox(width: 20),
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              right: 10,
                                                            ),
                                                        child: Icon(
                                                          Icons.group,
                                                          color: Colors.red,
                                                          size: 16,
                                                        ),
                                                      ),
                                
                                                      Expanded(
                                                        child: CustomText(
                                                          fontSize: 14,
                                                          color: Colors.grey,
                                                          text:
                                                              '${patient.user.toString()}',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CustomText(text: 'View Booking details'),
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.green,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                title: 'Register',
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          );
 
    });
  }
}

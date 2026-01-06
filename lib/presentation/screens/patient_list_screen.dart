import 'package:ayurvedic_centre_patients/core/date_formatter.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_button.dart';
import 'package:ayurvedic_centre_patients/core/widgets/custom_text.dart';
import 'package:ayurvedic_centre_patients/presentation/providers/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<PatientProvider>(
        context,
        listen: false,
      ).fetchPatientList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);

    return patientProvider.patientData == null
        ? Scaffold(
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
        : Scaffold(
                       body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      // itemCount: patientProvider.patientData!.length,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        var patient = patientProvider.patientData![index];
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
                                                  
                                                      CustomText(
                                                        fontSize: 14,
                                                        color: Colors.grey,
                                                        text:
                                                            '${patient.user.toString()}',
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: 'View Booking details',
                                      ),
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
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(title: 'Register', ontap: (){}),
            )
          
          );

        
  }


}

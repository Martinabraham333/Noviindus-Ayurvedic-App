
import 'package:ayurvedic_centre_patients/core/api_client.dart';
import 'package:ayurvedic_centre_patients/data/data_sources/auth_remote_data_source.dart';
import 'package:ayurvedic_centre_patients/data/data_sources/patients_remote_data_source.dart';
import 'package:ayurvedic_centre_patients/data/repository_impl/auth_repository_impl.dart';
import 'package:ayurvedic_centre_patients/data/repository_impl/patient_repository_impl.dart';
import 'package:ayurvedic_centre_patients/domain/repositories/auth_repository.dart';
import 'package:ayurvedic_centre_patients/domain/repositories/patient_repository.dart';
import 'package:ayurvedic_centre_patients/domain/usecases/auth_usecase.dart';
import 'package:ayurvedic_centre_patients/domain/usecases/patient_usecase.dart';
import 'package:ayurvedic_centre_patients/presentation/providers/auth_provider.dart';
import 'package:ayurvedic_centre_patients/presentation/providers/patient_provider.dart';
import 'package:get_it/get_it.dart';

final sl=GetIt.instance;

Future<void>init()async{
//// AUTH DEPENDENCY ////
sl.registerFactory(()=>AuthProvider(sl()));
sl.registerLazySingleton(()=>AuthUsecase(sl()));
sl.registerLazySingleton<AuthRepository>(()=> AuthRepositoryImpl(sl()));
sl.registerLazySingleton(()=>AuthRemoteDataSource(sl()));
sl.registerLazySingleton(() => ApiClient());

//// PATIENT DEPENDENCY ////

sl.registerFactory(()=>PatientProvider(sl()));
sl.registerLazySingleton(()=>PatientUsecase(sl()));
sl.registerLazySingleton<PatientRepository>(()=> PatientRepositoryImpl(sl()));
sl.registerLazySingleton(()=>PatientsRemoteDataSource(sl()));


}
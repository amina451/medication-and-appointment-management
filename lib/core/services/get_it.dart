import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/features/doctors/data/remote/supa_base_services.dart';
import 'package:pharmacy_app/features/doctors/data/repo_imp/doctor_repo_imp.dart';
import 'package:pharmacy_app/features/doctors/domain/repo/docotr_repo.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/create_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/delete_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/edit_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/get_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_cubit.dart';
import 'package:pharmacy_app/features/medications/data/remote/supa_base_services.dart';
import 'package:pharmacy_app/features/medications/data/repo_imp/medication_repo_imp.dart';
import 'package:pharmacy_app/features/medications/domain/repo/medication_repo.dart';
import 'package:pharmacy_app/features/medications/domain/uses_case/create_medication_usecase.dart';
import 'package:pharmacy_app/features/medications/domain/uses_case/delete_medication_usecase.dart';
import 'package:pharmacy_app/features/medications/domain/uses_case/edit_medication_usecase.dart';
import 'package:pharmacy_app/features/medications/domain/uses_case/get_medication_usecase.dart';
import 'package:pharmacy_app/features/medications/presention/manger/medication_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Supabase client service
  getIt.registerSingleton<SupabaseServiceDoctor>(
    SupabaseServiceDoctor(supabase: Supabase.instance.client),
  );

  // Doctor repo
  getIt.registerSingleton<DoctorRepository>(
    DoctorRepoImpl(supabaseServiceDoctor: getIt<SupabaseServiceDoctor>()),
  );

  // Usecases
  getIt.registerSingleton<GetDoctorUsecase>(
    GetDoctorUsecase(doctorRepository: getIt<DoctorRepository>()),
  );

  getIt.registerSingleton<CreateDoctorUsecase>(
    CreateDoctorUsecase(doctorRepository: getIt<DoctorRepository>()),
  );

  getIt.registerSingleton<EditeDoctorUsecase>(
    EditeDoctorUsecase(getIt<DoctorRepository>()),
  );

  getIt.registerSingleton<DeleteDoctorUsecase>(
    DeleteDoctorUsecase(getIt<DoctorRepository>()),
  );







// medication services
  getIt.registerSingleton<SupabaseServiceMedication>(
    SupabaseServiceMedication(supabase: Supabase.instance.client),
  );


  getIt.registerSingleton<MedicationRepository>(
    MedicationRepoImpl(supabaseService: getIt<SupabaseServiceMedication>()),
  );


// usecases medication
  getIt.registerSingleton<GetMedicationUsecase>(
    GetMedicationUsecase(medicationRepository: getIt<MedicationRepository>()),
  );
  getIt.registerSingleton<CreateMedicationUsecase>(
    CreateMedicationUsecase(
      medicationRepository: getIt<MedicationRepository>(),
    ),
  );
  getIt.registerSingleton<EditeMedicationUsecase>(
    EditeMedicationUsecase(getIt<MedicationRepository>()),
  );
  getIt.registerSingleton<DeleteMedicationUsecase>(
    DeleteMedicationUsecase(getIt<MedicationRepository>()),
  );


  // Cubit
  getIt.registerFactory<DoctorsCubit>(
    () => DoctorsCubit(
      getDoctorUsecase: getIt<GetDoctorUsecase>(),
      createDoctorUsecase: getIt<CreateDoctorUsecase>(),
      editeDoctorUsecase: getIt<EditeDoctorUsecase>(),
      deleteDoctorUsecase: getIt<DeleteDoctorUsecase>(),
    ),
  );



  getIt.registerFactory<MedicationsCubit>(
    () => MedicationsCubit(
      getMedicationUsecase: getIt<GetMedicationUsecase>(),
      createMedicationUsecase: getIt<CreateMedicationUsecase>(),
      editeMedicationUsecase: getIt<EditeMedicationUsecase>(),
      deleteMedicationUsecase: getIt<DeleteMedicationUsecase>(),
    ),
  );
}

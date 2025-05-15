import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/features/date/data/remote/supa_base_services_dates.dart';
import 'package:pharmacy_app/features/date/data/repo_imp/date_repo_imp.dart';
import 'package:pharmacy_app/features/date/domain/repo/date_repo.dart';
import 'package:pharmacy_app/features/date/domain/uses_case/create_date_usecase.dart';
import 'package:pharmacy_app/features/date/domain/uses_case/delete_date_usecase.dart';
import 'package:pharmacy_app/features/date/domain/uses_case/edit_date_usecase.dart';
import 'package:pharmacy_app/features/date/domain/uses_case/get_date_usecase.dart';
import 'package:pharmacy_app/features/date/manger/date_cubit.dart';
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
import 'package:pharmacy_app/features/perscipations/data/remote/supa_base_services_prescription.dart';
import 'package:pharmacy_app/features/perscipations/data/repo_imp/prescription_repo_imp.dart';
import 'package:pharmacy_app/features/perscipations/domain/repo/prescription_repo.dart';
import 'package:pharmacy_app/features/perscipations/domain/uses_case/create_prescription_usecase.dart';
import 'package:pharmacy_app/features/perscipations/domain/uses_case/delete_prescription_usecase.dart';
import 'package:pharmacy_app/features/perscipations/domain/uses_case/edit_prescription_usecase.dart';
import 'package:pharmacy_app/features/perscipations/domain/uses_case/get_prescription_usecase.dart';
import 'package:pharmacy_app/features/perscipations/presentaion/manger/prescription_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Supabase client services
  getIt.registerSingleton<SupabaseServiceDoctor>(
    SupabaseServiceDoctor(supabase: Supabase.instance.client),
  );
  getIt.registerSingleton<SupabaseServiceMedication>(
    SupabaseServiceMedication(supabase: Supabase.instance.client),
  );
  getIt.registerSingleton<SupabaseServiceDate>(
    SupabaseServiceDate(supabase: Supabase.instance.client),
  );
  getIt.registerSingleton<SupabaseServicePrescription>(
    SupabaseServicePrescription(supabase: Supabase.instance.client),
  );

  // Repositories
  getIt.registerSingleton<DoctorRepository>(
    DoctorRepoImpl(supabaseServiceDoctor: getIt<SupabaseServiceDoctor>()),
  );
  getIt.registerSingleton<MedicationRepository>(
    MedicationRepoImpl(supabaseService: getIt<SupabaseServiceMedication>()),
  );
  getIt.registerSingleton<DateRepository>(
    DateRepoImpl(supabaseService: getIt<SupabaseServiceDate>()),
  );
  getIt.registerSingleton<PrescriptionRepository>(
    PrescriptionRepoImpl(supabaseService: getIt<SupabaseServicePrescription>()),
  );

  // Doctor Usecases
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

  // Medication Usecases
  getIt.registerSingleton<GetMedicationUsecase>(
    GetMedicationUsecase(medicationRepository: getIt<MedicationRepository>()),
  );
  getIt.registerSingleton<CreateMedicationUsecase>(
    CreateMedicationUsecase(medicationRepository: getIt<MedicationRepository>()),
  );
  getIt.registerSingleton<EditeMedicationUsecase>(
    EditeMedicationUsecase(getIt<MedicationRepository>()),
  );
  getIt.registerSingleton<DeleteMedicationUsecase>(
    DeleteMedicationUsecase(getIt<MedicationRepository>()),
  );

  // Date Usecases
  getIt.registerSingleton<GetDateUsecase>(
    GetDateUsecase(dateRepository: getIt<DateRepository>()),
  );
  getIt.registerSingleton<CreateDateUsecase>(
    CreateDateUsecase(dateRepository: getIt<DateRepository>()),
  );
  getIt.registerSingleton<EditeDateUsecase>(
    EditeDateUsecase(getIt<DateRepository>()),
  );
  getIt.registerSingleton<DeleteDateUsecase>(
    DeleteDateUsecase(getIt<DateRepository>()),
  );

  // Prescription Usecases
  getIt.registerSingleton<GetPrescriptionUsecase>(
    GetPrescriptionUsecase(prescriptionRepository: getIt<PrescriptionRepository>()),
  );
  getIt.registerSingleton<CreatePrescriptionUsecase>(
    CreatePrescriptionUsecase(prescriptionRepository: getIt<PrescriptionRepository>()),
  );
  getIt.registerSingleton<EditPrescriptionUsecase>(
    EditPrescriptionUsecase(getIt<PrescriptionRepository>()),
  );
  getIt.registerSingleton<DeletePrescriptionUsecase>(
    DeletePrescriptionUsecase(getIt<PrescriptionRepository>()),
  );

  // Cubits
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
  getIt.registerFactory<DatesCubit>(
    () => DatesCubit(
      getDatesUsecase: getIt<GetDateUsecase>(),
      createDateUsecase: getIt<CreateDateUsecase>(),
      editDateUsecase: getIt<EditeDateUsecase>(),
      deleteDateUsecase: getIt<DeleteDateUsecase>(),
    ),
  );
  getIt.registerFactory<PrescriptionsCubit>(
    () => PrescriptionsCubit(
      getPrescriptionsUsecase: getIt<GetPrescriptionUsecase>(),
      createPrescriptionUsecase: getIt<CreatePrescriptionUsecase>(),
      editPrescriptionUsecase: getIt<EditPrescriptionUsecase>(),
      deletePrescriptionUsecase: getIt<DeletePrescriptionUsecase>(),
    ),
  );
}
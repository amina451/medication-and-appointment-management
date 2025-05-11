import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/features/doctors/data/remote/supa_base_services.dart';
import 'package:pharmacy_app/features/doctors/data/repo_imp/doctor_repo_imp.dart';
import 'package:pharmacy_app/features/doctors/domain/repo/docotr_repo.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/create_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/delete_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/edit_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/domain/uses_case/get_doctor_usecase.dart';
import 'package:pharmacy_app/features/doctors/presention/manger/doctor_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // Supabase client service
  getIt.registerSingleton<SupabaseService>(
    SupabaseService(supabase: Supabase.instance.client),
  );



  // Doctor repo
  getIt.registerSingleton<DoctorRepository>(
    DoctorRepoImpl(supabaseService: getIt<SupabaseService>()),
  );

  // Usecases
  getIt.registerSingleton<GetDoctorUsecase>(
    GetDoctorUsecase(doctorRepository: getIt<DoctorRepository>()),
  );

  getIt.registerSingleton<CreateDoctorUsecase>(
    CreateDoctorUsecase(doctorRepository: getIt<DoctorRepository>()),
  );

  getIt.registerSingleton<EditeDoctorUsecase>(
    EditeDoctorUsecase(doctorRepository: getIt<DoctorRepository>()),
  );

  getIt.registerSingleton<DeleteDoctorUsecase>(
    DeleteDoctorUsecase(doctorRepository: getIt<DoctorRepository>()),
  );

  // Cubit
  getIt.registerFactory<DoctorsCubit>(
    () => DoctorsCubit(
      getDoctorUsecase: getIt<GetDoctorUsecase>(),
      createDoctorUsecase: getIt<CreateDoctorUsecase>(),
      editeDoctorUsecase: getIt<EditeDoctorUsecase>(),
      deleteDoctorUsecase: getIt<DeleteDoctorUsecase>(), 
      // ✅ صار شغال
    ),
  );
}

import 'package:get_it/get_it.dart';
import 'package:pharmacy_app/core/services/subabase_auth_services.dart';
import 'package:pharmacy_app/features/auth/data/repos/auth_repo_imp.dart';
import 'package:pharmacy_app/features/auth/domin/repo/auth_repo.dart';

final getIt = GetIt.instance;

void setup() {
  /*getIt.registerSingleton<SupabaseAuthServices>(SupabaseAuthServices());
   getIt.registerSingleton<AuthRepo>(AuthRepoImpl(supabaseAuthService: getIt<SupabaseAuthServices>(),));
*/
  }
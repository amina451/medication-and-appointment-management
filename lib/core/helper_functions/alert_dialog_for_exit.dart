import 'package:flutter/material.dart';
import 'package:pharmacy_app/core/utils/app_text_style.dart';
import 'package:pharmacy_app/features/auth/presnetion/views/screens/login_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void showLogoutAlert(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(
            "Confirmer la déconnexion",
            style: AppTextStyle.semiBold20,
          ),
          content: Text("Voulez-vous vous déconnecter de l'application ?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue
              },
              child: Text("Annuler", style: TextStyle(color: Colors.green)),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue

                // Déconnexion ici
                // Exemple avec Supabase :
                // await Supabase.instance.client.auth.signOut();

                // Aller à la page de connexion
                Supabase.instance.client.auth.signOut();
                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
              child: Text("Déconnexion", style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
  );
}

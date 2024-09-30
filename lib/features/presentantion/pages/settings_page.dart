import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_tawsel/core/theme/app_pallete.dart';
import 'package:student_tawsel/features/auth/persentation/login_page.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/features/presentantion/pages/add_child_page.dart';
import 'package:student_tawsel/features/presentantion/pages/payment_methods_page.dart';
import 'package:student_tawsel/features/presentantion/pages/profile_page.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';

class SettingsPage extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const SettingsPage({super.key, required this.onLocaleChange});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Locale _selectedLocale = const Locale('en');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const AppBarBackGroundWidget(),
        centerTitle: true,
        title: Text(S.of(context).settings,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppPallete.secondaryColor,
                  fontWeight: FontWeight.bold,
                )),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(children: [
            settingsoptionlist(
              icon: "assets/MyProfile.png",
              title: S.of(context).profile,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ProfilePage();
                }));
              },
            ),
            settingsoptionlist(
              icon: "assets/icongroup.png",
              title: S.of(context).addchild,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AddChildPage();
                }));
              },
            ),
            settingsoptionlist(
              icon: "assets/iconcreditcard.png",
              title: S.of(context).paymentMethods,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PaymentMethodsPage();
                }));
              },
            ),
            settingsoptionlist(
              icon: "assets/iconlanguage.png",
              title: S.of(context).language,
              onTap: () {},
            ),
            settingsoptionlist(
              icon: "assets/iconprivacybadge_.png",
              title: S.of(context).privacyPolicy,
              onTap: () {},
            ),
            settingsoptionlist(
              icon: "assets/iconphone.png",
              title: S.of(context).contactUs,
              onTap: () {},
            ),
            settingsoptionlist(
                icon: "assets/logouticon.png",
                title: S.of(context).logOut,
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                })
          ]))
        ],
      ),
    );
  }

  Widget settingsoptionlist({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 18, right: 18, top: 28),
      leading: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff182243),
          ),
          child: Image.asset(icon)),
      title: title == "Language" || title == "اللغة"
          ? expandedtile()
          : Text(title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith()),
      trailing: GestureDetector(
          onTap: () {
            expandedtile(
              onLocaleChange: widget.onLocaleChange,
            );
          },
          child: Icon(Icons.arrow_forward_ios,
              color: Theme.of(context).iconTheme.color)),
      onTap: onTap,
    );
  }

  Widget expandedtile({Function(Locale p1)? onLocaleChange}) {
    return ExpansionTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
        side: BorderSide.none,
      ),
      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
      showTrailingIcon: false,
      title: Text(S.of(context).language,
          style: Theme.of(context).textTheme.titleMedium?.copyWith()),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                minTileHeight: 20,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'العربية',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                trailing: _selectedLocale.languageCode == 'ar'
                    ? const Icon(Icons.check, color: Colors.green, size: 20)
                    : null,
                onTap: () {
                  _selectedLocale = const Locale('ar');
                  widget.onLocaleChange(_selectedLocale);
                },
              ),
              ListTile(
                minVerticalPadding: 2,
                minTileHeight: 20,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'English',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                trailing: _selectedLocale.languageCode == 'en'
                    ? const Icon(Icons.check, color: Colors.green, size: 20)
                    : null,
                onTap: () {
                  _selectedLocale = const Locale('en');
                  widget.onLocaleChange(_selectedLocale);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

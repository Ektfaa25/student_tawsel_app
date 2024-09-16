import 'package:flutter/material.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/pages/add_child_page.dart';
import 'package:student_tawsel/presentantion/pages/payment_methods_page.dart';
import 'package:student_tawsel/presentantion/pages/profile_page.dart';
import 'package:student_tawsel/presentantion/widgets/app_bar_back_ground_widget.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 139,
        flexibleSpace: const AppBarBackGroundWidget(),
        backgroundColor: const Color(0xff182243),
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).settings,
          style: const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
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
              onTap: () {},
            )
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
          : Text(
              title,
              style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff130F44)),
            ),
      trailing: GestureDetector(
          onTap: () {
            expandedtile(
              onLocaleChange: widget.onLocaleChange,
            );
          },
          child: const Icon(Icons.arrow_forward_ios)),
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
      title: Text(
        S.of(context).language,
        style: const TextStyle(
          fontFamily: "Inter",
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xff130F44),
        ),
      ),
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
                title: const Text('العربية',
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff292931))),
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
                title: const Text('English',
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff292931))),
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

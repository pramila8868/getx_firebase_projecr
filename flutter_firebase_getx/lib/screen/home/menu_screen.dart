import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/config/themes/app_colors.dart';
import 'package:flutter_firebase_getx/config/themes/ui_parameter.dart';
import 'package:flutter_firebase_getx/controllers/zoom_drawer_controller.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient(context)),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(primary: onSurfaceTextColor))),
        child: SafeArea(
            child: Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    controller.toogleDrawer();
                    print("You are trapped");
                  },
                )),
            Column(
              children: [
                Obx(() => controller.user.value == null
                    ? SizedBox()
                    : Text(controller.user.value!.displayName ?? "")),
                Spacer(
                  flex: 1,
                ),
                _DrawerButton(
                  icon: Icons.web,
                  label: "website",
                  onPressed: () => controller.website(),
                ),
                _DrawerButton(
                  icon: Icons.facebook,
                  label: "facebook",
                  onPressed: () => controller.facebook(),
                ),
                _DrawerButton(
                  icon: Icons.email,
                  label: "email",
                  onPressed: () => controller.email(),
                ),
                _DrawerButton(
                  icon: Icons.logout,
                  label: "Logout",
                  onPressed: () => controller.signOut(),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  const _DrawerButton(
      {Key? key, required this.icon, required this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.abc_outlined),
      label: Text(label),
    );
  }
}

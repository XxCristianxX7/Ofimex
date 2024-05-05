import 'package:flutter/material.dart';
import 'package:ofimex/theme/theme.dart';
import 'package:ofimex/widgets/profileMenuWidget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage(
                              "assets/profile_image.jpg")), // Reemplazar con la ruta correcta de la imagen de perfil
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppTheme().theme().primaryColor, // Cambiar a tu color preferido
                      ),
                      child: const Icon(
                        Icons
                            .edit, // Usar el icono predeterminado de Flutter para editar
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("Adolfo Ramos Cruz",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge), // Reemplazar con el nombre del usuario
              Text("adolfoxd6@gmail.com",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium), // Reemplazar con el subtítulo del perfil
              const SizedBox(height: 20),

              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/updateProfile");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme().theme().primaryColor,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text("Editar perfil",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              ProfileMenuWidget(
                  title: "Configuración", icon: Icons.settings, onPress: () {
                    Navigator.of(context).pushNamed("/detailProfile");
                  }),
              ProfileMenuWidget(
                  title: "Detalles de facturación",
                  icon: Icons.account_balance_wallet,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Gestión de usuario",
                  icon: Icons.group,
                  onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Información", icon: Icons.info, onPress: () {}),
              ProfileMenuWidget(
                title: "Cerrar sesión",
                icon: Icons.logout,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
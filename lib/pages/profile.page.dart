import 'package:flutter/material.dart';
import 'package:my_doggy/model/UserProfile.model.dart';

class ProfilePage extends StatelessWidget {
  final UserProfile userProfile;
  const ProfilePage({Key? key, required this.userProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(userProfile.firstName),
        ),
        body: _body());
  }

  _body() {
    return Column(
      children: [_buildStack(), _buildCard()],
    );
  }

  Widget _buildCard() {
    return SizedBox(
      height: 410,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                userProfile.location.street,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                  "${userProfile.location.country}, ${userProfile.location.city}, ${userProfile.location.state}"),
              leading: Icon(
                Icons.house_rounded,
                color: Colors.blue[500],
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(
                userProfile.phone,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: const Text("Telefono"),
              leading: Icon(
                Icons.contact_phone_rounded,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text(userProfile.email),
              subtitle: const Text("Email"),
              leading: Icon(
                Icons.contact_mail_rounded,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text(userProfile.dateOfBirth),
              subtitle: const Text("Fecha de nacimiento"),
              leading: Icon(
                Icons.date_range_rounded,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text(userProfile.registerDate),
              subtitle: const Text("Registro"),
              leading: Icon(
                Icons.timer_rounded,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Text(userProfile.registerDate),
              subtitle: const Text("Ultimo acceso"),
              leading: Icon(
                Icons.update_rounded,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStack() {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/mydoggy.png'),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            "${userProfile.firstName} ${userProfile.lastName}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

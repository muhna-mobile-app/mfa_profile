import 'dart:io';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:common_utils/common_utils.dart';

import '../helpers/image_helper.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final imageHelper = GetIt.I.get<ImageHelper>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 64,
                  foregroundImage: _image != null ? FileImage(_image!) : null,
                  child: const Text(
                    'KN',
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                final file = await imageHelper.pickImage();
                if (file != null) {
                  final croppedFile = await imageHelper.cropImage(file: file);
                  setState(() => _image = File(croppedFile!.path));
                }
              },
              child: const Text('Editar Foto'),
            ),
            const CustomListTile(
              title: Text('Nome'),
              subtitle: Text('Kaio Nink'),
            ),
            const CustomListTile(
              title: Text('Email'),
              subtitle: Text('kaio@mail.com'),
            ),
            const CustomListTile(
              title: Text('Senha'),
              subtitle: Text('*******'),
            )
          ],
        ),
      ),
    );
  }
}

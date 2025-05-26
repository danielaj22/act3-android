import 'package:flutter/material.dart';
import 'details.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _ProviderFormState();
}

class _ProviderFormState extends State<MyForm> {
  final _idProveedorController = TextEditingController();
  final _nombreController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _emailController = TextEditingController();
  final _cantidadController = TextEditingController();
  final _direccionController = TextEditingController();
  final _horarioController = TextEditingController();

  @override
  void dispose() {
    _idProveedorController.dispose();
    _nombreController.dispose();
    _telefonoController.dispose();
    _emailController.dispose();
    _cantidadController.dispose();
    _direccionController.dispose();
    _horarioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal.shade300,
          title: const Text("Proveedor"),
          centerTitle: true),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            MyTextField(
              myController: _idProveedorController,
              fieldName: "ID Proveedor",
              myIcon: Icons.vpn_key_outlined,
              prefixIconColor: Colors.teal.shade300,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _nombreController,
              fieldName: "Nombre",
              myIcon: Icons.person_outline,
              prefixIconColor: Colors.teal.shade300,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _telefonoController,
              fieldName: "Teléfono",
              myIcon: Icons.phone_outlined,
              prefixIconColor: Colors.teal.shade300,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _emailController,
              fieldName: "Email",
              myIcon: Icons.email_outlined,
              prefixIconColor: Colors.teal.shade300,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _cantidadController,
              fieldName: "Cantidad",
              myIcon: Icons.format_list_numbered_outlined,
              prefixIconColor: Colors.teal.shade300,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _direccionController,
              fieldName: "Dirección",
              myIcon: Icons.location_on_outlined,
              prefixIconColor: Colors.teal.shade300,
            ),
            const SizedBox(height: 10.0),
            MyTextField(
              myController: _horarioController,
              fieldName: "Horario",
              myIcon: Icons.schedule_outlined,
              prefixIconColor: Colors.teal.shade300,
            ),
            const SizedBox(height: 20.0),
            myBtn(context),
          ],
        ),
      ),
    );
  }

  //Function that returns OutlinedButton Widget also it pass data to Details Screen
  OutlinedButton myBtn(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ProviderDetails(
              idProveedor: _idProveedorController.text,
              nombre: _nombreController.text,
              telefono: _telefonoController.text,
              email: _emailController.text,
              cantidad: _cantidadController.text,
              direccion: _direccionController.text,
              horario: _horarioController.text,
            );
          }),
        );
      },
      child: Text(
        "Submit Form".toUpperCase(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.teal),
      ),
    );
  }
}

//Custom STateless WIdget Class that helps re-usability
// You can learn it in Tutorial (2.13) Custom Widget in Flutter
class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.fieldName,
    required this.myController,
    this.myIcon = Icons.verified_user_outlined,
    this.prefixIconColor = Colors.blueAccent,
    this.keyboardType,
  });

  final TextEditingController myController;
  String fieldName;
  final IconData myIcon;
  Color prefixIconColor;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          labelText: fieldName,
          prefixIcon: Icon(myIcon, color: prefixIconColor),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal.shade300),
          ),
          labelStyle: const TextStyle(color: Colors.teal)),
    );
  }
}
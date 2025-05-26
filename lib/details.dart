import 'package:flutter/material.dart';

class ProviderDetails extends StatelessWidget {
  ProviderDetails({
    Key? key,
    required this.idProveedor,
    required this.nombre,
    required this.telefono,
    required this.email,
    required this.cantidad,
    required this.direccion,
    required this.horario,
  }) : super(key: key);

  final String idProveedor;
  final String nombre;
  final String telefono;
  final String email;
  final String cantidad;
  final String direccion;
  final String horario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Provider Details",
          ),
          //Pop and navigate to previous screen
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildDetailTile(
                  title: "ID Proveedor", value: idProveedor, icon: Icons.vpn_key),
              _buildDetailTile(
                  title: "Nombre", value: nombre, icon: Icons.person),
              _buildDetailTile(
                  title: "Teléfono", value: telefono, icon: Icons.phone),
              _buildDetailTile(title: "Email", value: email, icon: Icons.email),
              _buildDetailTile(
                  title: "Cantidad", value: cantidad, icon: Icons.format_list_numbered),
              _buildDetailTile(
                  title: "Dirección", value: direccion, icon: Icons.location_on),
              _buildDetailTile(
                  title: "Horario", value: horario, icon: Icons.schedule),
            ],
          ),
        ));
  }

  Widget _buildDetailTile({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.teal),
                const SizedBox(width: 8.0),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              value,
              style: const TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
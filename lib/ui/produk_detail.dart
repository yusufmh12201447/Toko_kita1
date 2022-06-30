import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  Produk? produk;

  ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Produk'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Kode: ${widget.produk!.kodeProduk}",
                style: const TextStyle(fontSize: 20.0),
              ),
              Text(
                "Nama: ${widget.produk!.namaProduk}",
                style: const TextStyle(fontSize: 18.0),
              ),
              Text(
                "Harga: ${widget.produk!.kodeProduk.toString()}",
                style: const TextStyle(fontSize: 18.0),
              ),
              _tombolHapusEdit()
            ],
          ),
        ));
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
          child: const Text("EDIT"),
          onPressed: () {
            Navigator.push(
                this.context,
                MaterialPageRoute(
                    builder: (context) => ProdukForm(
                          produk: widget.produk!,
                        )));
          },
        ),
        OutlinedButton(
          child: const Text("DELETE"),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin Ingin menghapus data ini?"),
      actions: [
        // Tombol Hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {},
        ),
        // Tombol Batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(this.context),
        ),
      ],
    );

    showDialog(builder: (context) => alertDialog, context: this.context);
  }
}

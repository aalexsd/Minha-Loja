import 'package:flutter/material.dart';


Future<void> showAlertDialog1ok(BuildContext context, String mensagem,
    {int nPop = 1, int tipo = 0}) async {
  // configura o button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {
      int x;
      for (x = 0; x < nPop; x++) Navigator.of(context).pop();
    },
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    actionsPadding: EdgeInsets.symmetric(horizontal: 50),
    content: Text(mensagem),
    titleTextStyle:
        TextStyle(fontSize: 18, color: tipo == 0 ? Colors.red : Colors.green),
    //contentTextStyle: TextStyle(fontSize: 8),
    title: Text(tipo == 0 ? 'Atenção' : 'Sucesso'),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
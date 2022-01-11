// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null) {
      setState((){
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    }
    else {
      if((precoAlcool / precoGasolina) >= 0.7){
        setState((){
          _textoResultado = "Melhor abastecer com Gasolina.";
        });
      } else{
        setState((){
          _textoResultado = "Melhor abastecer com Álcool.";
        });
      }
      // _limparCampos();
    }
  }

  // void _limparCampos() {
  //   _controllerGasolina.text = "";
  //   _controllerAlcool.text = "";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ácool ou Gasolina") ,
        backgroundColor: Colors.blue ,
      ) ,
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 32) , 
                child: Image.asset("images/logo.png") ,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10) , 
                child: Text(
                  "Saiba qual a melhor opção para o seu carro" ,
                  style: TextStyle(
                    fontSize: 25 ,
                    fontWeight: FontWeight.bold
                  ),
                ) ,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Preço Alcool, ex 1.59"
                ),
                style: const TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Preço Gasolina, ex 3.59"
                ),
                style: const TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 20
                    )
                  ) ,
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  )
                ),
              )
            ]
          )
        ),
      )
    );
  }
}
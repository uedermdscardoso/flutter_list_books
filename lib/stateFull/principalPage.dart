import 'package:flutter/material.dart';

// ** Classe da página principal ** -- Representa o Widget
class PrincipalPage extends StatefulWidget { //Com estado // que reage a alterações
  @override
  State<StatefulWidget> createState() {
    return new _PrincipalPageState(); //Sabe que os estados dessa página serão coordenados/gerenciados por este estado.
  }
}

// ** Estado da página principal ** -- Representa o Estado
class _PrincipalPageState extends State<PrincipalPage> { //Define qual classe será como estado de uma determinada tela //Representa o estado de um Widget. O parâmetro genérico é utilizado para definir qual página de qual estrutura da aplicação que vai corresponder ao estado

  double _numero1 = 0.0;
  double _numero2 = 0.0;
  double _resultadoAdicao = 0.0;

  void _setNumero1(String numero1){
    setState((){//Avisa a alteração de estado / Transição de estado
      try{
        _numero1 = double.parse(numero1);
        _resultadoAdicao = _numero1 + _numero2;
      } catch(ex){
        //TODO: Notificar o usuário
      }
    }); //Depois que executar o que tiver dentro de setState e irá rodar novamente o build

  }

  void _setNumero2(String numero2){
    setState((){ //Avisa a alteração de estado / Transição de estado
      try{
        _numero2 = double.parse(numero2);
        _resultadoAdicao = _numero1 + _numero2;
      } catch(ex){
        //TODO: Notificar o usuário
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('Best Practices - Flutter')
      ),
      body: new Container(
          padding: EdgeInsets.all(16.0), //Espera um double e não inteiro
          child: new Column(
            children: <Widget>[
              new TextField(
                  decoration: new InputDecoration(
                      labelText: 'Primeiro número: '
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _setNumero1(value);
                  }
              ), //TextField 1
              new TextField(
                decoration: new InputDecoration(
                    labelText: 'Segundo número: '
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _setNumero2(value);
                },
              ), //TextField 2
              new Text(
                  '-  Adição: $_resultadoAdicao',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center
              )
            ],
          )
      ),
    );
  }
}
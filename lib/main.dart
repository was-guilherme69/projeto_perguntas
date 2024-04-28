import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _PerguntaSelecionada = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão'],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': ['Maria', 'João', 'Leo', 'Pedro'],
    },
  ];

  void _responder() {
    setState(() {
      _PerguntaSelecionada++;
    });
    debugPrint(_PerguntaSelecionada.toString());
  }

  bool get temPerguntaSelecionada {
    return _PerguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    
  List<String>? respostas = temPerguntaSelecionada
        ? _perguntas[_PerguntaSelecionada]['respostas'] as List<String>?
        : null;

    List<Widget> widgets =
        respostas!.map((t) => Resposta(t, _responder)).toList();

    /* if (respostasList != null) {
      for (String textoResp in respostasList) {
        respostas.add(Resposta(textoResp, _responder));
      }
    }*/

    if (respostas == null) {
      return const Center(
        child: Text('Parabéns!'),
      );
    }


    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Perguntas'),
            centerTitle: true,
            backgroundColor: Colors.blue,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            )

/*
         actions: <Widget>[
           IconButton(
             icon: const Icon(Icons.add),
             onPressed: () => debugPrint('Botao de adicionar'),
           ),
         ],*/
            ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Questao(_perguntas[_PerguntaSelecionada]['texto'].toString()),

              // pegar a lista de respostas e transformar em uma lista de widgets
              ...widgets,
              //...respostas,

              /*const SizedBox(
                height: 100,
              ),
              Flexible(
                child: ElevatedButton(
                  onPressed: () => _responder(),
                  child: const Text('Resposta 1'),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  onPressed: () => _responder(),
                  child: const Text('Resposta 2'),
                ),
              ),
              Flexible(
                child: ElevatedButton(
                  onPressed: () => _responder(),
                  child: const Text('Resposta 3'),
                ),
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}

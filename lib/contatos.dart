// cadastro_contato_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaContato extends StatefulWidget {
  final List<Contato> _contatos = [];
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaContatoState();
  }
}

class ListaContatoState extends State<ListaContato> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: widget._contatos.length,
        itemBuilder: (context, indice) {
          final contato = widget._contatos[indice];
          return itemContato(contato);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () {
          final Future<Contato?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioContato();
              },
            ),
          );

          future.then(
            (contatoRecebido) {
              if (contatoRecebido != null) {
                debugPrint('$contatoRecebido');
                setState(
                  () {
                    widget._contatos.add(contatoRecebido);
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}

class CadastroContatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contato'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Página de Cadastro de Contato'),
      ),
    );
  }
}

class itemContato extends StatelessWidget {
  final Contato _contato;

  itemContato(this._contato);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.contacts_rounded),
        title: Text("Nome: ${_contato.nome}"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Telefone: ${_contato.telefone}"),
            Text("Email: ${_contato.email}"),
            Text("Endereço: ${_contato.endereco}"),
            Text("CPF: ${_contato.cpf}")
          ],
        ),
      ),
    );
  }
}

class Contato {
  final String nome;
  final String email;
  final String cpf;
  final String endereco;
  final String telefone;

  Contato(this.nome, this.email, this.cpf, this.endereco, this.telefone);

  @override
  String toString() {
    return 'Contato(nome: $nome, cpf: $cpf, email: $email, endereco: $endereco, telefone: $telefone)';
  }
}

class FormularioContato extends StatelessWidget {
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoEmail = TextEditingController();
  final TextEditingController _controladorCampoCpf = TextEditingController();
  final TextEditingController _controladorCampoEndereco =
      TextEditingController();
  final TextEditingController _controladorCampoTelefone =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
        backgroundColor: Colors.green,
      ),
      body: ListView(children: [
        Column(
          children: [
            Editor(
              controlador: _controladorCampoNome,
              rotulo: 'Nome',
              dica: 'Guilherme de Almeida',
              icone: Icons.account_box_outlined,
            ),
            Editor(
              controlador: _controladorCampoEmail,
              rotulo: 'Email',
              dica: 'Guilherme@email.com',
              icone: Icons.email_outlined,
            ),
            Editor(
                controlador: _controladorCampoCpf,
                rotulo: 'CPF',
                dica: '123.321.234-23',
                icone: Icons.contact_emergency_outlined),
            Editor(
                controlador: _controladorCampoEndereco,
                rotulo: 'Endereco',
                dica: 'Rua maranhão 2255',
                icone: Icons.location_on),
            Editor(
                controlador: _controladorCampoTelefone,
                rotulo: 'Telefone',
                dica: '(DDD) 99999-9999',
                icone: Icons.phone),
            ElevatedButton(
              child: Text('Confirmar'),
              onPressed: () {
                _criaTransferencia(
                    context,
                    _controladorCampoNome,
                    _controladorCampoEmail,
                    _controladorCampoCpf,
                    _controladorCampoEndereco,
                    _controladorCampoTelefone);
              },
            )
          ],
        ),
      ]),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({
    this.controlador,
    this.rotulo,
    this.dica,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 14.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
      ),
    );
  }
}

void _criaTransferencia(
    context,
    _controladorCampoNome,
    _controladorCampoEmail,
    _controladorCampoCpf,
    _controladorCampoEndereco,
    _controladorCampoTelefone) {
  final String? nome = _controladorCampoNome.text;
  final String? email = _controladorCampoEmail.text;
  final String? cpf = _controladorCampoCpf.text;
  final String? endereco = _controladorCampoEndereco.text;
  final String? telefone = _controladorCampoTelefone.text;

  if (nome != null &&
      email != null &&
      cpf != null &&
      endereco != null &&
      telefone != null) {
    final contatoCriado = Contato(nome, email, cpf, endereco, telefone);
    Navigator.pop(context, contatoCriado);
  }
}

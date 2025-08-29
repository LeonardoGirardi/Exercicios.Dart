class Produto {
  String _nome;
  double _preco;
  String? _descricao;

  Produto({required String nome, required double preco, String? descricao})
      : _nome = nome,
        _preco = preco,
        _descricao = descricao {
    if (_nome.trim().isEmpty) {
      print("Nome inválido!");
      _nome = "Sem nome";
    }
    if (_preco < 0) {
      print("Preço inválido!");
      _preco = 0;
    }
  }

  String get nome => _nome;
  double get preco => _preco;
  String? get descricao => _descricao;

  set nome(String valor) {
    if (valor.trim().isEmpty) {
      print("Nome inválido!");
    } else {
      _nome = valor;
    }
  }

  set preco(double valor) {
    if (valor < 0) {
      print("Preço inválido!");
    } else {
      _preco = valor;
    }
  }

  set descricao(String? valor) => _descricao = valor;

  @override
  String toString() {
    return "Produto: $_nome | Preço: R\$ ${_preco.toStringAsFixed(2)} | Descrição: ${_descricao ?? "Sem descrição"}";
  }
}

class Loja {
  final List<Produto> _produtos = [];

  void adicionarProduto(Produto produto) {
    if (_produtos.any((p) => p.nome == produto.nome)) {
      print("Produto '${produto.nome}' já existe na loja!");
    } else {
      _produtos.add(produto);
    }
  }

  void listarProdutos() {
    if (_produtos.isEmpty) {
      print("Nenhum produto cadastrado.");
    } else {
      _produtos.forEach((p) => print(p));
    }
  }

  void aplicarDesconto(double porcentagem) {
    _produtos.forEach((p) {
      var aplicar = (double preco) => preco - (preco * porcentagem / 100);
      p.preco = aplicar(p.preco);
    });
  }
}

void main() {
  print("=== Sistema de Produtos ===");
  var loja = Loja();

  var p1 = Produto(nome: "Notebook", preco: 3500.0, descricao: "Dell i7");
  var p2 = Produto(nome: "Mouse", preco: 120.0);
  var p3 = Produto(nome: "Teclado", preco: 200.0, descricao: "Mecânico");

  loja.adicionarProduto(p1);
  loja.adicionarProduto(p2);
  loja.adicionarProduto(p3);
  loja.adicionarProduto(Produto(nome: "Mouse", preco: 100)); 

  print("\nProdutos cadastrados:");
  loja.listarProdutos();

  print("\nAplicando 10% de desconto...");
  loja.aplicarDesconto(10);

  print("\nProdutos com desconto:");
  loja.listarProdutos();
}

abstract class Animal {
  final String _nome;

  Animal(this._nome);

  String get nome => _nome;

  void apresentar() {
    print("Olá, meu nome é $_nome!");
  }

  void fazerSom(); // método abstrato
}

class Cachorro extends Animal {
  Cachorro(String nome) : super(nome);

  @override
  void fazerSom() {
    print("Au Au!");
  }
}

class Gato extends Animal {
  Gato(String nome) : super(nome);

  @override
  void fazerSom() {
    print("Miau!");
  }
}

void main() {
  print("\n=== Sistema de Animais ===");
  var cachorro = Cachorro("Rex");
  var gato = Gato("Mimi");

  cachorro.apresentar();
  cachorro.fazerSom();

  gato.apresentar();
  gato.fazerSom();
}

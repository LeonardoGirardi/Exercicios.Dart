import 'dart:io';
import 'dart:math';

double calcularDelta(double a, double b, double c) {
  return pow(b, 2) - 4 * a * c;
}

void calcularRaizes(double a, double b, double c) {
  double delta = calcularDelta(a, b, c);
  print("Delta: ${delta.toStringAsFixed(2)}");

  if (delta < 0) {
    print("A equação não possui raízes reais.");
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print("A equação possui uma raiz real: x = ${x.toStringAsFixed(2)}");
  } else {
    double raizDelta = sqrt(delta);
    double x1 = (-b + raizDelta) / (2 * a);
    double x2 = (-b - raizDelta) / (2 * a);
    print("A equação possui duas raízes reais:");
    print("x1 = ${x1.toStringAsFixed(2)}");
    print("x2 = ${x2.toStringAsFixed(2)}");
  }
}

void main() {
  print("\n=== Equação do 2º Grau ===");

  try {
    stdout.write("Digite o valor de a: ");
    double a = double.parse(stdin.readLineSync()!);

    if (a == 0) {
      print("Não é uma equação do 2º grau!");
      return;
    }

    stdout.write("Digite o valor de b: ");
    double b = double.parse(stdin.readLineSync()!);

    stdout.write("Digite o valor de c: ");
    double c = double.parse(stdin.readLineSync()!);

    calcularRaizes(a, b, c);
  } catch (e) {
    print("Entrada inválida! Digite apenas números.");
  }
}

// ISP - Muitas interfaces específicas são melhores que uma geral.

abstract class Conta {
  void depositar(int val);
  void transferir(int val);
  void realizarEmprestimo();
}

class ContaCorrente implements Conta {
  @override
  void depositar(int val) => print('realizando...');

  @override
  void realizarEmprestimo() => print('realizando...');

  @override
  void transferir(int val) => print('realizando...');
}

class ContaPoupanca implements Conta {
  @override
  void depositar(int val) => print('realizando...');

  @override
  void realizarEmprestimo() => throw Exception('Conta poupança não realiza emprestimo');

  @override
  void transferir(int val) => throw Exception('Conta poupança não realiza transferência');
}

/*
  * O problema aqui é estamos dependendo da classe Conta
  * e conta nos oferece mais coisas do que realmente precisamos.
  * Solução:
*/

abstract class Conta2 {
  void depositar(int val);
}

abstract class CestaDeServicos {
  void transferir(int val);
  void realizarEmprestimo();
}

class ContaCorrente2 extends Conta2 implements CestaDeServicos {
  @override
  void depositar(int val) => print('realizando...');

  @override
  void realizarEmprestimo() => print('realizando...');

  @override
  void transferir(int val) => print('realizando...');
}

class ContaPoupanca2 extends Conta2 {
  @override
  void depositar(int val) => print('realizando...');
}
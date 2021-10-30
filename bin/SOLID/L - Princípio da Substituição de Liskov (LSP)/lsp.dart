// LSP - Os subtipos devem ser substituíveis pelos seus tipos base.

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

main(List<String> args) {
  Conta c = ContaCorrente();

  c.realizarEmprestimo();

  Conta c2 = ContaPoupanca();

  c2.realizarEmprestimo();
}
// DIP - Depender de abstrações e não de classes concretas. 

class PagamentoRepository {
  void save() => print('salvando pagamento.');
}

class ContaCorrente {
  PagamentoRepository _repository;

  ContaCorrente() {
    _repository = PagamentoRepository();
  }  

  void executarAlgumaLogica() {
    _repository.save();
  }
}

/*  
  A violação acontece na linha 11, estamos dependendo de uma classe concreta.
  Se quisermos fazer o mock por exemplo do repository não será possível.

  Solução: Devemos inverter a responsabilidade de instanciar a classe Repository.
*/

abstract class IPagamentoRepository {
  void save();
}

class PagamentoRepositoryImpl implements IPagamentoRepository {
  @override
  void save() => print('Implementação');
}

class PagamentoRepositoryMock implements IPagamentoRepository {
  @override
  void save() => print('Mock');
}

class ContaCorrente2 {
  IPagamentoRepository _repository;

  ContaCorrente2(IPagamentoRepository repository) {
    _repository = repository;
  }

  void executaAlgumaLogica() {
    _repository.save();
  }
}

void main(List<String> args) {
  var c = ContaCorrente2(PagamentoRepositoryImpl());
  c.executaAlgumaLogica();
  c = ContaCorrente2(PagamentoRepositoryMock());
  c.executaAlgumaLogica();
}
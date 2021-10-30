/*
  Cada classe deve ter sua responsabilidade bem definida.

  Não pode haver mistura de responsabilidades em uma classe.
*/

// -- Forma Errada

class ContaCorrente {
  validarContaExiste() {
    // Regra necessária para o Negócio.
  }

  salvarModificacoes() {
    print('Salvando no DB...');
  }
}

// -- Forma Correta

class ContaCorrenteRepository {
  void save() => print('salvando informações');
}

class ContaCorrente2 {
  ContaCorrenteRepository _repository = ContaCorrenteRepository();

  validarContaExiste() {
    // Regra necessária para o Negócio.
  }

  salvarModificacoes() {
    _repository.save();
  }
}
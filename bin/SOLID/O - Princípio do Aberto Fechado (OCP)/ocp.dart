
// Objetos ou entidades devem estar abertos para extensão, mas fechados para modificação.
 
// -- Forma Errada

class Pagamento {
  void realizarPagamento(String pagamento) {

    var valor = 20;

    switch(pagamento) {
      case 'pagamento': {
        print('Pagando boleto $valor');
        break;
      }
      case 'imposto': {
        valor = 10;
        print('Pagando imposto $valor');
        break;
      }
      case 'cartao': {
        valor = 5;
        print('Pagando cartão $valor');
        break;
      }
    }
  }
}

/*
  E se precisarmos adicionar um novo tipo de pagamento? desta forma estamos sujeitos a modificar
  nosso código já em produção.

  Solução: Como solução devemos ser capaz de extender o funcionamento da nossa classe de pagamento
  ou seja "pagar", porém sem modificar a classe existente.
*/

abstract class Pagamento2 {
  int valor = 20;
  void pagar();
}

class PagamentoBoleto extends Pagamento2 {
  @override
  void pagar() => print('Pagando boleto $valor');
}

class PagamentoImposto extends Pagamento2 {
  @override 
  int valor = 10;

  @override
  void pagar() => print('Pagando imposto $valor');
}

class PagamentoCartao extends Pagamento2 {
  @override 
  int valor = 5;

  @override
  void pagar() => print('Pagando cartão');
}

// -- Forma Correta

class Pagamento3 {
  void realizarPagamento(Pagamento2 pagamento) => pagamento.pagar();
}


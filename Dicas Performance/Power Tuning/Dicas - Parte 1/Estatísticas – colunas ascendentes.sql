/*
Para entendermos o comportamento deste tipo de estatística, temos os seguintes cenários:

-> Pré-SQL2014

  - Nos SQLs anteriores à versão 2014 não havia o auto update statistics.
  - Como exemplo para entender o comportamento, nós temos as tabelas de valores ascendentes (ex.: coluna de data), neste caso há uma data do dia 2026-03-12 e se adicionarmos mais valores com a data 2026-03-13 o SQL não irá atualizar suas estatísticas, fazendo com que o plano estimado para uma consulta que retorna o valor do dia 13 ser de apenas 1 linha e não a quantidade (aproximada) inserida.
  - OBS.: este comportamente também ocorreria caso a data não existisse e mesmo assim fosse solicitado o retorno de uma consulta nela.
*/

  -- SCRIPT PARA VER O HISTOGRAMA
  DBCC SHOW_STATISTICS (collumn_name, [index_name]) WITH HISTOGRAM
  GO

/*
-> Pós-SQL2014

  - Nos SQLs posteriores à versão 2014 há já o auto update statistics.
  - Desta forma, o próprio SQL faz uma estimativa do valor caso haja a insersão de valores com datas posteriores à existente.
  - OBS.: este comportamente também ocorreria caso a data não existisse e mesmo assim fosse solicitado o retorno de uma consulta nela.
  - Para ocorrer esta estimativa, o SQL faz uma média com a 'densidade das estatísticas' x 'quantidade de linhas' da tabela, essa 'densidade' e 'quantidade' podemos ver com o script do histograma.
*/

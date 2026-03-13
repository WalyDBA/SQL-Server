/*
Para entendermos o comportamento deste tipo de estatística, temos os seguintes cenários:

-> Pré-SQL2014

  - Nos SQLs anteriores à versão 2014 não havia o auto update statistics.
  - Como exemplo para entender o comportamento, nós temos as tabelas de valores ascendentes (ex.: coluna de data), neste caso há uma data do dia 2026-03-12 e se adicionarmos mais valores com a data 2026-03-13 o SQL não irá atualizar suas estatísticas, fazendo com que o plano estimado para uma consulta que retorna o valor do dia 13 ser de apenas 1 linha e não a quantidade inserida. 
*/
  -- SCRIPT PARA VER O HISTOGRAMA
  DBCC SHOW_STATISTICS (collumn_name, [index_name]) WITH HISTOGRAM
  GO

/*
-> Pós-SQL2014

  - Nos SQLs posteriores à versão 2014 há já o auto update statistics.

*/

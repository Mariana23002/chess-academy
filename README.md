# ♞chess-academy

O Chess Academy é uma plataforma web voltada para estudantes de xadrez, que recomenda conteúdos de estudo personalizados com base no nível (rating) do jogador.

# ♟️Estrutura do Banco de Dados

O banco relacional é composto pelas seguintes tabelas:

faixas_rating — 3 faixas de rating (Iniciante, Intermediário e Avançado).

aberturas — 19 aberturas, defesas e gambitos.

temas — 13 temas táticos e estratégicos.

exercicios — 45 exercícios com enunciado e solução.

faixas_aberturas, faixas_exercicios e exercicios_temas — tabelas associativas que conectam exercícios, aberturas, temas e faixas de rating.


# ♜Funcionalidades

Visão Geral (index.html):

Classificação automática do nível do aluno (Iniciante, Intermediário ou Avançado) com base no rating informado.

Exibição dinâmica de aberturas e exercícios recomendados para a faixa de rating correspondente.

O rating informado é mantido apenas durante a navegação atual e é redefinido ao atualizar a página.

Biblioteca de Exercícios (html/exercicios.html):

45 exercícios de tática e finais cadastrados no banco de dados.

Filtros combináveis por Tema e Faixa de Rating.

Botão Visualizar que abre um modal com o diagrama da posição inicial do enunciado.

Botão Solução que revela a resposta correta em modal próprio, mantendo o enunciado sem spoilers.

Biblioteca de Aberturas (html/aberturas.html):

19 aberturas, defesas e gambitos com notação dos lances iniciais.

Filtros por Categoria, Cor (brancas ou pretas) e Faixa de Rating.

Visualização da posição inicial de cada abertura em modal.

Biblioteca de Temas (html/temas.html):

13 temas táticos com definições claras dos principais padrões e conceitos do jogo.



insert into alunos (nome, rating_atual)
values
('Krikor Mekhitarian', 2589),
('Luis Paulo Supi', 2583),
('Henrique Mecking', 2573),
('Magnus Carlsen', 2823),
('Hikaru Nakamura', 2792),
('Bobby Fischer', 2785),
('Judit Polgar', 2735),
('Mikhail Tal', 2705),
('Elizabeth Harmon', 2700),
('Evandro Barbosa', 2483),
('Gukesh Dommaraju', 2686),
('Javokhir Sindarov', 2782),
('Jose Raul Capablanca', 2877);

insert into faixas_rating(nome, rating_minimo, rating_maximo)
values
('iniciante', 100, 1199),
('intermediario', 1200, 1899),
('avançado', 1900, 3600);

insert into aberturas(categoria, nome, cor, movimentos_iniciais)
values
('abertura', 'Ruy Lopez', 'brancas', '1.e4 e5 2.Cf3 Cc6 3.Bb5'),
('defesa', 'Francesa', 'pretas', '1.e4 e6'),
('abertura', 'Italiana', 'brancas', '1.e4 e5 2.Cf3 Cc6 3.Bc4'),
('gambito', 'Gambito Halloween', 'brancas', '1.e4 e5 2.Cf3 Cc6 3.Cc3 Cf6 4.Cxe5'),
('gambito', 'Gambito Budapeste', 'pretas', '1.d4 Cf6 2.c4 e5'),
('defesa', 'Caro-Kann', 'pretas', '1.e4 c6'),
('abertura', 'Sistema London', 'brancas', '1.d4 d5 2.Cf3 Cf6 3.Bf4'),
('gambito', 'Gambito Dinamarques', 'brancas', '1.e4 e5 2.d4 exd4 3.c3'),
('defesa', 'Siciliana', 'pretas', '1.e4 c5'),
('gambito', 'Gambito da Dama', 'brancas', '1.d4 d5 2.c4'),
('defesa', 'Escandinava', 'pretas', '1.e4 d5'),
('abertura', 'Inglesa', 'brancas', '1.c4'),
('defesa', 'Holandesa', 'pretas', '1.d4 f5');
('gambito', 'Gambito Benko', 'pretas', '1.d4 Cf6 2.c4 c5 3.d5 b5'),
('abertura', 'Gambito do Rei', 'brancas', '1.e4 e5 2.f4'),
('defesa', 'Grunfeld', 'pretas', '1d4 Cf6 2. c4 g6 3. Cc3 d5.')
('abertura', 'Escocesa', 'brancas', '1.e4 e5 2.Cf3 Cc6 3.d4'),
('gambito', 'Gambito Smith-Morra', 'brancas', '1.e4 c5 2.d4 cxd4 3.c3'),
('defesa', 'Alekhine', 'pretas', '1.e4 Cf6');

insert into temas(nome, descricao)
values
('garfo', 'ataque a duas ou mais peças adversárias ao mesmo tempo com uma única peça.'),
('cravada', 'meio-jogo', 'tática que impede uma peça adversária de se movimentar sem expor uma peça que possui mais valor.'),
('ataque descoberto', 'tática onde o jogador move uma peça para revelar um ataque de outra peça que estava bloqueada atras dela.'),
('xeque descoberto', 'ataque descoberto que coloca o rei adversário em xeque.'),
('ataque duplo', 'jogada que cria duas ameaças contra o adversário.'),
('desvio', 'manobra que força uma peça adversária a abandonar uma função defensiva importante.'),
('sacrificio', 'entrega voluntária de material para obter vantagem posicional, tática ou ataque.'),
('Mate na última fileira', 'padrão de xeque-mate em que o rei fica preso na última fileira por suas próprias peças.'),
('oposição', 'técnica de posicionamento dos reis para conquistar ou impedir a passagem do rei adversário.'),
('peão passado', 'peão que não possui peões adversários capazes de impedir seu avanço até a promoção.'),
('promoção de peão', 'técnica de conduzir um peão até a última fileira para transformá-lo em outra peça.'),
('final de peões', 'finalização em que os principais elementos são os reis e os peões.'),
('mate de escada', 'Consiste em usar duas peças principais (duas torres, duas damas ou uma torre e uma dama) para empurrar o rei adversário até a borda do tabuleiro.')
('mate com dama', 'técnica de aplicar xeque-mate utilizando o rei e uma dama contra o rei adversário.');
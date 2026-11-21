insert into faixas_rating(nome, rating_minimo, rating_maximo)
values
('iniciante', 100, 1200),
('intermediario', 1201, 1900),
('avançado', 1901, 3600);

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
('Jose Raul Capablanca', 2877),
('Anish Giri', 2656);

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
('defesa', 'Holandesa', 'pretas', '1.d4 f5'),
('gambito', 'Gambito Benko', 'pretas', '1.d4 Cf6 2.c4 c5 3.d5 b5'),
('abertura', 'Gambito do Rei', 'brancas', '1.e4 e5 2.f4'),
('defesa', 'Grunfeld', 'pretas', '1d4 Cf6 2. c4 g6 3. Cc3 d5.'),
('abertura', 'Escocesa', 'brancas', '1.e4 e5 2.Cf3 Cc6 3.d4'),
('gambito', 'Gambito Smith-Morra', 'brancas', '1.e4 c5 2.d4 cxd4 3.c3'),
('defesa', 'Alekhine', 'pretas', '1.e4 Cf6');

insert into temas(nome, descricao)
values
('garfo', 'ataque a duas ou mais peças adversárias ao mesmo tempo com uma única peça.'),
('cravada', 'tática que impede uma peça adversária de se movimentar sem expor uma peça que possui mais valor.'),
('ataque descoberto', 'tática onde o jogador move uma peça para revelar um ataque de outra peça que estava bloqueada atras dela.'),
('xeque descoberto', 'ataque descoberto que coloca o rei adversário em xeque.'),
('ataque duplo', 'jogada que cria duas ameaças contra o adversário.'),
('desvio', 'manobra que força uma peça adversária a abandonar uma função defensiva importante.'),
('sacrificio', 'entrega voluntária de material para obter vantagem posicional, tática ou ataque.'),
('mate na última fileira', 'padrão de xeque-mate em que o rei fica preso na última fileira por suas próprias peças.'),
('peão passado', 'peão que não possui peões adversários capazes de impedir seu avanço até a promoção.'),
('promoção de peão', 'técnica de conduzir um peão até a última fileira para transformá-lo em outra peça.'),
('final de peões', 'finalização em que os principais elementos são os reis e os peões.'),
('mate de escada', 'Consiste em usar duas peças principais (duas torres, duas damas ou uma torre e uma dama) para empurrar o rei adversário até a borda do tabuleiro.'),
('mate com dama', 'técnica de aplicar xeque-mate utilizando o rei e uma dama contra o rei adversário.');

insert into exercicios(enunciado, solucao)
values
('As brancas têm um Cavalo em c7. Como você pode atacar o Rei preto em e8 e a Torre em a8 simultaneamente?', 'Nc7xa8 (ou Cc7+, aplicando o garfo real entre o Rei e a Torre)'),
('O Rei preto está preso em h8 e você possui uma Dama em f6 e um Rei em g6. Qual é o lance de xeque-mate imediato?', 'Qg7#'),
('Você possui duas Torres em a6 e b5, enquanto o Rei preto está isolado em d8. Qual lance força o xeque-mate na borda do tabuleiro?', 'Ra8#'),
('O Rei preto está em g8, bloqueado pelos seus próprios peões em f7, g7 e h7. Como a Torre branca em e1 aplica o xeque-mate?', 'Re8#'),
('Seu peão branco está em e7 e o caminho até e8 está livre, mas a casa de promoção é vigiada por um Bispo preto em c6. Qual peça você deve escolher ao promover para evitar empate ou perda de tempo?', 'e8=Q+ (Promover para Dama com xeque)'),

('O Cavalo preto em f6 protege a Dama preta em d8 contra um Bispo branco em g5. Como você aumenta a pressão sobre a peça cravada para ganhá-la?', 'Nd5 (Atacando o Cavalo cravado novamente com o Cavalo branco)'),
('A Dama branca está em d4, o Rei preto está em g8 e há um Bispo preto indefeso em a7. Qual lance de Dama cria duas ameaças simultâneas?', 'Qe5 (Ameaça xeque-mate em g7 e ataca o Bispo em a7)'),
('Seu Bispo branco está em c4 mirando o ponto f7, mas é bloqueado pelo seu próprio Cavalo em e5. Onde o Cavalo deve saltar para criar um ataque duplo?', 'Nxf7 (O Cavalo ataca a Dama em d8 e a Torre em h8 enquanto o Bispo abre a diagonal)'),
('Sua Torre branca está em e1 alinhada ao Rei preto em e8, com um Bispo branco em e4 no caminho. Como ganhar a Dama preta situada em a8?', 'Bxa8+ (O Bispo captura a Dama e revela o xeque da Torre em e1)'),
('Você tem um peão passado em d5 apoiado por um Rei em e4, enquanto o Rei preto está em d7 tentando bloquear o avanço. Qual lance garante a passagem do peão?', 'Ke5 (Ganha a oposição e controla as casas de avanço d6 e d7)'),

('A Dama preta em e7 é a única defensora da Torre preta em e8 contra a sua Torre em e1. Como você desvia a Dama preta dessa função defensiva?', 'Bg5 (Ataca a Dama preta; se ela capturar o Bispo, segue Rxe8#)'),
('O roque preto em g8 está protegido apenas pelo Cavalo em f6, e você tem um Bispo em d3 e uma Dama em h5. Qual sacrifício clássico destrói a cobertura do Rei?', 'Bxh7+ (Sacrifício grego; após Kxh7, segue Ng5+ e Qh5 com ataque decisivo)'),
('Finais de Reis e Peões: Rei branco em c4, peão branco em b4; Rei preto em c6. Qual lance preciso garante a vitória sem permitir que o Rei preto bloqueie a promoção?', 'b5+ (Força o Rei preto a recuar e permite que o Rei branco invada por d5 ou b5)'),
('Em uma posição complexa de meio-jogo, o Rei preto está em g8 e a Dama preta em c8. Seu Cavalo em d5 precisa encontrar uma casa intermediária com xeque para aplicar um garfo. Qual é a sequência?', 'Ne7+ (Aplica o garfo imediato entre o Rei em g8 e a Dama em c8)'),
('O Rei preto em h8 é defendido contra mate em g7 apenas pela Torre preta em f7. Como você força essa Torre a abandonar a sétima fileira?', 'Qe8+ (Força Rf8, permitindo Qxf8# ou desviando a defesa do ponto crítico)');

insert into faixas_aberturas(id_abertura, id_faixa)
values
(1, 1),
(1, 2),
(2,1),
(2,2),
(3,1),
(3,2),
(3,3),
(4,2),
(5,1),
(6,1),
(6,2),
(7,3),
(8,1),
(9,2),
(9,3),
(10,1),
(10,2),
(10,3),
(11,1),
(12, 3),
(13, 3),
(14, 2),
(14, 3),
(15, 2),
(16, 2),
(16, 3),
(17, 1),
(18, 1),
(19, 3);

insert into faixas_exercicios(id_exercicio, id_faixa)
values 
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 3),
(12, 3),
(13, 2),
(13, 3),
(14, 2),
(14, 3),
(15, 3);

insert into exercicios_temas(id_exercicio, id_tema)
values
(1, 1),
(2, 13),
(3, 12),
(4, 8),
(5, 11),
(6, 2),
(7, 5),
(8, 3),
(9, 4),
(10, 9),
(11, 6),
(12, 7),
(13, 11),
(14, 1),
(15, 6);

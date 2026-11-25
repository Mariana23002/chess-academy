const { createClient } = supabase;

const config = {
    url: "https://umjywzbymyvfrwkhjgsy.supabase.co",
    publishableKey: "sb_publishable_c7-L6igvzggIO_lGp1ezqA_Eafg940o"
};

const banco = createClient(
    config.url,
    config.publishableKey
);

async function buscarFaixas() {
    const { data, error } = await banco
        .from('faixas_rating')
        .select('*')
        .order('rating_minimo', { ascending: true });

    if (error) console.error("Erro ao buscar faixas:", error.message);
    return data || [];
}

async function buscarTemas() {
    const { data, error } = await banco
        .from('temas')
        .select('*')
        .order('nome', { ascending: true });

    if (error) console.error("Erro ao buscar temas:", error.message);
    return data || [];
}

async function buscarExercicios() {
    const { data, error } = await banco
        .from('exercicios')
        .select(`
            id_exercicio, enunciado, solucao,
            faixas_exercicios ( id_faixa ),
            exercicios_temas ( id_tema, temas ( nome ) )
        `)
        .order('id_exercicio', { ascending: true });

    if (error) console.error("Erro ao buscar exercícios:", error.message);
    return data || [];
}

async function buscarAberturas() {
    const { data, error } = await banco
        .from('aberturas')
        .select(`
            id_abertura, categoria, nome, cor, movimentos_iniciais,
            faixas_aberturas ( id_faixa )
        `)
        .order('nome', { ascending: true });

    if (error) console.error("Erro ao buscar aberturas:", error.message);
    return data || [];
}

async function buscarAberturasPorFaixa(idFaixa) {
    const { data, error } = await banco
        .from('faixas_aberturas')
        .select('aberturas ( id_abertura, categoria, nome, cor, movimentos_iniciais )')
        .eq('id_faixa', idFaixa);

    if (error) console.error("Erro ao buscar aberturas:", error.message);
    return (data || []).map((item) => item.aberturas).filter(Boolean);
}

async function buscarExerciciosPorFaixa(idFaixa) {
    const { data, error } = await banco
        .from('faixas_exercicios')
        .select('exercicios ( id_exercicio, enunciado, solucao, exercicios_temas ( temas ( nome ) ) )')
        .eq('id_faixa', idFaixa);

    if (error) console.error("Erro ao buscar exercícios:", error.message);
    return (data || []).map((item) => item.exercicios).filter(Boolean);
}



function capitalizar(texto) {
    if (!texto) return "";
    return texto.charAt(0).toUpperCase() + texto.slice(1);
}

function formatarNivel(nome) {
    if (!nome) return "Não definido";
    const nomes = {
        iniciante: "Iniciante",
        intermediario: "Intermediário",
        avancado: "Avançado"
    };
    return nomes[nome.trim().toLowerCase()] || capitalizar(nome);
}

function slug(nome) {
    return nome
        .normalize('NFD')
        .replace(/[\u0300-\u036f]/g, '')
        .toLowerCase()
        .replace(/[^a-z0-9]+/g, '-')
        .replace(/^-|-$/g, '');
}

function descobrirFaixa(rating, faixas) {
    if (!faixas.length) return null;
    const encontrada = faixas.find((f) => rating >= f.rating_minimo && rating <= f.rating_maximo);
    if (encontrada) return encontrada;
    return rating < faixas[0].rating_minimo ? faixas[0] : faixas[faixas.length - 1];
}

function temasDoExercicio(ex) {
    const lista = (ex.exercicios_temas || []).map((t) => t.temas?.nome).filter(Boolean);
    return lista.length ? lista.join(' · ').toUpperCase() : 'TÁTICA';
}

function adicionarOpcao(select, valor, texto) {
    const option = document.createElement('option');
    option.value = valor;
    option.textContent = texto;
    select.appendChild(option);
}


function configurarModal() {
    const modal = document.getElementById('openingModal');
    if (!modal) return;

    modal.querySelector('[data-modal-fechar]')?.addEventListener('click', () => modal.close());
    modal.addEventListener('click', (e) => {
        if (e.target === modal) modal.close();
    });
}

function abrirModal(categoria, titulo, texto, imagem = "") {
    const modal = document.getElementById('openingModal');
    if (!modal) return;

    modal.querySelector('[data-modal-categoria]').textContent = categoria;
    modal.querySelector('[data-modal-nome]').textContent = titulo;
    modal.querySelector('[data-modal-movimentos]').textContent = texto;

    const img = modal.querySelector('[data-modal-img]');
    img.hidden = !imagem;
    img.src = imagem;
    img.alt = imagem ? titulo : "";

    modal.showModal();
}

function criarCardAbertura(template, ab, pastaImg) {
    const card = template.content.cloneNode(true);
    card.querySelector('[data-categoria]').textContent = ab.categoria.toUpperCase();
    card.querySelector('[data-nome]').textContent = ab.nome;
    card.querySelector('[data-movimentos]').textContent = ab.movimentos_iniciais;

    card.querySelector('[data-visualizar]').addEventListener('click', () => {
        const img = `${pastaImg}/${slug(ab.nome)}.png`;
        abrirModal(ab.categoria.toUpperCase(), ab.nome, ab.movimentos_iniciais, img);
    });

    return card;
}

function criarCardExercicio(template, ex, pastaImg) {
    const card = template.content.cloneNode(true);
    const tema = temasDoExercicio(ex);

    card.querySelector('[data-tema]').textContent = tema;
    card.querySelector('[data-enunciado]').textContent = ex.enunciado;

    card.querySelector('[data-visualizar]').addEventListener('click', () => {
        const img = `${pastaImg}/exercicio-${ex.id_exercicio}.png`;
        abrirModal(tema, `Exercício #${ex.id_exercicio}`, ex.enunciado, img);
    });

    card.querySelector('[data-visualizar-solucao]').addEventListener('click', () => {
        abrirModal(`SOLUÇÃO · ${tema}`, `Exercício #${ex.id_exercicio}`, ex.solucao);
    });

    return card;
}


async function paginaIndex() {
    const form = document.getElementById('userForm');
    if (!form) return;

    const inputRating = document.getElementById('userRating');
    const resumo = document.getElementById('studentSummary');
    const btnAlterar = document.getElementById('btnAlterarRating');
    const painelForm = form.closest('section.panel');
    const tituloForm = painelForm.previousElementSibling;

    const secAberturas = document.getElementById('secRecomendacoesAberturas');
    const listaAberturas = document.getElementById('recommendedOpenings');
    const tplAbertura = document.getElementById('templateAbertura');

    const secExercicios = document.getElementById('secRecomendacoesExercicios');
    const listaExercicios = document.getElementById('recommendedExercises');
    const tplExercicio = document.getElementById('templateExercicio');

    const faixas = await buscarFaixas();

    function mostrarFormulario(mostrar) {
        painelForm.hidden = !mostrar;
        tituloForm.hidden = !mostrar;
    }

    btnAlterar.addEventListener('click', () => {
        mostrarFormulario(true);
        inputRating.focus();
    });

    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        const rating = parseInt(inputRating.value, 10);
        if (isNaN(rating)) return alert("Por favor, informe um rating válido.");

        const faixa = descobrirFaixa(rating, faixas);
        mostrarFormulario(false);

        resumo.querySelector('.avatar').textContent = "♞";
        resumo.querySelector('h3').textContent = `Nível: ${formatarNivel(faixa?.nome)}`;
        resumo.querySelector('p').textContent = faixa
            ? `Rating informado: ${rating} · Faixa de ${faixa.rating_minimo} a ${faixa.rating_maximo} pontos`
            : `Rating informado: ${rating}`;
        btnAlterar.hidden = false;

        if (!faixa) return;

        const aberturas = await buscarAberturasPorFaixa(faixa.id_faixa);
        const exercicios = await buscarExerciciosPorFaixa(faixa.id_faixa);

        secAberturas.hidden = false;
        listaAberturas.replaceChildren();
        aberturas.forEach((ab) => {
            listaAberturas.appendChild(criarCardAbertura(tplAbertura, ab, listaAberturas.dataset.imgDir));
        });

        secExercicios.hidden = false;
        listaExercicios.replaceChildren();
        exercicios.forEach((ex) => {
            listaExercicios.appendChild(criarCardExercicio(tplExercicio, ex, listaExercicios.dataset.imgDir));
        });
    });
}

async function paginaExercicios() {
    const lista = document.getElementById('exerciseList');
    if (!lista) return;

    const selectFaixa = document.getElementById('exerciseRange');
    const selectTema = document.getElementById('exerciseTheme');
    const btnLimpar = document.getElementById('clearExercise');
    const contador = document.getElementById('exerciseCount');
    const tplCard = document.getElementById('templateExercicio');
    const tplVazio = document.getElementById('templateVazioExercicio');

    const faixas = await buscarFaixas();
    const temas = await buscarTemas();
    const exercicios = await buscarExercicios();

    faixas.forEach((f) => adicionarOpcao(selectFaixa, f.id_faixa, `${formatarNivel(f.nome)} (${f.rating_minimo}–${f.rating_maximo})`));
    temas.forEach((t) => adicionarOpcao(selectTema, t.id_tema, capitalizar(t.nome)));

    function renderizar() {
        const filtrados = exercicios.filter((ex) => {
            const bateFaixa = !selectFaixa.value || ex.faixas_exercicios.some((f) => String(f.id_faixa) === selectFaixa.value);
            const bateTema = !selectTema.value || ex.exercicios_temas.some((t) => String(t.id_tema) === selectTema.value);
            return bateFaixa && bateTema;
        });

        contador.textContent = `${filtrados.length} exercício(s)`;
        lista.replaceChildren();

        if (!filtrados.length) return lista.appendChild(tplVazio.content.cloneNode(true));
        filtrados.forEach((ex) => lista.appendChild(criarCardExercicio(tplCard, ex, lista.dataset.imgDir)));
    }

    selectFaixa.addEventListener('change', renderizar);
    selectTema.addEventListener('change', renderizar);
    btnLimpar.addEventListener('click', () => {
        selectFaixa.value = "";
        selectTema.value = "";
        renderizar();
    });

    renderizar();
}

async function paginaAberturas() {
    const lista = document.getElementById('aberturas');
    if (!lista) return;

    const selectCat = document.getElementById('openingCategory');
    const selectCor = document.getElementById('openingColor');
    const selectFaixa = document.getElementById('openingRange');
    const btnLimpar = document.getElementById('clearOpening');
    const contador = document.getElementById('contador');
    const tplCard = document.getElementById('templateAbertura');
    const tplVazio = document.getElementById('templateVazioAbertura');

    const faixas = await buscarFaixas();
    const aberturas = await buscarAberturas();

    const categorias = [...new Set(aberturas.map((a) => a.categoria.toLowerCase()))];
    categorias.forEach((cat) => adicionarOpcao(selectCat, cat, capitalizar(cat)));
    faixas.forEach((f) => adicionarOpcao(selectFaixa, f.id_faixa, `${formatarNivel(f.nome)} (${f.rating_minimo}–${f.rating_maximo})`));

    function renderizar() {
        const filtradas = aberturas.filter((ab) => {
            const bateCat = !selectCat.value || ab.categoria.toLowerCase() === selectCat.value;
            const bateCor = !selectCor.value || ab.cor.toLowerCase() === selectCor.value;
            const bateFaixa = !selectFaixa.value || ab.faixas_aberturas.some((f) => String(f.id_faixa) === selectFaixa.value);
            return bateCat && bateCor && bateFaixa;
        });

        contador.textContent = `${filtradas.length} abertura(s)`;
        lista.replaceChildren();

        if (!filtradas.length) return lista.appendChild(tplVazio.content.cloneNode(true));
        filtradas.forEach((ab) => lista.appendChild(criarCardAbertura(tplCard, ab, lista.dataset.imgDir)));
    }

    selectCat.addEventListener('change', renderizar);
    selectCor.addEventListener('change', renderizar);
    selectFaixa.addEventListener('change', renderizar);
    btnLimpar.addEventListener('click', () => {
        selectCat.value = "";
        selectCor.value = "";
        selectFaixa.value = "";
        renderizar();
    });

    renderizar();
}

async function paginaTemas() {
    const lista = document.getElementById('temas');
    if (!lista) return;

    const contador = document.getElementById('contador');
    const tplCard = document.getElementById('templateTema');
    const temas = await buscarTemas();

    contador.textContent = `${temas.length} tema(s)`;
    lista.replaceChildren();

    temas.forEach((tema) => {
        const card = tplCard.content.cloneNode(true);
        card.querySelector('[data-nome]').textContent = capitalizar(tema.nome);
        card.querySelector('[data-descricao]').textContent = capitalizar(tema.descricao);
        lista.appendChild(card);
    });
}

async function main() {
    document.getElementById('menuToggle')?.addEventListener('click', () => {
        document.getElementById('sidebar')?.classList.toggle('open');
    });

    configurarModal();
    await paginaIndex();
    await paginaExercicios();
    await paginaAberturas();
    await paginaTemas();
}

main();
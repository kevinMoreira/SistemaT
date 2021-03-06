window.onload = function() {

    VerificaSessao();
    getDadosUsuario();
    MontaMenu();
    Desabilitar(true);
    carregarComboBoxTipo();
};

function Editar(){

    Desabilitar(false);

    document.getElementById('nome').focus();
    document.getElementById('novo').setAttribute('style', 'visibility:hidden');
    document.getElementById('editar').setAttribute('src', 'imagens/ok.png');
    document.getElementById('editar').setAttribute('title', 'Atualizar');
    document.getElementById('editar').setAttribute('onclick', 'Update();');
    document.getElementById('excluir').setAttribute('style', 'visibility:hidden');
    document.getElementById('pesquisar').setAttribute('src', 'imagens/close.png');
    document.getElementById('pesquisar').setAttribute('width', '50');
    document.getElementById('pesquisar').setAttribute('height', '50');
    document.getElementById('pesquisar').setAttribute('title', 'Cancelar');
    document.getElementById('pesquisar').setAttribute('onclick', 'Cancelar();');
}

function Pesquisar(){

    var pesq;

    if(pesq=prompt("Buscar categoria pelo nome ou código.")) {


        var ajax = new Ajax('POST', './php/Neg/CategoriaNeg.php', false);

        var p='action=pesquisarCategoria';
        p+='&pesq=' + pesq;

        ajax.Request(p);

        // alert(ajax.getResponseText());

        if(ajax.getResponseText()==0){
            alert("Inexistente!");
            return;
        }

        var v =ajax.getResponseText(p);

        var json = JSON.parse(v);

        if (ajax.getResponseText() == 0) {
            alert("Inexistente!");
            return;

        }

        document.getElementById('nome').value = json.nome;
        document.getElementById('codigo').value = json.idCategoria;
        document.getElementById('tipo').value = json.tipo;
    }
}

function Excluir(){

    if(confirm("Deseja excluir categoria?")){
        var idCategoria = document.getElementById('codigo').value;
        var ajax = new Ajax('POST', './php/Neg/CategoriaNeg.php', false);
        var p='action=excluir';
        p+='&idCategoria=' + idCategoria;
        // alert(p);
        ajax.Request(p);
        // alert(ajax.getResponseText());
        alert("Excluído com sucesso!");
        Cancelar();
    }else{
        alert("Ufa... Foi por pouco!");
    }
}

function Novo(){

    Desabilitar(false);
    document.getElementById('nome').focus();

    document.getElementById('novo').setAttribute('src', 'imagens/ok.png');
    document.getElementById('novo').setAttribute('width', '50');
    document.getElementById('novo').setAttribute('height', '50');
    document.getElementById('novo').setAttribute('title', 'Salvar');
    document.getElementById('novo').setAttribute('onclick', 'Salvar();');//salvar

    document.getElementById('editar').setAttribute('style', 'visibility:hidden');
    document.getElementById('excluir').setAttribute('style', 'visibility:hidden');

    document.getElementById('pesquisar').setAttribute('src', 'imagens/close.png');
    document.getElementById('pesquisar').setAttribute('width', '50');
    document.getElementById('pesquisar').setAttribute('height', '50');
    document.getElementById('pesquisar').setAttribute('title', 'Cancelar');
    document.getElementById('pesquisar').setAttribute('onclick', 'Cancelar();');
}

function Desabilitar(valor){
    document.getElementById('nome').disabled = valor;
    document.getElementById('tipo').disabled = valor;
}

function Cancelar(){

    Desabilitar(true);

    document.getElementById('nome').value='';
    document.getElementById('codigo').value='';
    document.getElementById('tipo').value = 0;

    document.getElementById('editar').setAttribute('src', 'imagens/editar.png');
    document.getElementById('excluir').setAttribute('src', 'imagens/excluir.png');

    document.getElementById('novo').setAttribute('style', 'visibility:visible');
    document.getElementById('editar').setAttribute('style', 'visibility:visible');
    document.getElementById('excluir').setAttribute('style', 'visibility:visible');

    document.getElementById('novo').setAttribute('src', 'imagens/novo.png');
    document.getElementById('novo').setAttribute('width', '50');
    document.getElementById('novo').setAttribute('height', '50');
    document.getElementById('novo').setAttribute('title', 'Novo');
    document.getElementById('novo').setAttribute('onclick', 'Novo();');

    document.getElementById('pesquisar').setAttribute('src', 'imagens/pesquisar.png');
    document.getElementById('pesquisar').setAttribute('width', '50');
    document.getElementById('pesquisar').setAttribute('height', '50');
    document.getElementById('pesquisar').setAttribute('title', 'Pesquisar');
    document.getElementById('pesquisar').setAttribute('onclick', 'Pesquisar();');

    document.getElementById('editar').setAttribute('src', 'imagens/editar.png');
    document.getElementById('editar').setAttribute('width', '50');
    document.getElementById('editar').setAttribute('height', '50');
    document.getElementById('editar').setAttribute('title', 'Editar');
    document.getElementById('editar').setAttribute('onclick', 'Editar();');
}

function Salvar(){
    var ajax = new Ajax('POST', './php/Neg/CategoriaNeg.php', false);
    var nome = document.getElementById('nome').value;
    var tipo = document.getElementById('tipo').value;

    var p='action=salvarCategoria';
    p+='&nome=' + nome;
    p+='&tipo=' + tipo;

    // alert(p);
    if(confirm("Deseja salvar?")){
        ajax.Request(p);

        // alert(ajax.getResponseText());


        Cancelar();
        alert("Gravado com sucesso!");
    }
}

function Update(){

    if(confirm("Deseja atualizar?")){

        var ajax = new Ajax('POST', './php/Neg/CategoriaNeg.php', false);
        var idCategoria = document.getElementById('codigo').value;
        var nome = document.getElementById('nome').value;
        var tipo = document.getElementById('tipo').value;

        var p='action=editarCategoria';

        p+='&idCategoria=' + idCategoria;
        p+='&nome=' + nome;
        p+='&tipo=' + tipo;
        //alert(tipo);
        // alert(p);
        ajax.Request(p);
        // alert(ajax.getResponseText());
        Cancelar();
        alert("Atualizado com sucesso!");
    }
}

function carregarComboBoxTipo(){

    var combo = document.getElementById('tipo');
    var ajax = new Ajax('POST', './php/Neg/CategoriaNeg.php', false);
    var p='action=carregarComboBoxTipo';

    ajax.Request(p);

     // alert(ajax.getResponseText());

    if(ajax.getResponseText() != '0'){
        var json = JSON.parse(ajax.getResponseText());
        combo.options[0] = new Option ("SELECIONE", 0);
        for (var i = 0; i < json.length; i++) {
            combo.options[i+1] = new Option (json[i].nome, json[i].idSuperCategorias);
        }
    }else{
        combo.options[0] = new Option ("SELECIONE",0);
    }
}


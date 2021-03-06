<?php
/*
 * Feito por Kevin Rangel
 * inicio: 26/05/2016
 * 
*/

require_once('../Dao/ProdutoDao.php');
require_once('../Ent/Produto.php');
$objProdutoNeg = new ProdutoNeg();
$objProdutoEnt = new Produto();

if(isset($_POST['nome']))
    $objProdutoEnt->setNome($_POST['nome']);

if(isset($_POST['valorVenda']))
    $objProdutoEnt->setValor($_POST['valorVenda']);

if(isset($_POST['categoriaId']))
    $objProdutoEnt->setCategoriaId($_POST['categoriaId']);

if(isset($_POST['produtoId']))
    $objProdutoEnt->setProdutoId($_POST['produtoId']);

if(isset($_POST['codigoBarras']))
    $objProdutoEnt->setCodigoBarras($_POST['codigoBarras']);


// if(isset($_POST['tipo']))
//     $objProdutoEnt->setTipo($_POST['tipo']);

if(isset($_POST['quantidadeMinima']))
    $objProdutoEnt->setQuantidadeMinima($_POST['quantidadeMinima']);

if(isset($_POST['dataMinimaAlertaVencimento']))
    $objProdutoEnt->setDataMinimaAlertaVencimento($_POST['dataMinimaAlertaVencimento']);


if (isset($_POST['action'])) {
    switch ($_POST['action']) {

        case 'pesquisarProduto':

            $objProduto = $objProdutoNeg->Obter($_POST['pesq']);
            $json = json_encode( $objProduto );
            echo $json;
            break;

        case 'salvarProduto':

            $teste = $objProdutoNeg->Salvar($objProdutoEnt);
            echo $teste;
            break;

        case 'excluir':
            $objProdutoNeg->Excluir($_POST['produtoId']);
            break;

        case 'editarProduto':
            $teste= $objProdutoNeg->Atualizar($objProdutoEnt);
            echo $teste;
            break;

        case 'carregarComboBox':
            $categorias= $objProdutoNeg->CarregarComboBox();
            $json = json_encode( $categorias);
            echo $json;
            break;

        // case 'carregarComboBoxTipo':
        //     $tipos= $objProdutoNeg->CarregarComboBoxTipo();
        //     $json = json_encode( $tipos);
        //     echo $json;
        //     break;
    }
}


class ProdutoNeg {

    // public function CarregarComboBoxTipo(){
    //     $produtoDao = new ProdutoDao();
    //     return $produtoDao->CarregarComboBoxTipo();
    // }

     public function CarregarComboBox(){
        $produtoDao = new ProdutoDao();
        return $produtoDao->CarregarComboBox();
    }

    public function Obter($pesq){
        $produtoDao = new ProdutoDao();
        return $produtoDao->Obter($pesq);
    }
    
    public function Salvar(Produto $objProduto){
        $produtoDao = new ProdutoDao();
        return $produtoDao->Salvar($objProduto);
    }
    
    public function Atualizar(Produto $objProduto){
        $produtoDao = new ProdutoDao();
        return $produtoDao->Atualizar($objProduto);
    }

    public function Excluir($id){
        $produtoDao = new ProdutoDao();
        return $produtoDao->Exclir($id);
    }
    
    
    
}
<?php
/***
 * @author kevin Rangel Moreira
 * @since 26/03/2016
 * classe conexão banco de dados com a classe produto
 */
include '../sistemaJP.php';
require_once('../Ent/Produto.php');
//adicionando classes da catego


class ProdutoDao{

	public function Obter($pesq)
	{
		session_start();
		$conexao= AbreBancoJP();

		$objProduto = new Produto();

		$sql="SELECT 
				`produto`.`idProduto`,
				`produto`.`idCategoria`,
				`produto`.`nome`,
				`produto`.`valorVenda`,
				`produto`.`status`,
				`produto`.`CodigoDeBarras`,
                sc.idSuperCategorias as tipo,
                `produto`.`QuantidadeMinima`,
				`produto`.`DataMinimaAvisoVencimento`		
				
			FROM 
				`produto` as produto
				inner join categoria as cat on cat.idCategoria =produto.idCategoria
				inner join SuperCategoriasCategorias as scc on scc.categoriaId = cat.idCategoria
				inner join SuperCategorias as sc on sc.idSuperCategorias = scc.superCategoriaId
			WHERE 
				`produto`.status=1
			and 
				(`produto`.nome = '".$pesq."'
			OR 
				`produto`.idProduto = '".$pesq."')
			AND
				`produto`.idOrganizacao = $_SESSION[idOrganizacao]";

		$sql=mysql_query($sql, $conexao);

		if(mysql_num_rows($sql) <= 0){
			mysql_close($conexao);
			return 0;
		}

		while($row=mysql_fetch_row($sql)){
			$objProduto->setProdutoId($row[0]);
			$objProduto->setCategoriaId($row[1]);
			$objProduto->setNome($row[2]);
			$objProduto->setValor($row[3]);
			$objProduto->setStatus($row[4]);
			$objProduto->setCodigoBarras($row[5]);
			$objProduto->setTipo($row[6]);
			$objProduto->setQuantidadeMinima($row[7]);
			$objProduto->setDataMinimaAlertaVencimento($row[8]);

		}
		mysql_close($conexao);
		return $objProduto;
	}


	//Salva categria  na base
	public function Salvar(Produto $produto)
	{
		session_start();
		$conexao=AbreBancoJP();

		$sql="
        INSERT INTO  `produto`
		(
			`idOrganizacao`,
			`idCategoria`,
			`nome`,
			`valorVenda`,
			`status`,
			`CadastroDataHora`,

			`quantidadeMinima`,
			`DataMinimaAvisoVencimento`,

			`CodigoDeBarras`
		)
		VALUES
		(
		 
			$_SESSION[idOrganizacao],
			  ".$produto->getCategoriaoId().",
			'".$produto->getNome()."',
			".$produto->getValor().",
			1,
			current_timestamp(),
			".$produto->getQuantidadeMinima().",
			".$produto->getDataMinimaAlertaVencimento().",

			'".$produto->getCodigoBarras()."'
		);
";

		mysql_query($sql, $conexao);

		$retorno = $sql;
		mysql_close($conexao);
		return $retorno;
	}


	//Atualiza categoria na base
	public function Atualizar(Produto $produto)
	{
		session_start();
		$conexao=AbreBancoJP();

		$sql="
		UPDATE 
			`produto`
		SET
			`idCategoria` = ".$produto->getCategoriaoId().",
			`nome` = '".$produto->getNome()."',
			`valorVenda` = ".$produto->getValor().",
			`AtualizacaoDataHora` = current_timestamp(),
			`CodigoDeBarras` ='".$produto->getCodigoBarras()."', 
			`quantidadeMinima` ='".$produto->getQuantidadeMinima()."',
			`DataMinimaAvisoVencimento`='".$produto->setDataMinimaAlertaVencimento()."'
		";

		if($produto->getQuantidadeMinima() != null)
			$sql .=" ,`quantidadeMinima` =".$produto->getQuantidadeMinima();

		if($produto->getDataMinimaAlertaVencimento() != null)
			$sql .=" ,`dataMinimaAlertaVencimento` =".$produto->getDataMinimaAlertaVencimento();

		$sql .="
		 WHERE 
			`idProduto` = ".$produto->getProdutoId()."
		 	and `idOrganizacao` = $_SESSION[idOrganizacao]";

		mysql_query($sql, $conexao);
		$retorno = "1";
		mysql_close($conexao);
		return $retorno;
	}


	public  function  Excluir(Produto $produto){
		session_start();
		$conexao=AbreBancoJP();

		$sql="
			UPDATE 
				`produto`
			SET
				`status` = 0,
				`AtualizacaoDataHora` = current_timestamp()
			WHERE 
				`idProduto` = 33
				and `idOrganizacao` = ".$_SESSION['idOrganizacao'];

		mysql_query($sql, $conexao);
		$retorno = "1";
		mysql_close($conexao);

		return $retorno;
	}

	public function CarregarComboBox(){
		session_start();
		$conexao= AbreBancoJP();

		$sql="SELECT 
						idCategoria ,
						nomeCategoria
				FROM 
					categoria 
				WHERE 
					status=1
				AND
					idOrganizacao =".$_SESSION['idOrganizacao'];

		$sql=mysql_query($sql, $conexao);

		if(mysql_num_rows($sql) <= 0){
			mysql_close($conexao);
			return 0;
		}

		while($row=mysql_fetch_row($sql)){
			$json[] = array(
				'id_categoria' => $row[0],
				'nome_categoria'=>$row[1]
			);
		}
		mysql_close($conexao);
		return $json;
	}


	public function CarregarComboBoxTipo(){
		session_start();
		$conexao= AbreBancoJP();

		$sql="
			SELECT 
				idSuperCategorias,
				nome
			FROM 
				SuperCategorias
			ORDER BY 
				nome asc";

		$sql=mysql_query($sql, $conexao);

		if(mysql_num_rows($sql) <= 0){
			mysql_close($conexao);
			return 0;
		}

		while($row=mysql_fetch_row($sql)){
			$json[] = array(
				'idSuperCategorias' => $row[0],
				'nome'=>$row[1]
			);
		}
		mysql_close($conexao);
		return $json;
	}
}
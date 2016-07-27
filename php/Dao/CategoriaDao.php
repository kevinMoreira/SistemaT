<?php
/**
 * @author Kevin Rangel Moreira
 * @since data 26/03/2016
 *	classe criada para conexão banco de dados categoria
 */


//require_once('../MySQL.php');
require_once('../Ent/Categoria.php');
include '../sistemaJP.php';


class CategoriaDAO {

	public function Obter($pesq)
	{

		session_start();
		$conexao= AbreBancoJP();

		$objCategoriaEnt = new Categoria();

		$sql="SELECT 
						idCategoria ,
						nomeCategoria,
						idSuperCategorias
				FROM 
					categoria as a 
					inner join SuperCategoriasCategorias as b on b.categoriaId = a.idCategoria
					inner join SuperCategorias as a on a.idSuperCategorias = b.SuperCategoriaId
				WHERE
				    (nomeCategoria LIKE CONCAT('%', '$pesq' '%') OR '$pesq'  IS NULL)
				    or 
				     idCategoria ='$pesq'
				 AND 
					status=1
				AND
					idOrganizacao =".$_SESSION['idOrganizacao'];

		$sql=mysql_query($sql, $conexao);

		if(mysql_num_rows($sql) <= 0){
			mysql_close($conexao);
			return 0;
		}

		while($row=mysql_fetch_row($sql)){
			$objCategoriaEnt->setIdCategoria($row['0']);
			$objCategoriaEnt->setNome($row['1']);
			$objCategoriaEnt->setTipo($row['2']);
		}
		mysql_close($conexao);
		return $objCategoriaEnt;
	}


	//Salva categria  na base
	public function Salvar( $categoria)
	{
		session_start();
		$conexao=AbreBancoJP();

		$sql = "call USP_MANTER_CATEGORIAS(
					'".$categoria->getNome().",
					".$_SESSION["idOrganizacao"].",
					null,
					null,
					null,
					0,
					".$categoria->getTipo()."
				);";

		// $sql="
		// INSERT INTO categoria
		// (
		// 	`idOrganizacao`,
		// 	`nomeCategoria`,
		// 	`status`,
		// 	`CadastroDataHora`,
		// 	`CadastroUsuarioId`,
		// 	`AtualizacaoDataHora`,
		// 	`AtualizacaoUsuarioId`
		// )
		// VALUES
		// (
		// 	$_SESSION[idOrganizacao],
		// 	'".$categoria->getNome()."',
		// 	1,
		// 	current_timestamp(),
		// 	NULL,
		// 	NULL,
		// 	NULL
  //       );

  //       SET @ID = LAST_INSERT_ID();

  //       INSERT INTO SuperCategoriasCategorias
  //       (
  //       	categoriaId,
  //       	SuperCategoriaId
  //       )
  //       select 
  //        	idCategoria,
  //        	".$categoria->getTipo()." 
  //        from 
  //        	`categoria` 
  //        where 
  //        	idCategoria =  @ID;
  //       ";

		mysql_query($sql, $conexao);

		$retorno = $sql;

		mysql_close($conexao);

		return $retorno;

	}


	//Atualiza categoria na base
	public function Atualizar(Categoria $categorias)
	{
		session_start();
		$conexao=AbreBancoJP();

		$sql="
		        UPDATE
		        	SuperCategoriasCategorias
		        SET
		        	SuperCategoriaId = ".$categoria->getTipo()."
		        WHERE
		        	`idCategoria` = ".$categorias->getIdCategoria() .";

				UPDATE 
					`categoria`
				SET
					`nomeCategoria` = '".$categorias->getNome()."',
					`status` = 1,
					`AtualizacaoDataHora` = current_timestamp()
				WHERE 
					`idCategoria` = ".$categorias->getIdCategoria() ."
				AND
					`idOrganizacao`=". $_SESSION['idOrganizacao'].";";

		mysql_query($sql, $conexao);


		$retorno = "1";

		mysql_close($conexao);

		return $retorno;
	}


	public  function  excluir( $categoria){
		session_start();
		$conexao=AbreBancoJP();

		$sql="UPDATE 
				`categoria`
			SET
				`status` = 0,
				`AtualizacaoDataHora` = current_timestamp()
			WHERE 
				`idCategoria` = ".$categoria->getIdCategoria()." 
			AND
				`idOrganizacao`= $_SESSION[idOrganizacao];
		";


		mysql_query($sql, $conexao);


		$retorno = "1";

		mysql_close($conexao);

		return $retorno;
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

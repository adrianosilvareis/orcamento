<?php 

	require_once 'class/DB.php';

	class Grupo_usuarios extends Crud{
		
		public $table = 'grupo_usuarios';

		private $nome;

		public function setNome($nome){
			$this->nome = $nome;
		}
		
		public function getNome(){
			return $this->nome;
		}

		public function insert(){
			$sql = "INSERT INTO $this->table (nome) values (:nome)";
	 		$stmt = DB::prepare($sql);
	 		$stmt->bindParam(':nome', $this->nome);
	 		return $stmt->execute();
		}

		public function update($id){
			$sql = "UPDATE $this->table set nome=:nome WHERE id = :id";
	 		$stmt = DB::prepare($sql);
	 		$stmt->bindParam(':nome', $this->nome);
	 		$stmt->bindParam(':id', $id, PDO::PARAN_INT);
	 		return $stmt->execute();
	 	}
	}
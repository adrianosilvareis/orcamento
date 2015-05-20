<?php 
	
	require_once 'Crud.php';

	class Usuarios extends Crud{

		public $table = 'usuario';

		private $nome;
		private $email;
		private $senha;
		private $fk_gu;

		public function setNome($nome){
			$this->nome = $nome;
		}
		
		public function getNome(){
			return $this->nome;
		}

		public function setEmail($email){
			$this->email = $email;
		}
		
		public function getEmail(){
			return $this->email;
		}

		public function setSenha($senha){
			$this->senha = $senha;
		}
		
		public function getSenha(){
			return $this->senha;
		}

		public function setFkGU($fk_gu){
			$this->fk_gu = $fk_gu;
		}
		
		public function getFkGU(){
			return $this->fk_gu;
		}
		
		public function insert(){
			$sql = "INSERT INTO $this->table (nome, email, senha) values (:nome, :email, :grupo_usuarios_id)";
	 		$stmt = DB::prepare($sql);
	 		$stmt->bindParam(':nome', $this->nome);
	 		$stmt->bindParam(':email', $this->email);
	 		$stmt->bindParam(':senha', $this->senha);
	 		$stmt->bindParam(':grupo_usuarios_id', $this->fk_gu, PDO::PARAN_INT);
	 		return $stmt->execute();
		}

		public function update($id){
			$sql = "UPDATE $this->table set nome=:nome, email=:email, senha=:senha, grupo_usuarios_id=:fk_gu WHERE id = :id";
	 		$stmt = DB::prepare($sql);
	 		$stmt->bindParam(':nome', $this->nome);
	 		$stmt->bindParam(':email', $this->email);
	 		$stmt->bindParam(':senha', $this->senha);
	 		$stmt->bindParam(':grupo_usuarios_id', $this->fk_gu, PDO::PARAN_INT);
	 		$stmt->bindParam(':id', $id, PDO::PARAN_INT);
	 		return $stmt->execute();
	 	}
	}

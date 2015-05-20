<?php 
	function __autoload($class_name){
		require_once 'class/'.$class_name.'.php';
	}
 ?>
<!DOCTYPE html>
<html>
<head>
	<title>teste</title>
</head>
<body>
	<?php 
		$Usuarios = new Usuarios();
		$Grupo_usuarios = new Grupo_usuarios();
	 ?>

	 <table>
	 	<tr>
		 	<th>Nome</th>
		 	<th>Email</th>
		 	<th>Grupo de Usuarios</th>
		 	<th>senha</th>
	 	</tr>
	 	<?php foreach ($Usuarios->findAll() as $key => $value): 
	 		$guFind = $Grupo_usuarios->find($value->grupo_usuarios_id);
	 	?>
	 		<tr>
	 			<td><?php echo $value->nome ?></td>
	 			<td><?php echo $value->email ?></td>
	 			<td><?php echo $guFind->nome ?></td>
	 			<td><?php echo $value->senha ?></td>
	 		</tr>
	 	<?php endforeach ?>
	 </table>


</body>
</html>
import hechiceria.*

object espadaDelDestino{
	method aporte(){
		return 3
	}
}

object collarDivino{
	var property perlas = 5
	
	method aporte(){
		return perlas
	}
}

object mascaraOscura{
	method aporte(){
		if(fuerzaOscura.valor()/2>=4){
			return fuerzaOscura.valor()/2
		}
		else{
			return 4
		}
	}
}
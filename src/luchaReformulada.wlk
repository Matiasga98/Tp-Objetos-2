import hechiceriaRecargada.*



class ArmaDelDestino{
	constructor(){}
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

class Mascara{
	var property indiceDeOscuridad
	var property minimo = 4
	
	constructor(unIndiceDeOscuridad){
		indiceDeOscuridad = unIndiceDeOscuridad
	}
	
	method aporte(){
		if(fuerzaOscura.valor()/2*indiceDeOscuridad>=minimo){
			return fuerzaOscura.valor()/2
		}
		else{
			return minimo
		}
	}
}
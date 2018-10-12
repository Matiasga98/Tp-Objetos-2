import hechiceriaRecargada.*



class ArmaDelDestino{
	constructor(){}
	method aporte(){
		return 3
	}
	method costo (){
		return 5*self.aporte()
	}
}

object collarDivino{
	var property perlas = 5
	
	method aporte(){
		return perlas
	}
	method costo (){
		return 2*perlas
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
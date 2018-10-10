import lucha.*
import luchaYHechiceriaAvanzada.*



class Personaje {
	
	
	const property valorBaseHechiceria = 3
	var property hechizoPreferido 
	var property valorBaseLucha = 1 // 
	var property artefactos = []
		
	constructor(unHechizoPreferido, unosArtefactos){
		hechizoPreferido  = unHechizoPreferido
		artefactos = unosArtefactos
	}	
		
		
	method nivelDeHechiceria(){
		return valorBaseHechiceria*hechizoPreferido.poder()+fuerzaOscura.valor()
	}
	
	method seCreePoderoso() = hechizoPreferido.poderoso()
	
	method agregarArtefacto(unArtefacto){
		artefactos.add(unArtefacto)
	}
	
	method removerArtefacto(unArtefacto){
		artefactos.remove(unArtefacto)
	}
	
	method valorDeLucha(){
		return valorBaseLucha + self.aporteDeArtefactos()
	}
	
	method aporteDeArtefactos(){
		return artefactos.map({artefacto => artefacto.aporte()}).sum()
	}
	
	
}

class Logos {
	var property nombre
	var property poderDeHechiceria
	
	constructor(unNombre, unPoder){
		nombre = unNombre
		poderDeHechiceria = unPoder
	}
	
	method poder(){
		return poderDeHechiceria*nombre.size()
	}
	
	method poderoso() = self.poder()>15
}
object hechizoIneficiente{
	method poder(){
		return 0
	}
	method poderoso() = false
}
object hechizoBasico{
	method poder(){  
		return 10    
	}
	
	method poderoso() = false
}

object fuerzaOscura{
	var property valor = 5
	
	method duplicarValor(){
		valor = valor*2
	}
}

object eclipse{
	method eclipsar(){
		fuerzaOscura.duplicarValor()
	}
}
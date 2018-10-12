import lucha.*
import luchaYHechiceriaAvanzada.*



class Personaje {
	
	
	const property valorBaseHechiceria = 3
	var property hechizoPreferido 
	var property valorBaseLucha = 1 // 
	var property artefactos = []
	var property monedas = 100
	var property compraExitosa
		
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
	
	method mayorLuchaQueHechiceria() = self.valorDeLucha() > self.nivelDeHechiceria()
	
	method tieneSoloEspejos() = self.removerEspejos().isEmpty()
	
	method removerEspejos(){
			return artefactos.filter({artefacto => artefacto.className() !="luchaYhechiceriaPlus.Espejo"})
	}
	
	method maximoAporte(){
		return self.removerEspejos().map({artefacto => artefacto.aporte()}).max()
	}
	
	method estaCargado() = artefactos.size() >= 5
	
	method canjearHechizo(hechizoAComprar){
		if (monedas + hechizoPreferido.costo()/2 >= hechizoAComprar.costo()){
			monedas -= (hechizoAComprar.costo()-hechizoPreferido.costo()/2).max(0) 
			hechizoPreferido = hechizoAComprar
			compraExitosa = true
		}
		else{
			compraExitosa = false
		}
	
	}
	
	method comprarArtefacto (artefactoAComprar){
		if (monedas >= artefactoAComprar.costo()){
			monedas -= artefactoAComprar.costo()
			self.agregarArtefacto(artefactoAComprar)
			compraExitosa = true
		}
		else{
			compraExitosa = false
		}
		
	}
	
	method cumplirObjetivo (){
		monedas +=10
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
	method costo(){
		return self.poder()
	}
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
	method costo (){
		return 10
	}
	

	
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
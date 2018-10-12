import hechiceriaRecargada.*
import luchaReformulada.*


class Armadura{
	var property duenio 
	var property refuerzo 
	var property base

	
	constructor (unRefuerzo, unaBase, unDuenio) {
		refuerzo = unRefuerzo
		base = unaBase
		duenio = unDuenio
	}
	
	method aporte(){
		return base + refuerzo.valor(duenio)
	}
	
	method costo (){
		return refuerzo.costo()
	}
}


class CotaDeMalla{
	var property unidadDeLucha
	constructor (unValor){
		unidadDeLucha = unValor
	}
	
	method valor(duenio) {
		return unidadDeLucha
	}
	method costo (){
		return unidadDeLucha/2
	}
}

object bendicion{
	var property perteneceA 
	method valor(duenio){
		return duenio.nivelDeHechiceria()
	}
	
	method costo (){
		return perteneceA.base()
	}
}


class Hechizo{			//creimos conveniente ponerlo como clase
	var property tipoDeHechizo
	var property perteneceA
	
	constructor (unHechizo){
		tipoDeHechizo = unHechizo
	}
	
	method valor(duenio){
		return tipoDeHechizo.poder()
	}	
	method costo (){
		return perteneceA.base()+tipoDeHechizo.costo()
	}
	
}

object ninguno{
	method valor(duenio){
		return 0
	}
	method costo (){
		return 2
	}
}



class Espejo{
	var property duenio
	
	
	constructor (unDuenio){
		duenio = unDuenio
	}
	
	method aporte(){
		if(duenio.tieneSoloEspejos()){
			return 0
		}
		else{
			return duenio.maximoAporte()
		}
	}
	method costo (){
		return 90
	}
}



class LibroDeHechizos{
	var property hechizos
	
	constructor (unosHechizos) {
		hechizos = unosHechizos
	}
	
	method poder(){
		return self.aporteTotalHechizosPoderosos()
	}
	
	method aporteTotalHechizosPoderosos(){
		return self.hechizosPoderosos().map({hechizo => hechizo.poder()}).sum()
	}
	
	method hechizosPoderosos(){
		return hechizos.filter({hechizo => hechizo.poderoso()})
	}
	method costo (){
		return 10*hechizos.size()+self.aporteTotalHechizosPoderosos()
	}
}

//Conviene hacer una clase ya que entre los mismos espejos y libros de hechizos tienen distintos valores que afectan su comportamiento

//Mientras que el libro de hechizos no se contenga a si mismo, funcionaria. Un libro puede contener a otro y 
//no entrar en un ciclo infinito siempre que ninguno de los libros involucrados se contenga a si mismo
// tampoco funcionaria si se genera un ciclo de contencion. ejemplo A contiene a B, B contiene a C, C contiene a A

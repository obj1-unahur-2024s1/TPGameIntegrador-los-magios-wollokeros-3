
import wollok.game.*
import bros.*
import direcciones.*
import niveles.*

class Objeto{
	var property position
	method serEmpujado(){}
	method iniciar(){ game.addVisual(self) }
}

object contador{
    var valor = 15
	method valor(){
		return valor
	}
	method descontar(){
		valor -= 1
	}
    method segundero(){
    	game.onTick(1000,"terContador",{self.descontar()})    	
    }
   	
}



class Ladrillo inherits Objeto { 
	method image() = "Ladrillo.png"
	method direccionActual() = bros.direccionActual().contrario()
}

class Objetivo inherits Objeto {
	const property invisibles = []
	var property image =  "objetivo (punto).png"
	method cambiarColorDeCaja() { game.onCollideDo(self, {c => c.pintarCaja() if (nivelUno.completado() and nivelUno.existe()) { nivelUno.pasarANivel2() }}) } // revisar
	method finalizar() { game.onCollideDo(self, {c => c.pintarCaja() if (nivelDos.completado() and not nivelUno.existe()) { nivelCuatro.finalizarJuego() }}) }
	
	method pintarCaja(){}
	method direccionActual() = bros.direccionActual().contrario()
	method aniadirInvisibles() { 
		if (game.getObjectsIn(position.left(1)).size() == 0) { invisibles.add(new Invisible(position = position.left(1))) }
		if (game.getObjectsIn(position.right(1)).size() == 0) { invisibles.add(new Invisible(position = position.right(1))) }
		if (game.getObjectsIn(position.up(1)).size() == 0) { invisibles.add(new Invisible(position = position.up(1))) }
		if (game.getObjectsIn(position.down(1)).size() == 0) { invisibles.add(new Invisible(position = position.down(1)))}
		invisibles.forEach({i => i.iniciar()})
	} 
	      
    override method iniciar() { 
    	super()
		self.aniadirInvisibles()
		self.cambiarColorDeCaja()
		self.finalizar()
		
	}
}

class Invisible inherits Objeto {
	method cambiarColorDeCaja() { game.onCollideDo(self, {c => c.despintarCaja()}) }
	method image() = "fondo.png"
    override method iniciar() { 
    	super()
    	self.cambiarColorDeCaja()
    }
    method rebotar(){}
    method direccionActual() = bros.direccionActual().contrario()
}

class Caja inherits Objeto {
	var property direccionActual = bros.direccionActual()
	var property image = "caja.png" 
	override method serEmpujado(){
		if (bros.direccionActual().esIgual(derecha) and not self.hayLadrilloHaciaCaja(position.right(1))) {
			position = position.right(1)
		}
		else if (bros.direccionActual().esIgual(izquierda) and not self.hayLadrilloHaciaCaja(position.left(1))) { 
			position = position.left(1)
		}
		else if (bros.direccionActual().esIgual(abajo) and not self.hayLadrilloHaciaCaja(position.down(1)))  { 
			position = position.down(1)
		}
		else if (bros.direccionActual().esIgual(arriba) and not self.hayLadrilloHaciaCaja(position.up(1))){
			position = position.up(1)
		}	
		else { bros.rebotar() }
		
	}	
	method estaEnObjetivo() = self.image() == "caja guardada.png"
	method hayLadrilloHaciaCaja(direccion) = game.getObjectsIn(direccion).any({l => l.image() == "Ladrillo.png"})
	method noSePuedenMover() { if (self.hayMuchasCajas() or self.hayLadrilloHaciaCaja(self.posicionSiguiente())) { bros.brosRebotar() } else { self.serEmpujado() }}
	method hayMuchasCajas() = bros.direccionActual().esIgual(direccionActual) and game.getObjectsIn(self.posicionSiguiente()).any({el => el.image() == image})
	method posicionSiguiente() = direccionActual.posSiguiente(position)
	method posicionAnterior() = direccionActual.posAnterior(position)
	method pintarCaja() { self.image("caja guardada.png") }
	method despintarCaja() { self.image("caja.png") }        
	method rebotar() { position = self.posicionAnterior() }     
}
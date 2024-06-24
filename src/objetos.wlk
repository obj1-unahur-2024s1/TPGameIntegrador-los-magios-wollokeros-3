import wollok.game.*
import bros.*
import direcciones.*
import niveles.*
import portadas.*

class Objeto {

	var property position

	method serEmpujado() {
	}

	method iniciar() {
		game.addVisual(self)
	}

}

class Ladrillo inherits Objeto {

	method image() = "Ladrillo.png"

	method direccionActual() = bros.direccionActual().contrario()

}

class Objetivo inherits Objeto {

	const property invisibles = []
	var property image

method cambiarColorDeCaja(){
           self.cambiarColorYPasarDeNivel(nivelUno,nivelDos)
           self.pasarACadenaDeNiveles(nivelUno,nivelDos,nivelTres)
    	   self.pasarACadenaDeNiveles(nivelDos,nivelTres,nivelCuatro)
              }
          
      
    method pasarACadenaDeNiveles(nivelAEvaluar,nivelActual,nivelSiguiente){
    	if(not nivelAEvaluar.existe()){
    		self.cambiarColorYPasarDeNivel(nivelActual,nivelSiguiente)}
    		
    		}
    	
	method finalizarNivel(nivelActual, nivelAFinalizar) {
		game.onCollideDo(self, { c =>
			c.pintarCaja()if (nivelAFinalizar.completado() and not nivelActual.existe()) {
				nivelAFinalizar.finalizarJuego()
			}})}

	method cambiarColorYPasarDeNivel(nivel1, nivel2) {
		game.onCollideDo(self, { c =>
			c.pintarCaja()
			if (nivel1.completado() and nivel1.existe()) {
				nivel1.pasarAlNivel(nivel2)
				
			}
		})
	}

	method finalizar() {
		self.finalizarNivel(nivelTres, nivelCuatro)
	}

	method pintarCaja() {
	}

	method direccionActual() = bros.direccionActual().contrario()

	method aniadirInvisibles() {
		if (game.getObjectsIn(position.left(1)).size() == 0) {
			invisibles.add(new Invisible(position = position.left(1)))
		}
		if (game.getObjectsIn(position.right(1)).size() == 0) {
			invisibles.add(new Invisible(position = position.right(1)))
		}
		if (game.getObjectsIn(position.up(1)).size() == 0) {
			invisibles.add(new Invisible(position = position.up(1)))
		}
		if (game.getObjectsIn(position.down(1)).size() == 0) {
			invisibles.add(new Invisible(position = position.down(1)))
		}
		invisibles.forEach({ i => i.iniciar()})
	}

	override method iniciar() {
		super()
		self.aniadirInvisibles()
		self.cambiarColorDeCaja()
		self.finalizar()
	}

}

class Invisible inherits Objeto {

	method cambiarColorDeCaja() {
		game.onCollideDo(self, { c => c.despintarCaja()})
	}

	method image() = "fondo.png"

	override method iniciar() {
		super()
		self.cambiarColorDeCaja()
	}

	method rebotar() {
	}

	method direccionActual() = bros.direccionActual().contrario()

}

class Caja inherits Objeto {

	var property direccionActual = bros.direccionActual()
	var property image
	var property cajaGuardada

	
	var property posX
	var property posY

	override method serEmpujado() {
		if (bros.direccionActual().esIgual(derecha) and not self.hayLadrilloHaciaCaja(position.right(1))) {
			position = position.right(1)
		} else if (bros.direccionActual().esIgual(izquierda) and not self.hayLadrilloHaciaCaja(position.left(1))) {
			position = position.left(1)
		} else if (bros.direccionActual().esIgual(abajo) and not self.hayLadrilloHaciaCaja(position.down(1))) {
			position = position.down(1)
		} else if (bros.direccionActual().esIgual(arriba) and not self.hayLadrilloHaciaCaja(position.up(1))) {
			position = position.up(1)
		} else {
			bros.rebotar()
		}
	}															
	method posObjetivo() = game.at(posX,posY)
	
	method estaEnObjetivo() = self.position() == self.posObjetivo()

	method hayLadrilloHaciaCaja(direccion) = game.getObjectsIn(direccion).any({ l => l.image() == "Ladrillo.png" })

	method noSePuedenMover() {
		if (self.hayMuchasCajas() or self.hayLadrilloHaciaCaja(self.posicionSiguiente())) {
			bros.brosRebotar()
		} else {
			self.serEmpujado()
		}
	}

	method hayMuchasCajas() = bros.direccionActual().esIgual(direccionActual) and (game.getObjectsIn(self.posicionSiguiente()).any({el => el.image() == "caja marron.png"})
		or game.getObjectsIn(self.posicionSiguiente()).any({el => el.image() == "caja verde.png"})
		or game.getObjectsIn(self.posicionSiguiente()).any({el => el.image() == "caja roja.png"})
		or game.getObjectsIn(self.posicionSiguiente()).any({el => el.image() == "caja azul.png"})
	)

	method posicionSiguiente() = direccionActual.posSiguiente(position)

	method posicionAnterior() = direccionActual.posAnterior(position)

	method pintarCaja() { 
        if (self.estaEnObjetivo()) { 
            self.image(cajaGuardada) 
        } 
    }

	method despintarCaja() {
		self.image(image)
	}

	method rebotar() {
		position = self.posicionAnterior()
	}

}


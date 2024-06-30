<<<<<<< HEAD
import wollok.game.*
import objetos.*
import direcciones.*
import portadas.*

object bros {

	var property position = game.center()
	var property image = "parado.png"
	var property direccionActual = derecha
	var estadoAnimacion = 1
	var arrastroCaja = false
	var cajaAgarrada = null

	method iniciar() {
		game.addVisual(self)
		self.configurarTeclas()
		self.empujarCaja()
	}

	method moverDerecha() {
		if (not (self.hayLadrilloHacia(position.right(1)))) {
			position = position.right(1)
			if (estadoAnimacion == 1) {
				image = "derecha1.png"
				estadoAnimacion = 2
			} else {
				image = "derecha2.png"
				estadoAnimacion = 1
			}
			direccionActual = derecha
		}
	}

	method moverIzquierda() {
		if (not (self.hayLadrilloHacia(position.left(1)))) {
			position = position.left(1)
			if (estadoAnimacion == 1) {
				image = "izquierda1.png"
				estadoAnimacion = 2
			} else {
				image = "izquierda2.png"
				estadoAnimacion = 1
			}
			direccionActual = izquierda
		}
	}

	method moverArriba() {
		if (not (self.hayLadrilloHacia(position.up(1)))) {
			position = position.up(1)
			if (estadoAnimacion == 1) {
				image = "arriba1.png"
				estadoAnimacion = 2
			} else {
				image = "arriba2.png"
				estadoAnimacion = 1
			}
			direccionActual = arriba
		}
	}

	method moverAbajo() {
		if (not (self.hayLadrilloHacia(position.down(1)))) {
			position = position.down(1)
			if (estadoAnimacion == 1) {
				image = "abajo1.png"
				estadoAnimacion = 2
			} else {
				image = "abajo2.png"
				estadoAnimacion = 1
			}
			direccionActual = abajo
		}
	}

	method hayLadrilloHacia(direccion) = game.getObjectsIn(direccion).any({ x => x.image() == "Ladrillo.png" })

	method hayCajaHacia(direccion) = game.getObjectsIn(direccion).any({ x => x.direccionActual().esIgual(direccionActual) })

	method hayAlgoAtras() = self.hayCajaHacia(self.posicionAnterior()) or self.hayLadrilloHacia(self.posicionAnterior())

	method configurarTeclas() {
		keyboard.left().onPressDo{ self.moverIzquierda()}
		keyboard.right().onPressDo{ self.moverDerecha()}
		keyboard.up().onPressDo{ self.moverArriba()}
		keyboard.down().onPressDo{ self.moverAbajo()}
		keyboard.s().onPressDo{ self.arrastrarCaja()}
	}

	method brosRebotar() {
		if (not (self.hayAlgoAtras())) {
			position = self.posicionAnterior()
		}
	}

	method posicionAnterior() = direccionActual.posAnterior(position)

	method posicionSiguiente() = direccionActual.posSiguiente(position)

	method empujarCaja() {
		game.onCollideDo(self, { el =>
			if (el.image() == "caja roja.png" or el.image() == "caja azul.png" or el.image() == "caja verde.png" or el.image() == "caja marron.png" or el.image() == "caja gris.png" or el.image() == "caja verde apagado.png") {
				el.direccionActual(direccionActual)
				el.noSePuedenMover()
				arrastroCaja = false
			}
		})
	}

	method arrastrarCaja() {
		if (not arrastroCaja) {
			if (game.getObjectsIn(self.posicionSiguiente()).any({ c => c.direccionActual().esIgual(direccionActual) })) {
				cajaAgarrada = game.getObjectsIn(self.posicionSiguiente()).find({ c => c.direccionActual().esIgual(direccionActual) })
				if (cajaAgarrada.estaEnObjetivo()) {
					self.rebotar()
				} else {
					self.brosRebotar()
					cajaAgarrada.rebotar()
					arrastroCaja = true
				}
			}
		}
	}

	method despintarCaja() {
	}

	method pintarCaja() {
	}

	method rebotar() {
	}

	method serEmpujadoPorObjetivo() {
		self.rebotar()
	}

	method sumarMasTiempo() {
	}

	method pintarLaCaja() {
	}

}

=======
import wollok.game.*
import objetos.*
import direcciones.*
import portadas.*

object bros {

	var property position = game.center()
	var property image = "parado.png"
	var property direccionActual = derecha
	var estadoAnimacion = 1
	var arrastroCaja = false
	var cajaAgarrada = null

	method iniciar() {
		game.addVisual(self)
		self.configurarTeclas()
		self.empujarCaja()
	}

	method moverDerecha() {
		if (not (self.hayLadrilloHacia(position.right(1)))) {
			position = position.right(1)
			if (estadoAnimacion == 1) {
				image = "derecha1.png"
				estadoAnimacion = 2
			} else {
				image = "derecha2.png"
				estadoAnimacion = 1
			}
			direccionActual = derecha
		}
	}

	method moverIzquierda() {
		if (not (self.hayLadrilloHacia(position.left(1)))) {
			position = position.left(1)
			if (estadoAnimacion == 1) {
				image = "izquierda1.png"
				estadoAnimacion = 2
			} else {
				image = "izquierda2.png"
				estadoAnimacion = 1
			}
			direccionActual = izquierda
		}
	}

	method moverArriba() {
		if (not (self.hayLadrilloHacia(position.up(1)))) {
			position = position.up(1)
			if (estadoAnimacion == 1) {
				image = "arriba1.png"
				estadoAnimacion = 2
			} else {
				image = "arriba2.png"
				estadoAnimacion = 1
			}
			direccionActual = arriba
		}
	}

	method moverAbajo() {
		if (not (self.hayLadrilloHacia(position.down(1)))) {
			position = position.down(1)
			if (estadoAnimacion == 1) {
				image = "abajo1.png"
				estadoAnimacion = 2
			} else {
				image = "abajo2.png"
				estadoAnimacion = 1
			}
			direccionActual = abajo
		}
	}

	method hayLadrilloHacia(direccion) = game.getObjectsIn(direccion).any({ x => x.image() == "Ladrillo.png" })

	method hayCajaHacia(direccion) = game.getObjectsIn(direccion).any({ x => x.direccionActual().esIgual(direccionActual) })

	method hayAlgoAtras() = self.hayCajaHacia(self.posicionAnterior()) or self.hayLadrilloHacia(self.posicionAnterior())

	method configurarTeclas() {
		keyboard.left().onPressDo{ self.moverIzquierda()}
		keyboard.right().onPressDo{ self.moverDerecha()}
		keyboard.up().onPressDo{ self.moverArriba()}
		keyboard.down().onPressDo{ self.moverAbajo()}
		keyboard.s().onPressDo{ self.arrastrarCaja()}
	}

	method brosRebotar() {
		if (not (self.hayAlgoAtras())) {
			position = self.posicionAnterior()
		}
	}

	method posicionAnterior() = direccionActual.posAnterior(position)

	method posicionSiguiente() = direccionActual.posSiguiente(position)

	method empujarCaja() {
		game.onCollideDo(self, { el =>
			if (el.image() == "caja roja.png" or el.image() == "caja azul.png" or el.image() == "caja verde.png" or el.image() == "caja marron.png" or el.image() == "caja gris.png" or el.image() == "caja verde apagado.png") {
				el.direccionActual(direccionActual)
				el.noSePuedenMover()
				arrastroCaja = false
			}
		})
	}

	method arrastrarCaja() {
		if (not arrastroCaja) {
			if (game.getObjectsIn(self.posicionSiguiente()).any({ c => c.direccionActual().esIgual(direccionActual) })) {
				cajaAgarrada = game.getObjectsIn(self.posicionSiguiente()).find({ c => c.direccionActual().esIgual(direccionActual) })
				if (cajaAgarrada.estaEnObjetivo()) {
					self.rebotar()
				} else {
					self.brosRebotar()
					cajaAgarrada.rebotar()
					arrastroCaja = true
				}
			}
		}
	}

	method despintarCaja() {
	}

	method pintarCaja() {
	}

	method rebotar() {
	}

	method serEmpujadoPorObjetivo() {
		self.rebotar()
	}

	method sumarMasTiempo() {
	}

	method pintarLaCaja() {
	}

}

>>>>>>> 2443d5313a15491dc13a1c800eef2dbf3a31e1a8

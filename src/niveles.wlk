import wollok.game.*
import bros.*
import objetos.*
import portadas.*

class Nivel {

	const ladrillos = []
	const cajas = []
	const objetivos = []
	var property existe = true

	method agregarFilaDeLadrillos(desde, hasta, y) {
		(desde .. hasta).forEach({ x => ladrillos.add(new Ladrillo(position = game.at(x, y)))})
	}

	method agregarColumnaDeLadrillos(desde, hasta, x) {
		(desde .. hasta).forEach({ y => ladrillos.add(new Ladrillo(position = game.at(x, y)))})
	}

	method borrar() {
		ladrillos.forEach({ l => game.removeVisual(l)})
		cajas.forEach({ c => game.removeVisual(c)})
		objetivos.forEach({ o => o.invisibles().forEach({ i => game.removeVisual(i)})})
		objetivos.forEach({ o => game.removeVisual(o)})
		game.removeVisual(bros)
		game.removeVisual(informacionDeAyuda)
		existe = false
		tiempo.reset()
	}

	method pasarAlNivel(nivelAPasar) {
		self.borrar()
		nivelAPasar.iniciar()
		tiempo.borrar()
		game.addVisual(tiempo)
		game.schedule(4000, { tiempo.mostrarTiempo()})
		imagenNivelCompleto.agregarImagen()
		imagenNivelCompleto.quitarConTiempo()
	}

	method completado() = cajas.all({ c => c.estaEnObjetivo() })

	method hayCajaEnAlgunObjetivo() = cajas.any({ c => c.hayObjetivo() })

	method agregarLadrillos() {
	}

	method agregarCajas() {
	}

	method agregarObjetivos() {
	}

	method iniciar() {
		self.agregarLadrillos()
		self.agregarObjetivos()
		self.agregarCajas()
		bros.iniciar()
		game.addVisual(informacionDeAyuda)
	}

}

object nivelUno inherits Nivel {

	override method agregarLadrillos() {
		self.agregarColumnaDeLadrillos(1, 15, 0)
		self.agregarColumnaDeLadrillos(0, 10, 13)
		self.agregarColumnaDeLadrillos(11, 13, 10)
		self.agregarColumnaDeLadrillos(2, 3, 12)
		self.agregarColumnaDeLadrillos(0, 14, 14)
		self.agregarColumnaDeLadrillos(6, 8, 4)
		self.agregarFilaDeLadrillos(0, 15, 0)
		self.agregarFilaDeLadrillos(1, 9, 4)
		self.agregarFilaDeLadrillos(4, 10, 10)
		self.agregarFilaDeLadrillos(1, 12, 1)
		self.agregarFilaDeLadrillos(1, 13, 14)
		ladrillos.forEach({ l => l.iniciar()})
	}

	override method agregarCajas() {
		cajas.add(new Caja(posX = 12, posY = 12, image = "caja marron.png", cajaGuardada = "caja guardada marron.png", position = game.at(8, 7)))
		cajas.add(new Caja(posX = 8, posY = 12, image = "caja verde.png", cajaGuardada = "caja guardada verde.png", position = game.at(9, 7)))
		cajas.add(new Caja(posX = 3, posY = 7, image = "caja roja.png", cajaGuardada = "caja guardada roja.png", position = game.at(10, 7)))
		cajas.add(new Caja(posX = 1, posY = 2, image = "caja azul.png", cajaGuardada = "caja guardada azul.png", position = game.at(11, 7)))
		cajas.forEach({ x => x.iniciar()})
	}

	override method agregarObjetivos() {
		objetivos.add(new Objetivo(image = "objetivo marron.png", position = game.at(12, 12)))
		objetivos.add(new Objetivo(image = "objetivo verde.png", position = game.at(8, 12)))
		objetivos.add(new Objetivo(image = "objetivo rojo.png", position = game.at(3, 7)))
		objetivos.add(new Objetivo(image = "objetivo azul.png", position = game.at(1, 2)))
		objetivos.forEach{ x => x.iniciar()}
	}

}

object nivelDos inherits Nivel {

	override method agregarLadrillos() {
		self.agregarFilaDeLadrillos(0, 15, 0)
		self.agregarFilaDeLadrillos(3, 10, 4)
		self.agregarFilaDeLadrillos(5, 7, 9)
		self.agregarFilaDeLadrillos(10, 13, 10)
		self.agregarFilaDeLadrillos(0, 1, 8)
		self.agregarFilaDeLadrillos(1, 13, 1)
		self.agregarFilaDeLadrillos(3, 9, 11)
		self.agregarFilaDeLadrillos(1, 13, 14)
		self.agregarColumnaDeLadrillos(9, 13, 0)
		self.agregarColumnaDeLadrillos(0, 15, 0)
		self.agregarColumnaDeLadrillos(5, 7, 6)
		self.agregarColumnaDeLadrillos(5, 5, 3)
		self.agregarColumnaDeLadrillos(5, 8, 2)
		self.agregarColumnaDeLadrillos(4, 6, 11)
		self.agregarColumnaDeLadrillos(6, 7, 12)
		self.agregarColumnaDeLadrillos(1, 14, 14)
		self.agregarColumnaDeLadrillos(11, 13, 11)
		self.agregarColumnaDeLadrillos(10, 14, 12)
		self.agregarColumnaDeLadrillos(10, 14, 13)
		self.agregarColumnaDeLadrillos(2, 7, 1)
		ladrillos.forEach({ l => l.iniciar()})
	}

	override method agregarCajas() {
		cajas.add(new Caja(posX = 4, posY = 5, image = "caja gris.png", cajaGuardada = "caja guardada gris.png", position = game.at(6, 8)))
		cajas.add(new Caja(posX = 3, posY = 6, image = "caja azul.png", cajaGuardada = "caja guardada azul.png", position = game.at(9, 6)))
		cajas.add(new Caja(posX = 10, posY = 11, image = "caja verde.png", cajaGuardada = "caja guardada verde.png", position = game.at(9, 8)))
		cajas.add(new Caja(posX = 2, posY = 4, image = "caja marron.png", cajaGuardada = "caja guardada marron.png", position = game.at(10, 7)))
		cajas.add(new Caja(posX = 12, posY = 5, image = "caja roja.png", cajaGuardada = "caja guardada roja.png", position = game.at(4, 9)))
		cajas.add(new Caja(posX = 9, posY = 10, image = "caja verde apagado.png", cajaGuardada = "caja guardada verde apagado.png", position = game.at(7, 10)))
		cajas.forEach({ x => x.iniciar()})
	}

	override method agregarObjetivos() {
		objetivos.add(new Objetivo(image = "objetivo gris.png", position = game.at(4, 5)))
		objetivos.add(new Objetivo(image = "objetivo azul.png", position = game.at(3, 6)))
		objetivos.add(new Objetivo(image = "objetivo verde.png", position = game.at(10, 11)))
		objetivos.add(new Objetivo(image = "objetivo marron.png", position = game.at(2, 4)))
		objetivos.add(new Objetivo(image = "objetivo rojo.png", position = game.at(12, 5)))
		objetivos.add(new Objetivo(image = "objetivo verde apagado.png", position = game.at(9, 10)))
		objetivos.forEach{ x => x.iniciar()}
	}

	override method iniciar() {
		self.agregarLadrillos()
		self.agregarObjetivos()
		self.agregarCajas()
		game.addVisual(bros)
		game.addVisual(informacionDeAyuda)
	}

}

object nivelTres inherits Nivel {

	override method agregarLadrillos() {
		self.agregarColumnaDeLadrillos(0, 15, 0)
		self.agregarColumnaDeLadrillos(0, 14, 14)
		self.agregarColumnaDeLadrillos(2, 14, 1)
		self.agregarColumnaDeLadrillos(0, 0, 0)
		self.agregarColumnaDeLadrillos(0, 0, 0)
		self.agregarFilaDeLadrillos(0, 15, 0)
		self.agregarFilaDeLadrillos(0, 14, 14)
		self.agregarFilaDeLadrillos(12, 9, 7)
		self.agregarFilaDeLadrillos(1, 14, 1)
		self.agregarFilaDeLadrillos(2, 6, 10)
		self.agregarFilaDeLadrillos(1, 5, 4)
		self.agregarFilaDeLadrillos(4, 4, 6)
		self.agregarFilaDeLadrillos(6, 7, 6)
		self.agregarFilaDeLadrillos(7, 7, 5)
		ladrillos.forEach({ l => l.iniciar()})
	}

	override method agregarCajas() {
		cajas.add(new Caja(posX = 2, posY = 13, image = "caja marron.png", cajaGuardada = "caja guardada marron.png", position = game.at(4, 5)))
		cajas.add(new Caja(posX = 2, posY = 2, image = "caja roja.png", cajaGuardada = "caja guardada roja.png", position = game.at(5, 6)))
		cajas.add(new Caja(posX = 13, posY = 7, image = "caja verde.png", cajaGuardada = "caja guardada verde.png", position = game.at(5, 11)))
		cajas.add(new Caja(posX = 6, posY = 2, image = "caja azul.png", cajaGuardada = "caja guardada azul.png", position = game.at(3, 7)))
		cajas.forEach({ x => x.iniciar()})
	}

	override method agregarObjetivos() {
		objetivos.add(new Objetivo(image = "objetivo marron.png", position = game.at(2, 13)))
		objetivos.add(new Objetivo(image = "objetivo rojo.png", position = game.at(2, 2)))
		objetivos.add(new Objetivo(image = "objetivo verde.png", position = game.at(13, 7)))
		objetivos.add(new Objetivo(image = "objetivo azul.png", position = game.at(6, 2)))
		objetivos.forEach{ x => x.iniciar()}
	}

	override method iniciar() {
		self.agregarLadrillos()
		self.agregarObjetivos()
		self.agregarCajas()
		game.addVisual(bros)
		game.addVisual(informacionDeAyuda)
	}

}

object nivelCuatro inherits Nivel {

	override method agregarLadrillos() {
		self.agregarFilaDeLadrillos(3, 14, 14)
		self.agregarFilaDeLadrillos(2, 10, 0)
		self.agregarFilaDeLadrillos(2, 3, 5)
		self.agregarFilaDeLadrillos(0, 1, 8)
		self.agregarFilaDeLadrillos(9, 13, 12)
		self.agregarFilaDeLadrillos(7, 7, 2)
		self.agregarFilaDeLadrillos(11, 12, 8)
		self.agregarColumnaDeLadrillos(12, 14, 2)
		self.agregarColumnaDeLadrillos(11, 9, 1)
		self.agregarColumnaDeLadrillos(8, 3, 0)
		self.agregarColumnaDeLadrillos(0, 2, 1)
		self.agregarColumnaDeLadrillos(1, 3, 11)
		self.agregarColumnaDeLadrillos(4, 7, 12)
		self.agregarColumnaDeLadrillos(8, 10, 13)
		self.agregarColumnaDeLadrillos(8, 10, 7)
		self.agregarColumnaDeLadrillos(9, 10, 6)
		self.agregarColumnaDeLadrillos(8, 9, 3)
		ladrillos.forEach({ l => l.iniciar()})
	}

	override method agregarCajas() {
		cajas.add(new Caja(posX = 12, posY = 13, image = "caja marron.png", cajaGuardada = "caja guardada marron.png", position = game.at(2, 2)))
		cajas.add(new Caja(posX = 11, posY = 7, image = "caja roja.png", cajaGuardada = "caja guardada roja.png", position = game.at(5, 11)))
		cajas.add(new Caja(posX = 7, posY = 1, image = "caja azul.png", cajaGuardada = "caja guardada azul.png", position = game.at(10, 11)))
		cajas.add(new Caja(posX = 6, posY = 8, image = "caja verde.png", cajaGuardada = "caja guardada verde.png", position = game.at(7, 5)))
		cajas.forEach({ x => x.iniciar()})
	}

	override method agregarObjetivos() {
		objetivos.add(new Objetivo(image = "objetivo marron.png", position = game.at(12, 13)))
		objetivos.add(new Objetivo(image = "objetivo rojo.png", position = game.at(11, 7)))
		objetivos.add(new Objetivo(image = "objetivo azul.png", position = game.at(7, 1)))
		objetivos.add(new Objetivo(image = "objetivo verde.png", position = game.at(6, 8)))
		objetivos.forEach{ x => x.iniciar()}
	}

	method finalizarJuego() {
		game.addVisual(pantallaFinal)
	}

	override method pasarAlNivel(nivel) {
	}

	override method iniciar() {
		self.agregarLadrillos()
		self.agregarObjetivos()
		self.agregarCajas()
		game.addVisual(bros)
		game.addVisual(informacionDeAyuda)
	}

}


import bros.*
import objetos.*
import wollok.game.*
import niveles.*
import portadas.*

object juego {

	method configurar() {
	
		game.title("Sokoban Bros!")
		game.ground("fondo.png")
		game.width(15)
		game.height(15)
		inicio.iniciar()
	
		tiempo.iniciar()
		
		menuPausa.iniciar()
	}

}


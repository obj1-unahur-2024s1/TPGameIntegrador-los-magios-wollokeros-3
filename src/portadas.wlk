import wollok.game.*
import niveles.*
import bros.*


object inicio {
	method image() = "menu8.png"
	method position()= game.origin()
	method configurarTeclaInicio(){keyboard.enter().onPressDo{ if (game.hasVisual(self)) {
		game.removeVisual(self)
		nivelUno.iniciar()
		
		
		}
	}}
	method soundtrack(){
	const rain = game.sound("soundtrackSokobanBros.mp3")
	rain.shouldLoop(true)
	keyboard.k().onPressDo({rain.pause()})
	keyboard.j().onPressDo({rain.resume()})
	keyboard.m().onPressDo({rain.stop()})
	game.schedule(500, {rain.play()})
	}
	
	
	method iniciar(){ 
		game.addVisual(self)	
		self.configurarTeclaInicio()
		self.soundtrack()
	}
	
}

object menuPausa {
	
	method image() = "menuPausa.png"
	
	method position()= game.at(2,8)

	method configurarTecla(){
		keyboard.p().onPressDo{
			if (not game.hasVisual(self)) {
				game.addVisual(self)
			    self.quitarConTiempo()
			}
		}
	}
	method quitar() {
		game.removeVisual(self)
	
	}
	method quitarConTiempo(){
		game.schedule(5000,{self.quitar()})}
		
	method iniciar() {
		self.image()
		self.position()
		self.configurarTecla()
	}	
}

object imagenNivelCompleto{
		var property image="portada2.jpg"
		method position(){return game.at(0,0)}
		method agregarImagen(){game.addVisual(self)}
		method quitarConTiempo(){game.schedule(4000,{game.removeVisual(self)})}
}



object informacionDeAyuda{
	method text() = "Press P to help"
	method position() = game.at(12,14)
	method textColor()= paleta.blanco() 
}
	
object paleta{const property blanco = "#FFFFFF" }
		
object pantallaFinal { 
	method image() = "portada3.jpg"
	method position() = game.origin()
}
object tiempo {

    const property position = game.at(1,14)
    const property rojo = "#FFFFFF"
    var property tiempoSegundos = 60
    var property tiempoMiliSegundos = 0



    method text() = "tiempo : " + tiempoSegundos.toString() 

    method textColor() = rojo
	
    method configurarTecla() {
        keyboard.enter().onPressDo{ if (not game.hasVisual(self)) {
                game.addVisual(self)
                self.mostrarTiempo()
            }
        }
    }

    method iniciar() {
        self.position()
        self.configurarTecla()
    }

    method restar() { // restar
        tiempoMiliSegundos += 1
        if (tiempoMiliSegundos == 10) {
            tiempoMiliSegundos = 0
            tiempoSegundos -= 1
        }
    }

    method reset() {
        tiempoSegundos = 60
        tiempoMiliSegundos = 0
        game.removeVisual(self)
    }
	method sumarMasTiempo(){tiempoSegundos=tiempoSegundos +40}
    method tiempoTermina() {
        if ((self.tiempoSegundos())>0) {
            self.restar()
        } else {
            game.removeTickEvent("tiempo")
            game.say(self, "se acabo el tiempo!")
            game.schedule(10, { game.addVisual(gameOver)})
        }
    }

    method borrar() = game.removeTickEvent("tiempo")

    
  
  


   method mostrarTiempo() {
        game.onTick(100, "tiempo", { self.tiempoTermina()})
    }
	
}

object gameOver {

    method image() = "gameOver.jpg"

    method position() = game.origin()

}    


import portadas.*

class Animacion {
  var imagenes = []
  var indiceActual = 0
  var tiempoUltimoCambio = 0
  var intervaloCambio = 1000
  
  method inicializar() {
    imagenes = [
      "menuprincipal.jpg",
      "menuprincipal1.jpg",
      "menuprincipal2.jpg",
      "menuprincipal3.jpg",
      "menuprincipal4.jpg",
      "menuprincipal5.jpg",
      "menuprincipal6.jpg",
      "menuprincipal7.jpg"
    ]
  }
  
  method imagenActual() {
    imagenes
    [indiceActual]
  }
  
  method actualizar() {
    var tiempoActual = wkg.time.now
    
    if ((tiempoActual - tiempoUltimoCambio) > intervaloCambio) {
      tiempoUltimoCambio = tiempoActual
      indiceActual = (indiceActual + 1) % imagenes.size()
    }
  }
}
const juego = new juego()
const spriteAnimado = new Sprite()
//spriteAnimado.x = center()
//spriteAnimado.y = center()
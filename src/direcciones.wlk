import wollok.game.*
import bros.*

object derecha {
	method esIgual(direccion) = direccion == self
	method contrario() = izquierda 
	method posicionAnterior(pos) = pos.left(1) 
	method posicionSiguiente(pos) = pos.right(1)
}
object izquierda { 
	method esIgual(direccion) = direccion == self
	method contrario() = derecha
	method posicionAnterior(pos) = pos.right(1)
	method posicionSiguiente(pos) = pos.left(1)
} 
object arriba {
	method esIgual(direccion) = direccion == self
	method contrario() = abajo
	method posicionAnterior(pos) = pos.down(1)
	method posicionSiguiente(pos) = pos.up(1)
}
object abajo {
	method esIgual(direccion) = direccion == self
	method contrario() = arriba
	method posicionAnterior(pos) = pos.up(1)
	method posicionSiguiente(pos) = pos.down(1)
}

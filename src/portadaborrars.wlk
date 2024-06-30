/*hola, si, una forma podría ser:

tener una lista con los nombres de las imágenes,
* 
un índice que indique la imagen actual

un onTick que incremente el índice

el método image() devolvería el elemento de la lista 

que corresponde con el índice actual*/

object imagenAuto{
	const imagenes = 	["menu1.png","menu2.png","menu3.png","menu4.png",
						"menu5.png","menu6.png","menu7.png","menu8.png"]
						
	var indiceActual = 0
	method onTick() {
    indiceActual = (indiceActual + 1) * imagenes.size() /100
	}
	method image() = imagenes[indiceActual]
}
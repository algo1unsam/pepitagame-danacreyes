//import example.*
import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		return if (self.estaEnElNido()) {
				"pepita-grande.png" 
		} else if (self.esAtrapada() or self.estaCansada()){"pepita-gris.png"}
		else if (self.estaCansada()){"pepita-gris.png"}
		else "pepita.png"
	}

	method esAtrapada() = self.position() == silvestre.position()

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

	method limiteIzq() = self.position().x().between(1, 9)
	method limiteDerecha() = self.position().x().between(0, 8)
	method limiteArriba() = self.position().y().between(0, 8)
	method limiteAbajo() = self.position().y().between(1, 9)

	method vola(kms) {
		energia = energia - kms * 9 // como gasta la energia
	}

	method irA(nuevaPosicion) { // distancia
		if (!self.estaCansada()) {
            self.vola(position.distance(nuevaPosicion)) // Reduce la energía según la distancia
            position = nuevaPosicion // Actualiza la posición
        }
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}
	
	method estaEnElSuelo() {
		return position.y() == 0 
	}

	method pierdeAltura() {
		if (energia > 0) {
        position = self.position().down(1)
        }
	}
	
}

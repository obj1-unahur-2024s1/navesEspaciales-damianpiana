class Nave{
	
	var velocidad = 0 //km/seg
	var direccion = 0// respecto del sol entre -10 y 10
	var combustible = 0
	
	method initialize(){
		if (not direccion.between(-10,10))
		self.error("direccion incorrecta")
	}
	
	method acelerar(cuanto){
		velocidad = 100000.min(cuanto)
	}
	
	method desacelerar(cuanto){
		velocidad = 0.max(cuanto)
	}
	
	method irHaciaElSol(){
		direccion = 10
	}
	
	method escaparDelSol(){
		direccion = -10
	}
	
	method ponerseParaleloAlSol(){
		direccion = 0
	}
	
	method acercarseUnPocoAlSol(){
		direccion = 10.min(direccion + 1)
	}
	
	method alejarseUnPocoDelSol(){
		direccion = (-10).max(direccion - 1)
	}
	
	method prepararViaje()	

	method cargarCombustible(unaCantidad) {
		combustible += unaCantidad
	}
	
	method desargarCombustible(unaCantidad) {
		combustible -= unaCantidad
	}
	
	method accionAdicional(){
		self.cargarCombustible(30000)
		self.acelerar(5000)
	}
	
}

class NaveBaliza inherits Nave{
	var color 
		
	method initialize(){
		self.validarColores(color)
	}
	
	override method prepararViaje(){
		self.cambiarColorDeBaliza("verde")
		self.ponerseParaleloAlSol()
		self.accionAdicional()
	}
	
	method validarColores(unColor) {
		if(["rojo","verde","azul"].contains(color))
		self.error("Color no valido")
	}
	
	method cambiarColorDeBaliza(colorNuevo){
		self.validarColores(colorNuevo)
		color = colorNuevo
	}
			
}

class NavePasajeros inherits Nave{
	var property cantidadPasajeros = 0
	var bebida = 0
	var comida = 0
	
	method cargarBebida(unaCantidad) {
		bebida += unaCantidad
	}
	
	method descargarBebida(unaCantidad) {
		bebida -= unaCantidad
	}
	
	method cargarComida(unaCantidad) {
		comida += unaCantidad
	}
	
	method descargarComida(unaCantidad) {
		comida -= unaCantidad
	}
	
	override method prepararViaje(){
		
		self.cargarComida(4*cantidadPasajeros)
		self.cargarBebida(6*cantidadPasajeros)
		self.acercarseUnPocoAlSol()
		self.accionAdicional()
	}
}

class NaveCombate inherits Nave{
	var visibilidad = true
	var misilesDesplegados = false
	const mensajesEmitidos = []
	
	method ponerseVisible() {
		visibilidad = true
	}
	
	method ponerseInvisible() {
		visibilidad = false
	} 
	
	method estaInvisible() = not visibilidad
	
	method desplegarMisiles(){
		misilesDesplegados = true	
	}	
	
	method replegarMisiles(){
		misilesDesplegados = false
	}
	
	method misilesDesplegados() = misilesDesplegados
	
	method emitirMensaje(unMensaje){
		mensajesEmitidos.add(unMensaje)
	}
	
	method mensajesEmitidos() = mensajesEmitidos	

	method primerMensajeEmitido() = mensajesEmitidos.first()
	
	method ultimoMensajeEmitido() = mensajesEmitidos.last()
	
	method esEscueta() = mensajesEmitidos.any{mensajeEmitido => mensajeEmitido > 30}
	
	method emitioMensaje(unMensaje){
		mensajesEmitidos.contains(unMensaje)
	}
		 
	override method prepararViaje(){
		self.ponerseInvisible()
		self.desplegarMisiles()
		self.acelerar(15000)
		self.emitirMensaje("Saliendo en Mision")
		self.accionAdicional()
	}
	
	override method accionAdicional(){
		self.accionAdicional()
		self.acelerar(15000)
	}
}

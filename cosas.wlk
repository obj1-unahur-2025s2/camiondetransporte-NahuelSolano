object knightRider {
    method peso() = 500;
    method peligrosidad() = 10;
}

object bumblebee {
    var estadoBumblebee = self.auto()
    
    method peso() = 800;
    method peligrosidad() = estadoBumblebee

    method auto() = 15;
    method robot() = 30;

    method transformarEnRobot() {
      estadoBumblebee = self.robot()
      return estadoBumblebee;
    }
}

object paqueteLadrillos {

    var cantLadrillos = 0;

    method peso() = cantLadrillos * 2;
    method peligrosidad() = 2

    method cantidadDeLadrillos(ladrillos) {
        cantLadrillos = ladrillos;
    }
}

object arena {
    var peso = 0
    
    method peso() = peso;
    method peligrosidad() = 1;

    method pesoArena(pesoArena) {
      peso = pesoArena;
    }
}

object bateria {

    var estadoBateria = 0
    var peligroBateria = 0

    method peso() = estadoBateria;
    method peligrosidad() = peligroBateria; 

    method cargado() {
        estadoBateria = 300;
        peligroBateria = 100;
    }

    method descargado() {
      estadoBateria = 200;
      peligroBateria = 0;
    }
}

object contenedor {
    var listaObjetos = [];
    var peso = 0;
    var peligrosidad = 0;

    method peso() = 100 + peso;
    method peligrosidad() = 0 + peligrosidad;  

    method meterObjeto(objeto) {
        listaObjetos.add(objeto)
    }
    method pesoListaObjetos() {
        peso = listaObjetos.sum({o => o.peso()})
    }
    method peligrosidadObjetos(){
        peligrosidad = listaObjetos.max({o => o.peligrosidad()})
    }
}

object residuos {
    var peso = 0;
  
    method peso() = peso;
    method peligrosidad() = 200; 
  
    method cambiarPeso(unPeso){
        peso = unPeso;
    }
}

object embalaje {
    var peso = 0;
    var peligrosidad = 0;

    method peso() = peso;
    method peligrosidad() = peligrosidad / 2;

    method objectoEmbalado(objeto) {
      peso = objeto.peso()
      peligrosidad = objeto.peligrosidad()
    } 
}

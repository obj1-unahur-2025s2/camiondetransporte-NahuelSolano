import cosas.*;

object camion {

    var listaObjetosCamion = [];
    var pesoTotal = 0;

    method peso() = 1000 + pesoTotal;

    method cargarObjeto(objeto) {
        listaObjetosCamion.add(objeto)
    }

    method descargarObjetos(objeto) {
        listaObjetosCamion.remove(objeto)
    }

    method pesoListaObjetosDelCamion() {
        pesoTotal = listaObjetosCamion.sum({o => o.peso()})
    }

    method todosLosPesosSonPares() {
        return listaObjetosCamion.all({o => o.peso().even()})
    }

    method hayObjetoQuePeseMasDe(unPeso) {
        return listaObjetosCamion.any({ o => o.peso() >= unPeso})
    }

    method objetoConNivelDePeligrosidad(nivelPeligrosidad){
        return listaObjetosCamion.find({ o => o.peligrosidad() == nivelPeligrosidad})  
    }

    method objetosConPeligrosidadMayorA(minimoPeligrosidad){
        return listaObjetosCamion.filter({o=>o.peligrosidad() >= minimoPeligrosidad})
    }

    method objetosConPeligrosidadMayorAlObjeto(unObjeto){
        var peligrosidadDeObjeto = 0
        peligrosidadDeObjeto = unObjeto.peligrosidad()
        return listaObjetosCamion.filter({o=>o.peligrosidad() > peligrosidadDeObjeto})
    }

    method noSuperaElPesoMaximo() {
        return 2500 >= self.peso();
    }

    method noSuperaElNivelMaximoDePeligrosidad(maximoDePeligrosidad){
        return listaObjetosCamion.all({ o => o.peligrosidad() < maximoDePeligrosidad})
    }

    method puedeCircularEnUnaRutaConPeligrosidad(maximoDePeligrosidad) {
        return self.noSuperaElPesoMaximo() && self.noSuperaElNivelMaximoDePeligrosidad(maximoDePeligrosidad)
    }

    method cosaConPesoEntre(maximo, minimo) {
        var pesoMaximo = 0;
        
        pesoMaximo = listaObjetosCamion.filter({ o => o.peso() <= maximo })

        return pesoMaximo.any({ o => o.peso() >= minimo })
    }

    method cosaMasPesada() {
      return listaObjetosCamion.max({o => o.peso()})
    }
}

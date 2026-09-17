object tom{

var energia = 100

method velocidad() = 5 + (energia / 10)

method interrumpirSuenio(){
    energia -= 20

}

method saberEnergia() = energia


method limpiarCasa(){
    casa.limpiar(100)
    energia -= 40
}

method puedeSacarQuilombero(quilombero) = self.masRapidoQue(quilombero)

method masRapidoQue(quilombero) = self.velocidad() > quilombero.velocidad()

method dormir(){energia += 50}

}

object roboCat{

method velocidad(){}

method interrumpirSuenio(){}

method limpiarCasa(){
    casa.limpiar(999999999999999999999999999999999999999999)
}

method puedeSacarQuilombero(quilombero) = true

method dormir(){}

}

object jerry{

    var peso = 3

    method hacerQuilombo(){
        casa.suciedad(110)
        peso += 1
    }

    method velocidad() =  10 - peso
}

object tuffy{

    method velocidad() = 10

    method hacerQuilombo(){
        casa.hacerRuido()
    }
}

object pandilla{

const integrantes = [jerry, tuffy]

method velocidad() = integrantes.map({ integrante => integrante.velocidad() }).min()

method hacerQuilombo(){
    if(integrantes.size() > 3) casa.hacerRuido()
    integrantes.forEach({integrante => integrante.hacerQuilombo()})
}
}

object casa{
    var cuidador = tom
    var quilombero = jerry
    var suciedad = 1309483928490823

    method asignarCuidador(nuevoCuidador){
        cuidador = nuevoCuidador
    }
    method asignarQuilombero(nuevoQuilombero){
        quilombero = nuevoQuilombero
    }

    method pasarDia(){
        cuidador.limpiarCasa()
        if(cuidador.puedeSacarQuilombero(quilombero)) quilombero = null
        }

    method pasarNoche(){
    cuidador.dormir()
    if(quilombero != null)quilombero.hacerQuilombo()
    }

    method limpiar(nivelDeSuciedad){
        suciedad = (suciedad - nivelDeSuciedad).max(0)
    }

    method suciedad(nivelDeSuciedad){
        suciedad += nivelDeSuciedad 
    }

    method hacerRuido(){
        cuidador.interrumpirSuenio()
    }

    method saberSuciedad() = suciedad

    method saberQuilombero() = quilombero  

    method saberCuidador() = cuidador 
}

object flox{

method velocidad() = 1000

method interrumpirSuenio(){}

method limpiarCasa(){
    casa.limpiar(0)
}

method puedeSacarQuilombero(quilombero) = false

method dormir(){}

}

object speedyGonzalez{

    method velocidad() = 99999999999999

    method hacerQuilombo(){
        casa.hacerRuido()
        casa.suciedad(9999999999999999)
    }
}

/*     interfaz cuidadores      

method velocidad()

method interrumpirSuenio()

method limpiarCasa()

method puedeSacarQuilombero(quilombero)

method dormir(){}

--------------------------------------------------
        interfaz quilombero

 method velocidad() 

method hacerQuilombo()

*/


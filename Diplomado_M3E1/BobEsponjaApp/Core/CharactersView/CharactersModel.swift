//
//  CharactersModel.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 17/10/26.
//

import Foundation
import UIKit

struct CharacterSection{
    let title: String
    let characters: [CharactersModel]
}

struct CharactersModel {
    let image: String
    let alias: String
    let name: String
    let lastName: String?
    var fullName: String   {
        if let lastName {
            return "\(name) \(lastName)"
        }
        return name
    }
    let species: String
    let occupation: String
    let description: String
}

class characterTableViewModel {
    let characters: [CharactersModel]
    
    private(set) var filterCharacters: [CharactersModel] = []
    private(set) var sections: [CharacterSection] = []
    init() {
        characters = [
            CharactersModel(
                            image: "arenita",
                            alias: "Arenita",
                            name: "Sandra Jeniffer Olivia",
                            lastName: "Mejillas",
                            species: "Ardilla",
                            occupation: "Científica",
                            description: "Arenita es una ardilla originaria de Texas que vive en Fondo de Bikini dentro de una cúpula llena de aire. Es científica, inventora y una apasionada de los desafíos que ponen a prueba su inteligencia y su fuerza. Para explorar el océano utiliza un traje especial que le permite respirar bajo el agua.\nDisfruta practicar karate con Bob Esponja y participar en aventuras que requieren valentía e ingenio. Aunque está muy orgullosa de sus raíces texanas, ha encontrado en sus amigos del mar una segunda familia. Su curiosidad la impulsa a experimentar y buscar soluciones, incluso cuando sus inventos provocan situaciones inesperadas."
                        ),
                        CharactersModel(
                            image: "bobsponja",
                            alias: "Bob Esponja",
                            name: "Bob Esponja",
                            lastName: "Pantalones Cuadarados",
                            species: "Esponja marina",
                            occupation: "Cocinero",
                            description: "Bob Esponja es una esponja marina alegre y optimista que vive en una piña en Fondo de Bikini junto a su mascota Gary. Trabaja como cocinero en el Crustáceo Cascarudo, donde prepara cangreburgers con una dedicación extraordinaria. Para él, cada jornada es una oportunidad para disfrutar de lo que hace y ayudar a los demás.\nEn su tiempo libre le gusta atrapar medusas, hacer burbujas y compartir aventuras con su mejor amigo, Patricio. Su entusiasmo puede desesperar a quienes lo rodean, especialmente a Calamardo, pero sus buenas intenciones casi nunca cambian. Encuentra diversión en las cosas más sencillas y siempre está dispuesto a intentarlo de nuevo."
                        ),
                        CharactersModel(
                            image: "calamardo",
                            alias: "Calamardo",
                            name: "Calamardo",
                            lastName: "Tentáculos",
                            species: "Pulpo",
                            occupation: "Cajero",
                            description: "Calamardo es un pulpo que trabaja como cajero en el Crustáceo Cascarudo y vive entre las casas de Bob Esponja y Patricio. Prefiere la tranquilidad, el orden y los momentos de soledad, algo difícil de conseguir con vecinos tan entusiastas. Su carácter serio y sus comentarios sarcásticos reflejan la frustración que siente ante el ruido y las interrupciones constantes.\nSu verdadera pasión está en el arte: disfruta tocar el clarinete, pintar y soñar con una vida en la que su talento sea reconocido. Aunque suele mostrarse distante, en ocasiones deja ver un lado sensible y afectuoso. Detrás de su mal humor existe un profundo deseo de sentirse valorado."
                        ),
                        CharactersModel(
                            image: "chico_percebe",
                            alias: "Chico Percebe",
                            name: "Chico Percebe",
                            lastName: nil,
                            species: "Humano",
                            occupation: "Superhéroe",
                            description: "Chico Percebe es el compañero de aventuras de Hombre Sirena y forma parte de una legendaria pareja de superhéroes admirada por Bob Esponja y Patricio. Después de muchos años combatiendo villanos, lleva una vida más tranquila, aunque las emergencias y la insistencia de sus admiradores suelen interrumpir su descanso.\nEs más serio y práctico que su compañero, y con frecuencia se impacienta cuando los demás lo tratan como a un niño por su nombre de héroe. Su experiencia y su sentido de la responsabilidad siguen siendo importantes cuando llega el momento de actuar. A pesar de sus quejas, mantiene un fuerte vínculo con Hombre Sirena."
                        ),
                        CharactersModel(
                            image: "donCangrejo",
                            alias: "Don Cangrego",
                            name: "Eugenio Harold",
                            lastName: "Cangrejo",
                            species: "Cangrejo",
                            occupation: "Dueño de restaurante",
                            description: "Don Cangrejo es el dueño del Crustáceo Cascarudo, uno de los restaurantes más conocidos de Fondo de Bikini. Es un empresario ahorrador cuya mayor obsesión es ganar dinero y proteger la fórmula secreta de las cangreburgers. Supervisa el trabajo de Bob Esponja y Calamardo mientras busca nuevas maneras de aumentar las ganancias.\nSu rivalidad con Plankton da lugar a constantes intentos de robo, trampas y enfrentamientos entre restaurantes. Sin embargo, su vida no gira únicamente alrededor del negocio: también es el padre de Perlita, a quien quiere profundamente. A menudo debe encontrar un equilibrio entre su cariño por ella y su dificultad para gastar dinero."
                        ),
                        CharactersModel(
                            image: "gary",
                            alias: "Gary",
                            name: "Gary",
                            lastName: nil,
                            species: "Caracol marino",
                            occupation: "Mascota",
                            description: "Gary es el caracol marino de Bob Esponja y su compañero en la casa con forma de piña. Aunque se comunica principalmente mediante maullidos, logra expresar con claridad cuándo tiene hambre, está molesto o necesita atención. Su comportamiento tranquilo contrasta con la energía inagotable de su dueño.\nCon frecuencia demuestra más sentido común del que los demás esperan de una mascota. Observa las situaciones con calma y acompaña a Bob Esponja tanto en los momentos felices como en los difíciles. Su relación está llena de cariño, pequeñas rutinas y alguna que otra travesura que convierte la vida en casa en una aventura."
                        ),
                        CharactersModel(
                            image: "hombre_sirena",
                            alias: "Sireno man",
                            name: "Sireno man",
                            lastName: nil,
                            species: "Humano",
                            occupation: "Superhéroe",
                            description: "Hombre Sirena es un superhéroe retirado que durante años protegió los mares junto a su inseparable compañero, Chico Percebe. Sus hazañas lo convirtieron en un ídolo para Bob Esponja y Patricio, quienes lo admiran y buscan cualquier oportunidad para acercarse a él. Conserva su traje y algunos de los objetos que utilizaba en sus aventuras.\nAunque la edad y sus despistes complican su vida cotidiana, todavía conserva el impulso de enfrentarse al mal. Puede pasar de la confusión al entusiasmo en cuestión de segundos, especialmente cuando recuerda su pasado heroico. Su amistad con Chico Percebe sigue siendo el corazón de sus aventuras."
                        ),
                        CharactersModel(
                            image: "karen",
                            alias: "Karen",
                            name: "Karen",
                            lastName: "Plankton",
                            species: "Computadora",
                            occupation: "Asistente",
                            description: "Karen es una computadora inteligente y la compañera de Plankton en el Balde de Carnada. Participa en sus planes para conseguir la fórmula secreta de las cangreburgers, aportando cálculos, ideas y análisis. Su capacidad para evaluar los problemas suele superar la paciencia que tiene para soportar las decisiones impulsivas de Plankton.\nDestaca por su humor sarcástico y por señalar los errores que su compañero prefiere ignorar. Aunque a menudo parece ser la voz más sensata del restaurante, también se involucra en sus disparatadas aventuras. Su personalidad demuestra que, incluso entre circuitos y pantallas, hay espacio para el carácter, el afecto y la frustración."
                        ),
                        CharactersModel(
                            image: "larry",
                            alias: "Larry la langosta",
                            name: "Larry Timothy",
                            lastName: "Langosta",
                            species: "Langosta",
                            occupation: "Salvavidas",
                            description: "Larry es una langosta fuerte y deportista que suele encontrarse en la playa de Laguna Pegajosa. Trabaja como salvavidas y disfruta de las actividades al aire libre, el ejercicio y los retos físicos. Su energía y su confianza lo convierten en una figura conocida entre los habitantes de Fondo de Bikini.\nLe gusta mantenerse en forma y compartir su entusiasmo por el deporte con los demás. Aunque su apariencia puede resultar intimidante, suele mostrarse amistoso y dispuesto a participar en las actividades de la comunidad. Para Larry, una buena jornada incluye movimiento, sol y la oportunidad de superar una nueva meta."
                        ),
                        CharactersModel(
                            image: "patricio",
                            alias: "Patricio",
                            name: "Patricio",
                            lastName: "Estrella",
                            species: "Estrella de mar",
                            occupation: "Desempleado",
                            description: "Patricio es una estrella de mar que vive debajo de una roca y es el mejor amigo de Bob Esponja. Disfruta dormir, comer y pasar el tiempo sin demasiadas preocupaciones. Su manera de interpretar el mundo suele ser tan sencilla como impredecible, lo que provoca confusiones y situaciones muy divertidas.\nSiempre está dispuesto a acompañar a Bob Esponja a atrapar medusas o a embarcarse en una aventura improvisada. Aunque sus consejos no suelen resolver los problemas, su compañía ocupa un lugar especial en la vida de su amigo. Entre ocurrencias absurdas y momentos de inesperada lucidez, Patricio convierte cualquier día común en algo memorable."
                        ),
                        CharactersModel(
                            image: "perlita",
                            alias: "Perlita",
                            name: "Perlita",
                            lastName: "Cangrejo",
                            species: "Ballena",
                            occupation: "Estudiante",
                            description: "Perlita es una ballena adolescente y la hija de Don Cangrejo. Le encanta salir con sus amigas, escuchar música, ir de compras y participar en actividades escolares. Tiene una personalidad expresiva y vive con intensidad tanto los momentos emocionantes como las pequeñas dificultades de la adolescencia.\nSus gustos suelen chocar con la costumbre de su padre de ahorrar hasta el último centavo. Esto provoca discusiones especialmente cuando se trata de fiestas, ropa o celebraciones importantes. A pesar de sus diferencias, ambos se quieren mucho, y Perlita busca encontrar su propio espacio mientras aprende a convivir con las peculiaridades de su familia."
                        ),
                        CharactersModel(
                            image: "plankton",
                            alias: "Plankton",
                            name: "Sheldon J.",
                            lastName: "Plankton",
                            species: "Plancton",
                            occupation: "Dueño de restaurante",
                            description: "Plankton es el diminuto dueño del Balde de Carnada y el rival constante de Don Cangrejo. Su gran objetivo es conseguir la fórmula secreta de las cangreburgers para convertir su restaurante en un éxito. Para lograrlo diseña máquinas, disfraces y estrategias que suelen ser mucho más complicadas de lo necesario.\nCuenta con la ayuda de Karen, aunque su orgullo le impide escuchar muchos de sus consejos. Su ambición contrasta con su pequeño tamaño y con los repetidos fracasos de sus planes. Aun así, rara vez se rinde: cada derrota se transforma rápidamente en una nueva idea para intentar superar al Crustáceo Cascarudo."
                        ),
                        CharactersModel(
                            image: "senora_puff",
                            alias: "Señora Puff",
                            name: "Virginia",
                            lastName: "Puff",
                            species: "Pez globo",
                            occupation: "Instructora de conducción",
                            description: "La señora Puff es un pez globo que trabaja como instructora en una escuela de conducción de Fondo de Bikini. Enseña a sus alumnos a manejar botes y procura mantener la calma incluso en las lecciones más complicadas. Su mayor desafío es Bob Esponja, cuyo nerviosismo al volante convierte muchos exámenes en auténticos desastres.\nCuando se asusta o se encuentra bajo demasiada presión, se infla como una reacción característica de su especie. Aunque las clases de Bob Esponja ponen a prueba su paciencia, sigue intentando cumplir con su trabajo. Su vida cotidiana combina el deseo de tranquilidad con las consecuencias impredecibles de tener al alumno más entusiasta de la ciudad."
                        )
        ]
        
//        filterCharacters = characters
        upDateSections()
    }
    
    private func upDateSections(){
        let grouped = Dictionary(grouping: filterCharacters, by: \.occupation)
        sections = grouped.keys.sorted().map({ title in
            CharacterSection(title: title, characters: grouped[title] ?? [])
        })
    }
    
    func getNumberOfSection() -> Int {
        sections.count
    }
    
    func getNumberOfRows(section: Int) -> Int {
        sections[section].characters.count
    }
    
    func getCharacter(index: IndexPath) -> CharactersModel {
        sections[index.section].characters[index.row]
    }
    
    func getTitle(section: Int) -> String {
        sections[section].title
    }
    
    func filterCharacters(with text: String) {
        let query = text.trimmingCharacters(in: .whitespacesAndNewlines)
        if query.isEmpty {
            filterCharacters = characters
        }else {
            filterCharacters = characters.filter{
                $0.fullName.localizedStandardContains(query) ||
                $0.species.localizedStandardContains(query) ||
                $0.occupation.localizedStandardContains(query) ||
                $0.alias.localizedStandardContains(query)
            }
        }
        upDateSections()
    }
}

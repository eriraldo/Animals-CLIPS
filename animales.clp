;-------------------------------------------------------------
; Reglas para di�logo con el usuario                         |
;-------------------------------------------------------------
;(defrule read-input
;(initial-fact)
;=>
;(printout t "Name a primary color" crlf)
;(assert (color (read))))

;-------------------------------------------------------------
;     Reglas de aplicación de las pruebas de identificación  |
;-------------------------------------------------------------
(deffacts main-control
   (entrada))

(defrule Rt1 "Test 1 de apariencia (general)"
(entrada)
=>
(printout t "Cual es la apariencia del animal?, es decir:" crlf)
(printout t "a. Tiene pelo" crlf)
(printout t "b. Tiene plumas" crlf)
(printout t "c. No se aprecia bien" crlf)
(printout t "(responder a/b/c): ")
(assert (apariencia (read))))

(defrule Rt2 "Test 2 de apariencia (general)"
(reconocerCria ?x)
=>
(printout t "a. Las alimenta con leche?" crlf)
(printout t "b. Pone huevos?" crlf)
(printout t "c. Sin crías" crlf)
(printout t "(responder a/b/c): ")
(assert (crias (read))))

(defrule Rt3 "Test 3 de apariencia (general)"
(pone_huevos ?x)
=>
(printout t "a. El animal posee cuatro patas" crlf)
(printout t "b. El animal posee dos patas" crlf)
(printout t "(responder a/b): ")
(assert (apariencia_cria (read))))

(defrule Rt4 "Test 4 de apariencia (general)"
(ave ?x)
=>
(printout t "a. El animal puede volar" crlf)
(printout t "b. El animal no tiene capacidad de vuelo" crlf)
(printout t "(responder a/b): ")
(assert (capacidad_vuelo (read))))

(defrule Rt5 "Apariencia (no volador)"
(no_vuela)
=>
(printout t "a. Su color es blanco y negro" crlf)
(printout t "b. Posee cuello largo" crlf)
(printout t "(responder a/b): ")
(assert (apariencia_no_volador (read))))

(defrule Rt6 "Calidad vuelo"
(vuela)
=>
(printout t "a. Vuela muy bien" crlf)
(printout t "b. Otra" crlf)
(printout t "(responder a/b): ")
(assert (calidad_vuelo (read))))

(defrule Rt7 "Alimentación ave"
(vuela_bien)
=>
(printout t "a. Consume crustáceos" crlf)
(printout t "b. Consume otras aves" crlf)
(printout t "(responder a/b): ")
(assert (alimentacion_ave (read))))
;-------------------------------------------------------------
;       Reglas para el S.E. de identificación de animales   |
;-------------------------------------------------------------
;Apariencia
(defrule R1 "cobertura de piel 1" 
	(apariencia a) 
	=>
	(assert (pelo apariencia)))

(defrule R2 "cobertura de piel 2" 
	(apariencia b) 
	=>
	(assert (plumas apariencia)))

(defrule R3 "cobertura de piel 3" 
	(apariencia c) 
	=>
	(assert (reconocerCria apariencia)))

;Al menos que haya un camino a salamandra, no que sea con la primer respuesta
;(defrule R4 "cobertura de piel 4" 
	;(apariencia d) 
	;=>
	;(assert (piel_desnuda apariencia)))
(defrule R4 "dos patas, pone huevos"
	(pone_huevos ?x)
	(dos_patas ?x)
	=>
	(assert (ave ?x)))

(defrule R5 "pelo"
	(pelo ?x)
	=>
	(assert (mamifero ?x)))

(defrule R6 "plumas"
	(plumas ?x)
	=>
	(assert (ave ?x)))

;Crías
(defrule R7 "Tipo cría 1" 
	(crias a) 
	=>
	(assert (da_leche cria)))

(defrule R8 "Tipo cría 2" 
	(crias b) 
	=>
	(assert (pone_huevos cria)))

(defrule R9 "Tipo cría 3" 
	(crias c) 
	=>
	(assert (desconocido cria)))

(defrule R10 "dar leche" 
	(da_leche ?x) 
	=>
	(assert (mamifero cria)))

;Apariencia por cria
(defrule R11 "Cuatro patas cría"
	(apariencia_cria a)
	=>
	(assert (cuatro_patas cria))
	(assert (piel_desnuda cria)))

(defrule R12 "Dos patas cría"
	(apariencia_cria b)
	=>
	(assert (dos_patas cria)))

;Capacidad de vuelo
(defrule R13 "Puede volar"
	(capacidad_vuelo a)
	=>
	(assert (vuela)))

(defrule R14 "No puede volar"
	(capacidad_vuelo b)
	=>
	(assert (no_vuela)))

;Apariencia (No volador)
(defrule R15 "Color blanco y negro"
	(apariencia_no_volador a)
	=>
	(assert (color_blanco_negro))
	(assert (nada)))

(defrule R16 "Cuello largo"
	(apariencia_no_volador b)
	=>
	(assert (cuello_largo))
	(assert (patas_largas)))

;Calidad vuelo
(defrule R17 "Vuela muy bien"
	(calidad_vuelo a)
	=>
	(assert (vuela_bien)))

(defrule R18 "Otro"
	(calidad_vuelo b)
	=>
	(assert (desconocido calidad_vuelo)))

;Alimentación ave
(defrule R19 "Consume crustáceos"
	(alimentacion_ave a)
	=>
	(assert (come_crustaceos)))

(defrule R20 "Otro"
	(alimentacion_ave b)
	=>
	(assert (come_aves)))



;Animales
(defrule A1 "Salamandra"
	(piel_desnuda ?x)
	(cuatro_patas ?x)
	=>
	(assert (animal salamandra))
	(printout t "El animal es una salamandra" crlf))

(defrule A2 "Pingüino"
	(ave ?x)
	(no_vuela)
	(nada)
	(color_blanco_negro)
	=>
	(assert (animal pinguino))
	(printout t "El animal es un Pingüino" crlf))

(defrule A3 "Avestruz"
	(ave ?x)
	(no_vuela)
	(cuello_largo)
	(patas_largas)
	=>
	(assert (animal avestruz))
	(printout t "El animal es un avestruz" crlf))

(defrule A4 "Desconocido"
	(desconocido ?x)
	=>
	(assert (animal desconocido))
	(printout t "El animal es desconocido" crlf))

(defrule A5 "Albatros"
	(ave ?x)
	(vuela_bien)
	(come_crustaceos)
	=>
	(assert (animal albatros))
	(printout t "El animal es un albatros" crlf))

(defrule A6 "Halcón peregrino"
	(ave ?x)
	(vuela_bien)
	(come_aves)
	=>
	(assert (animal halcon_peregrino))
	(printout t "El animal es un halcón peregrino" crlf))

			;--------------------------------------------------------------------
			;==================> Diálogo con el usuario   <=====================|
			;--------------------------------------------------------------------

;Ejecución principal
(deffacts main-control
   (entrada))

;Template para el backtrace
(deftemplate Backtrace
   (slot id (type STRING) (default ?DERIVE))
   (slot informacion (type STRING) (default ?DERIVE)))

;Imprimir todos los facts
(defrule Backtrace
=>
(do-for-all-facts ((?f Backtrace)) (printout t "	-"?f:informacion crlf)))


;-------------------------------------------------------------
;        Reglas de aplicación para la apariencia  	     	  |
;-------------------------------------------------------------

;Apariencia 1
(defrule Rt1 "Test 1: Apariencia general"
(entrada)
=>
(printout t crlf "¿Cual es la apariencia del animal?" crlf)
(printout t "	a. Tiene pelo" crlf)
(printout t "	b. Tiene plumas" crlf)
(printout t "	c. No se aprecia bien" crlf)
(printout t "(Por favor responda a/b/c): ")
(assert (apariencia (read))))

;-------------------------------------------------------------
;     Reglas de aplicación para las crías   	     		  |
;-------------------------------------------------------------

;Crías 1
(defrule Rt2 "Test 2: Crías"
(reconocerCria ?x)
=>
(printout t crlf "¿Cómo es la relación del animal con sus crías?" crlf)
(printout t "	a. Alimenta a sus crías con leche" crlf)
(printout t "	b. El animal pone huevos" crlf)
(printout t "	c. El animal no posee crías" crlf)
(printout t "(Por favor responda a/b/c): ")
(assert (crias (read))))

;-------------------------------------------------------------
;       Reglas 2 de aplicación para la apariencia  	      |
;-------------------------------------------------------------

;Apariencia 3
(defrule Rt3 "Test 3: Apariencia general respecto sus patas"
(pone_huevos ?x)
=>
(printout t crlf "¿Cuál es la apariencia del animal respecto a sus patas?" crlf)
(printout t "	a. El animal posee cuatro patas" crlf)
(printout t "	b. El animal posee dos patas" crlf)
(printout t "(Por favor responda a/b): ")
(assert (apariencia_cria (read))))


;-------------------------------------------------------------
;     Reglas de aplicación para la aves	          			  |
;-------------------------------------------------------------

;Aves 1
(defrule Rt4 "Test 4: Aves (voladoras)"
(ave ?x)
=>
(printout t crlf "Parece ser que el animal es un ave" crlf)
(printout t "¿Cuál es su capacidad de vuelo?" crlf)
(printout t "	a. El animal puede volar" crlf)
(printout t "	b. El animal no tiene capacidad de vuelo" crlf)
(printout t "(Por favor responda a/b): ")
(assert (capacidad_vuelo (read))))

;Aves 2
(defrule Rt5 "Test 5: Aves (no voladores)"
(no_vuela)
=>
(printout t crlf "¿Cuál es la apariencia del ave en cuanto a los siguiente?" crlf)
(printout t "	a. Su color es blanco y negro" crlf)
(printout t "	b. Posee cuello largo" crlf)
(printout t "(Por favor responda a/b): ")
(assert (apariencia_no_volador (read))))

;Aves 3
(defrule Rt6 "Test 6: Aves (Calidad de vuelo)"
(vuela)
=>
(printout t crlf "¿Cuál es la calidad de vuelo del animal?" crlf)
(printout t "	a. Vuela muy bien" crlf)
(printout t "	b. Otra" crlf)
(printout t "(Por favor responda a/b): ")
(assert (calidad_vuelo (read))))

;Aves 4
(defrule Rt7 "Test 7: Aves (Tamaño alas)"
(vuela_bien)
=>
(printout t crlf "¿Cómo son las alas del ave?" crlf)
(printout t "	a. Son pequeñas" crlf)
(printout t "	b. son grandes" crlf)
(printout t "(Por favor responda a/b): ")
(assert (alas_ave (read))))

;-------------------------------------------------------------
;     Reglas de aplicación para mamíferos        			  |
;-------------------------------------------------------------

;Mamífero 1
(defrule Rt8 "Test 8: Mamíferos (Alimentación)"
(mamifero ?x)
=>
(printout t crlf "Parece ser que el animal es un mamífero" crlf)
(printout t "¿Cómo es la alimentación del animal?" crlf)
(printout t "	a. El animal come carne" crlf)
(printout t "	b. El animal come plantas" crlf)
(printout t "	c. El animal no está comiendo" crlf)
(printout t "(Por favor responda a/b/c): ")
(assert (alimentacion_mamifero (read))))

;Mamífero 2
(defrule Rt9 "Test 9: Mamíferos carnívoros (Color leonardo)"
(carnivoro ?x)
=>
(printout t crlf "Parece ser que el mafímero tiene color leonado" crlf)
(printout t "¿Qué otra característica puede distinguir de su color?" crlf)
(printout t "	a. El animal tiene franjas negras" crlf)
(printout t "	b. El animal tiene manchas oscuras" crlf)
(printout t "(Por favor responda a/b): ")
(assert (apariencia_mamifero_carnivoro (read))))

;Mamífero 3
(defrule Rt10 "Test 10: Mamíferos (No están comiendo)"
(no_come)
=>
(printout t crlf "¿Qué otra característica puede distinguir del animal?" crlf)
(printout t "	a. El animal tiene garras y dientes agudos" crlf)
(printout t "	b. El animal tiene pezuñas" crlf)
(printout t "(Por favor responda a/b): ")
(assert (apariencia_mamifero_no_come (read))))

;-------------------------------------------------------------
;     Reglas de aplicación para mamíferos ungulados			  |
;-------------------------------------------------------------

;ungulado 1
(defrule Rt11 "Test 11: Apariencia mamífero ungulado"
(ungulado ?x)
=>
(printout t crlf "Parece ser que el animal es un mamífero ungulado" crlf)
(printout t "¿Qué otra característica puede distinguir de su apariencia?" crlf)
(printout t "	a. El animal tiene franjas negras y color blanco" crlf)
(printout t "	b. El animal tiene patas largas, cuello largo y color leonado" crlf)
(printout t "(Por favor responda a/b): ")
(assert (apariencia_mamifero_ungulado (read))))


			;--------------------------------------------------------------------------------------
			;=======> Reglas para el S.E de identificación de animalesDiálogo con el usuario<=====|
			;--------------------------------------------------------------------------------------

;Apariencia 1
(defrule R1 "cobertura de piel 1" 
	(apariencia a) 
	=>
	(assert (Backtrace (id "a") (informacion "El animal tiene pelo")))	
	(assert (pelo apariencia)))

;Apariencia 2
(defrule R2 "cobertura de piel 2" 
	(apariencia b) 
	=>
	(assert (Backtrace (id "b") (informacion "El animal tiene plumas")))	
	(assert (plumas apariencia)))

;Apariencia 3
(defrule R3 "cobertura de piel 3" 
	(apariencia c) 
	=>
	(assert (Backtrace (id "c") (informacion "Identificación de crías")))	
	(assert (reconocerCria apariencia)))

;Al menos que haya un camino a salamandra, no que sea con la primer respuesta
;(defrule R4 "cobertura de piel 4" 
	;(apariencia d) 
	;=>
	;(assert (piel_desnuda apariencia)))

;Apariencia 4
(defrule R4 "dos patas, pone huevos"
	(pone_huevos ?x)
	(dos_patas ?x)
	=>
	(assert (Backtrace (id "d") (informacion "El ave identificada pone huevos y posee dos patas")))	
	(assert (ave ?x)))

;Apariencia 5
(defrule R5 "pelo"
	(pelo ?x)
	=>
	(assert (Backtrace (id "e") (informacion "El animal es un mamífero")))	
	(assert (mamifero ?x)))

;Apariencia 6
(defrule R6 "plumas"
	(plumas ?x)
	=>
	(assert (Backtrace (id "e") (informacion "El animal es un ave")))	
	(assert (ave ?x)))

;Crías 1
(defrule R7 "Tipo cría 1" 
	(crias a) 
	=>
	(assert (Backtrace (id "f") (informacion "El animal da leche a sus crías")))	
	(assert (da_leche cria)))

;Crías 2
(defrule R8 "Tipo cría 2" 
	(crias b) 
	=>
	(assert (Backtrace (id "g") (informacion "El animal pone huevos")))	
	(assert (pone_huevos cria)))

;Crías 3
(defrule R9 "Tipo cría 3" 
	(crias c) 
	=>
	(assert (Backtrace (id "g") (informacion "No se identifica información acerca de las crías")))	
	(assert (desconocido cria)))

;Crías 4
(defrule R10 "dar leche" 
	(da_leche ?x) 
	=>
	(assert (Backtrace (id "g") (informacion "El animal es un mamífero")))	
	(assert (mamifero cria)))

;Cantidad patas 1
(defrule R11 "Cuatro patas cría"
	(apariencia_cria a)
	=>
	(assert (Backtrace (id "h") (informacion "El animal camina en cuatro patas y posee piel desnuda")))	
	(assert (cuatro_patas cria))
	(assert (piel_desnuda cria)))

;Cantidad patas 2
(defrule R12 "Dos patas cría"
	(apariencia_cria b)
	=>
	(assert (Backtrace (id "i") (informacion "El animal camina en dos patas")))	
	(assert (dos_patas cria)))

;Capacidad de vuelo 1
(defrule R13 "Puede volar"
	(capacidad_vuelo a)
	=>
	(assert (Backtrace (id "j") (informacion "El ave identificada vuela")))	
	(assert (vuela)))

;Capacidad de vuelo 2
(defrule R14 "No puede volar"
	(capacidad_vuelo b)
	=>
	(assert (Backtrace (id "k") (informacion "El ave identificada no vuela")))	
	(assert (no_vuela)))

;Apariencia (No volador) 1
(defrule R15 "Color blanco y negro"
	(apariencia_no_volador a)
	=>
	(assert (Backtrace (id "l") (informacion "El ave identificada posee color blanco y negro")))	
	(assert (color_blanco_negro))
	(assert (nada)))

;Apariencia (No volador) 2
(defrule R16 "Cuello largo"
	(apariencia_no_volador b)
	=>
	(assert (Backtrace (id "m") (informacion "El ave identificada posee cuello largo y patas largas")))	
	(assert (cuello_largo))
	(assert (patas_largas)))

;Calidad vuelo 1
(defrule R17 "Vuela muy bien"
	(calidad_vuelo a)
	=>
	(assert (Backtrace (id "n") (informacion "El ave identificada vuela muy bien")))	
	(assert (vuela_bien)))

;Calidad vuelo 2
(defrule R18 "Otro"
	(calidad_vuelo b)
	=>
	(assert (Backtrace (id "o") (informacion "No se reconoce la capacidad de vuelo del ave")))	
	(assert (desconocido calidad_vuelo)))

;Alas ave 1
(defrule R19 "Alas pequeñas"
	(alas_ave a)
	=>
	(assert (Backtrace (id "p") (informacion "El ave identificada tiene alas pequeñas")))	
	(assert (alas_peque)))

;Alas ave 2
(defrule R20 "Otro"
	(alas_ave b)
	=>
	(assert (Backtrace (id "q") (informacion "El ave identificada tiene alas grandes")))	
	(assert (alas_grandes)))

;Alimentación mamíferos 1
(defrule R21 "Come carne"
	(alimentacion_mamifero a)
	=>
	(assert (Backtrace (id "r") (informacion "El mamífero identificado es carnívoro")))	
	(assert (carnivoro alimentacion)))

;Alimentación mamíferos 2
(defrule R22 "Come plantas"
	(alimentacion_mamifero b)
	=>
	(assert (Backtrace (id "s") (informacion "El mamífero identificado es herbívoro")))	
	(assert (herbivoro)))

;Alimentación mamíferos 3
(defrule R23 "El animal no está comiendo"
	(alimentacion_mamifero c)
	=>
	(assert (Backtrace (id "t") (informacion "No se identifica la alimentación del mamífero")))	
	(assert (no_come)))

;Alimentación mamíferos 4
(defrule R24 "Herbívoro"
	(herbivoro)
	=>
	(assert (Backtrace (id "t") (informacion "El animal es herbívoro")))	
	(assert (ungulado alimentacion)))

;Apariencia mamífero 1
(defrule R25 "Apariencia Mamifero 1"
	(mamifero ?x)
	(dientes_agudos ?x)
	(garras ?x)        
	=>
	(assert (Backtrace (id "t") (informacion "El mamífero identificado es carnívoro")))	
	(assert (carnivoro apariencia)))

;Apariencia mamífero 2
(defrule R26 "Apariencia Mamifero 2"
	(pezuñas ?x)
	(mamifero ?x)        
	=>
	(assert (Backtrace (id "u") (informacion "El animal es un ungulado")))	
	(assert (ungulado apariencia)))

;Apariencia mamífero 3
(defrule R27 "Dientes agudos y garras"
	(apariencia_mamifero_no_come a)
	=>
	(assert (Backtrace (id "v") (informacion "El mamífero identificado posee dientes agudos y garras afiladas")))	
	(assert (dientes_agudos apariencia))
	(assert (garras apariencia)))

;Apariencia mamífero 4
(defrule R28 "Pezuñas"
	(apariencia_mamifero_no_come b)
	=>
	(assert (Backtrace (id "v") (informacion "El mamífero identificado posee pezuñas")))	
	(assert (pezuñas apariencia)))

;Apariencia carnívoro 1
(defrule R29 "Franjas negras"
	(apariencia_mamifero_carnivoro a)
	=>
	(assert (Backtrace (id "w") (informacion "El mamífero identificado posee un color leonardo con franjas negras")))	
	(assert (color_leonado))
	(assert (franjas_negras)))

;Apariencia carnívoro 2
(defrule R30 "Manchas oscuras"
	(apariencia_mamifero_carnivoro b)
	=>
	(assert (Backtrace (id "x") (informacion "El mamífero identificado posee un color leonardo con manchas oscuras")))	
	(assert (color_leonado))
	(assert (manchas_oscuras)))

;Apariencia ungulado 1
(defrule R31 "Franjas negras y color blanco"
	(apariencia_mamifero_ungulado a)
	=>
	(assert (Backtrace (id "y") (informacion "El mamífero ungulado identificado posee un color blanco con franjas negras")))	
	(assert (color_blanco))
	(assert (franjas_negras)))

;Apariencia ungulado 2
(defrule R32 "Color leonado, patas largas, cuello largo"
	(apariencia_mamifero_ungulado b)
	=>
	(assert (Backtrace (id "z") (informacion "El mamífero ungulado identificado posee un color leonardo además de patas largas y cuello largo")))	
	(assert (color_leonado))
	(assert (patas_largas))
	(assert (cuello_largo)))


			;-----------------------------------------------------------------------------------
			;====================> Base de conocimiento de los animales<========================|
			;-----------------------------------------------------------------------------------

;Salamandra
(defrule A1 "Salamandra"
	(piel_desnuda ?x)
	(cuatro_patas ?x)
	=>
	(assert (animal salamandra))
	(printout t crlf "=====> El animal es una salamandra" crlf)
	(printout t crlf "Se logro identificar gracias a las siguientes características: " crlf))

;Pingüino
(defrule A2 "Pingüino"
	(ave ?x)
	(no_vuela)
	(nada)
	(color_blanco_negro)
	=>
	(assert (animal pinguino))
	(printout t crlf "=====> El animal es un pingüino" crlf)
	(printout t crlf "Se logro identificar gracias a las siguientes características: " crlf))


;Avestruz
(defrule A3 "Avestruz"
	(ave ?x)
	(no_vuela)
	(cuello_largo)
	(patas_largas)
	=>
	(assert (animal avestruz))
	(printout t crlf "=====> El animal es un avestruz" crlf)
	(printout t crlf "Se logro identificar gracias a las siguientes características: " crlf))


;Desconocido
(defrule A4 "Desconocido"
	(desconocido ?x)
	=>
	(assert (animal desconocido))
	(printout t crlf "=====> El animal es desconocido, no se puede determinar con la apariencia observada" crlf)
	(printout t crlf "No se logro identificar al animal usando las siguientes características: " crlf))


;Albatros
(defrule A5 "Albatros"
	(ave ?x)
	(vuela_bien)
	(alas_grandes)
	=>
	(assert (animal albatros))
	(printout t crlf "=====> El animal es un albatros" crlf)
	(printout t crlf "Se logro identificar gracias a las siguientes características: " crlf))


;Halcón peregrino
(defrule A6 "Halcón peregrino"
	(ave ?x)
	(vuela_bien)
	(alas_peque)
	=>
	(assert (animal halcon_peregrino))
	(printout t crlf "=====> El animal es un halcón peregrino" crlf)
	(printout t crlf "Se logro identificar gracias a las siguientes características: " crlf))


;Tigre
(defrule A7 "Tigre"
	(carnivoro ?x)
	(color_leonado)
	(franjas_negras)
	=>
	(assert (animal tigre))
	(printout t crlf "=====> El animal es un tigre" crlf)
	(printout t crlf "Se logro identificar gracias a las siguientes características: " crlf))


;Leopardo
(defrule A8 "Leopardo"
	(carnivoro ?x)
	(color_leonado)
	(manchas_oscuras)
	=>
	(assert (animal leopardo))
	(printout t crlf "=====> El animal es un leopardo" crlf)
	(printout t crlf "Se logro identificar gracias a las siguientes características: " crlf))


;Jirafa
(defrule A9 "Jirafa"
	(ungulado ?x)
	(patas_largas)
	(cuello_largo)
	(color_leonado)
	=>
	(assert (animal jirafa))
	(printout t crlf "=====> El animal es una jirafa" crlf)
	(printout t crlf "Se logro identificar gracias a las siguientes características: " crlf))


;Cebra
(defrule A10 "Cebra"
	(ungulado ?x)
	(color_blanco)
	(franjas_negras)
	=>
	(assert (animal cebra))
	(printout t crlf "=====> El animal es un cebra" crlf)
	(printout t crlf "Se logro identificar gracias a las siguientes características: " crlf))



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
(printout t "a. tiene pelo" crlf)
(printout t "b. tiene plumas" crlf)
(printout t "c. no se aprecia bien" crlf)
(printout t "d. tiene piel desnuda" crlf)
(printout t "(responder a/b/c/d): ")
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
(printout t "a. El animal posee plumas" crlf)
(printout t "b. El animal posee piel desnuda" crlf)
(printout t "(responder a/b): ")
(assert (apariencia_huevo (read))))

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

(defrule R4 "cobertura de piel 4" 
	(apariencia d) 
	=>
	(assert (piel_desnuda apariencia)))

(defrule R5 "pelo"
	(pelo ?x)
	=>
	(assert (mamifero)))

(defrule R6 "plumas"
	(plumas ?x)
	=>
	(assert (ave)))




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
	(assert (desconocido cria))
	(printout t "El animal es desconocido" crlf))

(defrule R10 "dar leche" 
	(da_leche ?x) 
	=>
	(assert (mamifero cria)))

;Apariencia por cria
(defrule R11 "Cobertura de piel cria plumas"
	(apariencia_huevo a)
	=>
	(assert (plumas cria)))

(defrule R12 "Cobertura de piel cria piel desnuda"
	(apariencia_huevo b)
	=>
	(assert (piel_desnuda cria)))

;Animales
(defrule A1 "salamandra"
	(piel_desnuda ?x)
	=>
	(assert (animal salamandra))
	(printout t "Es una salamandra" crlf))
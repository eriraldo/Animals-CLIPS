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
(printout t "a. tiene pelo?" crlf)
(printout t "b. tiene plumas?" crlf)
(printout t "c. no se aprecia bien" crlf)
(printout t "(responder a/b/c): ")
(assert (apariencia (read))))

;-------------------------------------------------------------
;       Reglas para el S.E. de identificación de animales   |
;-------------------------------------------------------------
(defrule R1 "cobertura de piel 1" 
	(apariencia a) 
	=>
	(assert (mamifero apariencia)))

(defrule R2 "cobertura de piel 2" 
	(apariencia b) 
	=>
	(assert (ave apariencia)))

(defrule R3 "cobertura de piel 2" 
	(apariencia c) 
	=>
	(assert (crias apariencia)))
#language: es
@spanishContactForm
Característica: validación del formulario de contacto

  @Escenario
    Escenario: para comprobar la página de contacto
     #Dadas espere 3 segundos
     Dadas estoy en la página de inicio
     Y hago click en Español
     Dadas debo ver el enlace Contacto
     Entonces hago click en Contacto
     Entonces debo ver el encabezado "Website feedback"
     Cuando Ingreso los siguientes detalles
     #  | Su nombre     | Su dirección de correo electrónico | Asunto       | Mensaje  |
       | Your name     | Your email address        | Subject      | Message  |
       | viswa teji    | v.viswateji+01@gmail.com           | Test subject | test msg |
    #Entonces Presiono el botón "Enviar mensaje"
#El sitio web encontró un error inesperado. Vuelva a intentarlo más tarde.


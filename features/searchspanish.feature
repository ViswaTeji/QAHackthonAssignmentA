#language: es
Característica: verificación de búsqueda y función de búsqueda avanzada.
  Antecedentes: Verificación de la página de inicio
    Dadas estoy en la página de inicio
    Y hago click en Español
    Y wait for 3 secs

  @Escenario
  Escenario: Ingrese los detalles de la búsqueda
     Entonces Ingrese los detalles de búsqueda "Artículos"
     Y wait for 2 secs
     Y hago click en Buscar
     Y debo ver el encabezado "Buscar por Artículos"


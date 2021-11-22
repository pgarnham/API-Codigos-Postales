# API para los códigos postales de México

* El codigo original proviene del Github [acrogenesis/API-Codigos-Postales](https://github.com/acrogenesis/API-Codigos-Postales)

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/pgarnham/API-Codigos-Postales)

Dado un código postal, regresa un arreglo con las colonia, municipio y estado perteneciente al código postal.
Además se pueden realizar búsquedas de códigos postales usando los números iniciales.

## Sube la app a heroku
1) Da click en el botón `Deploy to Heroku` y sigue los pasos.
2) Al terminar corre `heroku run rake sepomex:update`.
3) Agrega el task de `rake sepomex:update` en el addon de Heroku
Scheduler para que se corra cada día.

## Suscripción y documentación de la API Original

[https://rapidapi.com/acrogenesis/api/mexico-zip-codes](https://rapidapi.com/acrogenesis/api/mexico-zip-codes)


**Consultar la información de un código postal**

```text
https://xepelin-zip-codes-mx.herokuapp.com/codigo_postal/66436
```

**Respuesta del servidor**
```json
{
  "codigo_postal": "66436",
  "municipio": "San Nicolás de los Garza",
  "estado": "Nuevo León",
  "colonias": [
    "Praderas de Santo Domingo",
    "Las Nuevas Puente"
  ]
}
```

---

**Buscar códigos postales**

```text
https://xepelin-zip-codes-mx.herokuapp.com/buscar
```

_parámetros necesarios_
```text
  codigo_postal=# codigo a buscar, parcial o total
```
_Ejemplo de búsqueda para códigos que inicien con **66**, con **664** y con **6641**_
```json
https://xepelin-zip-codes-mx.herokuapp.com/buscar?codigo_postal=66
https://xepelin-zip-codes-mx.herokuapp.com/buscar?codigo_postal=664
https://xepelin-zip-codes-mx.herokuapp.com/buscar?codigo_postal=6641
```

** Para el código postal 6641 el servidor regresa **
```json
{
  "codigos_postales": [
    "66410",
    "66412",
    "66413",
    "66414",
    "66415",
    "66417",
    "66418"
  ]
}
```

___

### Rake task
Ejecuta el rake task `rake sepomex:update` para descargar todos los códigos postales de México y actualizar tu base de datos.

### Colabora con la App Original
Errores y pull requests son bienvenidos en Github: https://github.com/Munett/API-Codigos-Postales.
Para bajar en tu BD todos los códigos postales corre el rake script `rake sepomex:update`.

Los datos se obtuvieron de http://www.correosdemexico.gob.mx/lservicios/servicios/CodigoPostal_Exportar.aspx

### TODO
- [ ] Pruebas automatizadas minitest

### Los datos se actualizan cada domingo.

### Licencia
MIT License

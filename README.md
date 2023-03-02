# Stored Procedure Split Column
![](https://i.ibb.co/gTf5rxH/Trunks-Futuro2.png)

###### Procedimiento que permite ingresar como primer parametro una cadena de carcteres que contenga un delimitante en común y como segundo parametro el caracter delimitante el cual retorna una tabla con las columnas delimitadas por el caracter delimitante.



**Table of Contents**

[TOCM]

[TOC]

### A simple example

Se dividira la cadena de texto `"nombre;apellido;ciudad"` 

    execute sp_SlpitColumn 'nombre;apellido;ciudad',';';

##### Resultado:
| 1  | 2  | 3 |
| :------------ |:---------------:| -----:|
| nombre     | apellido | ciudad |


### Documentation

Para permitir que el procedimiento divida la cadena en un número variable de columnas, se uso una combinación de las funciones **STRING_SPLIT** y **Dynamic SQL** en SQL Server.
El procedimiento utiliza la función **STRING_SPLIT** para contar el número de columnas necesarias y para dividir la cadena en filas de acuerdo con el delimitador. Luego, utiliza un ciclo **WHILE** para generar una cadena dinámica que contiene los números de columna resultantes para la cláusula **PIVOT**. Finalmente, utiliza Dynamic SQL para ejecutar la consulta SQL completa.

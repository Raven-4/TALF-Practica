%{

  #include <stdio.h>
  extern FILE *yyin;
  extern int yylex();

  #define YYDEBUG 1

%} 
/*
%token ABSTRACTO AND ASOCIATIVA BOOLEANO CABECERA CADENA CASO CARACTER CARGA CLASE CONJUNTO CONSTANTE CUERPO CTC_BOOLEANA CTC_CADENA CTC_CARACTER CTC_ENTERA CTC_REAL CONSTRUCTOR CUANDO CUATRO_PTOS DESCENDENTE DESPD DESPI DESTRUCTOR DE DEVOLVER DOS_PTOS EJECUTA ELEMENTO EN ENTERO ENTONCES EQ ESPECIFICO EXCEPTO FICHERO FINAL FINALMENTE FLECHA_DOBLE FUNCION GEQ GENERICO HASTA IDENTIFICADOR INTERFAZ LANZAR LEQ LISTA MIENTRAS MODIFICABLE NEQ OTRO OR PAQUETE PARA PATH POTENCIA PRIVADO PROBAR PROCEDIMIENTO PROGRAMA PUBLICO REAL REGISTRO REPITE SEA SALIR SEMIPUBLICO SI SINO TIPO VARIABLE
*/

%union {
int entero; 
double real;
char * texto; 
}

%token <texto> ABSTRACTO AND ASOCIATIVA BOOLEANO CABECERA CADENA CASO CARACTER CARGA CLASE CONJUNTO CONSTANTE CUERPO CTC_BOOLEANA CTC_CADENA CTC_CARACTER CONSTRUCTOR CUANDO CUATRO_PTOS DESCENDENTE DESPD DESPI DESTRUCTOR DE DEVOLVER DOS_PTOS EJECUTA ELEMENTO EN ENTERO ENTONCES EQ ESPECIFICO EXCEPTO FICHERO FINAL FINALMENTE FLECHA_DOBLE FUNCION GEQ GENERICO HASTA IDENTIFICADOR INTERFAZ LANZAR LEQ LISTA MIENTRAS MODIFICABLE NEQ OTRO OR PAQUETE PARA PATH POTENCIA PRIVADO PROBAR PROCEDIMIENTO PROGRAMA PUBLICO REAL REGISTRO REPITE SEA SALIR SEMIPUBLICO SI SINO TIPO VARIABLE
%token <entero> CTC_ENTERA
%token <real> CTC_REAL

%start expresion_constante
%nonassoc '-' '!'
%left '*' '/' '%' 
/*
%
*/

%%

/********************************/
/* programas, paquetes y cargas */
/********************************/
programa : definicion_programa {printf ("programa -> definicion_programa");}
          | definicion_paquete {printf ("programa -> definicion_paquete");}
;

definicion_programa : PROGRAMA nombre ';' bloque_programa {printf ("definicion_programa -> PROGRAMA nombre ';' bloque_programa");}
;

nombre : identificador_cuatro_ptos_asterisco IDENTIFICADOR {printf ("nombre -> identificador_cuatro_ptos_asterisco IDENTIFICADOR");}
;

identificador_cuatro_ptos_asterisco: IDENTIFICADOR CUATRO_PTOS {printf ("identificador_cuatro_ptos_asterisco -> IDENTIFICADOR CUATRO_PTOS");}
| identificador_cuatro_ptos_asterisco IDENTIFICADOR CUATRO_PTOS {printf ("identificador_cuatro_ptos_asterisco -> identificador_cuatro_ptos_asterisco IDENTIFICADOR CUATRO_PTOS");}
|                                                                {printf ("identificador_cuatro_ptos_asterisco -> vacio");}
;

bloque_programa :   declaracion_cargas_interrogacion {printf ("bloque_programa -> declaracion_cargas_interrogacion declaracion_tipos_interrogacion declaracion_constantes_interrogacion declaracion_variables_interrogacion bloque_instrucciones");}
                    declaracion_tipos_interrogacion 
                    declaracion_constantes_interrogacion 
                    declaracion_variables_interrogacion 
                    bloque_instrucciones 
;

declaracion_cargas_interrogacion : declaracion_cargas {printf ("declaracion_cargas_interrogacion -> declaracion_cargas");}
|                                                     {printf ("declaracion_cargas_interrogacion -> vacio");}
;

declaracion_tipos_interrogacion : declaracion_tipos {printf ("declaracion_tipos_interrogacion -> declaracion_cargas");}
|                                                   {printf ("declaracion_tipos_interrogacion -> vacio");}
;

declaracion_constantes_interrogacion : declaracion_constantes {printf ("declaracion_constantes_interrogacion -> declaracion_constantes");}
|                                                             {printf ("declaracion_constantes_interrogacion -> vacio");}
;

declaracion_variables_interrogacion : declaracion_variables {printf ("declaracion_variables_interrogacion -> declaracion_variables");}
|
;
                  
bloque_instrucciones : '{' instruccion_mas '}' {printf ("bloque_instrucciones -> '{' instruccion_mas '}'");}
;

instruccion_mas : instruccion {printf ("instruccion_mas -> instruccion");}
| instruccion_mas instruccion {printf ("instruccion_mas -> instruccion_mas instruccion");}
;

/*
instruccion_asterisco : instruccion //1
| instruccion_asterisco instruccion //+1
| //0
;

*/
definicion_paquete : PAQUETE nombre ';' seccion_cabecera seccion_cuerpo {printf ("definicion_paquete -> PAQUETE nombre ';' seccion_cabecera seccion_cuerpo");}
;

seccion_cabecera : CABECERA {printf ("seccion_cabecera -> CABECERA declaracion_cargas_interrogacion declaracion_tipos_interrogacion declaracion_constantes_interrogacion declaracion_variables_interrogacion declaracion_interfaces");}
                   declaracion_cargas_interrogacion 
                   declaracion_tipos_interrogacion 
                   declaracion_constantes_interrogacion 
                   declaracion_variables_interrogacion 
                   declaracion_interfaces 
;

declaracion_interfaces_interrogacion : declaracion_interfaces {printf ("declaracion_interfaces_interrogacion -> declaracion_interfaces");}
|                                                             {printf ("declaracion_interfaces_interrogacion -> vacio");}
;

seccion_cuerpo : CUERPO {printf ("seccion_cuerpo -> CUERPO declaracion_tipos_interrogacion declaracion_constantes_interrogacion declaracion_variables_interrogacion declaracion_subprograma_mas");}
                 declaracion_tipos_interrogacion 
                 declaracion_constantes_interrogacion 
                 declaracion_variables_interrogacion 
                 declaracion_subprograma_mas 
;

declaracion_subprograma_mas : declaracion_subprograma {printf ("declaracion_subprograma_mas -> declaracion_subprograma");}
| declaracion_subprograma_mas declaracion_subprograma {printf ("declaracion_subprograma_mas -> declaracion_subprograma_mas declaracion_subprograma");}
;

declaracion_cargas : CARGA declaracion_carga_mas ';' {printf ("declaracion_cargas -> CARGA declaracion_carga_mas ';'");}
;

declaracion_carga_mas : declaracion_carga {printf ("declaracion_carga_mas -> declaracion_carga");}
| declaracion_carga_mas declaracion_carga {printf ("declaracion_carga_mas -> declaracion_carga_mas declaracion_carga");}
;

declaracion_carga : nombre en_path_interrogacion nombre_mas_interrogacion {printf ("declaracion_carga -> nombre en_path_interrogacion nombre_mas_interrogacion");}
;

en_path_interrogacion : EN PATH {printf ("en_path_interrogacion -> EN PATH");}
|                               {printf ("en_path_interrogacion -> vacio");}
;

nombre_mas : nombre {printf ("nombre_mas -> nombre");}
| nombre_mas nombre {printf ("nombre_mas -> nombre_mas nombre");}
;

nombre_mas_interrogacion : '(' nombre_mas ')' {printf ("nombre_mas_interrogacion -> '(' nombre_mas ')'");}
|                                             {printf ("nombre_mas_interrogacion -> vacio");}
;

/*********/
/* tipos */
/*********/

declaracion_tipos : TIPO declaracion_tipo_mas {printf ("declaracion_tipos -> TIPO declaracion_tipo_mas");}
;

declaracion_tipo_mas : declaracion_tipo {printf ("declaracion_tipo_mas -> declaracion_tipo");}
| declaracion_tipo_mas declaracion_tipo {printf ("declaracion_tipo_mas -> declaracion_tipo_mas declaracion_tipo");}
;

declaracion_tipo : nombre '=' tipo_no_estructurado_o_nombre_tipo ';'       {printf ("declaracion_tipo -> nombre '=' tipo_no_estructurado_o_nombre_tipo ';'");}
                  | nombre '=' tipo_estructurado                           {printf ("declaracion_tipo -> nombre '=' tipo_estructurado ");}
;

tipo_no_estructurado_o_nombre_tipo : nombre                 {printf ("tipo_no_estructurado_o_nombre_tipo -> nombre");}
                                    | tipo_escalar          {printf ("tipo_no_estructurado_o_nombre_tipo -> tipo_escalar");}
                                    | tipo_fichero          {printf ("tipo_no_estructurado_o_nombre_tipo -> tipo_fichero");}
                                    | tipo_enumerado        {printf ("tipo_no_estructurado_o_nombre_tipo -> tipo_enumerado");}
                                    | tipo_lista            {printf ("tipo_no_estructurado_o_nombre_tipo -> tipo_lista");}
                                    | tipo_lista_asociativa {printf ("tipo_no_estructurado_o_nombre_tipo -> tipo_lista_asociativa");}
                                    | tipo_conjunto         {printf ("tipo_no_estructurado_o_nombre_tipo -> tipo_conjunto");}
;

tipo_estructurado : tipo_registro                    {printf ("tipo_estructurado -> tipo_registro");}
                  | declaracion_clase                {printf ("tipo_estructurado -> declaracion_clase");}
;

tipo_escalar : ENTERO               {printf ("tipo_escalar -> ENTERO");}
              | REAL                {printf ("tipo_escalar -> REAL");}
              | BOOLEANO            {printf ("tipo_escalar -> BOOLEANO");}
              | CARACTER            {printf ("tipo_escalar -> CARACTER");}
              | CADENA              {printf ("tipo_escalar -> CADENA");}
;

tipo_fichero : FICHERO {printf ("tipo_fichero -> FICHERO");}
;

tipo_enumerado : '(' expresion_constante_mas ')' {printf ("tipo_enumerado -> '(' expresion_constante_mas ')'");}
;

expresion_constante_mas : expresion_constante {printf ("expresion_constante_mas -> expresion_constante");}
| expresion_constante_mas expresion_constante {printf ("expresion_constante_mas -> expresion_constante_mas expresion_constante");}
;

tipo_lista : LISTA rango_mas_interrogacion DE tipo_no_estructurado_o_nombre_tipo {printf ("tipo_lista -> LISTA rango_mas_interrogacion DE tipo_no_estructurado_o_nombre_tipo");}
;

rango_mas : rango {printf ("rango_mas -> rango");}
| rango_mas rango {printf ("rango_mas -> rango_mas rango");}
;

rango_mas_interrogacion : '[' rango_mas ']' {printf ("rango_mas_interrogacion -> '[' rango_mas ']'");}
|                                           {printf ("rango_mas_interrogacion -> vacio");}
;

rango : expresion DOS_PTOS expresion expresion_interrogacion_ptos {printf ("rango -> expresion DOS_PTOS expresion expresion_interrogacion_ptos");}
;

expresion_interrogacion_ptos : DOS_PTOS expresion {printf ("expresion_interrogacion_ptos -> DOS_PTOS expresion");}
|                                                 {printf ("expresion_interrogacion_ptos -> vacio");}
;

tipo_lista_asociativa : LISTA ASOCIATIVA DE tipo_no_estructurado_o_nombre_tipo {printf ("tipo_lista_asociativa -> LISTA ASOCIATIVA DE tipo_no_estructurado_o_nombre_tipo");}
;

tipo_conjunto : CONJUNTO DE tipo_no_estructurado_o_nombre_tipo {printf ("tipo_conjunto -> CONJUNTO DE tipo_no_estructurado_o_nombre_tipo");}
;

tipo_registro : REGISTRO '{' declaracion_campo_mas '}' {printf ("tipo_registro -> REGISTRO '{' declaracion_campo_mas '}'");}
;

declaracion_campo_mas : declaracion_campo {printf ("declaracion_campo_mas -> declaracion_campo");}
| declaracion_campo_mas declaracion_campo {printf ("declaracion_campo_mas -> declaracion_campo_mas declaracion_campo");}
;

declaracion_campo : nombre_mas ':' tipo_no_estructurado_o_nombre_tipo ';' {printf ("declaracion_campo -> nombre_mas ':' tipo_no_estructurado_o_nombre_tipo ';'");}
;

expresion : |expresion_constante  {printf ("expresion -> expresion_constante");}
            |expresion_primaria   {printf ("expresion -> expresion_primaria");}
;

/**********/
/* CLASES */
/**********/
declaracion_clase : CLASE {printf ("declaracion_clase -> CLASE final_interrogacion nombre_mas_interrogacion '{' declaraciones_publicas declaraciones_semi_interrogacion declaraciones_privadas_interrogacion '}'");}
                    final_interrogacion 
                    nombre_mas_interrogacion 
                    '{' 
                    declaraciones_publicas 
                    declaraciones_semi_interrogacion 
                    declaraciones_privadas_interrogacion 
                    '}' 
;

final_interrogacion : FINAL {printf ("final_interrogacion -> FINAL");}
|                           {printf ("final_interrogacion -> vacio");}
;

declaraciones_semi_interrogacion : declaraciones_semi {printf ("declaraciones_semi_interrogacion -> declaraciones_semi");}
|                                                     {printf ("declaraciones_semi_interrogacion -> vacio");}
;

declaraciones_privadas_interrogacion : declaraciones_privadas {printf ("declaraciones_privadas_interrogacion -> declaraciones_privadas");}
|                                                             {printf ("declaraciones_privadas_interrogacion -> vacio");}
;

declaraciones_publicas : publico_interrogacion declaracion_componente_mas {printf ("declaraciones_publicas -> publico_interrogacion declaracion_componente_mas");}
;

declaraciones_semi : SEMIPUBLICO declaracion_componente_mas {printf ("declaraciones_semi -> SEMIPUBLICO declaracion_componente_mas");}
;

declaraciones_privadas : PRIVADO declaracion_componente_mas {printf ("declaraciones_privadas -> PRIVADO declaracion_componente_mas");}
;

publico_interrogacion : PUBLICO {printf ("publico_interrogacion -> PUBLICO");}
|                               {printf ("publico_interrogacion -> vacio");}
;

declaracion_componente_mas : declaracion_componente {printf ("declaracion_componente_mas -> declaracion_componente");}
| declaracion_componente_mas declaracion_componente {printf ("declaracion_componente_mas -> declaracion_componente_mas declaracion_componente");}
;

declaracion_componente : declaracion_tipo_anidado       {printf ("declaracion_componente -> declaracion_tipo_anidado");}
                        | declaracion_constante_anidada {printf ("declaracion_componente -> declaracion_constante_anidada");}
                        | declaracion_atributos         {printf ("declaracion_componente -> declaracion_atributos");}
                        | cabecera_subprograma ';' modificadores_interrogacion {printf ("declaracion_componente -> cabecera_subprograma ';' modificadores_interrogacion");}
;

modificadores_interrogacion : modificadores ';' {printf ("modificadores_interrogacion ->  modificadores ';'");}
|                                               {printf ("modificadores_interrogacion -> vacio");}
; 

declaracion_tipo_anidado : TIPO declaracion_tipo {printf ("declaracion_tipo_anidado -> TIPO declaracion_tipo");}
;

declaracion_constante_anidada : CONSTANTE declaracion_constante {printf ("declaracion_constante_anidada -> CONSTANTE declaracion_constante");}
;

declaracion_atributos : nombre_mas ':' tipo_no_estructurado_o_nombre_tipo ';' {printf ("declaracion_atributos -> nombre_mas ':' tipo_no_estructurado_o_nombre_tipo ';'");}
;

modificadores : modificador_mas {printf ("modificadores -> modificador_mas");}
;

modificador_mas : modificador {printf ("modificador_mas -> modificador");}
| modificador_mas modificador {printf ("modificador_mas -> modificador_mas modificador");}
;

modificador : GENERICO             {printf ("modificador -> GENERICO");}
            | ABSTRACTO            {printf ("modificador -> ABSTRACTO");}
            | ESPECIFICO           {printf ("modificador -> ESPECIFICO");}
            | FINAL                {printf ("modificador -> FINAL");}
;

/**************/
/* constantes */
/**************/

declaracion_constantes : CONSTANTE declaracion_constante_mas {printf ("declaracion_constantes -> CONSTANTE declaracion_constante_mas");}
;

declaracion_constante_mas : declaracion_constante {printf ("declaracion_constante_mas -> declaracion_constante");}
| declaracion_constante_mas declaracion_constante {printf ("declaracion_constante_mas -> declaracion_constante_mas declaracion_constante");}
;

declaracion_constante : nombre ':' tipo_no_estructurado_o_nombre_tipo '=' valor_constante ';' {printf ("declaracion_constante -> nombre ':' tipo_no_estructurado_o_nombre_tipo '=' valor_constante ';'");}
;

valor_constante : expresion                   {printf ("valor_constante -> expresion");}
                | '[' valor_constante_mas ']' {printf ("valor_constante ->  '[' valor_constante_mas ']'");}
                | '[' clave_valor_mas ']'     {printf ("valor_constante -> '[' clave_valor_mas ']'");}
                | '[' campo_valor_mas ']'     {printf ("valor_constante -> '[' campo_valor_mas ']' ");}
;

valor_constante_mas : valor_constante {printf ("valor_constante_mas -> valor_constante");}
| valor_constante_mas valor_constante {printf ("valor_constante_mas -> valor_constante_mas valor_constante");}
;

clave_valor_mas : clave_valor {printf ("clave_valor_mas -> clave_valor");}
| clave_valor_mas clave_valor {printf ("clave_valor_mas -> clave_valor_mas clave_valor");}
;

campo_valor_mas : campo_valor {printf ("campo_valor_mas -> campo_valor");}
| campo_valor_mas campo_valor {printf ("campo_valor_mas -> campo_valor_mas campo_valor");}
;

clave_valor : CTC_CADENA FLECHA_DOBLE valor_constante {printf ("clave_valor ->  CTC_CADENA FLECHA_DOBLE valor_constante");}
;

campo_valor : nombre FLECHA_DOBLE valor_constante {printf ("campo_valor -> nombre FLECHA_DOBLE valor_constante");}
;

/*************/
/* variables */
/*************/

declaracion_variables : VARIABLE declaracion_variable_mas {printf ("declaracion_variables -> VARIABLE declaracion_variable_mas");}
;

declaracion_variable_mas : declaracion_variable {printf ("declaracion_variable_mas -> declaracion_variable");}
| declaracion_variable_mas declaracion_variable {printf ("declaracion_variable_mas -> declaracion_variable_mas declaracion_variable");}
;

declaracion_variable : nombre_mas':' tipo_no_estructurado_o_nombre_tipo {printf ("declaracion_variable -> nombre_mas':' tipo_no_estructurado_o_nombre_tipo valor_constante_interrogacion ';'");}
                       valor_constante_interrogacion ';' 

valor_constante_interrogacion : '=' valor_constante {printf ("valor_constante_interrogacion ->'=' valor_constante");}
|                                                   {printf ("valor_constante_interrogacion -> vacio");}
;


/**************/
/* interfaces */
/**************/
declaracion_interfaces : INTERFAZ cabecera_subprograma_mas {printf ("declaracion_interfaces -> INTERFAZ cabecera_subprograma_mas");}
;

cabecera_subprograma_mas : cabecera_subprograma ';' {printf ("cabecera_subprograma_mas -> cabecera_subprograma ';'");}
| cabecera_subprograma_mas cabecera_subprograma ';' {printf ("cabecera_subprograma_mas -> cabecera_subprograma_mas cabecera_subprograma ';'");}
;

/****************/
/* subprogramas */
/****************/

declaracion_subprograma : cabecera_subprograma bloque_subprograma {printf ("declaracion_subprograma -> cabecera_subprograma bloque_subprograma");}
;

cabecera_subprograma : cabecera_funcion                       {printf ("cabecera_subprograma -> cabecera_funcion");}
                      | cabecera_procedimiento                {printf ("cabecera_subprograma -> cabecera_procedimiento");}
                      | cabecera_constructor                  {printf ("cabecera_subprograma -> cabecera_constructor");}
                      | cabecera_destructor                   {printf ("cabecera_subprograma -> cabecera_destructor");}
;

cabecera_funcion : FUNCION {printf ("cabecera_funcion -> FUNCION nombre declaracion_parametros_interrogacion FLECHA_DOBLE tipo_no_estructurado_o_nombre_tipo");}
                   nombre 
                   declaracion_parametros_interrogacion 
                   FLECHA_DOBLE 
                   tipo_no_estructurado_o_nombre_tipo 
;

declaracion_parametros_interrogacion : declaracion_parametros {printf ("declaracion_parametros_interrogacion -> declaracion_parametros");}
|                                                             {printf ("declaracion_parametros_interrogacion -> vacio");}
;

cabecera_procedimiento : PROCEDIMIENTO nombre declaracion_parametros_interrogacion {printf ("cabecera_procedimiento -> PROCEDIMIENTO nombre declaracion_parametros_interrogacion");}
;

cabecera_constructor : CONSTRUCTOR nombre declaracion_parametros_interrogacion {printf ("cabecera_constructor -> CONSTRUCTOR nombre declaracion_parametros_interrogacion");}
;

cabecera_destructor : DESTRUCTOR nombre {printf ("cabecera_destructor -> DESTRUCTOR nombre");}
;

declaracion_parametros : '(' lista_parametros_formales ')' {printf ("declaracion_parametros -> '(' lista_parametros_formales ')'");}
;

lista_parametros_formales : parametros_formales                               {printf ("lista_parametros_formales -> parametros_formales");}
                          | lista_parametros_formales ';' parametros_formales {printf ("lista_parametros_formales -> lista_parametros_formales ';' parametros_formales");}
;

parametros_formales : nombre_mas ':' tipo_no_estructurado_o_nombre_tipo modificable_interrogacion {printf ("parametros_formales -> nombre_mas ':' tipo_no_estructurado_o_nombre_tipo modificable_interrogacion");}
;

modificable_interrogacion : MODIFICABLE {printf ("modificable_interrogacion -> MODIFICABLE");}
|                                       {printf ("modificable_interrogacion -> vacio");}
;

bloque_subprograma : declaracion_tipos_interrogacion {printf ("bloque_subprograma -> declaracion_tipos_interrogacion declaracion_constantes_interrogacion declaracion_variables_interrogacion bloque_instrucciones");}
                     declaracion_constantes_interrogacion
                     declaracion_variables_interrogacion
                     bloque_instrucciones
;

/*****************/
/* instrucciones */
/*****************/

instruccion : ';'                         {printf ("instruccion -> ';'");}
            | instruccion_asignacion      {printf ("instruccion -> instruccion_asignacion");}
            | instruccion_salir           {printf ("instruccion -> instruccion_salir");}
            | instruccion_devolver        {printf ("instruccion -> instruccion_devolver");}
            | instruccion_llamada         {printf ("instruccion -> instruccion_llamada");}
            | instruccion_si              {printf ("instruccion -> instruccion_si");}
            | instruccion_casos           {printf ("instruccion -> instruccion_casos");}
            | instruccion_bucle           {printf ("instruccion -> instruccion_bucle");}
            | instruccion_probar_excepto  {printf ("instruccion -> instruccion_probar_excepto");}
            | instruccion_lanzar          {printf ("instruccion -> instruccion_lanzar");}
;

instruccion_asignacion : objeto '=' expresion ';' {printf ("instruccion_asignacion -> objeto '=' expresion ';'");}
;

instruccion_salir : SALIR si_expresion_interrogacion ';' {printf ("instruccion_salir -> SALIR si_expresion_interrogacion ';'");}
;

si_expresion_interrogacion : SI expresion {printf ("si_expresion_interrogacion -> SI expresion");}
|                                         {printf ("si_expresion_interrogacion -> vacio");}
;

instruccion_devolver : DEVOLVER expresion_interrogacion ';' {printf ("instruccion_devolver -> DEVOLVER expresion_interrogacion ';'");}
;

expresion_interrogacion : expresion {printf ("expresion_interrogacion -> expresion");}
|                                   {printf ("expresion_interrogacion -> vacio");}
;

instruccion_llamada : llamada_subprograma ';' {printf ("instruccion_llamada -> llamada_subprograma ';'");}
;

llamada_subprograma : nombre '(' expresion_asterisco ')' {printf ("llamada_subprograma -> nombre '(' expresion_asterisco ')'");}
;

expresion_asterisco : expresion {printf ("expresion_asterisco -> expresion");}
| expresion_asterisco expresion {printf ("expresion_asterisco -> expresion_asterisco expresion");}
|                               {printf ("expresion_asterisco -> vacio");}
;

instruccion_si : SI expresion                            {printf ("instruccion_si -> SI expresion");}
                 ENTONCES bloque_instrucciones           {printf ("instruccion_si -> ENTONCES bloque_instrucciones");}
                 bloque_instrucciones_sino_interrogacion {printf ("instruccion_si -> bloque_instrucciones_sino_interrogacion");}
;

bloque_instrucciones_sino_interrogacion : SINO bloque_instrucciones {printf ("bloque_instrucciones_sino_interrogacion -> SINO bloque_instrucciones");}
|                                                                   {printf ("bloque_instrucciones_sino_interrogacion -> vacio");}
;

instruccion_casos : EN CASO expresion SEA caso_mas ';' {printf ("instruccion_casos -> EN CASO expresion SEA caso_mas ';'");}
;

caso_mas : caso {printf ("caso_mas -> caso");}
| caso_mas caso {printf ("caso_mas -> caso_mas caso");}
;

caso : CUANDO entradas FLECHA_DOBLE bloque_instrucciones  {printf ("caso -> CUANDO entradas FLECHA_DOBLE bloque_instrucciones");}
;

entradas : entrada_asterisco entrada  {printf ("entradas -> entrada_asterisco entrada");}
;

entrada_asterisco : entrada '|' {printf ("entrada_asterisco -> entrada '|'");}
| entrada_asterisco entrada '|' {printf ("entrada_asterisco -> entrada_asterisco entrada '|'");}
|                               {printf ("entrada_asterisco -> vacio");}
; 

entrada : expresion         {printf ("entrada -> expresion");}
        | rango             {printf ("entrada -> rango");}
        | OTRO              {printf ("entrada -> OTRO");}
;

instruccion_bucle : clausula_iteracion bloque_instrucciones {printf ("instruccion_bucle -> clausula_iteracion bloque_instrucciones");}
;

clausula_iteracion : PARA nombre EN objeto                                      {printf ("clausula_iteracion -> PARA nombre EN objeto");}
                    | REPITE ELEMENTO nombre EN rango descendente_interrogacion {printf ("clausula_iteracion -> REPITE ELEMENTO nombre EN rango descendente_interrogacion");}
                    | MIENTRAS expresion                                        {printf ("clausula_iteracion -> MIENTRAS expresion");}
                    | REPITE HASTA expresion                                    {printf ("clausula_iteracion -> REPITE HASTA expresion");}
;

descendente_interrogacion : DESCENDENTE {printf ("descendente_interrogacion -> DESCENDENTE");}
|
;

instruccion_probar_excepto : PROBAR bloque_instrucciones              {printf ("instruccion_probar_excepto -> PROBAR bloque_instrucciones");}
                             EXCEPTO clausula_excepcion_mas           {printf ("instruccion_probar_excepto -> EXCEPTO clausula_excepcion_mas");}
                             bloque_instrucciones_final_interrogacion {printf ("instruccion_probar_excepto -> bloque_instrucciones_final_interrogacion");}

;

clausula_excepcion_mas : clausula_excepcion {printf ("clausula_excepcion_mas -> clausula_excepcion");}
| clausula_excepcion_mas clausula_excepcion {printf ("clausula_excepcion_mas -> clausula_excepcion_mas clausula_excepcion");}
;

bloque_instrucciones_final_interrogacion : FINALMENTE bloque_instrucciones  {printf ("bloque_instrucciones_final_interrogacion -> FINALMENTE bloque_instrucciones");}
|                                                                           {printf ("bloque_instrucciones_final_interrogacion -> vacio");}
;

clausula_excepcion : CUANDO nombre EJECUTA bloque_instrucciones {printf ("clausula_excepcion -> CUANDO nombre EJECUTA bloque_instrucciones");}
;

instruccion_lanzar : LANZAR nombre ';'  {printf ("instruccion_lanzar -> LANZAR nombre ';'");}
;

/***************/
/* expresiones */
/***************/
expresion_constante : CTC_ENTERA   {printf ("expresion_constante -> CTC_ENTERA");}
                    | CTC_REAL     {printf ("expresion_constante -> CTC_REAL");}
                    | CTC_CADENA   {printf ("expresion_constante -> CTC_CADENA");}
                    | CTC_CARACTER {printf ("expresion_constante -> CTC_CARACTER");}
                    | CTC_BOOLEANA {printf ("expresion_constante -> CTC_BOOLEANA");}
;

expresion_primaria : expresion_constante  {printf ("expresion_primaria -> expresion_constante");}
                    | objeto              {printf ("expresion_primaria -> objeto");}
                    | llamada_subprograma {printf ("expresion_primaria -> llamada_subprograma");}
                    | '(' expresion ')'   {printf ("expresion_primaria -> '(' expresion ')'");}
;

objeto : nombre                       {printf ("objeto -> nombre");}
      | objeto '['  expresion  ']'    {printf ("objeto -> objeto '[' expresion ']'");}
      | objeto '.' IDENTIFICADOR      {printf ("objeto -> objeto '.' IDENTIFICADOR");}
;

expresion_mas : expresion {printf ("expresion_mas -> expresion");}
| expresion_mas expresion {printf ("expresion_mas -> expresion_mas expresion");}
;


%%

int yyerror(char *s) {
  fflush(stdout);
  printf("***************** %s\n",s);
  }

int yywrap() {
  return(1);
  }

int main(int argc, char *argv[]) {

  yydebug = 0;

  if (argc < 2) {
    printf("Uso: ./moronico NombreArchivo\n");
    }
  else {
    yyin = fopen(argv[1],"r");
    yyparse();
    }
}

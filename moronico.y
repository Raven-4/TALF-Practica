%{

  #include <stdio.h>
  extern FILE *yyin;
  extern int yylex();

  #define YYDEBUG 1

%} 

%token ABSTRACTO AND ASOCIATIVA BOOLEANO CABECERA CADENA CASO CARACTER CARGA CLASE CONJUNTO CONSTANTE CUERPO CTC_BOOLEANA CTC_CADENA CTC_CARACTER CTC_ENTERA CTC_REAL CONSTRUCTOR CUANDO CUATRO_PTOS DESCENDENTE DESPD DESPI DESTRUCTOR DE DEVOLVER DOS_PTOS EJECUTA ELEMENTO EN ENTERO ENTONCES EQ ESPECIFICO EXCEPTO FICHERO FINAL FINALMENTE FLECHA_DOBLE FUNCION GEQ GENERICO HASTA IDENTIFICADOR INTERFAZ LANZAR LEQ LISTA MIENTRAS MODIFICABLE NEQ OTRO OR PAQUETE PARA PATH POTENCIA PRIVADO PROBAR PROCEDIMIENTO PROGRAMA PUBLICO REAL REGISTRO REPITE SEA SALIR SEMIPUBLICO SI SINO TIPO VARIABLE

%right OR
%right AND
%nonassoc '!'
%left '<' '>' LEQ GEQ EQ NEQ
%left '@'
%left '^'
%left '&'
%left DESPI DESPD
%left '+' '-'
%left '*' '/' '%'
%right POTENCIA

%%

/************************************************************************************************************************************************************************************/
/*                                                                      programas, paquetes y cargas                                                                                */
/************************************************************************************************************************************************************************************/

programa : definicion_programa                                              {printf ("\nprograma -> definicion_programa");}
         | definicion_paquete                                               {printf ("\nprograma -> definicion_paquete");}
;

definicion_programa : PROGRAMA nombre ';' bloque_programa                   {printf ("\ndefinicion_programa -> PROGRAMA nombre ';' bloque_programa");}
;

nombre : IDENTIFICADOR                                                      {printf ("\nnombre -> IDENTIFICADOR");}
       | nombre CUATRO_PTOS IDENTIFICADOR                                   {printf ("\nnombre -> nombre CUATRO_PTOS IDENTIFICADOR");}
;

bloque_programa : bloque_instrucciones                                                                                    {printf ("\nbloque_programa -> bloque_instrucciones");}

                | declaracion_cargas bloque_instrucciones                                                                 {printf ("\nbloque_programa -> declaracion_cargas bloque_instrucciones");}
                | declaracion_cargas declaracion_tipos bloque_instrucciones                                               {printf ("\nbloque_programa -> declaracion_cargas declaracion_tipos bloque_instrucciones");}
                | declaracion_cargas declaracion_constantes bloque_instrucciones                                          {printf ("\nbloque_programa -> declaracion_cargas declaracion_constantes bloque_instrucciones");}
                | declaracion_cargas declaracion_variables bloque_instrucciones                                           {printf ("\nbloque_programa -> declaracion_cargas declaracion_variables bloque_instrucciones");}
                | declaracion_cargas declaracion_tipos declaracion_constantes bloque_instrucciones                        {printf ("\nbloque_programa -> declaracion_cargas declaracion_tipos declaracion_constantes bloque_instrucciones");}
                | declaracion_cargas declaracion_tipos declaracion_variables bloque_instrucciones                         {printf ("\nbloque_programa -> declaracion_cargas declaracion_tipos declaracion_variables bloque_instrucciones");}
                | declaracion_cargas declaracion_tipos declaracion_constantes declaracion_variables bloque_instrucciones  {printf ("\nbloque_programa -> declaracion_cargas declaracion_tipos declaracion_constantes declaracion_variables bloque_instrucciones");}

                | declaracion_tipos bloque_instrucciones                                                                  {printf ("\nbloque_programa -> declaracion_tipos bloque_instrucciones");}
                | declaracion_tipos declaracion_constantes bloque_instrucciones                                           {printf ("\nbloque_programa -> declaracion_tipos declaracion_constantes bloque_instrucciones");}
                | declaracion_tipos declaracion_variables bloque_instrucciones                                            {printf ("\nbloque_programa -> declaracion_tipos declaracion_variables bloque_instrucciones");}
                |  declaracion_tipos declaracion_constantes declaracion_variables bloque_instrucciones                    {printf ("\nbloque_programa -> declaracion_tipos declaracion_constantes declaracion_variables bloque_instrucciones");}

                | declaracion_constantes bloque_instrucciones                                                             {printf ("\nbloque_programa -> declaracion_constantes bloque_instrucciones");}
                | declaracion_constantes declaracion_variables bloque_instrucciones                                       {printf ("\nbloque_programa -> declaracion_constantes declaracion_variables bloque_instrucciones");}

                | declaracion_variables bloque_instrucciones                                                              {printf ("\nbloque_programa -> declaracion_variables bloque_instrucciones");}
;
               
bloque_instrucciones : '{' instruccion_mas '}'                                          {printf ("\nbloque_instrucciones -> '{' instruccion_mas '}'");}
;

instruccion_mas : instruccion                                                           {printf ("\ninstruccion_mas -> instruccion");}
                | instruccion_mas instruccion                                           {printf ("\ninstruccion_mas -> instruccion_mas instruccion");}
;

definicion_paquete : PAQUETE nombre ';' seccion_cabecera seccion_cuerpo                 {printf ("\ndefinicion_paquete -> PAQUETE nombre ';' seccion_cabecera seccion_cuerpo");}
;

seccion_cabecera : CABECERA                                                             {printf ("\nseccion_cabecera -> CABECERA");}
                 
                 | CABECERA declaracion_cargas                                                                                        {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas");}
                 | CABECERA declaracion_cargas declaracion_tipos                                                                      {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_tipos");}
                 | CABECERA declaracion_cargas declaracion_constantes                                                                 {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_constantes");}
                 | CABECERA declaracion_cargas declaracion_variables                                                                  {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_variables");}
                 | CABECERA declaracion_cargas declaracion_interfaces                                                                 {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_interfaces");}
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_constantes                                               {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_tipos declaracion_constantes");}
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_variables                                                {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_tipos declaracion_variables");}
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_interfaces                                               {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_tipos declaracion_interfaces");}
                 | CABECERA declaracion_cargas declaracion_constantes declaracion_variables                                           {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_constantes declaracion_variables");}
                 | CABECERA declaracion_cargas declaracion_constantes declaracion_interfaces                                          {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_constantes declaracion_interfaces");}
                 | CABECERA declaracion_cargas declaracion_variables declaracion_interfaces                                           {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_variables declaracion_interfaces");}
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_constantes declaracion_variables                         {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_tipos declaracion_constantes declaracion_variables");}
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_constantes declaracion_interfaces                        {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_tipos declaracion_constantes declaracion_interfaces");}
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_variables declaracion_interfaces                         {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_tipos declaracion_variables declaracion_interfaces");}
                 | CABECERA declaracion_cargas declaracion_constantes declaracion_variables declaracion_interfaces                    {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_constantes declaracion_variables declaracion_interfaces");}
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_constantes declaracion_variables declaracion_interfaces  {printf ("\nseccion_cabecera -> CABECERA declaracion_cargas declaracion_tipos declaracion_constantes declaracion_variables declaracion_interfaces");}

                 | CABECERA declaracion_tipos                                                                                         {printf ("\nseccion_cabecera -> CABECERA declaracion_tipos");}
                 | CABECERA declaracion_tipos declaracion_constantes                                                                  {printf ("\nseccion_cabecera -> CABECERA declaracion_tipos declaracion_constantes");}
                 | CABECERA declaracion_tipos declaracion_variables                                                                   {printf ("\nseccion_cabecera -> CABECERA declaracion_tipos declaracion_variables");}
                 | CABECERA declaracion_tipos declaracion_interfaces                                                                  {printf ("\nseccion_cabecera -> CABECERA declaracion_tipos declaracion_interfaces");}
                 | CABECERA declaracion_tipos declaracion_constantes declaracion_variables                                            {printf ("\nseccion_cabecera -> CABECERA declaracion_tipos declaracion_constantes declaracion_variables");}
                 | CABECERA declaracion_tipos declaracion_constantes declaracion_interfaces                                           {printf ("\nseccion_cabecera -> CABECERA declaracion_tipos declaracion_constantes declaracion_interfaces");}
                 | CABECERA declaracion_tipos declaracion_variables declaracion_interfaces                                            {printf ("\nseccion_cabecera -> CABECERA declaracion_tipos declaracion_variables declaracion_interfaces");}
                 | CABECERA declaracion_tipos declaracion_constantes declaracion_variables declaracion_interfaces                     {printf ("\nseccion_cabecera -> CABECERA declaracion_tipos declaracion_constantes declaracion_variables declaracion_interfaces");}

                 | CABECERA declaracion_constantes                                                          {printf ("\nseccion_cabecera -> CABECERA declaracion_constantes");}
                 | CABECERA declaracion_constantes declaracion_variables                                    {printf ("\nseccion_cabecera -> CABECERA declaracion_constantes declaracion_variables");}
                 | CABECERA declaracion_constantes declaracion_interfaces                                   {printf ("\nseccion_cabecera -> CABECERA declaracion_constantes declaracion_interfaces");}
                 | CABECERA declaracion_constantes declaracion_variables declaracion_interfaces             {printf ("\nseccion_cabecera -> CABECERA declaracion_constantes declaracion_variables declaracion_interfaces");}

                 | CABECERA declaracion_variables                                                           {printf ("\nseccion_cabecera -> CABECERA declaracion_variables");}
                 | CABECERA declaracion_variables declaracion_interfaces                                    {printf ("\nseccion_cabecera -> CABECERA declaracion_variables declaracion_interfaces");}

                 | CABECERA declaracion_interfaces                                                          {printf ("\nseccion_cabecera -> CABECERA declaracion_interfaces");}
;

seccion_cuerpo : CUERPO                                                                                                   {printf ("\nseccion_cuerpo -> CUERPO");}

               | CUERPO declaracion_tipos declaracion_subprograma_mas                                                     {printf ("\nseccion_cuerpo -> CUERPO declaracion_tipos declaracion_subprograma_mas");}
               | CUERPO declaracion_tipos declaracion_constantes declaracion_subprograma_mas                              {printf ("\nseccion_cuerpo -> CUERPO declaracion_tipos declaracion_constantes declaracion_subprograma_mas");}
               | CUERPO declaracion_tipos declaracion_variables declaracion_subprograma_mas                               {printf ("\nseccion_cuerpo -> CUERPO declaracion_tipos declaracion_variables declaracion_subprograma_mas");}
               | CUERPO declaracion_tipos declaracion_constantes declaracion_variables declaracion_subprograma_mas        {printf ("\nseccion_cuerpo -> CUERPO declaracion_tipos declaracion_constantes declaracion_variables declaracion_subprograma_mas");}
  
               | CUERPO declaracion_constantes declaracion_variables declaracion_subprograma_mas                          {printf ("\nseccion_cuerpo -> CUERPO declaracion_constantes declaracion_variables declaracion_subprograma_mas");}
               | CUERPO declaracion_constantes declaracion_subprograma_mas                                                {printf ("\nseccion_cuerpo -> CUERPO declaracion_constantes declaracion_subprograma_mas");}
  
               | CUERPO declaracion_variables declaracion_subprograma_mas                                                 {printf ("\nseccion_cuerpo -> CUERPO declaracion_variables declaracion_subprograma_mas");}
;

declaracion_subprograma_mas : declaracion_subprograma                             {printf ("\ndeclaracion_subprograma_mas -> declaracion_subprograma");}
                            | declaracion_subprograma_mas declaracion_subprograma {printf ("\ndeclaracion_subprograma_mas -> declaracion_subprograma_mas declaracion_subprograma");}
;

declaracion_cargas : CARGA declaracion_carga_mas ';'                              {printf ("\ndeclaracion_cargas -> CARGA declaracion_carga_mas ';'");}
;

declaracion_carga_mas : declaracion_carga                                         {printf ("\ndeclaracion_carga_mas -> declaracion_carga");}
                      | declaracion_carga_mas ',' declaracion_carga               {printf ("\ndeclaracion_carga_mas -> declaracion_carga_mas ',' declaracion_carga");}
;

declaracion_carga : nombre                                                        {printf ("\ndeclaracion_carga -> nombre");}
                  | nombre EN PATH                                                {printf ("\ndeclaracion_carga -> nombre EN PATH");}
                  | nombre '(' nombre_mas')'                                      {printf ("\ndeclaracion_carga -> nombre '(' nombre_mas')'");}
                  | nombre EN PATH '(' nombre_mas')'                              {printf ("\ndeclaracion_carga -> nombre EN PATH '(' nombre_mas')'");}
;

nombre_mas : nombre                                                               {printf ("\nnombre_mas -> nombre");}
           | nombre_mas ',' nombre                                                {printf ("\nnombre_mas -> nombre_mas ',' nombre");}
;

/************************************************************************************************************************************************************************************/
/*                                                                                    tipos                                                                                         */
/************************************************************************************************************************************************************************************/

declaracion_tipos : TIPO declaracion_tipo_mas                                     {printf ("\ndeclaracion_tipos -> TIPO declaracion_tipo_mas");}
;

declaracion_tipo_mas : declaracion_tipo                                           {printf ("\ndeclaracion_tipo_mas -> declaracion_tipo");}
                     | declaracion_tipo_mas declaracion_tipo                      {printf ("\ndeclaracion_tipo_mas -> declaracion_tipo_mas declaracion_tipo");}
;

declaracion_tipo : nombre '=' tipo_no_estructurado_o_nombre_tipo ';'              {printf ("\ndeclaracion_tipo -> nombre '=' tipo_no_estructurado_o_nombre_tipo ';'");}
                 | nombre '=' tipo_estructurado                                   {printf ("\ndeclaracion_tipo -> nombre '=' tipo_estructurado");}
;

tipo_no_estructurado_o_nombre_tipo : nombre                                       {printf ("\ntipo_no_estructurado_o_nombre_tipo -> nombre");}
                                   | tipo_escalar                                 {printf ("\ntipo_no_estructurado_o_nombre_tipo -> tipo_escalar");}
                                   | tipo_fichero                                 {printf ("\ntipo_no_estructurado_o_nombre_tipo -> tipo_fichero");}
                                   | tipo_enumerado                               {printf ("\ntipo_no_estructurado_o_nombre_tipo -> tipo_enumerado");}
                                   | tipo_lista                                   {printf ("\ntipo_no_estructurado_o_nombre_tipo -> tipo_lista");}
                                   | tipo_lista_asociativa                        {printf ("\ntipo_no_estructurado_o_nombre_tipo -> tipo_lista_asociativa");}
                                   | tipo_conjunto                                {printf ("\ntipo_no_estructurado_o_nombre_tipo -> tipo_conjunto");}
;

tipo_estructurado : tipo_registro                                                 {printf ("\ntipo_estructurado -> tipo_registro");}
                  | declaracion_clase                                             {printf ("\ntipo_estructurado -> declaracion_clase");}
;

tipo_escalar : ENTERO                                                             {printf ("\ntipo_escalar -> ENTERO");}
             | REAL                                                               {printf ("\ntipo_escalar -> REAL");}
             | BOOLEANO                                                           {printf ("\ntipo_escalar -> BOOLEANO");}
             | CARACTER                                                           {printf ("\ntipo_escalar -> CARACTER");}
             | CADENA                                                             {printf ("\ntipo_escalar -> CADENA");}
;

tipo_fichero : FICHERO                                                            {printf ("\ntipo_fichero -> FICHERO");}
;

tipo_enumerado : '(' expresion_constante_mas ')'                                  {printf ("\ntipo_enumerado -> '(' expresion_constante_mas ')'");}
;

expresion_constante_mas : expresion_constante                                     {printf ("\nexpresion_constante_mas -> expresion_constante");}
                        | expresion_constante_mas ',' expresion_constante         {printf ("\nexpresion_constante_mas -> expresion_constante_mas ',' expresion_constante");}
;

tipo_lista : LISTA DE tipo_no_estructurado_o_nombre_tipo                          {printf ("\ntipo_lista -> LISTA DE tipo_no_estructurado_o_nombre_tipo");}
           | LISTA rango_mas DE tipo_no_estructurado_o_nombre_tipo                {printf ("\ntipo_lista -> LISTA rango_mas DE tipo_no_estructurado_o_nombre_tipo");}
;

rango_mas : rango                                                                 {printf ("\nrango_mas -> rango");}
          | rango_mas ',' rango                                                   {printf ("\nrango_mas -> rango_mas ',' rango");}
;

rango : expresion DOS_PTOS expresion                                              {printf ("\nrango -> expresion DOS_PTOS expresion");}
      | expresion DOS_PTOS expresion DOS_PTOS expresion                           {printf ("\nrango -> expresion DOS_PTOS expresion DOS_PTOS expresion");}
;

tipo_lista_asociativa : LISTA ASOCIATIVA DE tipo_no_estructurado_o_nombre_tipo    {printf ("\ntipo_lista_asociativa -> LISTA ASOCIATIVA DE tipo_no_estructurado_o_nombre_tipo");}
;

tipo_conjunto : CONJUNTO DE tipo_no_estructurado_o_nombre_tipo                    {printf ("\ntipo_conjunto -> CONJUNTO DE tipo_no_estructurado_o_nombre_tipo");}
;

tipo_registro : REGISTRO '{' declaracion_campo_mas '}'                            {printf ("\ntipo_registro -> REGISTRO '{' declaracion_campo_mas '}'");}
;

declaracion_campo_mas : declaracion_campo                                         {printf ("\ndeclaracion_campo_mas -> declaracion_campo");}
                      | declaracion_campo_mas declaracion_campo                   {printf ("\ndeclaracion_campo_mas -> declaracion_campo_mas declaracion_campo");}
;

declaracion_campo : nombre_mas ':' tipo_no_estructurado_o_nombre_tipo ';'         {printf ("\ndeclaracion_campo -> nombre_mas ':' tipo_no_estructurado_o_nombre_tipo ';'");}
;

/************************************************************************************************************************************************************************************/
/*                                                                                clases                                                                                            */
/************************************************************************************************************************************************************************************/
declaracion_clase : CLASE '{' declaraciones_publicas '}'                                                                  {printf ("\ndeclaracion_clase -> CLASE '{' declaraciones_publicas '}'");}

                  | CLASE FINAL '{' declaraciones_publicas '}'                                                            {printf ("\ndeclaracion_clase -> CLASE FINAL '{' declaraciones_publicas '}'");}
                  | CLASE FINAL '(' nombre_mas ')' '{' declaraciones_publicas '}'                                         {printf ("\ndeclaracion_clase -> CLASE FINAL '(' nombre_mas ')' '{' declaraciones_publicas '}'");}
                  | CLASE FINAL '{' declaraciones_publicas declaraciones_semi '}'                                         {printf ("\ndeclaracion_clase -> CLASE FINAL '{' declaraciones_publicas declaraciones_semi '}'");}
                  | CLASE FINAL '{' declaraciones_publicas  declaraciones_privadas '}'                                    {printf ("\ndeclaracion_clase -> CLASE FINAL '{' declaraciones_publicas  declaraciones_privadas '}'");}
                  | CLASE FINAL '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_semi '}'                      {printf ("\ndeclaracion_clase -> CLASE FINAL '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_semi '}'");}
                  | CLASE FINAL '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_privadas '}'                  {printf ("\ndeclaracion_clase -> CLASE FINAL '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_privadas '}'");}
                  | CLASE FINAL '{' declaraciones_publicas declaraciones_semi declaraciones_privadas '}'                  {printf ("\ndeclaracion_clase -> CLASE FINAL '{' declaraciones_publicas declaraciones_semi declaraciones_privadas '}'");}
                  
                  | CLASE '(' nombre_mas ')' '{' declaraciones_publicas '}'                                               {printf ("\ndeclaracion_clase -> CLASE '(' nombre_mas ')' '{' declaraciones_publicas '}'");}
                  | CLASE '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_semi '}'                            {printf ("\ndeclaracion_clase -> CLASE '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_semi '}'");}
                  | CLASE '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_privadas '}'                        {printf ("\ndeclaracion_clase -> CLASE '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_privadas '}'");}
                  | CLASE '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_semi declaraciones_privadas '}'     {printf ("\ndeclaracion_clase -> CLASE '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_semi declaraciones_privadas '}'");}

                  | CLASE '{' declaraciones_publicas declaraciones_semi '}'                                               {printf ("\ndeclaracion_clase -> CLASE '{' declaraciones_publicas declaraciones_semi '}'");}
                  | CLASE '{' declaraciones_publicas declaraciones_semi declaraciones_privadas '}'                        {printf ("\ndeclaracion_clase -> CLASE '{' declaraciones_publicas declaraciones_semi declaraciones_privadas '}'");}

                  | CLASE '{' declaraciones_publicas declaraciones_privadas '}'                                           {printf ("\ndeclaracion_clase -> CLASE '{' declaraciones_publicas declaraciones_privadas '}'");}
;

declaraciones_publicas : declaracion_componente_mas                             {printf ("\ndeclaraciones_publicas -> declaracion_componente_mas");}
                       | PUBLICO declaracion_componente_mas                     {printf ("\ndeclaraciones_publicas -> PUBLICO declaracion_componente_mas");}
;

declaraciones_semi : SEMIPUBLICO declaracion_componente_mas                     {printf ("\ndeclaraciones_semi -> SEMIPUBLICO declaracion_componente_mas");}
;

declaraciones_privadas : PRIVADO declaracion_componente_mas                     {printf ("\ndeclaraciones_privadas -> PRIVADO declaracion_componente_mas");}
;

declaracion_componente_mas : declaracion_componente                             {printf ("\ndeclaracion_componente_mas -> declaracion_componente");}
                           | declaracion_componente_mas declaracion_componente  {printf ("\ndeclaracion_componente_mas -> declaracion_componente_mas declaracion_componente");}
;

declaracion_componente : declaracion_tipo_anidado                               {printf ("\ndeclaracion_componente -> declaracion_tipo_anidado");}
                       | declaracion_constante_anidada                          {printf ("\ndeclaracion_componente -> declaracion_constante_anidada");}
                       | declaracion_atributos                                  {printf ("\ndeclaracion_componente -> declaracion_atributos");}
                       | cabecera_subprograma ';'                               {printf ("\ndeclaracion_componente -> cabecera_subprograma ';'");}
                       | cabecera_subprograma ';' modificadores ';'             {printf ("\ndeclaracion_componente -> cabecera_subprograma ';' modificadores ';'");}
;

declaracion_tipo_anidado : TIPO declaracion_tipo                                {printf ("\ndeclaracion_tipo_anidado -> TIPO declaracion_tipo");}
;

declaracion_constante_anidada : CONSTANTE declaracion_constante                 {printf ("\ndeclaracion_constante_anidada -> CONSTANTE declaracion_constante");}
;

declaracion_atributos : nombre_mas ':' tipo_no_estructurado_o_nombre_tipo ';'   {printf ("\ndeclaracion_atributos -> nombre_mas ':' tipo_no_estructurado_o_nombre_tipo ';'");}
;

modificadores : modificador_mas                                                 {printf ("\nmodificadores -> modificador_mas");}
;

modificador_mas : modificador                                                   {printf ("\nmodificador_mas -> modificador");}
                | modificador_mas ',' modificador                               {printf ("\nmodificador_mas -> modificador_mas ',' modificador");}
;

modificador : GENERICO                                                          {printf ("\nmodificador -> GENERICO");}
            | ABSTRACTO                                                         {printf ("\nmodificador -> ABSTRACTO");}
            | ESPECIFICO                                                        {printf ("\nmodificador -> ESPECIFICO");}
            | FINAL                                                             {printf ("\nmodificador -> FINAL");}
;

/************************************************************************************************************************************************************************************/
/*                                                                              constantes                                                                                          */
/************************************************************************************************************************************************************************************/

declaracion_constantes : CONSTANTE declaracion_constante_mas                    {printf ("\ndeclaracion_constantes -> CONSTANTE declaracion_constante_mas");}
;

declaracion_constante_mas : declaracion_constante                               {printf ("\ndeclaracion_constante_mas -> declaracion_constante");}
                          | declaracion_constante_mas declaracion_constante     {printf ("\ndeclaracion_constante_mas -> declaracion_constante_mas declaracion_constante");}
;

declaracion_constante : nombre ':' tipo_no_estructurado_o_nombre_tipo '=' valor_constante ';'   {printf ("\ndeclaracion_constante -> nombre ':' tipo_no_estructurado_o_nombre_tipo '=' valor_constante ';'");}
;

valor_constante : expresion                                                     {printf ("\nvalor_constante -> expresion");}
                | '[' valor_constante_mas ']'                                   {printf ("\nvalor_constante -> '[' valor_constante_mas ']'");}
                | '[' clave_valor_mas ']'                                       {printf ("\nvalor_constante -> '[' clave_valor_mas ']'");}
                | '[' campo_valor_mas ']'                                       {printf ("\nvalor_constante -> '[' campo_valor_mas ']'");}
;

valor_constante_mas : valor_constante                                           {printf ("\nvalor_constante_mas -> valor_constante");}
                    | valor_constante_mas ',' valor_constante                   {printf ("\nvalor_constante_mas -> valor_constante_mas ',' valor_constante");}
;

clave_valor_mas : clave_valor                                                   {printf ("\nclave_valor_mas -> clave_valor");}
                | clave_valor_mas ',' clave_valor                               {printf ("\nclave_valor_mas -> clave_valor_mas ',' clave_valor");}
;

campo_valor_mas : campo_valor                                                   {printf ("\ncampo_valor_mas -> campo_valor");}
                | campo_valor_mas ',' campo_valor                               {printf ("\ncampo_valor_mas -> campo_valor_mas ',' campo_valor");}
;

clave_valor : CTC_CADENA FLECHA_DOBLE valor_constante                           {printf ("\nclave_valor -> CTC_CADENA FLECHA_DOBLE valor_constante");}
;

campo_valor : nombre FLECHA_DOBLE valor_constante                               {printf ("\ncampo_valor -> nombre FLECHA_DOBLE valor_constante");}
;

/************************************************************************************************************************************************************************************/
/*                                                                              variables                                                                                           */
/************************************************************************************************************************************************************************************/

declaracion_variables : VARIABLE declaracion_variable_mas                       {printf ("\ndeclaracion_variables -> VARIABLE declaracion_variable_mas");}
;

declaracion_variable_mas : declaracion_variable                                 {printf ("\ndeclaracion_variable_mas -> declaracion_variable");}  
                         | declaracion_variable_mas declaracion_variable        {printf ("\ndeclaracion_variable_mas -> declaracion_variable_mas declaracion_variable");}
;

declaracion_variable : nombre_mas':' tipo_no_estructurado_o_nombre_tipo ';'                         {printf ("\ndeclaracion_variable -> mas':' tipo_no_estructurado_o_nombre_tipo ';'");}
                     | nombre_mas':' tipo_no_estructurado_o_nombre_tipo '=' valor_constante ';'     {printf ("\ndeclaracion_variable -> nombre_mas':' tipo_no_estructurado_o_nombre_tipo '=' valor_constante ';'");}

/************************************************************************************************************************************************************************************/
/*                                                                              interfaces                                                                                          */
/************************************************************************************************************************************************************************************/
declaracion_interfaces : INTERFAZ cabecera_subprograma_mas                      {printf ("\ndeclaracion_interfaces -> INTERFAZ cabecera_subprograma_mas");}
;

cabecera_subprograma_mas : cabecera_subprograma ';'                             {printf ("\ncabecera_subprograma_mas -> cabecera_subprograma ';'");}
                         | cabecera_subprograma_mas cabecera_subprograma ';'    {printf ("\ncabecera_subprograma_mas -> cabecera_subprograma_mas cabecera_subprograma ';'");}
;

/************************************************************************************************************************************************************************************/
/*                                                                             subprogramas                                                                                         */
/************************************************************************************************************************************************************************************/

declaracion_subprograma : cabecera_subprograma bloque_subprograma               {printf ("\ndeclaracion_subprograma -> cabecera_subprograma bloque_subprograma");}
;

cabecera_subprograma : cabecera_funcion                                         {printf ("\ncabecera_subprograma -> cabecera_funcion");}
                     | cabecera_procedimiento                                   {printf ("\ncabecera_subprograma -> cabecera_procedimiento");}
                     | cabecera_constructor                                     {printf ("\ncabecera_subprograma -> cabecera_constructor");}
                     | cabecera_destructor                                      {printf ("\ncabecera_subprograma -> cabecera_destructor");}
;

cabecera_funcion : FUNCION nombre  FLECHA_DOBLE tipo_no_estructurado_o_nombre_tipo                            {printf ("\ncabecera_funcion -> FUNCION nombre  FLECHA_DOBLE tipo_no_estructurado_o_nombre_tipo");}
                 | FUNCION nombre declaracion_parametros FLECHA_DOBLE tipo_no_estructurado_o_nombre_tipo      {printf ("\ncabecera_funcion -> FUNCION nombre declaracion_parametros FLECHA_DOBLE tipo_no_estructurado_o_nombre_tipo");}
;

cabecera_procedimiento : PROCEDIMIENTO nombre                                   {printf ("\ncabecera_procedimiento -> PROCEDIMIENTO nombre");}
                       | PROCEDIMIENTO nombre declaracion_parametros            {printf ("\ncabecera_procedimiento -> PROCEDIMIENTO nombre declaracion_parametros");}
;

cabecera_constructor : CONSTRUCTOR nombre                                       {printf ("\ncabecera_constructor -> CONSTRUCTOR nombre");}
                     | CONSTRUCTOR nombre declaracion_parametros                {printf ("\ncabecera_constructor -> CONSTRUCTOR nombre declaracion_parametros");}
;

cabecera_destructor : DESTRUCTOR nombre                                         {printf ("\ncabecera_destructor -> DESTRUCTOR nombre");}
;

declaracion_parametros : '(' lista_parametros_formales ')'                      {printf ("\ndeclaracion_parametros -> '(' lista_parametros_formales ')'");}
;

lista_parametros_formales : parametros_formales                                                               {printf ("\nlista_parametros_formales -> parametros_formales");}
                          | lista_parametros_formales ';' parametros_formales                                 {printf ("\nlista_parametros_formales -> lista_parametros_formales ';' parametros_formales");}
;

parametros_formales : nombre_mas ':' tipo_no_estructurado_o_nombre_tipo                                       {printf ("\nparametros_formales -> nombre_mas ':' tipo_no_estructurado_o_nombre_tipo");}
                    |  nombre_mas ':' tipo_no_estructurado_o_nombre_tipo MODIFICABLE                          {printf ("\nparametros_formales -> nombre_mas ':' tipo_no_estructurado_o_nombre_tipo MODIFICABLE");}
;

bloque_subprograma : bloque_instrucciones                                                                     {printf ("\nbloque_subprograma -> bloque_instrucciones");}
                   | declaracion_tipos bloque_instrucciones                                                   {printf ("\nbloque_subprograma -> declaracion_tipos bloque_instrucciones");}
                   | declaracion_constantes bloque_instrucciones                                              {printf ("\nbloque_subprograma -> declaracion_constantes bloque_instrucciones");}
                   | declaracion_variables bloque_instrucciones                                               {printf ("\nbloque_subprograma -> declaracion_variables bloque_instrucciones");}
                   | declaracion_tipos declaracion_constantes bloque_instrucciones                            {printf ("\nbloque_subprograma -> declaracion_tipos declaracion_constantes bloque_instrucciones");}
                   | declaracion_tipos declaracion_variables bloque_instrucciones                             {printf ("\nbloque_subprograma -> declaracion_tipos declaracion_variables bloque_instrucciones");}
                   | declaracion_tipos declaracion_constantes declaracion_variables bloque_instrucciones      {printf ("\nbloque_subprograma -> declaracion_tipos declaracion_constantes declaracion_variables bloque_instrucciones");}
;

/************************************************************************************************************************************************************************************/
/*                                                                            instrucciones                                                                                         */
/************************************************************************************************************************************************************************************/

instruccion : ';'                                                                 {printf ("\ninstruccion -> ';'");}
            | instruccion_asignacion                                              {printf ("\ninstruccion -> instruccion_asignacion");}
            | instruccion_salir                                                   {printf ("\ninstruccion -> instruccion_salir");}
            | instruccion_devolver                                                {printf ("\ninstruccion -> instruccion_devolver");}
            | instruccion_llamada                                                 {printf ("\ninstruccion -> instruccion_llamada");}
            | instruccion_si                                                      {printf ("\ninstruccion -> instruccion_si");}
            | instruccion_casos                                                   {printf ("\ninstruccion -> instruccion_casos");}
            | instruccion_bucle                                                   {printf ("\ninstruccion -> instruccion_bucle");}
            | instruccion_probar_excepto                                          {printf ("\ninstruccion -> instruccion_probar_excepto");}
            | instruccion_lanzar                                                  {printf ("\ninstruccion -> instruccion_lanzar");}
;

instruccion_asignacion : objeto '=' expresion ';'                                 {printf ("\ninstruccion_asignacion -> objeto '=' expresion ';'");}
;

instruccion_salir : SALIR ';'                                                     {printf ("\ninstruccion_salir -> SALIR ';'");}
                  | SALIR SI expresion ';'                                        {printf ("\ninstruccion_salir -> SALIR SI expresion ';'");}
;

instruccion_devolver : DEVOLVER ';'                                               {printf ("\ninstruccion_devolver -> DEVOLVER ';'");}
                     | DEVOLVER expresion ';'                                     {printf ("\ninstruccion_devolver -> DEVOLVER expresion ';'");}
;

instruccion_llamada : llamada_subprograma ';'                                     {printf ("\ninstruccion_llamada -> llamada_subprograma ';'");}
;

llamada_subprograma : nombre '(' expresion_asterisco ')'                          {printf ("\nllamada_subprograma -> nombre '(' expresion_asterisco ')'");}
;

instruccion_si : SI expresion ENTONCES bloque_instrucciones SINO bloque_instrucciones_interrogacion     {printf ("\ninstruccion_si -> SI expresion ENTONCES bloque_instrucciones SINO bloque_instrucciones_interrogacion");}
;

bloque_instrucciones_interrogacion :                                              {printf ("\nbloque_instrucciones_interrogacion -> vacío");}
                                   | bloque_instrucciones                         {printf ("\nbloque_instrucciones_interrogacion -> bloque_instrucciones");}
;

instruccion_casos : EN CASO expresion SEA caso_mas ';'                            {printf ("\ninstruccion_casos -> EN CASO expresion SEA caso_mas ';'");}
;

caso_mas : caso                                                                   {printf ("\ncaso_mas -> caso");}
         | caso_mas caso                                                          {printf ("\ncaso_mas -> caso_mas caso");}
;

caso :  entradas FLECHA_DOBLE bloque_instrucciones                                {printf ("\ncaso -> entradas FLECHA_DOBLE bloque_instrucciones");}
;

entradas : entrada                                                                {printf ("\nentradas -> entrada");}
         | entrada_asterisco entrada                                              {printf ("\nentradas -> entrada_asterisco entrada");}
;

entrada_asterisco : entrada '|'                                                   {printf ("\nentrada_asterisco -> entrada '|'");}
                  | entrada_asterisco entrada '|'                                 {printf ("\nentrada_asterisco -> entrada_asterisco entrada '|'");}
; 

entrada : expresion                                                               {printf ("\nentrada -> expresion");}
        | rango                                                                   {printf ("\nentrada -> rango");}
        | OTRO                                                                    {printf ("\nentrada -> OTRO");}
;

instruccion_bucle : clausula_iteracion bloque_instrucciones                       {printf ("\ninstruccion_bucle -> clausula_iteracion bloque_instrucciones");}
;

clausula_iteracion : PARA nombre EN objeto                                        {printf ("\nclausula_iteracion -> PARA nombre EN objeto");}
                   | REPITE ELEMENTO nombre EN rango                              {printf ("\nclausula_iteracion -> REPITE ELEMENTO nombre EN rango");}
                   | REPITE ELEMENTO nombre EN rango DESCENDENTE                  {printf ("\nclausula_iteracion -> REPITE ELEMENTO nombre EN rango DESCENDENTE");}
                   | MIENTRAS expresion                                           {printf ("\nclausula_iteracion -> MIENTRAS expresion");}   
                   | REPITE HASTA expresion                                       {printf ("\nclausula_iteracion -> REPITE HASTA expresion");}                 
;

instruccion_probar_excepto : PROBAR bloque_instrucciones EXCEPTO clausula_excepcion_mas                                       {printf ("\ninstruccion_probar_excepto -> PROBAR bloque_instrucciones EXCEPTO clausula_excepcion_mas");}
                           | PROBAR bloque_instrucciones EXCEPTO clausula_excepcion_mas FINALMENTE bloque_instrucciones       {printf ("\ninstruccion_probar_excepto -> PROBAR bloque_instrucciones EXCEPTO clausula_excepcion_mas FINALMENTE bloque_instrucciones");}

;

clausula_excepcion_mas : clausula_excepcion                                       {printf ("\nclausula_excepcion_mas -> clausula_excepcion");}
                       | clausula_excepcion_mas clausula_excepcion                {printf ("\nclausula_excepcion_mas -> clausula_excepcion_mas clausula_excepcion");}
;

clausula_excepcion : CUANDO nombre EJECUTA bloque_instrucciones                   {printf ("\nclausula_excepcion -> CUANDO nombre EJECUTA bloque_instrucciones");}
;

instruccion_lanzar : LANZAR nombre ';'                                            {printf ("\ninstruccion_lanzar -> LANZAR nombre ';'");}
;

/************************************************************************************************************************************************************************************/
/*                                                                              expresiones                                                                                         */
/************************************************************************************************************************************************************************************/

expresion_constante : CTC_ENTERA                                                  {printf ("\nexpresion_constante -> CTC_ENTERA");}
                    | CTC_REAL                                                    {printf ("\nexpresion_constante -> CTC_REAL");}
                    | CTC_CADENA                                                  {printf ("\nexpresion_constante -> CTC_CADENA");}
                    | CTC_CARACTER                                                {printf ("\nexpresion_constante -> CTC_CARACTER");}
                    | CTC_BOOLEANA                                                {printf ("\nexpresion_constante -> CTC_BOOLEANA");}
;

expresion_primaria : expresion_constante                                          {printf ("\nexpresion_primaria -> expresion_constante");}
                   | objeto                                                       {printf ("\nexpresion_primaria -> objeto");}
                   | llamada_subprograma                                          {printf ("\nexpresion_primaria -> llamada_subprograma");}
                   | '(' expresion ')'                                            {printf ("\nexpresion_primaria -> '(' expresion ')'");}
;

expresion_unaria : '-' expresion                                                  {printf ("\nexpresion_unaria -> '-' expresion");}
                 | '!' expresion                                                  {printf ("\nexpresion_unaria -> '!' expresion");}
;

expresion_binaria : expresion POTENCIA expresion                                  {printf ("\nexpresion_binaria -> expresion POTENCIA expresion");}
                  | expresion '*' expresion                                       {printf ("\nexpresion_binaria -> expresion '*' expresion");}
                  | expresion '/' expresion                                       {printf ("\nexpresion_binaria -> expresion '/' expresion");}  
                  | expresion '%' expresion                                       {printf ("\nexpresion_binaria -> expresion '%' expresion");}
                  | expresion '+' expresion                                       {printf ("\nexpresion_binaria -> expresion '+' expresion");}
                  | expresion '-' expresion                                       {printf ("\nexpresion_binaria -> expresion '-' expresion");}
                  | expresion DESPI expresion                                     {printf ("\nexpresion_binaria -> expresion DESPI expresion");}
                  | expresion DESPD expresion                                     {printf ("\nexpresion_binaria -> expresion DESPD expresion");}
                  | expresion '&' expresion                                       {printf ("\nexpresion_binaria -> expresion '&' expresion");}
                  | expresion '^' expresion                                       {printf ("\nexpresion_binaria -> expresion '^' expresion");}
                  | expresion '@' expresion                                       {printf ("\nexpresion_binaria -> expresion '@' expresion");}
                  | expresion '<' expresion                                       {printf ("\nexpresion_binaria -> expresion '<' expresion");}
                  | expresion '>' expresion                                       {printf ("\nexpresion_binaria -> expresion '>' expresion");}
                  | expresion GEQ expresion                                       {printf ("\nexpresion_binaria -> expresion GEQ expresion");}
                  | expresion LEQ expresion                                       {printf ("\nexpresion_binaria -> expresion LEQ expresion");}
                  | expresion EQ expresion                                        {printf ("\nexpresion_binaria -> expresion EQ expresion");}
                  | expresion NEQ expresion                                       {printf ("\nexpresion_binaria -> expresion NEQ expresion");}
                  | expresion AND expresion                                       {printf ("\nexpresion_binaria -> expresion AND expresion");}
                  | expresion OR expresion                                        {printf ("\nexpresion_binaria -> expresion OR expresion");}
;

objeto : nombre                                                                   {printf ("\nobjeto -> nombre");}                     
       | objeto '[' expresion_mas ']'                                             {printf ("\nobjeto -> objeto '[' expresion_mas ']'");}
       | objeto '.' IDENTIFICADOR                                                 {printf ("\nobjeto -> objeto '.' IDENTIFICADOR");}
;

expresion_mas : expresion                                                         {printf ("\nexpresion_mas -> expresion");}
              | expresion_mas ',' expresion                                       {printf ("\nexpresion_mas -> expresion_mas ',' expresion");}
;

expresion_asterisco :                                                             {printf ("\nexpresion_asterisco -> vacío");}
                    | expresion                                                   {printf ("\nexpresion_asterisco -> expresion");}
                    | expresion_asterisco ',' expresion                           {printf ("\nexpresion_asterisco -> expresion_asterisco ',' expresion");}
;

expresion : expresion_primaria                                                    {printf ("\nexpresion -> expresion_primaria");}
          | expresion_unaria                                                      {printf ("\nexpresion -> expresion_unaria");}
          | expresion_binaria                                                     {printf ("\nexpresion -> expresion_binaria");}
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

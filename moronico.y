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

programa : definicion_programa
         | definicion_paquete
;

definicion_programa : PROGRAMA nombre ';' bloque_programa
;

nombre : IDENTIFICADOR
       | nombre CUATRO_PTOS IDENTIFICADOR
;

bloque_programa : bloque_instrucciones

                | declaracion_cargas bloque_instrucciones
                | declaracion_cargas declaracion_tipos bloque_instrucciones
                | declaracion_cargas declaracion_constantes bloque_instrucciones
                | declaracion_cargas declaracion_variables bloque_instrucciones
                | declaracion_cargas declaracion_tipos declaracion_constantes bloque_instrucciones
                | declaracion_cargas declaracion_tipos declaracion_variables bloque_instrucciones
                | declaracion_cargas declaracion_tipos declaracion_constantes declaracion_variables bloque_instrucciones

                | declaracion_tipos bloque_instrucciones
                | declaracion_tipos declaracion_constantes bloque_instrucciones
                | declaracion_tipos declaracion_variables bloque_instrucciones
                |  declaracion_tipos declaracion_constantes declaracion_variables bloque_instrucciones

                | declaracion_constantes bloque_instrucciones
                | declaracion_constantes declaracion_variables bloque_instrucciones

                | declaracion_variables bloque_instrucciones
;
               
bloque_instrucciones : '{' instruccion_mas '}'
;

instruccion_mas : instruccion
                | instruccion_mas instruccion
;

definicion_paquete : PAQUETE nombre ';' seccion_cabecera seccion_cuerpo
;

seccion_cabecera : CABECERA
                 
                 | CABECERA declaracion_cargas
                 | CABECERA declaracion_cargas declaracion_tipos
                 | CABECERA declaracion_cargas declaracion_constantes 
                 | CABECERA declaracion_cargas declaracion_variables 
                 | CABECERA declaracion_cargas declaracion_interfaces 
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_constantes 
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_variables 
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_interfaces 
                 | CABECERA declaracion_cargas declaracion_constantes declaracion_variables 
                 | CABECERA declaracion_cargas declaracion_constantes declaracion_interfaces 
                 | CABECERA declaracion_cargas declaracion_variables declaracion_interfaces 
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_constantes declaracion_variables 
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_constantes declaracion_interfaces 
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_variables declaracion_interfaces 
                 | CABECERA declaracion_cargas declaracion_constantes declaracion_variables declaracion_interfaces 
                 | CABECERA declaracion_cargas declaracion_tipos declaracion_constantes declaracion_variables declaracion_interfaces 

                 | CABECERA declaracion_tipos
                 | CABECERA declaracion_tipos declaracion_constantes 
                 | CABECERA declaracion_tipos declaracion_variables 
                 | CABECERA declaracion_tipos declaracion_interfaces 
                 | CABECERA declaracion_tipos declaracion_constantes declaracion_variables 
                 | CABECERA declaracion_tipos declaracion_constantes declaracion_interfaces 
                 | CABECERA declaracion_tipos declaracion_variables declaracion_interfaces 
                 | CABECERA declaracion_tipos declaracion_constantes declaracion_variables declaracion_interfaces 

                 | CABECERA declaracion_constantes
                 | CABECERA declaracion_constantes declaracion_variables 
                 | CABECERA declaracion_constantes declaracion_interfaces 
                 | CABECERA declaracion_constantes declaracion_variables declaracion_interfaces 

                 | CABECERA declaracion_variables
                 | CABECERA declaracion_variables declaracion_interfaces 

                 | CABECERA declaracion_interfaces
;

seccion_cuerpo : CUERPO 

               | CUERPO declaracion_tipos declaracion_subprograma_mas
               | CUERPO declaracion_tipos declaracion_constantes declaracion_subprograma_mas
               | CUERPO declaracion_tipos declaracion_variables declaracion_subprograma_mas
               | CUERPO declaracion_tipos declaracion_constantes declaracion_variables declaracion_subprograma_mas
  
               | CUERPO declaracion_constantes declaracion_variables declaracion_subprograma_mas
               | CUERPO declaracion_constantes declaracion_subprograma_mas
 
               | CUERPO declaracion_variables declaracion_subprograma_mas
;

declaracion_subprograma_mas : declaracion_subprograma
                            | declaracion_subprograma_mas declaracion_subprograma
;

declaracion_cargas : CARGA declaracion_carga_mas ';'
;

declaracion_carga_mas : declaracion_carga
                      | declaracion_carga_mas ',' declaracion_carga
;

declaracion_carga : nombre
                  | nombre EN PATH 
                  | nombre '(' nombre_mas')'
                  | nombre EN PATH '(' nombre_mas')'
;

nombre_mas : nombre
           | nombre_mas ',' nombre
;

/************************************************************************************************************************************************************************************/
/*                                                                                    tipos                                                                                         */
/************************************************************************************************************************************************************************************/

declaracion_tipos : TIPO declaracion_tipo_mas
;

declaracion_tipo_mas : declaracion_tipo
                     | declaracion_tipo_mas declaracion_tipo
;

declaracion_tipo : nombre '=' tipo_no_estructurado_o_nombre_tipo ';'    
                 | nombre '=' tipo_estructurado                          
;

tipo_no_estructurado_o_nombre_tipo : nombre                
                                   | tipo_escalar         
                                   | tipo_fichero         
                                   | tipo_enumerado       
                                   | tipo_lista           
                                   | tipo_lista_asociativa
                                   | tipo_conjunto        
;

tipo_estructurado : tipo_registro                   
                  | declaracion_clase               
;

tipo_escalar : ENTERO              
             | REAL               
             | BOOLEANO           
             | CARACTER           
             | CADENA             
;

tipo_fichero : FICHERO
;

tipo_enumerado : '(' expresion_constante_mas ')'
;

expresion_constante_mas : expresion_constante
                        | expresion_constante_mas ',' expresion_constante
;

tipo_lista : LISTA DE tipo_no_estructurado_o_nombre_tipo
           | LISTA rango_mas DE tipo_no_estructurado_o_nombre_tipo
;

rango_mas : rango
          | rango_mas ',' rango
;

rango : expresion DOS_PTOS expresion 
      | expresion DOS_PTOS expresion DOS_PTOS expresion
;

tipo_lista_asociativa : LISTA ASOCIATIVA DE tipo_no_estructurado_o_nombre_tipo
;

tipo_conjunto : CONJUNTO DE tipo_no_estructurado_o_nombre_tipo
;

tipo_registro : REGISTRO '{' declaracion_campo_mas '}'
;

declaracion_campo_mas : declaracion_campo
                      | declaracion_campo_mas declaracion_campo
;

declaracion_campo : nombre_mas ':' tipo_no_estructurado_o_nombre_tipo ';'
;

/************************************************************************************************************************************************************************************/
/*                                                                                clases                                                                                            */
/************************************************************************************************************************************************************************************/
declaracion_clase : CLASE '{' declaraciones_publicas '}'

                  | CLASE FINAL '{' declaraciones_publicas '}'
                  | CLASE FINAL '(' nombre_mas ')' '{' declaraciones_publicas '}'
                  | CLASE FINAL '{' declaraciones_publicas declaraciones_semi '}'
                  | CLASE FINAL '{' declaraciones_publicas  declaraciones_privadas '}'
                  | CLASE FINAL '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_semi '}'
                  | CLASE FINAL '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_privadas '}'
                  | CLASE FINAL '{' declaraciones_publicas declaraciones_semi declaraciones_privadas '}'
                  
                  | CLASE '(' nombre_mas ')' '{' declaraciones_publicas '}'
                  | CLASE '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_semi '}'
                  | CLASE '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_privadas '}'
                  | CLASE '(' nombre_mas ')' '{' declaraciones_publicas declaraciones_semi declaraciones_privadas '}'

                  | CLASE '{' declaraciones_publicas declaraciones_semi '}'
                  | CLASE '{' declaraciones_publicas declaraciones_semi declaraciones_privadas '}'
                  
                  | CLASE '{' declaraciones_publicas declaraciones_privadas '}'
;

declaraciones_publicas : declaracion_componente_mas
                       | PUBLICO declaracion_componente_mas
;

declaraciones_semi : SEMIPUBLICO declaracion_componente_mas
;

declaraciones_privadas : PRIVADO declaracion_componente_mas
;

declaracion_componente_mas : declaracion_componente
                           | declaracion_componente_mas declaracion_componente
;

declaracion_componente : declaracion_tipo_anidado      
                       | declaracion_constante_anidada
                       | declaracion_atributos        
                       | cabecera_subprograma ';'
                       | cabecera_subprograma ';' modificadores ';' 
;

declaracion_tipo_anidado : TIPO declaracion_tipo
;

declaracion_constante_anidada : CONSTANTE declaracion_constante
;

declaracion_atributos : nombre_mas ':' tipo_no_estructurado_o_nombre_tipo ';'
;

modificadores : modificador_mas
;

modificador_mas : modificador
                | modificador_mas ',' modificador
;

modificador : GENERICO            
            | ABSTRACTO           
            | ESPECIFICO          
            | FINAL               
;

/************************************************************************************************************************************************************************************/
/*                                                                              constantes                                                                                          */
/************************************************************************************************************************************************************************************/

declaracion_constantes : CONSTANTE declaracion_constante_mas
;

declaracion_constante_mas : declaracion_constante
                          | declaracion_constante_mas declaracion_constante
;

declaracion_constante : nombre ':' tipo_no_estructurado_o_nombre_tipo '=' valor_constante ';'
;

valor_constante : expresion                  
                | '[' valor_constante_mas ']'
                | '[' clave_valor_mas ']'    
                | '[' campo_valor_mas ']'    
;

valor_constante_mas : valor_constante
                    | valor_constante_mas ',' valor_constante
;

clave_valor_mas : clave_valor
                | clave_valor_mas ',' clave_valor
;

campo_valor_mas : campo_valor
                | campo_valor_mas ',' campo_valor
;

clave_valor : CTC_CADENA FLECHA_DOBLE valor_constante
;

campo_valor : nombre FLECHA_DOBLE valor_constante
;

/************************************************************************************************************************************************************************************/
/*                                                                              variables                                                                                           */
/************************************************************************************************************************************************************************************/

declaracion_variables : VARIABLE declaracion_variable_mas
;

declaracion_variable_mas : declaracion_variable
                         | declaracion_variable_mas declaracion_variable
;

declaracion_variable : nombre_mas':' tipo_no_estructurado_o_nombre_tipo ';'
                     | nombre_mas':' tipo_no_estructurado_o_nombre_tipo '=' valor_constante ';'

/************************************************************************************************************************************************************************************/
/*                                                                              interfaces                                                                                          */
/************************************************************************************************************************************************************************************/
declaracion_interfaces : INTERFAZ cabecera_subprograma_mas
;

cabecera_subprograma_mas : cabecera_subprograma ';'
                         | cabecera_subprograma_mas cabecera_subprograma ';'
;

/************************************************************************************************************************************************************************************/
/*                                                                             subprogramas                                                                                         */
/************************************************************************************************************************************************************************************/

declaracion_subprograma : cabecera_subprograma bloque_subprograma
;

cabecera_subprograma : cabecera_funcion                      
                     | cabecera_procedimiento               
                     | cabecera_constructor                 
                     | cabecera_destructor                  
;

cabecera_funcion : FUNCION nombre  FLECHA_DOBLE tipo_no_estructurado_o_nombre_tipo
                 | FUNCION nombre declaracion_parametros FLECHA_DOBLE tipo_no_estructurado_o_nombre_tipo
;

cabecera_procedimiento : PROCEDIMIENTO nombre 
                       | PROCEDIMIENTO nombre declaracion_parametros
;

cabecera_constructor : CONSTRUCTOR nombre 
                     |CONSTRUCTOR nombre declaracion_parametros
;

cabecera_destructor : DESTRUCTOR nombre
;

declaracion_parametros : '(' lista_parametros_formales ')'
;

lista_parametros_formales : parametros_formales                              
                          | lista_parametros_formales ';' parametros_formales
;

parametros_formales : nombre_mas ':' tipo_no_estructurado_o_nombre_tipo             
                    |  nombre_mas ':' tipo_no_estructurado_o_nombre_tipo MODIFICABLE
;

bloque_subprograma : bloque_instrucciones 
                   | declaracion_tipos bloque_instrucciones
                   | declaracion_constantes bloque_instrucciones
                   | declaracion_variables bloque_instrucciones
                   | declaracion_tipos declaracion_constantes bloque_instrucciones
                   | declaracion_tipos declaracion_variables bloque_instrucciones
                   | declaracion_tipos declaracion_constantes declaracion_variables bloque_instrucciones
;

/************************************************************************************************************************************************************************************/
/*                                                                            instrucciones                                                                                         */
/************************************************************************************************************************************************************************************/

instruccion : ';'                        
            | instruccion_asignacion     
            | instruccion_salir          
            | instruccion_devolver       
            | instruccion_llamada        
            | instruccion_si             
            | instruccion_casos          
            | instruccion_bucle          
            | instruccion_probar_excepto 
            | instruccion_lanzar         
;

instruccion_asignacion : objeto '=' expresion ';'
;

instruccion_salir : SALIR ';'
                  | SALIR SI expresion ';'
;

instruccion_devolver : DEVOLVER ';'
                     | DEVOLVER expresion ';'
;

instruccion_llamada : llamada_subprograma ';'
;

llamada_subprograma : nombre '(' expresion_asterisco ')'
;

instruccion_si : SI expresion ENTONCES bloque_instrucciones SINO bloque_instrucciones_interrogacion
;

bloque_instrucciones_interrogacion :                        
                                   | bloque_instrucciones
;

instruccion_casos : EN CASO expresion SEA caso_mas ';'
;

caso_mas : caso
         | caso_mas caso
;

caso :  entradas FLECHA_DOBLE bloque_instrucciones 
;

entradas : entrada 
         | entrada_asterisco entrada
;

entrada_asterisco : entrada '|'
                  | entrada_asterisco entrada '|'
; 

entrada : expresion        
        | rango            
        | OTRO             
;

instruccion_bucle : clausula_iteracion bloque_instrucciones
;

clausula_iteracion : PARA nombre EN objeto                                     
                   | REPITE ELEMENTO nombre EN rango 
                   | REPITE ELEMENTO nombre EN rango DESCENDENTE
                   | MIENTRAS expresion                                       
                   | REPITE HASTA expresion                                   
;

instruccion_probar_excepto : PROBAR bloque_instrucciones EXCEPTO clausula_excepcion_mas          
                           | PROBAR bloque_instrucciones EXCEPTO clausula_excepcion_mas FINALMENTE bloque_instrucciones

;

clausula_excepcion_mas : clausula_excepcion
                       | clausula_excepcion_mas clausula_excepcion
;

clausula_excepcion : CUANDO nombre EJECUTA bloque_instrucciones
;

instruccion_lanzar : LANZAR nombre ';'
;

/************************************************************************************************************************************************************************************/
/*                                                                              expresiones                                                                                         */
/************************************************************************************************************************************************************************************/

expresion_constante : CTC_ENTERA             
                    | CTC_REAL               
                    | CTC_CADENA             
                    | CTC_CARACTER           
                    | CTC_BOOLEANA           
;

expresion_primaria : expresion_constante     
                   | objeto                 
                   | llamada_subprograma    
                   | '(' expresion ')'
;

expresion_unaria : '-' expresion 
                 | '!' expresion
;

expresion_binaria : expresion POTENCIA expresion
                  | expresion '*' expresion
                  | expresion '/' expresion
                  | expresion '%' expresion
                  | expresion '+' expresion
                  | expresion '-' expresion
                  | expresion DESPI expresion
                  | expresion DESPD expresion
                  | expresion '&' expresion
                  | expresion '^' expresion
                  | expresion '@' expresion
                  | expresion '<' expresion
                  | expresion '>' expresion
                  | expresion GEQ expresion
                  | expresion LEQ expresion
                  | expresion EQ expresion
                  | expresion NEQ expresion
                  | expresion AND expresion
                  | expresion OR expresion
;

objeto : nombre                              
       | objeto '[' expresion_mas ']'      
       | objeto '.' IDENTIFICADOR             
;

expresion_mas : expresion                    
              | expresion_mas ',' expresion  
;

expresion_asterisco : 
                    | expresion
                    | expresion_asterisco ',' expresion                 
;

expresion : expresion_primaria              
          | expresion_unaria
          | expresion_binaria
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

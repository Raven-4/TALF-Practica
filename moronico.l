%{
  #include <string.h>
  #include <stdio.h>
  #include "moronico.tab.h"
%}

%option yylineno

PALABRA_RESERVADA                   (?i:abstracto|asociativa|booleano|cabecera|cadena|caso|caracter|clase|conjunto|constante|cuerpo|constructor|cuando|descendente|destructor|de|devolver|carga|elemento|ejecuta|en|entero|entonces|especifico|excepto|fichero|final|finalmente|funcion|generico|hasta|interfaz|lanzar|lista|mientras|modificable|otro|paquete|para|privado|probar|procedimiento|programa|publico|real|registro|repite|salir|sea|semipublico|si|sino|tipo|variable)
IDENTIFICADOR                       [a-zA-Z_][a-zA-Z0-9_]*
CONSTANTE_ENTERA                    ([0-9]+)|(\\[0-7]+)|(\\x|\\X)[0-9a-fA-F]+
CONSTANTE_REAL                      (([0-9]*\')?[0-9]+\^[+-]?[0-9]+)|([0-9]*\'[0-9]+)
CARACTER                            \'([^'\n\\\"\?]|\\'|\\\"|\\\?|\\\\|\\a|\\b|\\f|\\n|\\r|\\t|\\v|(25[0-5]|2[0-4][0-9]|[01]?[0-9]{1,2})|(\\([0-3][0-7]{2}|[0-7]{1,2}))|(\\x[0-9a-fA-F]{1,2}))\'
CADENA                              \"([^'\n\\\"\?]|\\'|\\\"|\\\?|\\\\|\\a|\\b|\\f|\\n|\\r|\\t|\\v|\\\n)*\"
PATH                                \"\.{0,2}\/[^\"\n]*\"
DELIMITADOR                         ::|\.\.|[{}():\;,\|]|=>
OPERADOR                            =|\+|\-|\*|\/|%|\*\*|\.|\[|\]|<\-|\->|@|~|&|<|>|=<|>=|:=|!=|!|\/\\|\\\/
COMENTARIO                          \/\/.*|\/\*([^*]|(\*+([^*\/])))*\*+\/

%%

{PALABRA_RESERVADA}                 {printf("línea %d, palabra reservada: %s\n", yylineno, yytext);
                                      if (strcasecmp(yytext, "abstracto") == 0) {
                                        return ABSTRACTO;
                                      } else if (strcasecmp(yytext, "asociativa") == 0){
                                        return ASOCIATIVA;
                                      } else if (strcasecmp(yytext, "booleano") == 0){
                                        return BOOLEANO;
                                      } else if (strcasecmp(yytext, "cabecera") == 0){
                                        return CABECERA;
                                      } else if (strcasecmp(yytext, "cadena") == 0){
                                        return CADENA;
                                      } else if (strcasecmp(yytext, "caso") == 0){
                                        return CASO;
                                      } else if (strcasecmp(yytext, "caracter") == 0){
                                        return CARACTER;
                                      } else if (strcasecmp(yytext, "clase") == 0){
                                        return CLASE;
                                      } else if (strcasecmp(yytext, "conjunto") == 0){
                                        return CONJUNTO;
                                      } else if (strcasecmp(yytext, "asociativa") == 0){
                                        return ASOCIATIVA;
                                      } else if (strcasecmp(yytext, "constante") == 0){
                                        return CONSTANTE;
                                      } else if (strcasecmp(yytext, "cuerpo") == 0){
                                        return CUERPO;
                                      } else if (strcasecmp(yytext, "constructor") == 0){
                                        return CONSTRUCTOR;
                                      } else if (strcasecmp(yytext, "cuando") == 0){
                                        return CUANDO;
                                      } else if (strcasecmp(yytext, "descendente") == 0){
                                        return DESCENDENTE;
                                      } else if (strcasecmp(yytext, "destructor") == 0){
                                        return DESTRUCTOR;
                                      } else if (strcasecmp(yytext, "de") == 0){
                                        return DE;
                                      } else if (strcasecmp(yytext, "devolver") == 0){
                                        return DEVOLVER;
                                      } else if (strcasecmp(yytext, "carga") == 0){
                                        return CARGA;
                                      } else if (strcasecmp(yytext, "elemento") == 0){
                                        return ELEMENTO;
                                      } else if (strcasecmp(yytext, "ejecuta") == 0){
                                        return EJECUTA;
                                      } else if (strcasecmp(yytext, "en") == 0){
                                        return EN;
                                      } else if (strcasecmp(yytext, "entero") == 0){
                                        return ENTERO;
                                      } else if (strcasecmp(yytext, "entonces") == 0){
                                        return ENTONCES;
                                      } else if (strcasecmp(yytext, "especifico") == 0){
                                        return ESPECIFICO;
                                      } else if (strcasecmp(yytext, "excepto") == 0){
                                        return EXCEPTO;
                                      } else if (strcasecmp(yytext, "fichero") == 0){
                                        return FICHERO;
                                      } else if (strcasecmp(yytext, "final") == 0){
                                        return FINAL;
                                      } else if (strcasecmp(yytext, "finalmente") == 0){
                                        return FINALMENTE;
                                      } else if (strcasecmp(yytext, "funcion") == 0){
                                        return FUNCION;
                                      } else if (strcasecmp(yytext, "generico") == 0){
                                        return GENERICO;
                                      } else if (strcasecmp(yytext, "hasta") == 0){
                                        return HASTA;
                                      } else if (strcasecmp(yytext, "interfaz") == 0){
                                        return INTERFAZ;
                                      } else if (strcasecmp(yytext, "lanzar") == 0){
                                        return LANZAR;
                                      } else if (strcasecmp(yytext, "lista") == 0){
                                        return LISTA;
                                      } else if (strcasecmp(yytext, "mientras") == 0){
                                        return MIENTRAS;
                                      } else if (strcasecmp(yytext, "modificable") == 0){
                                        return MODIFICABLE;
                                      } else if (strcasecmp(yytext, "otro") == 0){
                                        return OTRO;
                                      } else if (strcasecmp(yytext, "paquete") == 0){
                                        return PAQUETE;
                                      } else if (strcasecmp(yytext, "para") == 0){
                                        return PARA;
                                      } else if (strcasecmp(yytext, "privado") == 0){
                                        return PRIVADO;
                                      } else if (strcasecmp(yytext, "probar") == 0){
                                        return PROBAR;
                                      } else if (strcasecmp(yytext, "procedimiento") == 0){
                                        return PROCEDIMIENTO;
                                      } else if (strcasecmp(yytext, "programa") == 0){
                                        return PROGRAMA;
                                      } else if (strcasecmp(yytext, "publico") == 0){
                                        return PUBLICO;
                                      } else if (strcasecmp(yytext, "real") == 0){
                                        return REAL;
                                      } else if (strcasecmp(yytext, "registro") == 0){
                                        return REGISTRO;
                                      } else if (strcasecmp(yytext, "repite") == 0){
                                        return REPITE;
                                      } else if (strcasecmp(yytext, "salir") == 0){
                                        return SALIR;
                                      } else if (strcasecmp(yytext, "sea") == 0){
                                        return SEA;
                                      } else if (strcasecmp(yytext, "semipublico") == 0){
                                        return SEMIPUBLICO;
                                      } else if (strcasecmp(yytext, "si") == 0){
                                        return SI;
                                      } else if (strcasecmp(yytext, "sino") == 0){
                                        return SINO;
                                      } else if (strcasecmp(yytext, "tipo") == 0){
                                        return TIPO;
                                      } else if (strcasecmp(yytext, "variable") == 0){
                                        return VARIABLE;
                                      }
                                    }
                                    

{IDENTIFICADOR}                     {printf("línea %d, identificador: %s\n", yylineno, yytext); return IDENTIFICADOR;}

{CONSTANTE_REAL}                    {printf("línea %d, constante real: %s\n", yylineno, yytext); return CTC_REAL;}

{CONSTANTE_ENTERA}                  {printf("línea %d, constante entera: %s\n", yylineno, yytext); return CTC_ENTERA;}

{CARACTER}                          {printf("línea %d, caracter: %s\n", yylineno, yytext);return CTC_CARACTER;}

{PATH}                              {printf("línea %d, path: %s\n", yylineno, yytext); return PATH;}

{CADENA}                            {printf("línea %d, cadena: %s\n", yylineno, yytext); return CTC_CADENA;}

{DELIMITADOR}                       {printf("línea %d, delimitador: %s\n", yylineno, yytext);
                                      if (strcmp(yytext, "::") == 0) {
                                        return CUATRO_PTOS;
                                      } else if (strcmp(yytext, "..") == 0){
                                        return DOS_PTOS;
                                      } else if (strcmp(yytext, "=>") == 0){
                                        return FLECHA_DOBLE;
                                      } else{
                                        return yytext[0];
                                      }
                                    }

{OPERADOR}                          {printf("línea %d, operador: %s\n", yylineno, yytext);
                                      if (strcmp(yytext, "/\\") == 0) {
                                        return AND;
                                      } else if (strcmp(yytext, "->") == 0){
                                        return DESPD;
                                      } else if (strcmp(yytext, "<-") == 0){
                                        return DESPI;
                                      } else if (strcmp(yytext, ":=") == 0){
                                        return EQ;
                                      }  else if (strcmp(yytext, ">=") == 0){
                                        return GEQ;
                                      } else if (strcmp(yytext, "=<") == 0){
                                        return LEQ;
                                      } else if (strcmp(yytext, "!=") == 0){
                                        return NEQ;
                                      } else if (strcmp(yytext, "\\/") == 0){
                                        return OR;
                                      } else if (strcmp(yytext, "**") == 0){
                                        return POTENCIA;
                                      } else {
                                        return yytext[0];
                                      }
                                    }


{COMENTARIO}                          ;



\n                                   ;


.                             printf("línea %d, error: %s\n", yylineno, yytext);

%%
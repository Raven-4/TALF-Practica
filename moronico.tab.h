/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_MORONICO_TAB_H_INCLUDED
# define YY_YY_MORONICO_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ABSTRACTO = 258,
     AND = 259,
     ASOCIATIVA = 260,
     BOOLEANO = 261,
     CABECERA = 262,
     CADENA = 263,
     CASO = 264,
     CARACTER = 265,
     CARGA = 266,
     CLASE = 267,
     CONJUNTO = 268,
     CONSTANTE = 269,
     CUERPO = 270,
     CTC_BOOLEANA = 271,
     CTC_CADENA = 272,
     CTC_CARACTER = 273,
     CONSTRUCTOR = 274,
     CUANDO = 275,
     CUATRO_PTOS = 276,
     DESCENDENTE = 277,
     DESPD = 278,
     DESPI = 279,
     DESTRUCTOR = 280,
     DE = 281,
     DEVOLVER = 282,
     DOS_PTOS = 283,
     EJECUTA = 284,
     ELEMENTO = 285,
     EN = 286,
     ENTERO = 287,
     ENTONCES = 288,
     EQ = 289,
     ESPECIFICO = 290,
     EXCEPTO = 291,
     FICHERO = 292,
     FINAL = 293,
     FINALMENTE = 294,
     FLECHA_DOBLE = 295,
     FUNCION = 296,
     GEQ = 297,
     GENERICO = 298,
     HASTA = 299,
     IDENTIFICADOR = 300,
     INTERFAZ = 301,
     LANZAR = 302,
     LEQ = 303,
     LISTA = 304,
     MIENTRAS = 305,
     MODIFICABLE = 306,
     NEQ = 307,
     OTRO = 308,
     OR = 309,
     PAQUETE = 310,
     PARA = 311,
     PATH = 312,
     POTENCIA = 313,
     PRIVADO = 314,
     PROBAR = 315,
     PROCEDIMIENTO = 316,
     PROGRAMA = 317,
     PUBLICO = 318,
     REAL = 319,
     REGISTRO = 320,
     REPITE = 321,
     SEA = 322,
     SALIR = 323,
     SEMIPUBLICO = 324,
     SI = 325,
     SINO = 326,
     TIPO = 327,
     VARIABLE = 328,
     CTC_ENTERA = 329,
     CTC_REAL = 330
   };
#endif


#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 2058 of yacc.c  */
#line 14 "moronico.y"

int entero; 
double real;
char * texto; 


/* Line 2058 of yacc.c  */
#line 139 "moronico.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_MORONICO_TAB_H_INCLUDED  */

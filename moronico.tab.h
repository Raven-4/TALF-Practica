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
     CTC_ENTERA = 274,
     CTC_REAL = 275,
     CONSTRUCTOR = 276,
     CUANDO = 277,
     CUATRO_PTOS = 278,
     DESCENDENTE = 279,
     DESPD = 280,
     DESPI = 281,
     DESTRUCTOR = 282,
     DE = 283,
     DEVOLVER = 284,
     DOS_PTOS = 285,
     EJECUTA = 286,
     ELEMENTO = 287,
     EN = 288,
     ENTERO = 289,
     ENTONCES = 290,
     EQ = 291,
     ESPECIFICO = 292,
     EXCEPTO = 293,
     FICHERO = 294,
     FINAL = 295,
     FINALMENTE = 296,
     FLECHA_DOBLE = 297,
     FUNCION = 298,
     GEQ = 299,
     GENERICO = 300,
     HASTA = 301,
     IDENTIFICADOR = 302,
     INTERFAZ = 303,
     LANZAR = 304,
     LEQ = 305,
     LISTA = 306,
     MIENTRAS = 307,
     MODIFICABLE = 308,
     NEQ = 309,
     OTRO = 310,
     OR = 311,
     PAQUETE = 312,
     PARA = 313,
     PATH = 314,
     POTENCIA = 315,
     PRIVADO = 316,
     PROBAR = 317,
     PROCEDIMIENTO = 318,
     PROGRAMA = 319,
     PUBLICO = 320,
     REAL = 321,
     REGISTRO = 322,
     REPITE = 323,
     SEA = 324,
     SALIR = 325,
     SEMIPUBLICO = 326,
     SI = 327,
     SINO = 328,
     TIPO = 329,
     VARIABLE = 330
   };
#endif


#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
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

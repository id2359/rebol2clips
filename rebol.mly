%{
open ClipsTypes

%}
%token OBJECT
%token MAKE
%token LEFTSQUAREBRACKET
%token RIGHTSQUAREBRACKET
%token <string> SETWORD

%start simpleobjects
%type <instance list>simpleobjects

simpleobjects: {[]} | simpleobjects simpleobject { $2 :: $1 }

simpleobject: MAKE OBJECT LEFTSQUAREBRACKET assignments RIGHTSQUAREBRACKET 
{ Object($1) }

assignments:  /* nothing */ { [] } | assignments assignment { $2 :: $1 }

assignment: SETWORD  value {{ Slot(chop($1),$2) }}



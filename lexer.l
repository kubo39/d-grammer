%{
#include <stdio.h>

%}

%option yylineno

%x string
%x suffix

identifier [_a-zA-Z][_a-zA-Z0-9]*

%%

<suffix>{identifier}      { BEGIN(INITIAL); }
<suffix>(.|\n) { yyless(0); BEGIN(INITIAL); }

abstract { return ABSTRACT; }
alias    { return ALIAS; }
align    { return ALIGN; }
asm      { return ASM; }
assert   { return ASSERT; }
auto     { return AUTO; }
body     { return BODY; }
bool     { return BOOL; }
break    { return BREAK; }
byte     { return BYTE; }
case     { return CASE; }
cast     { return CAST; }
catch    { return CATCH; }
cdouble  { return CDOUBLE; }
cent     { return CENT; }
cfloat   { return CFLOAT; }
char     { return CHAR; }
class    { return CLASS; }
const    { return CONST; }
contine  { return CONTINUE; }
creal    { return CREAL; }
dchar    { return DCHAR; }
debug    { return DEBUG; }
defaut   { return DEFAULT; }
delegate { return DELEGATE; }
delete   { return DELETE; }
deprecated { return DEPRECATED; }
do       { return DO; }
double   { return DOUBLE; }
else     { return ELSE; }
enum     { return ENUM; }
export   { return EXPORT; }
extern   { return EXTERN; }
false    { return FALSE; }
final    { return FINAL; }
finally  { return FINALLY; }
float    { return FLOAT; }
for      { return FOR; }
foreach  { return FOREACH; }
foreach_reverse  { return FOREACHREVERSE; }
function  { return FUNCTION; }
goto  { return GOTO; }
idouble  { return IDOUBLE; }
if  { return IF; }
ifloat  { return IFLOAT; }
immutable  { return IMMUTABLE; }
import  { return IMPORT; }
in  { return IN; }
inout  { return INOUT; }
int  { return INT; }
interface  { return INTERFACE; }
invariant  { return INVARIANT; }
ireal  { return IREAL; }
is  { return IS; }
lazy  { return LAZY; }
long  { return LONG; }
macro  { return MACRO; }
mixin  { return MIXIN; }
module  { return MODULE; }
new  { return NEW; }
nothrow  { return NOTHROW; }
null  { return NULLKEYWORD; }
out  { return OUT; }
override  { return OVERRIDE; }
package  { return PACKAGE; }
pragma  { return PRAGMA; }
private  { return PRIVATE; }
protected  { return PROTECTED; }
public  { return PUBLIC; }
pure  { return PURE; }
real  { return REAL; }
ref  { return REF; }
return  { return RETURN; }
scope  { return SCOPE; }
shared  { return SHARED; }
short  { return SHORT; }
static  { return STATIC; }
struct  { return STRUCT; }
super  { return SUPER; }
switch  { return SWITCH; }
synchronized  { return SYNCHRONIZED; }
template  { return TEMPLATE; }
this  { return THIS; }
throw  { return THROW; }
true  { return TRUE; }
try  { return TRY; }
typedef  { return TYPEDEF; }
typeid  { return TYPEID; }
typeof  { return TYPEOF; }
ubyte  { return UBYTE; }
ucent  { return UCENT; }
uint  { return UINT; }
ulong  { return LONG; }
union  { return UNION; }
unittest  { return UNITTEST; }
ushort  { return USHORT; }
version  { return VERSION; }
void  { return VOID; }
volatile  { return VOLATILE; }
wchar  { return WCHAR; }
while  { return WHILE; }
with  { return WITH; }

__FILE__  { return SPFILE; }
__FILE_FULL_PATH__  { return SPFILEFULLPATH; }
__MODULE__  { return SPMODULE; }
__LINE__  { return SPLINE; }
__FUNCTION__  { return SPFUNCTION; }
__PRETTY_FUNCTION__  { return SPPRETTYFUNCION; }
__gshared  { return SPGSHARED; }
__traits  { return SPTRAITS; }
__vector  { return SPVECTOR; }
__parameters  { return SPPARAMETERS; }

{identifier} { return IDENTIFIER; }

0[xX][0-9a-fA-F_]+ { return INTEGER; }
0[bB][01_]+      { return INTEGER; }
[0-9]         { return INTEGER; }
[1-9][0-9_]*  { return INTEGER; }

\x22          { BEGIN(string); yymore(); }
<string>\x22  { BEGIN(suffix); return DOUBLEQOUTEDSTRING; }

<string><<EOF>>   { return -1; }
<string>[a-zA-Z]+ { yymore(); }

\/      { return '/'; }
\/=     { return SLASHEQ; }
\.      { return '.'; }
\.\.    { return DOTDOT; }
\.\.\.  { return DOTDOTDOT; }
&       { return '&'; }
&=      { return ANDEQ; }
&&      { return ANDAND; }
\|      { return '|'; }
\|=     { return OREQ; }
\|\|    { return OROR; }
\-      { return '-'; }
\-=     { return MINUSEQ; }
\-\-    { return DECREMENT; }
\+      { return '+'; }
\+=     { return PLUSEQ; }
\+\+    { return INCREMENT; }
\<      { return '<'; }
\<=     { return LE; }
\<\<    { return LSH; }
\<\<=   { return LSHEQ; }
\<\>    { return LSHRSH; }
\<\>=   { return LSHRSHEQ; }
\>      { return '>'; }
\>=     { return RE; }
\>\>=   { return RSHEQ; }
\>\>\>= { return RSHRSHRSHEQ; }
\>\>    { return RSH; }
\>\>\>  { return RSHRSHEQ; }
\!      { return '!'; }
\!=     { return NOTEQ; }
\!\<\>  { return NOTLERE; }
\!\<\>= { return NOTLEREEQ; }
\!\<    { return NOTLE; }
\!\<=   { return NOTLEEQ; }
\!\>    { return NOTRE; }
\!\>=   { return NOTREEQ; }
\(      { return '('; }
\)      { return ')'; }
\[      { return '['; }
\]      { return ']'; }
\{      { return '{'; }
\}      { return '}'; }
\?      { return '?'; }
,       { return ','; }
;       { return ';'; }
:       { return ':'; }
\$      { return '$'; }
=       { return '='; }
==      { return EQEQ; }
\*      { return '*'; }
\*=     { return STAREQ; }
%       { return '%'; }
%=      { return PERCENTEQ; }
\^      { return '^'; }
\^=     { return CARETEQ; }
\^\^    { return CARETCARET; }
\^\^=   { return CARETCARETEQ; }
\~      { return '~'; }
\~=     { return TILDEEQ; }

<<EOF>> { return 0; }

%%
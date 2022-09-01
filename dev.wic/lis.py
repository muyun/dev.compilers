"""
lis.py from https://norvig.com/lispy.html

note:  program -> parse -> abstract-syntax-tree -> evel -> resule
"""

"""
Type definitions for scheme objects

scheme programs consist solely of expressions. 
There is no statement/expression distinction
"""
Symbol = str
Number = (int, float)
Atom  = (Symbol, Number)  
List  = list  
Exp   = (Atom, List)
Env   = dict  

def tokenize(chars: str) -> list:
    """Convert a string of characters into a list of tokens
    the listpy tokens are parentheses, symbols, and numbers
    """
    return chars.replace('(', ' ( ').replace(')', ' ) ').split()

def get_ast(tokens: list) -> Exp:
    """Read an expression from a sequence of tokens
    """
    if len(tokens) == 0:
        raise SyntaxError('unexpected EOF')
    token = tokens.pop(0)
    # if ')', a syntex error
    if token == ')':
        raise SyntaxError('unexpected')
    # if '(', build up a list of sub-expressions until we hit a matching ')
    elif token == '(':
        L = []
        while tokens[0] != ')':
            L.append(get_ast(tokens))
        tokens.pop(0) #pop off ')'
        return L
    # any non-parenthesis token must be a symbol or number
    else:
        try:
            return int(token)
        except ValueError:
            try: 
                return float(token)
            except ValueError:
                return Symbol(token) 


def parse(program: str) -> Exp:
    """
    verify input program according to the syntactic rules, 
    and translate input tokens into an internal representations (a tree structure);
    The abstract syntax tree closely mirrors the nested structure of statements or expressions in the program
    """

    # lexical analysis - the input character string is broken up into a sequence of tokens
    tokens = tokenize(program)
    # syntactic analysis - the tokens are assembled into an abstract syntax tree
    # The abstract syntax tree closely mirrors the nested structure of statements or expressions
    # assemble an abstract syntax tree
    ast = get_ast(tokens)

    return ast

#### environments  
# an environment is a mapping from variable names to their values;
# eval will use a global env that includes the names for standard functions,
# this env can be augmented with user-defined variables, using the expression (define symbol value)
#

# calling a procedure introduces the new local variables,
# binding each symbol in the parameter list of 
# define Env as a class  
from collections import UserDict 
class Env(UserDict):
    """ An env: a dict of {variable : value} pairs, with an outer Env"""
    # create a new env that has those {variable : value} pairs as the inner part,
    # and also refers to the given outer env
    def __init__(self, params=(), args=(), outer=None):
        self.update(zip(params, args))
        self.outer = outer
    
    # the find method is to find the right env for a variable: either the inner one or an outer eone
    def find(self, var):
        # self represents the instance of the class
        return self if (var in self) else self.outer.find(var)
    
class Procedure():
    "a user-defined Scheme procedure"
    def __init__(self, parms, body, env):
        self.params, self.body, self.env = parms, body, env

    # __call__ method enables classes where the instances behave like functions 
    # and can be called like a function
    def __call__(self, *args):
        return eval(self.body, Env(self.parms, args, self.env))

def standard_env() -> Env:
    """ An environment with some Scheme standard procedures
    """
    import math
    import operator as op

    env = Env()
    # vars() will return a dict containing the local symbol table
    env.update(vars(math))  # retrieve the __dict__ attribute for math module
    env.update({
        '+':op.add,
        '*':op.mul,
        '-':op.sub,
        '/':op.truediv,
        '>': op.gt,
        '<': op.lt,
        '>=': op.ge,
        '<=': op.le,
        '=':op.eq,
        'max': max,
        'min': min,
        'expt': pow,
        'abs': abs,
        'not': op.not_,
        'null?': lambda x: x == [],
        'number?': lambda x: isinstance(x, Number),
        'print': print,
        'procedure?': callable,
        'round': round,
        'symbol?': lambda x: isinstance(x, Symbol),
        'list': lambda *x: List(x),
        'list?': lambda x: isinstance(x, List),
        'begin': lambda *x: x[-1],
    })

    return env

global_env = standard_env()

# TODO 
def eval(x: Exp, env=global_env) -> Exp:
    """the internal representation is then processed according to the semantic rules of the language,
    thereby carrying out the computation
    """
    # Evaluate an expression in an environment  
    if isinstance(x, Symbol):  # variable reference
        # a symbol is interpreted as a variable name
        # its value is the variable's value
        # r => 10
        return env[x]
    elif isinstance(x, Number): # constant number 
        # a number evaluates to itself 
        # 12 => 12
        return x
    elif x[0]  == 'if':  #conditional
        # evaluate test
        # if true, evaluate and return conseq; otherwise alt
        # (if (> 10 20) (+ 1 1) (+ 3 3)) => 6
        (_, test, conseq, alt) = x
        exp = (conseq if eval(test, env) else alt)
        return eval(exp, env)
    elif x[0] == 'define': # definition
        # define a new variable and give it the value of evaluating the expression exp
        # (define r 10)
        (_, symbol, exp) = x
        env[symbol] = eval(exp, env)
    else:   # procedure call
        # evaluate proc and all the args, 
        # and then the procedure is applied to the list of arg values
        # (sqrt (* 2 8))  => 4.0
        #
        # a callable is a function-like object, meaning it's something that behaves like a function
        # proc is a function object, we can call a function object by putting ()
        proc = eval(x[0], env)  #func
        args = [eval(arg, env) for arg in x[1:]]  #args
        #print("proc: ", proc)
        #print("args: ", args)
        #
        # a function  is passed as data
        # proc is a reference with eval(x[0], env)
        return proc(*args)

## A REPL
def repl(prompt='lis.py> '):
    "A prompt-read-eval-print loop"
    while True:
        val = eval(parse(input(prompt)))
        if val is not None:
            print(schemestr(val))

def schemestr(exp):
    # convert a python object back into a scheme-readable string
    if isinstance(exp, List):
        return '(' + ' '.join(map(schemestr, exp)) + ')'
    else:
        return str(exp)


def main():
    program = "(sqrt (* 2 8))"
    ast = parse(program)
    print(ast)
    print(eval(ast))
    
    #repl()


if __name__ == "__main__":
    main()

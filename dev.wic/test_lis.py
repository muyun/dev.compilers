from lis import tokenize, get_ast, eval

def test_tokenize(chars: str):
    tokens = tokenize(chars)
    print(tokens)
    return tokens

def test_get_ast(tokens: list):
    ast = get_ast(tokens)
    print(ast)
    return ast



def main():
    program = "(begin (define r 10) (* pi (* r r)))"
    tokens = test_tokenize(program)
    ast = test_get_ast(tokens)
    


if __name__ == "__main__":
    main()
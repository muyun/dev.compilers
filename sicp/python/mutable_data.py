"""
message passing:
**encapsulates the logic for all operations on a data value**
within one function that responds to different messages,
"""

"""
mutable objects can change throughout the execution of a program

"""
#a linked list is **a pair** containing the first, and the rest
#note: link is a **constructor** and first and rest are **selectors** for an abstract data representation of linked list
def is_link(s):
    """ s is a linked list if it is empty or a (first, rest) pair.
    """
    return s == "empty" or (len(s) == 2 and is_link(s[1]))

def link(first, rest):
    """ construct a linked list from its 1st element and the rest"""
    assert is_link(rest), "rest must be a linked list"
    return [first, rest]

def first(s):
    """ return the 1st element of a linked list s.
    """
    assert is_link(s), "first only applies to linked lists."
    assert s != "empty"
    return s[0]

def rest(s):
    """ return the rest element of a linked list s"""
    assert is_link(s), "rest only applies to linked list."
    assert s != "empty", "empty linked list has no rest"
    return s[1]


def mutable_link():
    """ return a functional implementation of a mutable linked list
    """
    contents = "empty"
    def dispatch(message, value=None):
        nonlocal contents  #nonlocal declares contents is changed in the 1st frame where contents is already bound
        if message == 'len':
            return len_link(contents)
        elif message == 'getitem':
            return getitem_link(contents, value)
        elif message == 'push_first':
            contents = link(value, contents)
        elif message == 'pop_first':
            f = first(contents)
            contents = rest(contents)
            return f
        elif message == 'str':
            return join_link(contents, ", ")
    return dispatch

def len_link(s):
    """ return the length of linked list s
    """
    length = 0
    while s != "empty":
        s, length = rest(s), length + 1
    return length

def getitem_link(s, v):
    return

def join_link(s, separator):
    """ return a string of all elemetns in s separated by separator.
    """
    if s == "empty":
        return ""
    elif rest(s) == "empty":
        return str(first(s))
    else:
        return str(first(s)) + separator + join_link(rest(s), separator)
    

def test_mutable_link():
    suits = ['heart', 'diamond', 'spade', 'club']
    s = mutable_link()
    for element in suits:
        s('push_first', element)

    print(s('str'))

    #r = mutable_link(1, )
    return


# dict - use a list of key-value pairs to store the contents of the dict
def dictionary():
    """ return a functional implementation of a dict
    """
    records = []  # store the list of key-value pair
    def setitem(key, value):
        nonlocal records
        non_matches = [r for r in records if r[0] != key]
        records = non_matches + [[key, value]]
    def getitem(key):
        #nonlocal records
        matches = [r for r in records if r[0] == key]
        if len(matches) == 1:
            key, value = matches[0]
            return value
    def dispatch(message, key=None, value=None):
        if message == 'setitem':
            setitem(key, value)
        elif message == 'getitem':
            return getitem(key)
        elif message == 'str':
            return join_dict(records, ", ")
    return dispatch

def join_dict(records, separator):
    _str = ""
    assert len(records) != 0, "empty dictionary has not element"
    for r in records:
        key, value = r[0], r[1]
        _str = _str + str(key) + ": " + str(value) + separator
    return _str
 
#
def test_dictionary():
    d = dictionary()
    d('setitem', 3, 9)
    print(d('str'))
    d('setitem', 4, 16)
    print(d('str'))
    value = d('getitem', 3)
    print(f'{value}')
    d('getitem', 4)
    return


# note3: non-local assignment is a powerful tool for creating modular pgorams  
# diff parts of a program, which correspond to diff environment frames, can evolve separately throughout program execution
# ch2.4


if __name__ == "__main__":
    #test_mutable_link()
    #test_mutable_link()
    test_dictionary()
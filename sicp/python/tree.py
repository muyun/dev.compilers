"""
Tree - ch2.3.6

Closure as a means of combination
"""
#
# A tree has a root label and a sequence of branches
#
# note: the data abstraction for a tree consists of
#  the constructor *tree* and the selectors *label* and *branches*
def tree(root_label, branches=[]):
    for branch in branches:
        assert istree(branch), 'branches must be trees'
    return [root_label] + list(branches)

def label(tree):
    return tree[0]

def branches(tree):
    return tree[1:]

# a tree is well-formed only if it has a root label and all branches are also trees
def istree(tree):
    if type(tree) != list or len(tree) < 1:
        return False
    for branch in branches(tree):
        if not istree(branch):
            return False
    return True

# check whether or not a tree has branches
def isleaf(tree):
    return not branches(tree)

def test_tree():
    t = tree(3, [tree(1), tree(2, [tree(1), tree(1)] )])

    return

if __name__ == "__main__":
    test_tree()
# -*- coding: utf-8 -*-
"""
 show python data model:

 A Pythonic Card Deck
"""
import collections

Card = collections.namedtuple('Card', ['rank', 'suit'])

class FrenchDeck:
    ranks = [str(n) for n in range(2, 11)] + list('JQKA')
    suits = 'spades diamonds clubs hearts'.split()

    def __init__(self):
        self._cards = [Card(rank, suit) for suit in self.suits
                                        for rank in self.ranks]

    """ By implementing the special methods __len__, __getitem__, FrenchDeck behaves like a standard python sequence, allowing it to benefit from core language features - like iteration and slicing - and from the standard library
    """
    def __len__(self):
        return len(self._cards)

    def __getitem__(self, position):
        return self._cards[position]

def spades_high(card):
    """sort by rank, then by suit in the order """
    suit_values = dict(spades=3, hearts=2, diamonds=1, clubs=0)
    rank_value = FrenchDeck.ranks.index(card.rank)
    return rank_value * len(suit_values) + suit_values[card.suit]

def main():
    deck = FrenchDeck() # list

    # because of composition, the __len__ and __getitem__ implementations can hand off all the work to a list object, self._cards
    print(len(deck))
    print(deck[:1])

    # sorted
    for card in sorted(deck, key=spades_high):
        print(card)

if __name__ == "__main__":
    main()

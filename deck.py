import numpy as np


class Deck:
    rng = np.random.default_rng()
    # CARDS = ['A(S)', '2(S)', '3(S)', '4(S)', '5(S)', '6(S)', '7(S)', '8(S)', '9(S)', '10(S)', 'J(S)', 'Q(S)', 'K(S)',
    #          'A(H)', '2(H)', '3(H)', '4(H)', '5(H)', '6(H)', '7(H)', '8(H)', '9(H)', '10(H)', 'J(H)', 'Q(H)', 'K(H)',
    #          'A(C)', '2(C)', '3(C)', '4(C)', '5(C)', '6(C)', '7(C)', '8(C)', '9(C)', '10(C)', 'J(C)', 'Q(C)', 'K(C)',
    #          'A(D)', '2(D)', '3(D)', '4(D)', '5(D)', '6(D)', '7(D)', '8(D)', '9(D)', '10(D)', 'J(D)', 'Q(D)', 'K(D)', ]

    CARDS = ['A(S)', 'K(S)', 'Q(S)', 'J(S)', '10(S)', '9(S)', '8(S)', '7(S)', '6(S)', '5(S)', '4(S)', '3(S)', '2(S)',
             'A(H)', 'K(H)', 'Q(H)', 'J(H)', '10(H)', '9(H)', '8(H)', '7(H)', '6(H)', '5(H)', '4(H)', '3(H)', '2(H)',
             'A(C)', 'K(C)', 'Q(C)', 'J(C)', '10(C)', '9(C)', '8(C)', '7(C)', '6(C)', '5(C)', '4(C)', '3(C)', '2(C)',
             'A(D)', 'K(D)', 'Q(D)', 'J(D)', '10(D)', '9(D)', '8(D)', '7(D)', '6(D)', '5(D)', '4(D)', '3(D)', '2(D)', ]

    POSITION = {2: ['bb', 'dealer'],
                3: ['sb', 'bb', 'dealer'],
                4: ['sb', 'bb', 'utg', 'dealer'],
                5: ['sb', 'bb', 'utg', 'utg+1', 'dealer'],
                6: ['sb', 'bb', 'utg', 'utg+1', 'utg+2', 'dealer'],
                7: ['sb', 'bb', 'utg', 'utg+1', 'utg+2', 'utg+3', 'dealer'],
                8: ['sb', 'bb', 'utg', 'utg+1', 'utg+2', 'utg+3', 'utg+4', 'dealer'],
                9: ['sb', 'bb', 'utg', 'utg+1', 'utg+2', 'utg+3', 'utg+4', 'utg+5', 'dealer'],
                10: ['sb', 'bb', 'utg', 'utg+1', 'utg+2', 'utg+3', 'utg+4', 'utg+5', 'utg+6', 'dealer'],
                }

    HANDS_RANK = {
        1: [[CARDS[0+13*0], CARDS[12+13*0], CARDS[11+13*0], CARDS[10+13*0], CARDS[9+13*0]],
            [CARDS[0+13*1], CARDS[12+13*1], CARDS[11+13*1], CARDS[10+13*1], CARDS[9+13*1]],
            [CARDS[0+13*2], CARDS[12+13*2], CARDS[11+13*2], CARDS[10+13*2], CARDS[9+13*2]],
            [CARDS[0+13*3], CARDS[12+13*3], CARDS[11+13*3], CARDS[10+13*3], CARDS[9+13*3]]]
    }

    class Pop:
        def __init__(self, deck, number_of_players):
            self.players = deck[:number_of_players]
            self.flop = deck[number_of_players:number_of_players+2].reshape((4,))
            self.turn = deck[number_of_players+2:number_of_players+3].reshape((2,))
            self.river = deck[number_of_players+3:number_of_players+4].reshape((2,))
            self.public = [self.flop[1], self.flop[2], self.flop[3], self.turn[1], self.river[1]]

        def to_string(self):
            pop_str = ''
            _position = Deck.POSITION[len(self.players)]
            for idx, p in enumerate(self.players):
                pop_str = pop_str + _position[idx] + '[' + Deck.CARDS[p[0]] + ',' + Deck.CARDS[p[1]] + ']\n'

            pop_str = pop_str + 'flop' + '[' \
                      + Deck.CARDS[self.flop[1]] + ',' \
                      + Deck.CARDS[self.flop[2]] + ',' \
                      + Deck.CARDS[self.flop[3]] + ']\n'

            pop_str = pop_str + 'turn' + '[' + Deck.CARDS[self.turn[1]] + ']\n'
            pop_str = pop_str + 'river' + '[' + Deck.CARDS[self.river[1]] + ']\n'
            return pop_str

        def print(self):
            _position = Deck.POSITION[len(self.players)]
            for idx, p in enumerate(self.players):
                print(_position[idx], '[', Deck.CARDS[p[0]], ',', Deck.CARDS[p[1]], ']')

            print('flop', '[', Deck.CARDS[self.flop[1]], ',', Deck.CARDS[self.flop[2]], ',', Deck.CARDS[self.flop[3]], ']')
            print('turn', '[', Deck.CARDS[self.turn[1]], ']')
            print('river', '[', Deck.CARDS[self.river[1]], ']')

        def get_winner_rank(self):
            pass


    def __init__(self):
        self.cards = np.arange(52)
        self.shuffled_deck = None

    def shuffle(self):
        np.random.shuffle(self.cards)
        self.shuffled_deck = self.cards.reshape((26, 2))
        # print(self.shuffled_deck)
        return self

    def pop(self, number_of_players):
        pop = self.Pop(self.shuffled_deck, number_of_players)
        # print(pop.players)
        # print(pop.flop)
        # print(pop.turn)
        # print(pop.river)
        return pop


def straight_flush(rank, rank_index):
    for x in range(0, 13):
        if x <= 9:
            rank[rank_index] = []
            for c in range(0, 4):
                rank[rank_index].append([(c*13)+x, (c*13)+x+1, (c*13)+x+2, (c*13)+x+3, (((c*13)+x+4) % 13) + (c*13),
                                         f'Straight Flush[{Deck.CARDS[(c*13)+x]}, {Deck.CARDS[(c*13)+x+1]}, '
                                         f'{Deck.CARDS[(c*13)+x+2]}, {Deck.CARDS[(c*13)+x+3]}, '
                                         f'{Deck.CARDS[(((c*13)+x+4) % 13) + (c*13)]}]', rank_index])
                rank['total'] = rank['total'] + 1

            rank_index = rank_index - 1


def four_of_a_kind(rank, rank_index):
    for x in range(0, 13):
        for y in range(0, 13):
            if x != y:
                rank[rank_index] = []
                for c in range(0, 4):
                    #print(x, x+13, x+13*2, x+13*3, y+c*13)
                    rank[rank_index].append([x, x+13, x+13*2, x+13*3, y+c*13,
                                             f'Four Of A Kind[{Deck.CARDS[x]}, {Deck.CARDS[x+13]}, {Deck.CARDS[x+13*2]},'
                                             f'{Deck.CARDS[x+13*3]}, {Deck.CARDS[y+c*13]}]', rank_index])
                    rank['total'] = rank['total'] + 1

                rank_index = rank_index - 1


def full_house(rank, rank_index):
    for x in range(0, 13):
        for y in range(0, 13):
            if x != y:
                rank[rank_index] = []
                for c in range(0, 4):
                    for c2 in range(0, 6):
                        rank[rank_index].append([x+13*(1 if c > 2 else 0), x+13*(2 if c > 1 else 1),
                                                 x+13*(3 if c > 0 else 2),
                                                 y+13*(0 if c2 < 3 else 1 if c2 < 5 else 2),
                                                 y+13*(c2+1 if c2 < 3 else (c2 % 3) + 2 if c2 < 5 else 3),
                                                 f'Full House[{Deck.CARDS[x+13*(1 if c > 2 else 0)]}, '
                                                 f'{Deck.CARDS[x+13*(2 if c > 1 else 1)]}, '
                                                 f'{Deck.CARDS[x+13*(3 if c > 0 else 2)]},'
                                                 f'{Deck.CARDS[y+13*(0 if c2 < 3 else 1 if c2 < 5 else 2)]}, '
                                                 f'{Deck.CARDS[y+13*(c2+1 if c2 < 3 else (c2 % 3) + 2 if c2 < 5 else 3)]}]',
                                                 rank_index])
                        rank['total'] = rank['total'] + 1
                rank_index = rank_index - 1


def flush(rank, rank_index):
    for x in range(0, 13):
        for x1 in range(x, 13):
            for x2 in range(x1, 13):
                for x3 in range(x2, 13):
                    for x4 in range(x3, 13):
                        if x != x1 and x1 != x2 and x2 != x3 and x3 != x4:
                            if not ((x1 == x+1 and x2 == x1+1 and x3 == x2+1 and x4 == x3+1)
                                    or (x == 0 and x1 == 9 and x2 == 10 and x3 == 11 and x4 == 12)):
                                rank[rank_index] = []
                                for c in range(0, 4):
                                    rank[rank_index].append([(c*13)+x, (c*13)+x1, (c*13)+x2, (c*13)+x3, (c*13)+x4,
                                                             f'Flush[{Deck.CARDS[(c*13)+x]}, '
                                                             f'{Deck.CARDS[(c*13)+x1]}, '
                                                             f'{Deck.CARDS[(c*13)+x2]}, '
                                                             f'{Deck.CARDS[(c*13)+x3]}, '
                                                             f'{Deck.CARDS[(c*13)+x4]}]', rank_index])
                                    rank['total'] = rank['total'] + 1
                                rank_index = rank_index - 1


def straight(rank, rank_index):
    for x in range(0, 13):
        if x <= 9:
            rank[rank_index] = []
            for c1 in range(0, 4):
                for c2 in range(0, 4):
                    for c3 in range(0, 4):
                        for c4 in range(0, 4):
                            for c5 in range(0, 4):
                                if c1 != c2 or c2 != c3 or c3 != c4 or c4 != c5 or c5 != c1:
                                    rank[rank_index].append([(c1*13)+x,
                                                             (c2*13)+x+1,
                                                             (c3*13)+x+2,
                                                             (c4*13)+x+3,
                                                             (((c5*13)+x+4) % 13) + (c5*13),
                                                             f'Straight[{Deck.CARDS[(c1*13)+x]}, '
                                                             f'{Deck.CARDS[(c2*13)+x+1]}, '
                                                             f'{Deck.CARDS[(c3*13)+x+2]}, '
                                                             f'{Deck.CARDS[(c4*13)+x+3]}, '
                                                             f'{Deck.CARDS[(((c5*13)+x+4) % 13) + (c5*13)]}]',
                                                             rank_index])
                                    rank['total'] = rank['total'] + 1

            rank_index = rank_index - 1


def three_of_a_kind(rank, rank_index):
    for x in range(0, 13):
        for y in range(0, 13):
            if x != y:
                for z in range(y, 13):
                    if x != z and y!=z:
                        rank[rank_index] = []
                        for c in range(0, 4):
                            for c1 in range(0, 4):
                                for c2 in range(0, 4):
                                    rank[rank_index].append([x+13*(1 if c > 2 else 0), x+13*(2 if c > 1 else 1),
                                                             x+13*(3 if c > 0 else 2),
                                                             y+13*c1,
                                                             z+13*c2,
                                                             f'Three Of A Kind[{Deck.CARDS[x+13*(1 if c > 2 else 0)]}, '
                                                             f'{Deck.CARDS[x+13*(2 if c > 1 else 1)]}, '
                                                             f'{Deck.CARDS[x+13*(3 if c > 0 else 2)]},'
                                                             f'{Deck.CARDS[y+13*c1]}, '
                                                             f'{Deck.CARDS[z+13*c2]}]',
                                                             rank_index])
                                    rank['total'] = rank['total'] + 1
                        rank_index = rank_index - 1


def two_pair(rank, rank_index):
    for x in range(0, 13):
        for y in range(x, 13):
            if x != y:
                for z in range(0, 13):
                    if x != z and y != z:
                        rank[rank_index] = []
                        for cx1 in range(0, 4):
                            for cx2 in range(cx1, 4):
                                if cx1 != cx2:
                                    for cy1 in range(0, 4):
                                        for cy2 in range(cy1, 4):
                                            if cy1 != cy2:
                                                for cz1 in range(0, 4):
                                                    rank[rank_index].append([x+13*cx1, x+13*cx2,
                                                                             y+13*cy1, y+13*cy2,
                                                                             z+13*cz1,
                                                                             f'Two Pair[{Deck.CARDS[x+13*cx1]}, '
                                                                             f'{Deck.CARDS[x+13*cx2]}, '
                                                                             f'{Deck.CARDS[y+13*cy1]},'
                                                                             f'{Deck.CARDS[y+13*cy2]}, '
                                                                             f'{Deck.CARDS[z+13*cz1]}]',
                                                                             rank_index])
                                                    rank['total'] = rank['total'] + 1
                        rank_index = rank_index - 1


def one_pair(rank, rank_index):
    for x in range(0, 13):
        for y1 in range(0, 13):
            for y2 in range(y1, 13):
                for y3 in range(y2, 13):
                    if x != y1 and x != y2 and x != y3 and y1 < y2 and y2 < y3:
                        rank[rank_index] = []
                        for cx1 in range(0, 4):
                            for cx2 in range(cx1, 4):
                                if cx1 != cx2:
                                    for cy1 in range(0, 4):
                                        for cy2 in range(0, 4):
                                            for cy3 in range(0, 4):
                                                rank[rank_index].append([x+13*cx1, x+13*cx2,
                                                                         y1+13*cy1, y2+13*cy2,
                                                                         y3+13*cy3,
                                                                         f'One Pair[{Deck.CARDS[x+13*cx1]}, '
                                                                         f'{Deck.CARDS[x+13*cx2]}, '
                                                                         f'{Deck.CARDS[y1+13*cy1]},'
                                                                         f'{Deck.CARDS[y2+13*cy2]}, '
                                                                         f'{Deck.CARDS[y3+13*cy3]}]',
                                                                         rank_index])
                                                rank['total'] = rank['total'] + 1
                        rank_index = rank_index - 1


def high_card(rank, rank_index):
    for x1 in range(0, 13):
        for x2 in range(x1, 13):
            for x3 in range(x2, 13):
                for x4 in range(x3, 13):
                    for x5 in range(x4, 13):
                        if x1 != x2 != x3 != x4 != x5 \
                                and not ((x1+1) == x2 and (x2+1) == x3 and (x3+1) == x4 and ((x4+1) == x5)) \
                                and not (x1 == 0 and (x2+1) == x3 and (x3+1) == x4 and ((x4+1) == x5) and ((x5+1) % 13 == x1)):
                            rank[rank_index] = []
                            for cx1 in range(0, 4):
                                for cx2 in range(0, 4):
                                    for cx3 in range(0, 4):
                                        for cx4 in range(0, 4):
                                            for cx5 in range(0, 4):
                                                if not(cx1 == cx2 == cx3 == cx4 == cx5):
                                                    rank[rank_index].append([x1+13*cx1, x2+13*cx2,
                                                                             x3+13*cx3, x4+13*cx4,
                                                                             x5+13*cx5,
                                                                             f'One Pair[{Deck.CARDS[x1+13*cx1]}, '
                                                                             f'{Deck.CARDS[x2+13*cx2]}, '
                                                                             f'{Deck.CARDS[x3+13*cx3]},'
                                                                             f'{Deck.CARDS[x4+13*cx4]}, '
                                                                             f'{Deck.CARDS[x5+13*cx5]}]',
                                                                             rank_index])
                                                    rank['total'] = rank['total'] + 1
                            rank_index = rank_index - 1


def combinations():
    rank = {'total': 0}
    rank_index = 999999

    straight_flush(rank, rank_index)
    four_of_a_kind(rank, rank_index)
    full_house(rank, rank_index)
    flush(rank, rank_index)
    straight(rank, rank_index)
    three_of_a_kind(rank, rank_index)
    two_pair(rank, rank_index)
    one_pair(rank, rank_index)
    high_card(rank, rank_index)
    #print(rank)


def random_hands(num_of_players):
    import time
    start_time = time.time()

    # Use a breakpoint in the code line below to debug your script.
    new_deck = Deck()

    for t in range(1, 2):
        new_deck.shuffle()
        hands = new_deck.pop(num_of_players)
        print(hands.to_string())

    print("--- %s seconds ---" % (time.time() - start_time))


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    random_hands(8)
    #print_rank()

    #combinations()




# See PyCharm help at https://www.jetbrains.com/help/pycharm/

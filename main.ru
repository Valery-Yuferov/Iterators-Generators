# Задание №1

nested_list = [
	['a', 'b', 'c'],
	['d', 'e', 'f', 'h', False],
	[1, 2, None],
]

class FlatIterator:
    def __init__(self, iterlist):
        self.iterlist = iterlist
        self.cursor = -1
        self.list_len = len(self.iterlist)

    def __iter__(self):
        self.cursor += 1
        self.nest_cursor = 0
        return self

    def __next__(self):
        if self.nest_cursor == len(self.iterlist[self.cursor]):
          iter(self)
        if self.cursor == self.list_len:
          raise StopIteration
        self.nest_cursor += 1     
        return self.iterlist[self.cursor][self.nest_cursor - 1]

for item in FlatIterator(nested_list):
	print(item)
print()

flat_list = [item for item in FlatIterator(nested_list)]
print(flat_list)
print()

# Задание №2

nested_list_2 = [
	['a', 'b', 'c'],
	['d', 'e', 'f'],
	[1, 2, None],
]

def flat_generator(my_list):
  for sub_list in my_list:
    for elem in sub_list:
      yield elem

for item in flat_generator(nested_list_2):
	print(item)

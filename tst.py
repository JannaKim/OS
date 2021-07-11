vowels = ['a', 'e', 'i', 'o', 'u']
dic = {}
watvowel = {}

for el in vowels:
    watvowel[el] = 0


avg = 0
box = [0] * 2069
cnt = 0
while True:
    s = input()
    cnt += 1
    
    sm = 0
    flag = False
    for idx, el in enumerate(s):
        sm += ord(el)

        '''
        sm += ( ord(el) * 7) //3
        if el in vowels:
            avg += idx
            watvowel[el] += 1
            break
        '''

            
    box[sm % 2069] += 1
    
    print(box)
    print('num of vowels met', watvowel)
    print('avg exposed idx', avg // cnt)

# first vowel's loc (a, e, i, o, u)

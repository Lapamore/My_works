from collections.abc import Iterable


def number_decoder(string, suffixes, numbers, suf):
    index = string.find(suf)
    first_word = string[:index]
    second_word = string[index:]
    try:
        if suf == "teen":
            result = suffixes[first_word] + suffixes[second_word]
        if suf == "ty":
            result = suffixes[first_word] * suffixes[second_word]
    except:
        if suf == "teen":
            result = numbers[first_word] + suffixes[second_word]
        if suf == "ty":
            result = numbers[first_word] * suffixes[second_word]
    return result


def flatten(l):
    for el in l:
        if isinstance(el, Iterable) and not isinstance(el, (str, bytes)):
            yield from flatten(el)
        else:
            yield el


def parse_int(string):
    numbers = {"zero": 0,
               "one": 1,
               "two": 2,
               "three": 3,
               "four": 4,
               "five": 5,
               "six": 6,
               "seven": 7,
               "eight": 8,
               "nine": 9,
               "ten": 10,
               "eleven": 11,
               "twelve": 12
               }
    suffixes = {"teen": 10,
                "ty": 10,
                "hundred": 100,
                "thousand": 1000,
                "million": 1000000,
                'twen': 2,
                'thir': 3,
                'for': 4,
                'fif': 5,
                'eigh': 8
                }

    if string.isnumeric():
        return int(string)

    splitting_number = list(flatten(map(lambda x: x.split(), string.lower().split('-'))))
    result_much = 0
    for word in splitting_number:
        if word in numbers:
            result_much += numbers[word]
        elif word in suffixes:
            if result_much == 0:
                result_much = 1 * suffixes[word]
            else:
                result_much *= suffixes[word]
        elif word[-4:] == "teen":
            result_much += number_decoder(word, suffixes, numbers, "teen")
        elif word[-2:] == "ty":
            result_much += number_decoder(word, suffixes, numbers, "ty")

    result_final = int(str(result_much)[:-5] + str(result_much)[-3:])

    if result_final == 0 or result_much == 1000000:
        return result_much
    else:
        return result_final


def main():
    print(parse_int(input("Enter your number: ")))


if __name__ == "__main__":
    main()

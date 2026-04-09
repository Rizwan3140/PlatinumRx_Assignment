def remove_duplicates(s):
    result = ""
    for char in s:
        if char not in result:
            result += char
    return result

input_string = input("Enter a string: ")
print(remove_duplicates(input_string))
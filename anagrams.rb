# Our goal today is to write a method that determines if two given words are anagrams. This means that the letters in one word can be rearranged to form the other word. For example:

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.

# Learning Goals
# Be able to determine the time and space complexity of a method
# Be able to recognize when and how time or space complexity can be improved
# Be able to compare different methods and discuss how changing inputs affects each one's overall runtime
# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.

def first_anagram?(str_1, str_2)     # O(n^3)
    arr = str_1.split("")            # 1
    arr = arr.permutation.to_a       # n
    arr.map! { |word| word.join }    # n
    arr.include?(str_2)              # n
    # (0...str_1.length-2).each do |i|

    #     all_anagrams << str_1[i + 1] + str_1[i] + str_1[i + 2..-1] 
    # end
    # all_anagrams
    # all_anagrams.include?(str_2)
end
#p first_anagram?("abracadaberaabracadabra", "abracadaberaabracadabara")


# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each letter in the first string, find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.
def second_anagram?(str_1, str_2) # O(n^2)
    str_1.each_char do |char| # n
        str_2.delete! char if str_2.include?(char) # n
        # if str_2.include?(char)
        #     idx = str_2.index(char)
        #     str_2.delete_at(idx)
        # end
        # p str_2
    end
    str_2.empty?

end

p second_anagram?("abracadabraabracadabraabracadabra", "abracadabraabracadabraabracadabra")
p second_anagram?("hello", "stella")


# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. The strings are then anagrams if and only if the sorted versions are identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??

# Phase IV:
# Write one more method #fourth_anagram?. This time, use two hashes to store the number of times each letter appears in both words. Compare the resulting hashes.

# What is the time complexity?

# Bonus: Do it with only one hash.

# Discuss the time complexity of your solutions together, then call over your TA to look at them.
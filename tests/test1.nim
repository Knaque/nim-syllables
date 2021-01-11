import syllables, testes

suite "match python-syllables":
  block long:
    check estimate("pneumonoultramicroscopicsilicovolcacoconiosis") == 17
  block short1:
    check estimate("Hi") == 1
  block short2:
    check estimate("Hello") == 2
  block sentence:
    check estimate("Sphinx of black quartz, judge my vow.") == 8
  block average:
    check estimate("Syllables") == 3
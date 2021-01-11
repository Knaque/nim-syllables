# syllables
Syllable estimation for Nim, based on [prosegrinder/python-syllables](https://github.com/prosegrinder/python-syllables).

## Installation
`nimble install syllables`

## Usage
Syllables has only a single procedure: `estimate(word: string): int`
```nim
doAssert estimate("pneumonoultramicroscopicsilicovolcacoconiosis") == 17
doAssert estimate("Hi") == 1
doAssert estimate("Hello") == 2
doAssert estimate("Sphinx of black quartz, judge my vow.") == 8
doAssert estimate("Syllables") == 3
```
This is only an estimation. Do not expect it to be perfectly accurate.
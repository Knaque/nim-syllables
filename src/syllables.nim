import regex

const subSyllables = [
  "cial",
  "tia",
  "cius",
  "cious",
  "uiet",
  "gious",
  "geous",
  "priest",
  "giu",
  "dge",
  "ion",
  "iou",
  "sia$",
  ".che$",
  ".ched$",
  ".abe$",
  ".ace$",
  ".ade$",
  ".age$",
  ".aged$",
  ".ake$",
  ".ale$",
  ".aled$",
  ".ales$",
  ".ane$",
  ".ame$",
  ".ape$",
  ".are$",
  ".ase$",
  ".ashed$",
  ".asque$",
  ".ate$",
  ".ave$",
  ".azed$",
  ".awe$",
  ".aze$",
  ".aped$",
  ".athe$",
  ".athes$",
  ".ece$",
  ".ese$",
  ".esque$",
  ".esques$",
  ".eze$",
  ".gue$",
  ".ibe$",
  ".ice$",
  ".ide$",
  ".ife$",
  ".ike$",
  ".ile$",
  ".ime$",
  ".ine$",
  ".ipe$",
  ".iped$",
  ".ire$",
  ".ise$",
  ".ished$",
  ".ite$",
  ".ive$",
  ".ize$",
  ".obe$",
  ".ode$",
  ".oke$",
  ".ole$",
  ".ome$",
  ".one$",
  ".ope$",
  ".oque$",
  ".ore$",
  ".ose$",
  ".osque$",
  ".osques$",
  ".ote$",
  ".ove$",
  ".pped$",
  ".sse$",
  ".ssed$",
  ".ste$",
  ".ube$",
  ".uce$",
  ".ude$",
  ".uge$",
  ".uke$",
  ".ule$",
  ".ules$",
  ".uled$",
  ".ume$",
  ".une$",
  ".upe$",
  ".ure$",
  ".use$",
  ".ushed$",
  ".ute$",
  ".ved$",
  ".we$",
  ".wes$",
  ".wed$",
  ".yse$",
  ".yze$",
  ".rse$",
  ".red$",
  ".rce$",
  ".rde$",
  ".ily$",
  ".ely$",
  ".des$",
  ".gged$",
  ".kes$",
  ".ced$",
  ".ked$",
  ".med$",
  ".mes$",
  ".ned$",
  ".[sz]ed$",
  ".nce$",
  ".rles$",
  ".nes$",
  ".pes$",
  ".tes$",
  ".res$",
  ".ves$",
  "ere$"
]

const addSyllables = [
  "ia",
  "riet",
  "dien",
  "ien",
  "iet",
  "iu",
  "iest",
  "io",
  "ii",
  "ily",
  ".oala$",
  ".iara$",
  ".ying$",
  ".earest",
  ".arer",
  ".aress",
  ".eate$",
  ".eation$",
  "[aeiouym]bl$",
  "[aeiou]{3}",
  "^mc", "ism",
  "^mc", "asm",
  "([^aeiouy])1l$",
  "[^l]lien",
  "^coa[dglx].",
  "[^gq]ua[^auieo]",
  "dnt$"
]

var re_subsyllables: seq[Regex]
for s in subSyllables:
  re_subsyllables.add(re(s))

var re_addsyllables: seq[Regex]
for s in addSyllables:
  re_addsyllables.add(re(s))


proc estimate*(word: string): int =
  let parts = word.split(re"[^aeiouy]+")
  var valid_parts: seq[string]

  for part in parts:
    if part != "":
      valid_parts.add(part)

  var syllables = 0

  for p in re_subsyllables:
    if word.match(p):
      syllables -= 1

  for p in re_addsyllables:
    if word.match(p):
      syllables += 1

  syllables += len(valid_parts)

  if syllables <= 0:
    syllables = 1

  return syllables
CODES = ('a'..'z').to_a
LETTERS = CODES.rotate(13)
KEY = CODES.zip(LETTERS).to_h
def decrypt(text)
  solution = ""
  text.chars.to_a.each do |char|
    capital = char == char.downcase ? false : true
    translation = KEY[char.downcase]
    if !!translation
      translation = translation.upcase if capital
      solution << translation
    else
      solution << char
    end
  end
  puts solution
end

data = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu"

decrypt(data)

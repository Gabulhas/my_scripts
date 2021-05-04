#!/usr/bin/env python3
# Procura por sinónimos no sinonimos.com.br

import requests
from bs4 import BeautifulSoup
import sys
from colorama import Fore, Back, Style
from unidecode import unidecode


if len(sys.argv) < 2:
    print("Introduz a palavra para procurar o sinonimo.")
    exit(0)

palavras_pre = sys.argv[1:]

palavra = unidecode("-".join(palavras_pre))
base_url = "https://www.sinonimos.com.br/"

page = requests.get(f"{base_url}{palavra}")

soup = BeautifulSoup(page.text, 'html.parser')

sentidos=soup.find_all(class_='s-wrapper')

print("Sinonimos de", end = " ")
print(Fore.BLUE + (" ".join(palavras_pre)) + "\n")

for sentido in sentidos:
    print(Fore.RED +sentido.find(class_='sentido').getText())
    print(Style.RESET_ALL)
    sinonimos = sentido.find_all(['a','span'])
    end = ','
    for i in range(len(sinonimos)):
        if i  == (len(sinonimos) - 1):
            end=''
        print(" " + sinonimos[i].getText(), end=end)
    print("\n\n")

print(Style.RESET_ALL)

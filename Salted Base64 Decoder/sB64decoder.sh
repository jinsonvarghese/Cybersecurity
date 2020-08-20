#!/bin/bash
echo ""
echo "------------------------------Salted Base64 Decoder------------------------------"
echo "                                     ------                                      "
echo "-------------------------Made by Jinson Varghese Behanan-------------------------"
echo "-------------------------https://www.jinsonvarghese.com/-------------------------"
echo ""
echo ""
echo "Please save the encoded text in a file named \"encoded.txt\""
echo ""
seperated=($(cat encoded.txt | tr "+" "\n" | tr "/" "\n" ))
for i in "${seperated[@]}"
do
    echo $i | base64 --decode
done
echo ""

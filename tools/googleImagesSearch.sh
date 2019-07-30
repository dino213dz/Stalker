motCle=$1
motCleFormatte=${motCle// /%20}
fichierTemp="/tmp/export.txt"
parametres_google="tbm=isch&client=firefox"

echo -e "Recherche du mot cle \"\033[31m"$motCle"\033[0m\":\n"

lynx --dump "https://www.google.com/search?q="$motCleFormatte"&source=lnms&"$parametres_google"" > $fichierTemp
cat $fichierTemp|grep -i " https://www.google.com/"|egrep "/url\?q="|cut -d " " -f4-|cut -d "=" -f2-

rm -fR $fichierTemp

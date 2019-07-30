motCle=$1
motCleFormatte=${motCle// /%20}
fichierTemp="/tmp/export.txt"
url_facebook="https://www.facebook.com/public/"
parametres_facebook=""
user_agent='Mozilla/5.0 (Linux; U; Android 4.1.1; en-gb; Build/KLP) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30'

echo -e "Recherche du mot cle \"\033[31m"$motCle"\033[0m\":\n"

lynx -useragent=$user_agent --dump $url_facebook""$motCleFormatte"&"$parametres_facebook"" > $fichierTemp 2>/dev/null
cat $fichierTemp |grep -i $url_facebook |cut -d " " -f4-|cut -d "=" -f2-

rm -fR $fichierTemp

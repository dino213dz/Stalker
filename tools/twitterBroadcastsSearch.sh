motCle=$1
motCleFormatte=${motCle// /%20}
fichierTemp="/tmp/export.txt"
parametres_tweeter="f=broadcasts"

echo -e "Recherche du mot cle \"\033[31m"$motCle"\033[0m\" dans \"BROADCAST\":"

lynx --dump "https://twitter.com/search?q="$motCleFormatte"&src=typd&lang=fr&vertical=default&"$parametres_tweeter"" > $fichierTemp
cat $fichierTemp|grep -iv "twitter.com/search"|grep -iv "dev.twitter.com"|grep -iv "business.twitter.com"|grep -iv "help.twitter.com"|grep -iv "twitter.com/signup"|grep -iv "twitter.com/login"|grep -iv "twitter.com/account"|grep -iv "support.twitter.com"|grep -iv "status.twitter.com"|grep -iv "twitter.com/about"|grep -iv "twitter.com/tos"|grep -iv "twitter.com/privacy" > $fichierTemp"2"

cat $fichierTemp"2" |egrep -i "^[ ]*[0-9]*[.]"|grep "://"|grep -vi "https://twitter.com/$"|grep -vi "opensearch.xml"|grep -vi "android-app://com.twitter.android"|grep -iv "twitter.com/hashtag/Periscope?src=hash"|cut -d "." -f2-|cut -d " " -f2-

rm -f $fichierTemp"*"

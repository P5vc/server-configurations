if [ ! -e /transfer/sources/gitea-data/secret_key ] && [ -e /transfer/destinations/gitea-data/secret_key ]
then
    cp /transfer/destinations/gitea-data/secret_key /transfer/sources/gitea-data/secret_key
fi

if [ ! -e /transfer/sources/gitea-data/internal_token ] && [ -e /transfer/destinations/gitea-data/internal_token ]
then
    cp /transfer/destinations/gitea-data/internal_token /transfer/sources/gitea-data/internal_token
fi

if [ ! -e /transfer/sources/gitea-data/cert.pem ] && [ -e /transfer/destinations/gitea-data/cert.pem ]
then
    cp /transfer/destinations/gitea-data/cert.pem /transfer/sources/gitea-data/cert.pem
fi

if [ ! -e /transfer/sources/cryptpad/public_salt ] && [ -e /transfer/destinations/cryptpad/public_salt ]
then
    cp /transfer/destinations/cryptpad/public_salt /transfer/sources/cryptpad/public_salt
fi

if [ ! -e /transfer/sources/registry-auth/htpasswd ] && [ -e /transfer/destinations/registry-auth/htpasswd ]
then
    cp /transfer/destinations/registry-auth/htpasswd /transfer/sources/registry-auth/htpasswd
fi

while true
do
    rsync -p -r /transfer/sources/gitea-data/ /transfer/destinations/gitea-data/
    rsync -p -r /transfer/sources/registry-auth/ /transfer/destinations/registry-auth/
    rsync -p -r /transfer/sources/cryptpad/ /transfer/destinations/cryptpad/

    sleep 60
done

#!/usr/bin/env sh

# https://beget.com/ru/kb/api/funkczii-upravleniya-dns

# acme.sh --issue --server letsencrypt_test --dns dns_beget -d 'bibibot.ru' -d '*.bibibot.ru'
# acme.sh --deactivate --server letsencrypt_test --dns dns_beget -d 'bibibot.ru' -d '*.bibibot.ru'

. ./acme.sh > /dev/null
. ./dnsapi/dns_beget.sh

logfile="acme.sh.log"
_info() { echo "$*" >> $logfile; }
_debug() { echo "$*" >> $logfile; }
_err() { echo "$*" >> $logfile; }
_saveaccountconf_mutable() { true; }

Beget_Username=arnik
Beget_Password=iGG3bx8Rq89f45

clean_up() {
  # rm -rf ./ca
  # rm -rf ./arnik.ru*
  echo > acme.sh.log
  echo > http.header
}

################################################################################

clean_up

dns_beget_add "acmetestXyzRandomName.bibibot.ru" "test1"
dns_beget_rm "acmetestXyzRandomName.bibibot.ru" "test1"

# dns_beget_add "bibibot.ru" "test1"
# dns_beget_add "_acme-challenge.bibibot.ru" "test2"
# dns_beget_add "_acme-challenge.www.bibibot.ru" "test3"
# dns_beget_add "bibibot.co.uk" "test4"
# dns_beget_add "_acme-challenge.bibibot.co.uk" "test5"
# dns_beget_add "_acme-challenge.www.bibibot.co.uk" "test6"
# dns_beget_add "sub1.sub2.bibibot.co.uk" "test7"
# dns_beget_add "_acme-challenge.sub1.sub2.bibibot.co.uk" "test8"

dns_beget_rm "bibibot.ru" "test1"
dns_beget_rm "_acme-challenge.bibibot.ru" "test2"
dns_beget_rm "_acme-challenge.www.bibibot.ru" "test3"
dns_beget_rm "bibibot.co.uk" "test4"
dns_beget_rm "_acme-challenge.bibibot.co.uk" "test5"
dns_beget_rm "_acme-challenge.www.bibibot.co.uk" "test6"
dns_beget_rm "sub1.sub2.bibibot.co.uk" "test7"
dns_beget_rm "_acme-challenge.sub1.sub2.bibibot.co.uk" "test8"

# clean_up
# add_txt
exit

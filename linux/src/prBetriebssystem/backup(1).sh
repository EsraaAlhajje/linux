#!/bin/bash
current_date="$(date +%+4Y%m%d)"
archive_name="$(date +%d-%m-%+4Y_%H-%M-%S)"
echo "Die Log-Datei wird erstellt"
LOG=/backup/$current_date/backup_$archive_name.log
echo "Die Log-Datei wurde erstellt" >> $LOG
echo "Das Back-up Verzeichnis für heute wird erstellt" >> $LOG
archive_dir=/backup
mkdir $archive_dir/$current_date
echo "Das Back-up Verzeichnis wurde erfolgreich erstellt" >> $LOG


#cp -r home $archive_dir/$current_date
#cp -r etc $archive_dir/$current_date
echo "/home is compressed" >> $LOG
tar cfz $archive_dir/$current_date/backup_$archive_name.tar.gz /home

echo "Das Verzeichnis / home wurde komprimiert und gespeichert in $ archive_dir / $ current_date" >> $LOG

echo "Die Paketliste ist gespeichert" >> $LOG

apt list --installed | cut -d/ -f1 | sed 1d >$archive_dir/$current_date/$archive_name.txt

echo "Das Backup der Paketliste wurde erstellt" >> $LOG

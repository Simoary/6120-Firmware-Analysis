#!/bin/sh
language_path=/tmp/mnt/usb1_1/language-table
language_list=/tmp/language_list
language_check=/tmp/language_check
test -e $language_path && FILE_EXIST="TRUE" || FILE_EXIST="FALSE"
if [ $FILE_EXIST = "TRUE" ]; then
   ls -l $language_path/ > $language_list
   if [ "$1" = "PE" ]; then
      lang1=Eng
      lang2=GR
      lang3=FR
      lang4=NL
      lang5=SV
      lang6=RU
      language1=English
      language2=German
      language3=French
      language4=Dutch
      language5=Swedish
      language6=Russian
      mkdir $language_check
      echo -e "Start Write Langage\n\n"
      for i in 1 2 3 4 5 6
      do
         eval lang=\$lang$i
         eval language=\$language$i
         mtd_partition=mtd`expr $i + 5`
         mtd_block=mtdblock`expr $i + 5`
         mtd erase $mtd_partition
         language_name=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 6`
         language_length=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 5`
         /userfs/bin/mtd writeflash $language_path/$language_name $language_length 0 /dev/$mtd_partition
         umount /dev/$mtd_block
         mount /dev/$mtd_block $language_check
         current_lang=`cat $language_check/LANGUAGE | cut -d ':' -f 1`
         if [ $current_lang = $language ]; then
            echo -e "\n\n\nWrite Langage$i Success\n\n\n"
         else
            echo -e "\n\n\nWrite Langage$i Fail\n\n\n"
			exit -1
         fi
         umount /dev/$mtd_block
      done
      rm -rf $language_list
      rm -rf $language_check
   elif [ "$1" = "EE" ]; then
      lang1=PL
      lang2=RU
      lang3=CS
      lang4=EL
      lang5=RO
      lang6=HU
      language1=Polish
      language2=Russian
      language3=Czech
      language4=Greek
      language5=Romanian
      language6=Hungarian
      mkdir $language_check
      echo -e "Start Write Langage\n\n"
      for i in 1 2 3 4 5 6
      do
         eval lang=\$lang$i
         eval language=\$language$i
         mtd_partition=mtd`expr $i + 5`
         mtd_block=mtdblock`expr $i + 5`
         mtd erase $mtd_partition
         language_name=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 6`
         language_length=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 5`
         /userfs/bin/mtd writeflash $language_path/$language_name $language_length 0 /dev/$mtd_partition
         umount /dev/$mtd_block
         mount /dev/$mtd_block $language_check
         current_lang=`cat $language_check/LANGUAGE | cut -d ':' -f 1`
         if [ $current_lang = $language ]; then
            echo -e "\n\n\nWrite Langage$i Success\n\n\n"
         else
            echo -e "\n\n\nWrite Langage$i Fail\n\n\n"
			exit -1
         fi
         umount /dev/$mtd_block
      done
      rm -rf $language_list
      rm -rf $language_check
   elif [ "$1" = "AU" ]; then
      lang1=Eng
      lang2=PR
      lang3=IT
      lang4=GR
      lang5=NL
      lang6=KO
      language1=English
      language2=Chinese
      language3=Italian
      language4=German
      language5=Dutch
      language6=Korean
      mkdir $language_check
      echo -e "Start Write Langage\n\n"
      for i in 1 2 3 4 5 6
      do
         eval lang=\$lang$i
         eval language=\$language$i
         mtd_partition=mtd`expr $i + 5`
         mtd_block=mtdblock`expr $i + 5`
         mtd erase $mtd_partition
         language_name=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 6`
         language_length=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 5`
         /userfs/bin/mtd writeflash $language_path/$language_name $language_length 0 /dev/$mtd_partition
         umount /dev/$mtd_block
         mount /dev/$mtd_block $language_check
         current_lang=`cat $language_check/LANGUAGE | cut -d ':' -f 1`
         if [ $current_lang = $language ]; then
            echo -e "\n\n\nWrite Langage$i Success\n\n\n"
         else
            echo -e "\n\n\nWrite Langage$i Fail\n\n\n"
			exit -1
         fi
         umount /dev/$mtd_block
      done
      rm -rf $language_list
      rm -rf $language_check
   elif [ "$1" = "UK" ]; then
      lang1=Eng
      lang2=PR
      lang3=FR
      lang4=GR
      lang5=NL
      lang6=KO
      language1=English
      language2=Chinese
      language3=French
      language4=German
      language5=Dutch
      language6=Korean
      mkdir $language_check
      echo -e "Start Write Langage\n\n"
      for i in 1 2 3 4 5 6
      do
         eval lang=\$lang$i
         eval language=\$language$i
         mtd_partition=mtd`expr $i + 5`
         mtd_block=mtdblock`expr $i + 5`
         mtd erase $mtd_partition
         language_name=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 6`
         language_length=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 5`
         /userfs/bin/mtd writeflash $language_path/$language_name $language_length 0 /dev/$mtd_partition
         umount /dev/$mtd_block
         mount /dev/$mtd_block $language_check
         current_lang=`cat $language_check/LANGUAGE | cut -d ':' -f 1`
         if [ $current_lang = $language ]; then
            echo -e "\n\n\nWrite Langage$i Success\n\n\n"
         else
            echo -e "\n\n\nWrite Langage$i Fail\n\n\n"
			exit -1
         fi
         umount /dev/$mtd_block
      done
      rm -rf $language_list
      rm -rf $language_check
   elif [ "$1" = "PR" ]; then
      lang1=Eng
      lang2=PR
      lang3=RU
      lang4=NL
      lang5=JP
      lang6=KO
      language1=English
      language2=Chinese
      language3=Russian
      language4=Dutch
      language5=Japanese
      language6=Korean
      mkdir $language_check
      echo -e "Start Write Langage\n\n"
      for i in 1 2 3 4 5 6
      do
         eval lang=\$lang$i
         eval language=\$language$i
         mtd_partition=mtd`expr $i + 5`
         mtd_block=mtdblock`expr $i + 5`
         mtd erase $mtd_partition
         language_name=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 6`
         language_length=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 5`
         /userfs/bin/mtd writeflash $language_path/$language_name $language_length 0 /dev/$mtd_partition
         umount /dev/$mtd_block
         mount /dev/$mtd_block $language_check
         current_lang=`cat $language_check/LANGUAGE | cut -d ':' -f 1`
         if [ $current_lang = $language ]; then
            echo -e "\n\n\nWrite Langage$i Success\n\n\n"
         else
            echo -e "\n\n\nWrite Langage$i Fail\n\n\n"
			exit -1
         fi
         umount /dev/$mtd_block
      done
      rm -rf $language_list
      rm -rf $language_check
   elif [ "$1" = "RU" ]; then
      lang1=RU
      lang2=Eng
      lang3=PL
      lang4=NL
      lang5=SV
      lang6=DA
      language1=Russian
      language2=English
      language3=Polish
      language4=Dutch
      language5=Swedish
      language6=Danish
      mkdir $language_check
      echo -e "Start Write Langage\n\n"
      for i in 1 2 3 4 5 6
      do
         eval lang=\$lang$i
         eval language=\$language$i
         mtd_partition=mtd`expr $i + 5`
         mtd_block=mtdblock`expr $i + 5`
         mtd erase $mtd_partition
         language_name=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 6`
         language_length=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 5`
         /userfs/bin/mtd writeflash $language_path/$language_name $language_length 0 /dev/$mtd_partition
         umount /dev/$mtd_block
         mount /dev/$mtd_block $language_check
         current_lang=`cat $language_check/LANGUAGE | cut -d ':' -f 1`
         if [ $current_lang = $language ]; then
            echo -e "\n\n\nWrite Langage$i Success\n\n\n"
         else
            echo -e "\n\n\nWrite Langage$i Fail\n\n\n"
			exit -1
         fi
         umount /dev/$mtd_block
      done
      rm -rf $language_list
      rm -rf $language_check
   elif [ "$1" = "PA" ]; then
      lang1=Eng
      lang2=FR
      lang3=SP
      lang4=PR
      lang5=GR
      lang6=PT
      language1=English
      language2=French
      language3=Spanish
      language4=Chinese
      language5=German
      language6=Portuguese
      mkdir $language_check
      echo -e "Start Write Langage\n\n"
      for i in 1 2 3 4 5 6
      do
         eval lang=\$lang$i
         eval language=\$language$i
         mtd_partition=mtd`expr $i + 5`
         mtd_block=mtdblock`expr $i + 5`
         mtd erase $mtd_partition
         language_name=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 6`
         language_length=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 5`
         /userfs/bin/mtd writeflash $language_path/$language_name $language_length 0 /dev/$mtd_partition
         umount /dev/$mtd_block
         mount /dev/$mtd_block $language_check
         current_lang=`cat $language_check/LANGUAGE | cut -d ':' -f 1`
         if [ $current_lang = $language ]; then
            echo -e "\n\n\nWrite Langage$i Success\n\n\n"
         else
            echo -e "\n\n\nWrite Langage$i Fail\n\n\n"
			exit -1
         fi
         umount /dev/$mtd_block
      done
      rm -rf $language_list
      rm -rf $language_check
   elif [ "$1" = "JP" ]; then
      lang1=Eng
      lang2=PR
      lang3=JP
      lang4=KO
      lang5=NL
      lang6=RU
      language1=English
      language2=Chinese
      language3=Japanese
      language4=Korean
      language5=Dutch
      language6=Russian
      mkdir $language_check
      echo -e "Start Write Langage\n\n"
      for i in 1 2 3 4 5 6
      do
         eval lang=\$lang$i
         eval language=\$language$i
         mtd_partition=mtd`expr $i + 5`
         mtd_block=mtdblock`expr $i + 5`
         mtd erase $mtd_partition
         language_name=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 6`
         language_length=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 5`
         /userfs/bin/mtd writeflash $language_path/$language_name $language_length 0 /dev/$mtd_partition
         umount /dev/$mtd_block
         mount /dev/$mtd_block $language_check
         current_lang=`cat $language_check/LANGUAGE | cut -d ':' -f 1`
         if [ $current_lang = $language ]; then
            echo -e "\n\n\nWrite Langage$i Success\n\n\n"
         else
            echo -e "\n\n\nWrite Langage$i Fail\n\n\n"
			exit -1
         fi
         umount /dev/$mtd_block
      done
      rm -rf $language_list
      rm -rf $language_check
   elif [ "$1" = "PR" ]; then
      lang1=Eng
      lang2=PR
      lang3=RU
      lang4=NL
      lang5=JP
      lang6=KO
      language1=English
      language2=Chinese
      language3=Russian
      language4=Dutch
      language5=Japanese
      language6=Korean
      mkdir $language_check
      echo -e "Start Write Langage\n\n"
      for i in 1 2 3 4 5 6
      do
         eval lang=\$lang$i
         eval language=\$language$i
         mtd_partition=mtd`expr $i + 5`
         mtd_block=mtdblock`expr $i + 5`
         mtd erase $mtd_partition
         language_name=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 6`
         language_length=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 5`
         /userfs/bin/mtd writeflash $language_path/$language_name $language_length 0 /dev/$mtd_partition
         umount /dev/$mtd_block
         mount /dev/$mtd_block $language_check
         current_lang=`cat $language_check/LANGUAGE | cut -d ':' -f 1`
         if [ $current_lang = $language ]; then
            echo -e "\n\n\nWrite Langage$i Success\n\n\n"
         else
            echo -e "\n\n\nWrite Langage$i Fail\n\n\n"
			exit -1
         fi
         umount /dev/$mtd_block
      done
      rm -rf $language_list
      rm -rf $language_check
   elif [ "$1" = "KO" ]; then
      lang1=Eng
      lang2=PR
      lang3=JP
      lang4=KO
      lang5=NL
      lang6=RU
      language1=English
      language2=Chinese
      language3=Japanese
      language4=Korean
      language5=Dutch
      language6=Russian
      mkdir $language_check
      echo -e "Start Write Langage\n\n"
      for i in 1 2 3 4 5 6
      do
         eval lang=\$lang$i
         eval language=\$language$i
         mtd_partition=mtd`expr $i + 5`
         mtd_block=mtdblock`expr $i + 5`
         mtd erase $mtd_partition
         language_name=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 6`
         language_length=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 5`
         /userfs/bin/mtd writeflash $language_path/$language_name $language_length 0 /dev/$mtd_partition
         umount /dev/$mtd_block
         mount /dev/$mtd_block $language_check
         current_lang=`cat $language_check/LANGUAGE | cut -d ':' -f 1`
         if [ $current_lang = $language ]; then
            echo -e "\n\n\nWrite Langage$i Success\n\n\n"
         else
            echo -e "\n\n\nWrite Langage$i Fail\n\n\n"
			exit -1
         fi
         umount /dev/$mtd_block
      done
      rm -rf $language_list
      rm -rf $language_check
   elif [ "$1" = "" ]; then
      echo Usage: wireless_region.sh COUNTRYCODE[PE, EE, AU, UK, NA, PR, GE]
      echo Example: wireless_region.sh PE
   else
      lang1=Eng
      lang2=SP
      lang3=PR
      lang4=FR
      lang5=GR
      lang6=IT
      language1=English
      language2=Spanish
      language3=Chinese
      language4=French
      language5=German
      language6=Italian
      mkdir $language_check
      echo -e "Start Write Langage\n\n"
      for i in 1 2 3 4 5 6
      do
         eval lang=\$lang$i
         eval language=\$language$i
         mtd_partition=mtd`expr $i + 5`
         mtd_block=mtdblock`expr $i + 5`
         mtd erase $mtd_partition
         language_name=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 6`
         language_length=`cat /tmp/language_list | grep $lang | sed 's/ \+/:/g' | cut -d ':' -f 5`
         /userfs/bin/mtd writeflash $language_path/$language_name $language_length 0 /dev/$mtd_partition
         umount /dev/$mtd_block
         mount /dev/$mtd_block $language_check
         current_lang=`cat $language_check/LANGUAGE | cut -d ':' -f 1`
         if [ $current_lang = $language ]; then
            echo -e "\n\n\nWrite Langage$i Success\n\n\n"
         else
            echo -e "\n\n\nWrite Langage$i Fail\n\n\n"
			exit -1
         fi
         umount /dev/$mtd_block
      done
      rm -rf $language_list
      rm -rf $language_check
   fi
else
   echo Not found language file, please input language file to USB Storage and connect USB Storage.
   exit -1
fi

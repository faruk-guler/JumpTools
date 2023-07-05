#!/bin/bash

# SSH Tools V2.5 The Guler0x

# Fonksiyonlar

show_menu() {
    clear
    echo "
                                     
 ███████╗███████╗██╗  ██╗    ████████╗ ██████╗  ██████╗ ██╗     ███████╗    ██╗   ██╗  ██████╗    ███████╗
 ██╔════╝██╔════╝██║  ██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝    ██║   ██║  ╚════██╗   ██╔════╝
 ███████╗███████╗███████║       ██║   ██║   ██║██║   ██║██║     ███████╗    ██║   ██║   █████╔╝   ███████╗
 ╚════██║╚════██║██╔══██║       ██║   ██║   ██║██║   ██║██║     ╚════██║    ╚██╗ ██╔╝  ██╔═══╝    ╚════██║
 ███████║███████║██║  ██║       ██║   ╚██████╔╝╚██████╔╝███████╗███████║     ╚████╔╝██╗███████╗██╗███████║
 ╚══════╝╚══════╝╚═╝  ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝      ╚═══╝ ╚═╝╚══════╝╚═╝╚══════╝
  ████████╗██╗  ██╗███████╗     ██████╗ ██╗   ██╗██╗     ███████╗██████╗  ██████╗ ██╗  ██╗                 
  ╚══██╔══╝██║  ██║██╔════╝    ██╔════╝ ██║   ██║██║     ██╔════╝██╔══██╗██╔═████╗╚██╗██╔╝                 
     ██║   ███████║█████╗      ██║  ███╗██║   ██║██║     █████╗  ██████╔╝██║██╔██║ ╚███╔╝                  
     ██║   ██╔══██║██╔══╝      ██║   ██║██║   ██║██║     ██╔══╝  ██╔══██╗████╔╝██║ ██╔██╗                  
     ██║   ██║  ██║███████╗    ╚██████╔╝╚██████╔╝███████╗███████╗██║  ██║╚██████╔╝██╔╝ ██╗                 
     ╚═╝   ╚═╝  ╚═╝╚══════╝     ╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝                 
     Home: www.farukguler.com  Github: https://github.com/theguler0x 
"
    echo "1. SSH İstemcisi"
    echo "2. Linux Dosya Transferi - Secure Copy Protocol (SCP)"
    echo "3. Çıkış"
    echo "-------------------------"
    read -p "Operasyon Seç 1-3: " choice

    case $choice in
        1) ssh_connection ;;
        2) file_copy ;;
        3) exit ;;
        *) echo "Geçersiz seçenek! Devam etmek için bir tuşa basın..." && read -n 1 -s && show_menu ;;
    esac
}

ssh_connection() {
    clear
    echo "-------------------------"
    echo "SSH İstemcisi"
    echo "-------------------------"
    read -p "Hedef IP/DNS girin: " host
    read -p "SSH Portunuzu girin (varsayılan: 22): " port
    port=${port:-22}
    read -p "Kullanıcı adı: " username

    echo
    echo "-------------------------"
    echo "SSH Connecting....."
    echo "-------------------------"
    echo

    ssh "$username"@"$host" -p "$port"

    echo
    echo "SSH bağlantısı tamamlandı. Devam etmek için bir tuşa basın..."
    read -n 1 -s && show_menu
}

file_copy() {
    clear
    echo "-------------------------"
    echo "Linux Dosya Transferi Secure Copy Protocol (SCP)"
    echo "-------------------------"
    read -p "Uzak sunucunun IP/DNS girin: " remoteServer
    read -p "Kullanıcı adını girin: " remoteUsername
    read -p "Dosyaların kopyalanacağı uzak dizini girin (örn: /uzak/dizin/): " remoteDirectory
    read -p "Yerel dosyayı veya yolunu girin (örn: \"C:\Desktop\Script.sh\"): " localFilePath

    echo
    echo "Dosyanız kopyalanacak Emin misiniz?..."
    echo

    scp -r "$localFilePath" "$remoteUsername"@"$remoteServer":"$remoteDirectory"

    echo
    echo "Devam etmek için bir tuşa basın..."
    read -n 1 -s && show_menu
}

# Başlangıç noktası
show_menu
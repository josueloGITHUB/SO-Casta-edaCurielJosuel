#!/bin/bash

if [ $# -ne 8 ]; then
    echo "Uso: $0 <nombre_vm> <tipo_sistema_operativo> <num_cpus> <memoria_ram> <vram> <tam_disco> <nombre_controlador_sata> <nombre_controlador_ide>"
    exit 1
fi

# Almacena los argumentos en variables
nombre_vm=$1
tipo_sistema_operativo=$2
num_cpus=$3
memoria_ram=$4
vram=$5
tam_disco=$6
nombre_controlador_sata=$7
nombre_controlador_ide=$8

# Crear la máquina virtual
VBoxManage createvm --name "$nombre_vm" --ostype "$tipo_sistema_operativo" --register

# Configurar la máquina virtual
VBoxManage modifyvm "$nombre_vm" --memory "$memoria_ram" --vram "$vram" --cpus "$num_cpus"

# Crear el disco duro virtual
VBoxManage createmedium disk --filename "$nombre_vm.vdi" --size "$tam_disco"

# Asociar el disco duro virtual a un controlador SATA
VBoxManage storagectl "$nombre_vm" --name "$nombre_controlador_sata" --add sata --controller IntelAhci
VBoxManage storageattach "$nombre_vm" --storagectl "$nombre_controlador_sata" --port 0 --device 0 --type hdd --medium "$nombre_vm.vdi"

# Crear un controlador IDE
VBoxManage storagectl "$nombre_vm" --name "$nombre_controlador_ide" --add ide --controller PIIX4

# Imprimir la configuración creada
echo "Configuración de la máquina virtual $nombre_vm:"
VBoxManage showvminfo "$nombre_vm"

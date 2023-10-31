#!/bin/bash

# Definir variables
nombre_instancia="mi-instancia-nodejs"
grupo_seguridad="mi-grupo-seguridad"
llave_nombre="mi-llave"
llave_nombre_aws="mi-llave-aws"
region="us-east-1"

# Crear una clave SSH si aún no existe
aws ec2 create-key-pair --key-name "$llave_nombre_aws" --query 'KeyMaterial' --output text > "$llave_nombre.pem"
chmod 400 "$llave_nombre.pem"

# Crear un grupo de seguridad para permitir el tráfico en el puerto 80
aws ec2 create-security-group --group-name "$grupo_seguridad" --description "Grupo de seguridad para Node.js"
aws ec2 authorize-security-group-ingress --group-name "$grupo_seguridad" --protocol tcp --port 80 --cidr 0.0.0.0/0

# Iniciar una instancia de EC2 con Amazon Linux 2 y Node.js preinstalado
aws ec2 run-instances \
  --image-id ami-xxxxxxxxxxxxxxxxx \
  --instance-type t2.micro \
  --key-name "$llave_nombre_aws" \
  --security-groups "$grupo_seguridad" \
  --user-data '#!/bin/bash
              yum update -y
              curl -sL https://rpm.nodesource.com/setup_14.x | bash -
              yum install -y nodejs'

# Esperar a que la instancia esté en estado 'running'
aws ec2 wait instance-running --instance-ids "$nombre_instancia"

# Obtener la dirección IP de la instancia
direccion_ip=$(aws ec2 describe-instances --instance-ids "$nombre_instancia" --query 'Reservations[0].Instances[0].PublicIpAddress' --output text)

echo "La instancia de EC2 se ha creado con éxito."
echo "Puedes acceder a la instancia en la dirección IP: $direccion_ip"

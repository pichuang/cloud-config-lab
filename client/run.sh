#!/bin/bash
# az group create -n rg-hub-er-taiwannorth -l taiwannorth

az vm create \
    --resource-group rg-hub-er-taiwannorth \
    --name vm-cloud-init-taiwannorth \
    --image Ubuntu2204 \
    --size Standard_B1ms \
    --custom-data cloud-init.txt \
    --public-ip-address-dns-name pip-cloud-init-taiwannorth \
    --nsg-rule SSH \
    --authentication-type ssh \
    --admin-username pichuang \
    --ssh-key-values ~/.ssh/poc-ms.pub

az vm open-port -g rg-hub-er-taiwannorth -n vm-cloud-init-taiwannorth --port 22
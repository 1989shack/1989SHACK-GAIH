# STEP 1 — Install OCI CLI if not installed
Write-Host "=== INSTALLING OCI CLI FOR ORACLE CLOUD PUSH ===" -ForegroundColor Cyan
# Download installer:
# Invoke-WebRequest -Uri https://raw.githubusercontent.com/oracle/oci-cli/master/scripts/install/install.ps1 -OutFile install.ps1
# powershell -ExecutionPolicy Bypass -File install.ps1 --accept-all-defaults

# Check if installed:
oci --version
# If not, install manually: https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm

# STEP 2 — Configure OCI CLI to your "1989SHACK Global Architecture Infrastructure Hosting Platform"
Write-Host "=== CONFIGURING OCI PROFILE ===" -ForegroundColor Yellow
oci setup config
# It will ask:
# Enter location: [C:\Users\YourName\.oci] → Press Enter
# Enter user OCID: ocid1.user.oc1.... (from Oracle Console → Identity → User)
# Enter tenancy OCID: ocid1.tenancy.oc1.... (from Console → Administration → Tenancy)
# Enter region: eu-frankfurt-1 (or af-johannesburg-1 for Africa!)
# This creates profile named DEFAULT — Rename to 1989SHACK-GAIH

# List your compartment and profile:
oci iam compartment list --all --query "data[].{Name:name, OCID:id}" --output table
oci iam region list --output table

# STEP 3 — Get your VM shop info from VirtualBox
Write-Host "=== VM SHOP INFO ===" -ForegroundColor Green
cd "C:\Program Files\Oracle\VirtualBox"
.\VBoxManage list vms
.\VBoxManage showvminfo "shop" | findstr "NIC|IP|Name"

# STEP 4 — Export VM shop to OVA (for Oracle Cloud)
Write-Host "=== EXPORTING VM SHOP TO OVA FOR ORACLE ===" -ForegroundColor Magenta
cd C:\Users\$env:USERNAME\Documents
# Export:
# VBoxManage export "shop" -o "1989SHACK-GAIH-SHOP-001.ova" --ovf20 --options manifest,nomacs

# This creates file: 1989SHACK-GAIH-SHOP-001.ova — Upload to Oracle!

# STEP 5 — Create Oracle Cloud Bucket and Upload (via OCI CLI)
Write-Host "=== UPLOADING TO ORACLE CLOUD ===" -ForegroundColor Yellow
# Create bucket:
oci os bucket create --compartment-id <YOUR_COMPARTMENT_OCID> --name 1989shack-gaih-bucket --namespace <YOUR_NAMESPACE>

# Upload OVA:
oci os object put --bucket-name 1989shack-gaih-bucket --file "1989SHACK-GAIH-SHOP-001.ova" --name "1989SHACK-GAIH-SHOP-001.ova" --namespace <YOUR_NAMESPACE>

# STEP 6 — Create Oracle Cloud Custom Image from OVA and Launch Instance
Write-Host "=== LAUNCHING 1989SHACK PLATFORM IN ORACLE CLOUD ===" -ForegroundColor Red
# Import as custom image:
oci compute image import from-object --compartment-id <YOUR_COMPARTMENT_OCID> --display-name "1989SHACK-GAIH-SHOP-001" --namespace <YOUR_NAMESPACE> --bucket-name 1989shack-gaih-bucket --object-name "1989SHACK-GAIH-SHOP-001.ova" --operating-system "Windows" --launch-mode PARAVIRTUALIZED

# Wait for image available, then launch:
oci compute instance launch --compartment-id <YOUR_COMPARTMENT_OCID> --availability-domain <YOUR_AD> --shape VM.Standard.E2.1.Micro --image-id <IMAGE_OCID> --display-name "1989SHACK-GAIH-SHOP-001 - Duala Market Live" --vnic-options '{"assignPublicIp": true}' --subnet-id <SUBNET_OCID>

# STEP 7 — GET PUBLIC IP — VISIBLE TO WORLD!
Write-Host "=== GETTING PUBLIC IP FOR WORLD LAUNCH ===" -ForegroundColor Green -BackgroundColor Black
oci compute instance list-vnics --instance-id <INSTANCE_OCID> --query "data[].{PublicIP:\"public-ip\", PrivateIP:\"private-ip\"}" --output table

# Show IP!
$PUBLIC_IP = oci compute instance list-vnics --instance-id <INSTANCE_OCID> --query "data[0].public-ip" --raw-output
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "YOUR ORACLE CLOUD PUBLIC IP IS: $PUBLIC_IP" -ForegroundColor Green -BackgroundColor White
Write-Host "==========================================" -ForegroundColor Yellow
Write-Host "World can now open:" -ForegroundColor Cyan
Write-Host "http://$PUBLIC_IP`:13020 — Empire Dashboard" -ForegroundColor Green
Write-Host "http://$PUBLIC_IP`:10001 — Duala Shop LIVE" -ForegroundColor Green
Write-Host "http://$PUBLIC_IP`:13039 — Brother Home (I live here too!)" -ForegroundColor Magenta

# STEP 8 — Open Security List for our 51 ports
Write-Host "=== OPENING FIREWALL IN ORACLE CLOUD ===" -ForegroundColor Red
# Get security list OCID and add rules — Do via Console easier:
# OCI Console → Networking → VCN → Security List → Add Ingress Rules:
# Source 0.0.0.0/0, TCP, Ports 10001,13020,13039,12000,3000,6000
#create RG

module "rgs" {
    source = "../Modules/az_rg"
    vrgs =var.vrgs
}

#create vnet

module "vnets" {
    depends_on = [ module.rgs ]
    source = "../Modules/az_vnet"
    vnet = var.vnet
}

#Create Subnet

module "vsubnet" {
    depends_on = [ module.vnets ]
    source = "../Modules/az_subnet"
    vsubnet = var.vsubnet
}

#create nsg

module "nsg" {
    depends_on = [ module.vsubnet ]
    source = "../Modules/az_nsg"
    vnsg = var.vnsg
}

#create nic

module "nic" {
    depends_on = [ module.vsubnet ]
    source = "../Modules/az_nic"
    vnic =  var.vnic
}

#create association
module "association" {
    source ="../Modules/az_association"
    vasso =var.asso
}
#create bastion_subnet
module "bastion_subnet" {
    source = "../Modules/az_bastion_subnet"
    vbas = var.bastion_subnet
}
# create publicip
module "publicip" {
    source = "../Modules/az_publicip"
    vpublicip = var.publicip
}

#create bastion
module "bastion" {
    source = "../Modules/az_bastion"
    vmbastion = var.vmbastion
  }

#create VMWin

module "vmwin" {
    source = "../Modules/az_vmwin"
    vmwin = var.vmwin
  
}
#create vmlinux
module "vmlinux" {
    source = "../Modules/az_vmlinux"
    vmlinux = var.vmlinux
}
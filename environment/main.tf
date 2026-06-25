#create RG

module "rgs" {
    source = "../Modules/az_rg"
    vrgs = var.vrgs
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
    depends_on = [ module.nsg, module.vsubnet ]
    source ="../Modules/az_association"
    vasso =var.vasso
}
#create bastion_subnet

module "bastion_subnet" {
    depends_on = [ module.rgs ]
    source = "../Modules/az_bastion_subnet"
    vbassub = var.vbassub
}
# create publicip
module "publicip" {
    depends_on = [ module.rgs ]
    source = "../Modules/az_publicip"
    vpip = var.vpip
}

#create bastion
module "bastion" {
    depends_on = [ module.bastion_subnet ]
    source = "../Modules/az_bastion"
    vmbastion = var.vmbastion
  }

#create VMWin

module "vmwin" {
    depends_on = [ module.nic ]
    source = "../Modules/az_win"
    vmwin = var.vmwin
  
}
#create vmlinux
module "vmlinux" {
    depends_on = [ module.nic ]
    source = "../Modules/az_vmlinux"
    vmlinux = var.vmlinux
}
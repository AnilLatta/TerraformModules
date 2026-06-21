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

module "nic" {
    depends_on = [ module.vsubnet ]
    source = "../Modules/az_nic"
    vnic =  var.vnic
}

#

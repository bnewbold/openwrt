BOARDNAME:=Soekris net6501
FEATURES:=squashfs pci usb
DEFAULT_PACKAGES += kmod-e1000e kmod-usb-core \
kmod-usb2 kmod-usb-uhci kmod-usb-ohci 

define Target/Description
	Build firmware images for Soekris net6501 board
endef


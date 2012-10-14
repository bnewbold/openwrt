#
# Copyright (C) 2006-2010 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=attr
PKG_VERSION:=2.4.46
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).src.tar.gz
PKG_SOURCE_URL:=http://download.savannah.gnu.org/releases/$(PKG_NAME)/
PKG_MD5SUM:=db557c17fdfa4f785333ecda08654010

include $(INCLUDE_DIR)/package.mk

MY_APPLETS:=setfattr getfattr attr

define Package/attr/Default
  SECTION:=utils
  CATEGORY:=Utilities
  URL:=http://savannah.nongnu.org/projects/attr
endef

define Package/attr
  $(call Package/attr/Default)
  TITLE:=Extended attributes tools
  MENU:=1
endef

define Package/libattr
  $(call Package/attr/Default)
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Extended attributes library
endef

define GenPlugin
  define Package/$(1)
    $(call Package/attr/Default)
    DEPENDS:= attr +libattr
    TITLE:=Utility $(2) from extended attributes tools
  endef
endef

$(foreach a,$(MY_APPLETS),$(eval $(call GenPlugin,attr-$(a),$(a))))

CONFIGURE_ARGS += --enable-shared --enable-static --disable-gettext

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) DIST_ROOT="$(PKG_INSTALL_DIR)" install install-lib install-dev
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) -r $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/

	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libattr.{a,so*} $(1)/usr/lib/
endef

define Package/attr/install
	true
endef

define Package/libattr/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libattr.so* $(1)/usr/lib/
endef

define BuildPlugin
  define Package/$(1)/install
	$(INSTALL_DIR) $$(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$(2) $$(1)/usr/bin/
  endef

  $$(eval $$(call BuildPackage,$(1)))
endef

$(eval $(call BuildPackage,attr))
$(eval $(call BuildPackage,libattr))
$(foreach a,$(MY_APPLETS),$(eval $(call BuildPlugin,attr-$(a),$(a))))

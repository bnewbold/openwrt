
include $(TOPDIR)/rules.mk

PKG_NAME:=lxc
PKG_VERSION:=0.7.5
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/lxc-$(PKG_VERSION)
PKG_SOURCE:=lxc-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://lxc.sourceforge.net/download/lxc/
PKG_MD5SUM:=04949900ff56898f4353b130929c09d1
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/lxc
  SECTION:=base
  CATEGORY:=Utilities
  DEFAULT:=y
  TITLE:=LXC: Lightweight Containers Utilities
  #DESCRIPTION:=This variable is obsolete. use the Package/name/description define instead!
  URL:=http://lxc.sourceforge.net/
  DEPENDS:=+libattr +libcap
endef

define Package/lxc/description
	LXC: Lightweight Containers Utilities
endef

CONFIGURE_ARGS += --enable-shared --enable-static --disable-gettext

#MAKE_FLAGS+=\
#    CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
#    LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS) -lc" \

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CROSS)gcc" \
		AR="$(TARGET_CROSS)ar rcu" \
		RANLIB="$(TARGET_CROSS)ranlib" \
		INSTALL_ROOT=/usr \
		CFLAGS="$(TARGET_CFLAGS) $(EXTRA_CFLAGS)" \
		LDFLAGS="$(TARGET_LDFLAGS) $(EXTRA_LDFLAGS) -lc" \
		MYLDFLAGS="$(TARGET_LDFLAGS)" \
		PKG_VERSION=$(PKG_VERSION)
	rm -rf $(PKG_INSTALL_DIR)
	mkdir -p $(PKG_INSTALL_DIR)
	$(MAKE) -C $(PKG_BUILD_DIR) \
		INSTALL_TOP="$(PKG_INSTALL_DIR)/usr" \
		DESTDIR="$(PKG_INSTALL_DIR)" \
		install
endef

define Package/lxc/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_DIR) $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/lxc-* $(1)/usr/bin
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/liblxc.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,lxc))

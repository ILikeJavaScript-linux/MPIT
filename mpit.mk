MPIT_VERSION = 1.0.0
MPIT_SITE = /path/to/mpit/source
MPIT_SITE_METHOD = local
MPIT_LICENSE = MIT
MPIT_LICENSE_FILES = LICENSE

define MPIT_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/mpit.sh $(TARGET_DIR)/usr/bin/mpit
    $(INSTALL) -D -m 0644 $(@D)/config/config.conf $(TARGET_DIR)/etc/mpit.conf
endef

$(eval $(generic-package))
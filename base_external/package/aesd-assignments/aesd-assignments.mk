##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# Replace with the actual commit hash if needed (optional)
AESD_ASSIGNMENTS_VERSION = 8d33801

# Use your SSH repo URL — this is important!
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignment-4-Pei-Cheng-Yu.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

AESD_ASSIGNMENTS_INSTALL_TARGET = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Install scripts and binaries to /usr/bin
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
	$(INSTALL) -D -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
	$(INSTALL) -D -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/writer

	# Install conf directory contents to /etc
	$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf
	$(INSTALL) -m 0644 $(@D)/finder-app/conf/* $(TARGET_DIR)/etc/finder-app/conf/
endef

$(eval $(generic-package))

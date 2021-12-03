Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D948E68
	for <landlock@lists.linux.dev>; Fri,  3 Dec 2021 20:38:51 +0000 (UTC)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4J5MNs2C1RzMqWNg;
	Fri,  3 Dec 2021 19:51:25 +0100 (CET)
Received: from localhost (unknown [23.97.221.149])
	by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4J5MNs0MTJzlhP5Z;
	Fri,  3 Dec 2021 19:51:24 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: kernel-team@lists.ubuntu.com
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Tyler Hicks <code@tyhicks.com>,
	landlock@lists.linux.dev
Subject: [PATCH v1 1/1] UBUNTU: [Config] Enable Landlock by default
Date: Fri,  3 Dec 2021 19:52:26 +0100
Message-Id: <20211203185226.1957311-2-mic@digikod.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203185226.1957311-1-mic@digikod.net>
References: <20211203185226.1957311-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1953192

Landlock is a feature to create security sandboxes thanks to 3 new
dedicated system calls.  They are designed to be safe to used by any
processes, which can only drop their privileges, similarly to seccomp.

The new Landlock LSM is build in the kernel (CONFIG_SECURITY_LANDLOCK=y)
but it is not enough to make it usable by default.  As a stackable LSM,
it is required to enable it at boot time, either with the "lsm=" boot
argument, or with the CONFIG_LSM list (as described in the kernel
documentation).

As for other stackable LSMs, prepending Landlock to the default LSM list
enables users to potentially get more protection by default by letting
applications sandbox themselves.

Signed-off-by: Mickaël Salaün <mic@digikod.net>
Link: https://lore.kernel.org/r/20211203185226.1957311-2-mic@digikod.net
---
 debian.master/config/config.common.ubuntu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/debian.master/config/config.common.ubuntu b/debian.master/config/config.common.ubuntu
index 912871ce8fde..0e26e7846024 100644
--- a/debian.master/config/config.common.ubuntu
+++ b/debian.master/config/config.common.ubuntu
@@ -5702,7 +5702,7 @@ CONFIG_LPARCFG=y
 # CONFIG_LP_CONSOLE is not set
 CONFIG_LRU_CACHE=m
 CONFIG_LSI_ET1011C_PHY=m
-CONFIG_LSM="lockdown,yama,integrity,apparmor"
+CONFIG_LSM="landlock,lockdown,yama,integrity,apparmor"
 CONFIG_LSM_MMAP_MIN_ADDR=0
 CONFIG_LS_EXTIRQ=y
 CONFIG_LS_SCFG_MSI=y
-- 
2.33.1


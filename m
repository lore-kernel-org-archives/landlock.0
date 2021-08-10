Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E5B177
	for <landlock@lists.linux.dev>; Tue, 10 Aug 2021 16:27:00 +0000 (UTC)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4GkcrV1xGfzMqHjL;
	Tue, 10 Aug 2021 17:51:38 +0200 (CEST)
Received: from localhost (unknown [23.97.221.149])
	by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4GkcrT4LLYzlh8mv;
	Tue, 10 Aug 2021 17:51:37 +0200 (CEST)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: musl@lists.openwall.com
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Rich Felker <dalias@aerifal.cx>,
	landlock@lists.linux.dev,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@linux.microsoft.com>
Subject: [PATCH v1] bits/syscall.h: add landlock_* from linux v5.13
Date: Tue, 10 Aug 2021 17:54:06 +0200
Message-Id: <20210810155406.2772584-1-mic@digikod.net>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mickaël Salaün <mic@linux.microsoft.com>

Add three system calls for all architectures:
* landlock_create_ruleset
* landlock_add_rule
* landlock_restrict_self

They enable creating unprivileged security sandboxes, see

  linux commit a49f4f81cb48925e8d7cbd9e59068f516e984144
  arch: Wire up Landlock syscalls

https://www.kernel.org/doc/html/latest/userspace-api/landlock.html

Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
Link: https://lore.kernel.org/r/20210810155406.2772584-1-mic@digikod.net
---
 arch/aarch64/bits/syscall.h.in    | 3 +++
 arch/arm/bits/syscall.h.in        | 3 +++
 arch/i386/bits/syscall.h.in       | 3 +++
 arch/m68k/bits/syscall.h.in       | 3 +++
 arch/microblaze/bits/syscall.h.in | 3 +++
 arch/mips/bits/syscall.h.in       | 3 +++
 arch/mips64/bits/syscall.h.in     | 3 +++
 arch/mipsn32/bits/syscall.h.in    | 3 +++
 arch/or1k/bits/syscall.h.in       | 3 +++
 arch/powerpc/bits/syscall.h.in    | 3 +++
 arch/powerpc64/bits/syscall.h.in  | 3 +++
 arch/riscv64/bits/syscall.h.in    | 3 +++
 arch/s390x/bits/syscall.h.in      | 3 +++
 arch/sh/bits/syscall.h.in         | 3 +++
 arch/x86_64/bits/syscall.h.in     | 3 +++
 15 files changed, 45 insertions(+)

diff --git a/arch/aarch64/bits/syscall.h.in b/arch/aarch64/bits/syscall.h.in
index 1ad467c0d32e..b94a1706994f 100644
--- a/arch/aarch64/bits/syscall.h.in
+++ b/arch/aarch64/bits/syscall.h.in
@@ -294,4 +294,7 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
 
diff --git a/arch/arm/bits/syscall.h.in b/arch/arm/bits/syscall.h.in
index cf9e34117109..9364cb335022 100644
--- a/arch/arm/bits/syscall.h.in
+++ b/arch/arm/bits/syscall.h.in
@@ -394,6 +394,9 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
 
 #define __ARM_NR_breakpoint	0x0f0001
 #define __ARM_NR_cacheflush	0x0f0002
diff --git a/arch/i386/bits/syscall.h.in b/arch/i386/bits/syscall.h.in
index 5d1c4d7a576d..1f45968c5ca4 100644
--- a/arch/i386/bits/syscall.h.in
+++ b/arch/i386/bits/syscall.h.in
@@ -431,4 +431,7 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
 
diff --git a/arch/m68k/bits/syscall.h.in b/arch/m68k/bits/syscall.h.in
index 6794b1a06220..297b0923b3b2 100644
--- a/arch/m68k/bits/syscall.h.in
+++ b/arch/m68k/bits/syscall.h.in
@@ -411,3 +411,6 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
diff --git a/arch/microblaze/bits/syscall.h.in b/arch/microblaze/bits/syscall.h.in
index 7f71df3b581c..637943b56a99 100644
--- a/arch/microblaze/bits/syscall.h.in
+++ b/arch/microblaze/bits/syscall.h.in
@@ -432,4 +432,7 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
 
diff --git a/arch/mips/bits/syscall.h.in b/arch/mips/bits/syscall.h.in
index d54845b22890..bb7378dfa032 100644
--- a/arch/mips/bits/syscall.h.in
+++ b/arch/mips/bits/syscall.h.in
@@ -413,4 +413,7 @@
 #define __NR_pidfd_getfd	4438
 #define __NR_faccessat2		4439
 #define __NR_process_madvise	4440
+#define __NR_landlock_create_ruleset 4444
+#define __NR_landlock_add_rule 4445
+#define __NR_landlock_restrict_self 4446
 
diff --git a/arch/mips64/bits/syscall.h.in b/arch/mips64/bits/syscall.h.in
index 920b43589d9e..028a30b5817e 100644
--- a/arch/mips64/bits/syscall.h.in
+++ b/arch/mips64/bits/syscall.h.in
@@ -343,4 +343,7 @@
 #define __NR_pidfd_getfd	5438
 #define __NR_faccessat2		5439
 #define __NR_process_madvise	5440
+#define __NR_landlock_create_ruleset 5444
+#define __NR_landlock_add_rule 5445
+#define __NR_landlock_restrict_self 5446
 
diff --git a/arch/mipsn32/bits/syscall.h.in b/arch/mipsn32/bits/syscall.h.in
index e6dad6881f9c..d08f079bdb32 100644
--- a/arch/mipsn32/bits/syscall.h.in
+++ b/arch/mipsn32/bits/syscall.h.in
@@ -367,4 +367,7 @@
 #define __NR_pidfd_getfd	6438
 #define __NR_faccessat2		6439
 #define __NR_process_madvise	6440
+#define __NR_landlock_create_ruleset 6444
+#define __NR_landlock_add_rule 6445
+#define __NR_landlock_restrict_self 6446
 
diff --git a/arch/or1k/bits/syscall.h.in b/arch/or1k/bits/syscall.h.in
index 463ee901a55d..495c36ce47b7 100644
--- a/arch/or1k/bits/syscall.h.in
+++ b/arch/or1k/bits/syscall.h.in
@@ -316,4 +316,7 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
 
diff --git a/arch/powerpc/bits/syscall.h.in b/arch/powerpc/bits/syscall.h.in
index db4d0ca47c15..6a123c52aa7f 100644
--- a/arch/powerpc/bits/syscall.h.in
+++ b/arch/powerpc/bits/syscall.h.in
@@ -420,4 +420,7 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
 
diff --git a/arch/powerpc64/bits/syscall.h.in b/arch/powerpc64/bits/syscall.h.in
index a128890b8f20..947c814a704b 100644
--- a/arch/powerpc64/bits/syscall.h.in
+++ b/arch/powerpc64/bits/syscall.h.in
@@ -392,4 +392,7 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
 
diff --git a/arch/riscv64/bits/syscall.h.in b/arch/riscv64/bits/syscall.h.in
index 39c0d650b1c8..fbfa614d00c4 100644
--- a/arch/riscv64/bits/syscall.h.in
+++ b/arch/riscv64/bits/syscall.h.in
@@ -294,6 +294,9 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
 
 #define __NR_sysriscv __NR_arch_specific_syscall
 #define __NR_riscv_flush_icache (__NR_sysriscv + 15)
diff --git a/arch/s390x/bits/syscall.h.in b/arch/s390x/bits/syscall.h.in
index 9c8d984ed25c..766b8daee2c2 100644
--- a/arch/s390x/bits/syscall.h.in
+++ b/arch/s390x/bits/syscall.h.in
@@ -357,4 +357,7 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
 
diff --git a/arch/sh/bits/syscall.h.in b/arch/sh/bits/syscall.h.in
index 17dd7e07435a..aab269ea7cfd 100644
--- a/arch/sh/bits/syscall.h.in
+++ b/arch/sh/bits/syscall.h.in
@@ -404,4 +404,7 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
 
diff --git a/arch/x86_64/bits/syscall.h.in b/arch/x86_64/bits/syscall.h.in
index e943883db974..9ddabc04b70e 100644
--- a/arch/x86_64/bits/syscall.h.in
+++ b/arch/x86_64/bits/syscall.h.in
@@ -350,4 +350,7 @@
 #define __NR_pidfd_getfd	438
 #define __NR_faccessat2		439
 #define __NR_process_madvise	440
+#define __NR_landlock_create_ruleset 444
+#define __NR_landlock_add_rule 445
+#define __NR_landlock_restrict_self 446
 

base-commit: 3f701faace7addc75d16dea8a6cd769fa5b3f260
-- 
2.32.0


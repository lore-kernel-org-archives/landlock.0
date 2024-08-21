Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E61531C1
	for <landlock@lists.linux.dev>; Wed, 21 Aug 2024 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724241877; cv=none; b=Oi25epZl1GD1QwZT2eDAXFZ9hxlmKYOlR73f83pIqX0sJ6pwtWy3mVxz83filwjMO25qfQ4KD8ZdtjhnPCHwO9WZfF9rW0XhzKWVitZhDxGAGMWCjB7vNxVOtFtIPsADF1ofP6gZ6KMRGWnY2Huo2N9piHd3Dt4KPpSeoRqEfXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724241877; c=relaxed/simple;
	bh=pC0ouWZhFDWOdUlDImRQ2duzs8MaqU4ZdC4Qk3W5TEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PkUN6B/HWr1SFLPxIYAEW2IRc5sMcX54fks/KhoR6lgWMXMVejRleLuyhGCz8FGvul7q2Ko+peVRw5HWmwPrIxjUJy/GbhwgbjSNLQRJ1CQHdLsTsN6zvdSFjAes8E5FNpScsaLSw2sVCmzJoGeVSR4UNt4JmsWN4PRmQMVZcSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BGXO5u3C; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t438K+7y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sSt3IPf4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=maxwHeVs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BGXO5u3C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t438K+7y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sSt3IPf4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="maxwHeVs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D667722297;
	Wed, 21 Aug 2024 12:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724241874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GvV+SYu2k+BZ1RMqyryMLk6uEeoXr7IIvCTYrWybpSE=;
	b=BGXO5u3CobQij5ZD9KrMqOYeUFcwlmwfCqXzuW3ay2kagj4ELBbUzsq4DGM/iFJFAKXvrj
	Wjj3EChqcLm8lYm7lX9iKOx3ZPtsEcaX0/amkklB2Eea7pp8/lrjJLGKYD20qIwaNPwTuo
	VqJaR/gdo7JojHrLQKTVSGm+ZWls6tU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724241874;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GvV+SYu2k+BZ1RMqyryMLk6uEeoXr7IIvCTYrWybpSE=;
	b=t438K+7ybrX2qHuzyCaQIDjnvKHOAhAXNRC8q6QgKt+A9zz7kQyUo31KpQqC0pIHcYfOox
	L/bMmWvJFerz7jCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sSt3IPf4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=maxwHeVs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724241873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GvV+SYu2k+BZ1RMqyryMLk6uEeoXr7IIvCTYrWybpSE=;
	b=sSt3IPf4uGIY3sE7PRhcDKa4Zq4+cmpWZmLZVVGne5fOQqxdfJsLEDY42I2AoyUDMivc8g
	RSEvQqTk9K/A6gYSNjnUycJjjgh9TRTvn2mI7vc/lXU8y8gfnoEOLllsdOwY9KepUFWKUM
	kztEU5mktjEzdb150Sodnb6TJhnEom8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724241873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GvV+SYu2k+BZ1RMqyryMLk6uEeoXr7IIvCTYrWybpSE=;
	b=maxwHeVsOpBeV3n322t8c/sUTUfcoLYnaDrlb5YS8XscVRBFv4JxxxDuvABRaNd5HVP88g
	KO3co9Jula16DIAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7728139C2;
	Wed, 21 Aug 2024 12:04:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UFPhKtHXxWaTBgAAD6G6ig
	(envelope-from <andrea.cervesato@suse.de>); Wed, 21 Aug 2024 12:04:33 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Wed, 21 Aug 2024 14:04:26 +0200
Subject: [PATCH v2 2/2] Add landlock07 test
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240821-landlock_houdini-v2-2-b46211ca64f9@suse.com>
References: <20240821-landlock_houdini-v2-0-b46211ca64f9@suse.com>
In-Reply-To: <20240821-landlock_houdini-v2-0-b46211ca64f9@suse.com>
To: ltp@lists.linux.it
Cc: landlock@lists.linux.dev
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724241873; l=3797;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=QKMhGicsSkl4w+IZDfpOx3+KhtDKhEyRSvDAMhX3NMI=;
 b=3RXzMLjlocZzE7brmTfQkN0xNwEMrunKz0JPfhY0OCmfeKTbE92eX3FUITSAjGykn/7Vevldf
 EB2cmCY7N/cDdgElWV9Oq/QXU7sG3C3qjo1VLJf8fQbc8rJ2DJoy8WP
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Rspamd-Queue-Id: D667722297
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.com:url,suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

From: Andrea Cervesato <andrea.cervesato@suse.com>

This test is a reproducer for the CVE-2024-42318 bug, also known as
landlock Houdini.

More information at:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-42318

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/syscalls                                |   1 +
 testcases/kernel/syscalls/landlock/.gitignore   |   1 +
 testcases/kernel/syscalls/landlock/landlock07.c | 109 ++++++++++++++++++++++++
 3 files changed, 111 insertions(+)

diff --git a/runtest/syscalls b/runtest/syscalls
index fea0c9828..a9fc8c432 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -706,6 +706,7 @@ landlock03 landlock03
 landlock04 landlock04
 landlock05 landlock05
 landlock06 landlock06
+landlock07 landlock07
 
 lchown01 lchown01
 lchown01_16 lchown01_16
diff --git a/testcases/kernel/syscalls/landlock/.gitignore b/testcases/kernel/syscalls/landlock/.gitignore
index 315ac1dca..db11bff2f 100644
--- a/testcases/kernel/syscalls/landlock/.gitignore
+++ b/testcases/kernel/syscalls/landlock/.gitignore
@@ -5,3 +5,4 @@ landlock03
 landlock04
 landlock05
 landlock06
+landlock07
diff --git a/testcases/kernel/syscalls/landlock/landlock07.c b/testcases/kernel/syscalls/landlock/landlock07.c
new file mode 100644
index 000000000..68045da3b
--- /dev/null
+++ b/testcases/kernel/syscalls/landlock/landlock07.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
+ */
+
+/**
+ * [Description]
+ *
+ * CVE-2024-42318
+ *
+ * Test to check if sysem is affected by Landlock Houdini bug:
+ * https://www.suse.com/security/cve/CVE-2024-42318.html
+ *
+ * Kernel bug fixed in:
+ *
+ *  commit 39705a6c29f8a2b93cf5b99528a55366c50014d1
+ *  Author: Jann Horn <jannh@google.com>
+ *  Date:   Wed Jul 24 14:49:01 2024 +0200
+ *
+ *  landlock: Don't lose track of restrictions on cred_transfer
+ */
+
+#include "tst_test.h"
+#include "lapi/prctl.h"
+#include "lapi/keyctl.h"
+#include "tst_test_macros.h"
+#include "landlock_common.h"
+
+static struct landlock_ruleset_attr *ruleset_attr;
+static int ruleset_fd;
+
+static pid_t spawn_houdini(void)
+{
+	pid_t pid;
+
+	SAFE_KEYCTL(KEYCTL_JOIN_SESSION_KEYRING, 0, 0, 0, 0);
+
+	pid = SAFE_FORK();
+	if (!pid) {
+		SAFE_KEYCTL(KEYCTL_JOIN_SESSION_KEYRING, 0, 0, 0, 0);
+		SAFE_KEYCTL(KEYCTL_SESSION_TO_PARENT, 0, 0, 0, 0);
+		exit(0);
+	}
+
+	return pid;
+}
+
+static void run(void)
+{
+	pid_t pid_houdini;
+
+	if (SAFE_FORK())
+		return;
+
+	SAFE_PRCTL(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+	SAFE_LANDLOCK_RESTRICT_SELF(ruleset_fd, 0);
+
+	TST_EXP_FAIL(open("/dev/null", O_WRONLY), EACCES);
+	if (TST_RET != -1) {
+		SAFE_CLOSE(TST_RET);
+		return;
+	}
+
+	pid_houdini = spawn_houdini();
+	SAFE_WAITPID(pid_houdini, NULL, 0);
+
+	TST_EXP_FAIL(open("/dev/null", O_WRONLY), EACCES);
+	if (TST_RET != -1)
+		SAFE_CLOSE(TST_RET);
+
+	exit(0);
+}
+
+static void setup(void)
+{
+	verify_landlock_is_enabled();
+
+	ruleset_attr->handled_access_fs = LANDLOCK_ACCESS_FS_WRITE_FILE;
+	ruleset_fd = SAFE_LANDLOCK_CREATE_RULESET(
+		ruleset_attr,
+		sizeof(struct landlock_ruleset_attr),
+		0);
+}
+
+static void cleanup(void)
+{
+	if (ruleset_fd != -1)
+		SAFE_CLOSE(ruleset_fd);
+}
+
+static struct tst_test test = {
+	.test_all = run,
+	.setup = setup,
+	.cleanup = cleanup,
+	.forks_child = 1,
+	.bufs = (struct tst_buffers []) {
+		{&ruleset_attr, .size = sizeof(struct landlock_ruleset_attr)},
+		{},
+	},
+	.caps = (struct tst_cap []) {
+		TST_CAP(TST_CAP_REQ, CAP_SYS_ADMIN),
+		{}
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "39705a6c29f8"},
+		{"CVE", "2024-42318"},
+		{}
+	}
+};

-- 
2.43.0


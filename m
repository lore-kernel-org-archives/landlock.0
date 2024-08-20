Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6E619148F
	for <landlock@lists.linux.dev>; Tue, 20 Aug 2024 12:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724156163; cv=none; b=LjqiDRSyiSKp4fjpD8w0TaG+XmOrIbhcKvC6o7qgn7xqTQ0ePQM562JgId1rmsifD6qS21XettvNGTGtPG4Z4mfsqRT077vvlMKOZ6/8Cz0VCtXr+8A73ceRsGEyDNMtmHy4votGrSURsiz/1zspsJ1OrB8aD+9Qik6demTOeUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724156163; c=relaxed/simple;
	bh=xGci0JkBAPgPovJhlPSivfoL8yR0prS7zmPbagrtdBQ=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:From:
	 In-Reply-To:Content-Type; b=M3OvJgOIk9J7yzkqqTaOqA1w8fPF9Z42Vf11Wk+EevjpCoSPbgr78nPaIAad2fqa1T/M6/9YKrPdW7G/ftk78J7U9W6xuuq8AlfNhakjK/C5rasXKe4lRQOHcFoSlIuL1PR+7wkkqIRrZj0zqM+WCzAEx+ZKuBwUweDVh9g/gCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UnviJ2VU; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UnviJ2VU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so932933066b.0
        for <landlock@lists.linux.dev>; Tue, 20 Aug 2024 05:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724156159; x=1724760959; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:to:content-language
         :references:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QmtMO3Pqt7/Bm9NdQ+bfR3hrywpEbeY5Rx4A3CVX1G8=;
        b=UnviJ2VU3K68wm8+3h6GIbM/er0Ju9ij0HtyzAAOj4KvueBKqYV2QYfXJ5tNBMi1FO
         dl3M6DxREGe3yyGaRCVI723KLq1atrpDiDOaEGdByd/nMNaigUzv/PAO0PqhfKnBqsZM
         rvhb6OK9hTc9mZZR4O2gVFSfiVWurnGyzu10Dtvvm5MbPG7lBmU4PtapeUlWZCq+11hC
         QcuUQglq2FG94u5AvJ1C8wcYAy2/XjIztt7lLy8PAvMXrYUAc70xJ3V9gidsxl/h9TOW
         YA1sXuPRQr3QHGAbKtr/uuLOwcfgqN1y0dI68c6hj7rKw1AjruhqtlDAQzj2cc4To5uW
         ZEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724156159; x=1724760959;
        h=content-transfer-encoding:in-reply-to:from:to:content-language
         :references:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QmtMO3Pqt7/Bm9NdQ+bfR3hrywpEbeY5Rx4A3CVX1G8=;
        b=kUwP9F8AshjvQdTCiip60hSPa83s1Nmf8JJ3FZTca1diGeii/5lbYjE5YsGmo765zH
         WsLykDJERRXxgki57Qeh0jVGkiQG4pUKp12p2Sdso9zZ82iY24413hoZzH88MhzOwSq+
         gwEF9B9r8lLz3CIn4fbBl3A34cVQa8DEp0snOX5UAugWKkhtruecc38aFg+Tw/TWALuC
         fg4qnex/0KYd+03eILSVlN9OoE7tVESzOOREorO5XrhAT/5bGs01d9IdvhqByWrrMVkN
         tQT0IvUBGixkR2YViaD3msRlTCKQnwu8Zc3LqqxRTqGGj3VNysw1AIkkOkVb1aaLcNTH
         6rWg==
X-Gm-Message-State: AOJu0Yx9RC7CyZZNNUrbkGj4DtwZAy0PbfN3brNGdLOCJ3Z75qo7SQ3c
	rM/syD0dK068DNiwyaGYXCxYNkBTk/bArijjHAjgxeryJ41GgXp3KU3w5gbHw5LTZm6U6vGOzAt
	9o4duMw==
X-Google-Smtp-Source: AGHT+IFBuaBkQ+oXfOqE8QCw4dei3USItblKdoXWobQR8P93+hw/LXfwltHzO0XAdNrIhbs2A9xflA==
X-Received: by 2002:a17:906:c111:b0:a6f:e7a0:91cf with SMTP id a640c23a62f3a-a8643ffb8e5mr262777566b.24.1724156158105;
        Tue, 20 Aug 2024 05:15:58 -0700 (PDT)
Received: from [10.232.133.86] ([88.128.88.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cfb18sm757580066b.60.2024.08.20.05.15.57
        for <landlock@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 05:15:57 -0700 (PDT)
Message-ID: <6e5b9e52-8db1-47d6-b288-0e34a3c0224d@suse.com>
Date: Tue, 20 Aug 2024 14:15:57 +0200
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Fwd: [PATCH] Add landlock07 test
References: <20240820-landlock_houdini-v1-1-ff3bffc93eaa@suse.com>
Content-Language: en-US
To: landlock@lists.linux.dev
From: Andrea Cervesato <andrea.cervesato@suse.com>
In-Reply-To: <20240820-landlock_houdini-v1-1-ff3bffc93eaa@suse.com>
X-Forwarded-Message-Id: <20240820-landlock_houdini-v1-1-ff3bffc93eaa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

FYI



-------- Forwarded Message --------
Subject: 	[PATCH] Add landlock07 test
Date: 	Tue, 20 Aug 2024 14:09:31 +0200
From: 	Andrea Cervesato <andrea.cervesato@suse.de>
To: 	ltp@lists.linux.it
CC: 	Andrea Cervesato <andrea.cervesato@suse.com>



From: Andrea Cervesato <andrea.cervesato@suse.com>

This test is a reproducer for the CVE-2024-42318 bug, also known as
landlock Houdini.

More information at:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-42318

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
More information at:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-42318
---
runtest/syscalls | 1 +
testcases/kernel/syscalls/landlock/.gitignore | 1 +
testcases/kernel/syscalls/landlock/landlock07.c | 114 
++++++++++++++++++++++++
3 files changed, 116 insertions(+)

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
diff --git a/testcases/kernel/syscalls/landlock/.gitignore 
b/testcases/kernel/syscalls/landlock/.gitignore
index 315ac1dca..db11bff2f 100644
--- a/testcases/kernel/syscalls/landlock/.gitignore
+++ b/testcases/kernel/syscalls/landlock/.gitignore
@@ -5,3 +5,4 @@ landlock03
landlock04
landlock05
landlock06
+landlock07
diff --git a/testcases/kernel/syscalls/landlock/landlock07.c 
b/testcases/kernel/syscalls/landlock/landlock07.c
new file mode 100644
index 000000000..f82442329
--- /dev/null
+++ b/testcases/kernel/syscalls/landlock/landlock07.c
@@ -0,0 +1,114 @@
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
+ * commit 39705a6c29f8a2b93cf5b99528a55366c50014d1
+ * Author: Jann Horn <jannh@google.com>
+ * Date: Wed Jul 24 14:49:01 2024 +0200
+ *
+ * landlock: Don't lose track of restrictions on cred_transfer
+ */
+
+#include "tst_test.h"
+#include "lapi/prctl.h"
+#include "lapi/keyctl.h"
+#include "lapi/landlock.h"
+#include "tst_test_macros.h"
+
+static struct landlock_ruleset_attr *ruleset_attr;
+static int ruleset_fd;
+
+static void create_keyring(const int operation)
+{
+ TEST(keyctl(operation, NULL, 0, 0, 0));
+ if (TST_RET == -1)
+ tst_brk(TERRNO | TBROK, "keyctl() failed");
+}
+
+static pid_t spawn_houdini(void)
+{
+ pid_t pid;
+
+ create_keyring(KEYCTL_JOIN_SESSION_KEYRING);
+
+ pid = SAFE_FORK();
+ if (!pid) {
+ create_keyring(KEYCTL_JOIN_SESSION_KEYRING);
+ create_keyring(KEYCTL_SESSION_TO_PARENT);
+ exit(0);
+ }
+
+ return pid;
+}
+
+static void run(void)
+{
+ pid_t pid_houdini;
+
+ if (SAFE_FORK())
+ return;
+
+ SAFE_PRCTL(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+ SAFE_LANDLOCK_RESTRICT_SELF(ruleset_fd, 0);
+
+ TST_EXP_FAIL(open("/dev/null", O_WRONLY), EACCES);
+ if (TST_RET != -1) {
+ SAFE_CLOSE(TST_RET);
+ return;
+ }
+
+ pid_houdini = spawn_houdini();
+ SAFE_WAITPID(pid_houdini, NULL, 0);
+
+ TST_EXP_FAIL(open("/dev/null", O_WRONLY), EACCES);
+ if (TST_RET != -1)
+ SAFE_CLOSE(TST_RET);
+
+ exit(0);
+}
+
+static void setup(void)
+{
+ ruleset_attr->handled_access_fs = LANDLOCK_ACCESS_FS_WRITE_FILE;
+ ruleset_fd = SAFE_LANDLOCK_CREATE_RULESET(
+ ruleset_attr,
+ sizeof(struct landlock_ruleset_attr),
+ 0);
+}
+
+static void cleanup(void)
+{
+ if (ruleset_fd != -1)
+ SAFE_CLOSE(ruleset_fd);
+}
+
+static struct tst_test test = {
+ .test_all = run,
+ .setup = setup,
+ .cleanup = cleanup,
+ .forks_child = 1,
+ .bufs = (struct tst_buffers []) {
+ {&ruleset_attr, .size = sizeof(struct landlock_ruleset_attr)},
+ {},
+ },
+ .caps = (struct tst_cap []) {
+ TST_CAP(TST_CAP_REQ, CAP_SYS_ADMIN),
+ {}
+ },
+ .tags = (const struct tst_tag[]) {
+ {"linux-git", "39705a6c29f8"},
+ {"CVE", "2024-42318"},
+ {}
+ }
+};

---
base-commit: c02d8ddc5f9d312ca5c384317141e213412a5c42
change-id: 20240820-landlock_houdini-f244f52e87c3

Best regards,

-- 
Andrea Cervesato <andrea.cervesato@suse.com>


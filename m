Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4D12367D3
	for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723401; cv=none; b=AsyQD7kpH3Ifz21rtZ56nWlog2MsXO8e3WjPuUROn2fsM0mxoheXzIJ5cDl0rXsoxv19MNgtmKBkb32u97licaTpxhddzbgVPjFCM5WDpgLTDAJ2k3l/PgGbXc3KQ2jLO9LOA2qMO9fD2kJUT9fprzDYpwcdX67va+FkwYYPciM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723401; c=relaxed/simple;
	bh=BGaFEx/f8mWLlH9deEEI1cp74nO5obRywMCSftusmHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pX9HVRvK7uhKy02O9TaoN7NRZcgq1fkOuCDQhR2PRGMdMr/7uZavkMDSAZU4r6p2BD2N7Byrw/m+n3YTyP+ZbcsBiD6iWQzyl7kbCWQDzfgZuu5jEexjrzn/qOWysJsdwjud3jbQ23aTqEUFWk3sOzoIuqZ8hL/7sLZs5R6s6Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=eKI88goN; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="eKI88goN"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69ea0595598so4271220a12.0
        for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 05:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1784723398; x=1785328198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGBJ0cI+WS5k0v0KKJxbb2IZYZWx9jLy469rhtaxBA8=;
        b=eKI88goNp7HOEYe0eJFByVxv9oVhFw73R6yTVyanwxRIkFEgOxOv9HA636trrirpxi
         rIBnALFicedUAOTnGteEMFC5Iw101oVoGVJHOFV6I9cieb9rI+G0582Xc2gntuhsfx7J
         RbT0QIAlGvGDAjtAHTRXVG5z/gy48UtAGPkEOiR9DEpjtW2OYCp3KQaMaupzWxAU3H6h
         g7OhdQIOQdk8M7wDiKCTC6I1VCBLEArJhd2LxckU299sTWLQ35TAfKEHuTsf79PF+NFQ
         VZCCTyvH4zZ4Np+2r5eVBzJyLK39RSX9g5cNUCF56MRK2fOwl6fBcoW7bgQIaaHEZIdi
         weOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723398; x=1785328198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGBJ0cI+WS5k0v0KKJxbb2IZYZWx9jLy469rhtaxBA8=;
        b=KCX1OB5GqU4lOJSLILu1CNbYgOUF9HG5LeBJGRokt2xPrVDQ2arpV1B+MiYd3ih+2U
         YiwPjh7pdSIpm1q0fwP5X19jAVxiy6u7xa0W0ILQiVMJMsISM8T+5PTiGxexNfJ/6Uld
         1J3BSI3AIsiQpqu+lCmm/Pp7pmDZPvh9RSDhlphsXWdQog2rXImAjgmGokARDfUAbTCU
         /+uYRhR05BJIyw32UXlFDeqAusFY+R4jT9lOlEdjPMNt3C/jiHeEy6zP2tMRkh3FWCJ3
         VJbHLQp/TAEWx7c+hg9B1pDcchgRJ6fGnOkWVQTZVTuNr7RVQKrqjO6baxhRDw46z4Rw
         RW9w==
X-Forwarded-Encrypted: i=1; AHgh+RqXPIqgHhLACCdgnG1fCzInWSjUa84vnlBhaPFWYR7R8p6ssmUBkkNipO2nTtcVyXvuZUy5+EXBbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YziTaISpThd9Yuk0G27WBkc5N+Fr9rGHzqGoozEZaa+Vu6R/cEn
	Vg6escmkAGF3Te4dbx9G00uCJduGwKCEWR21WL5bhwvBqkuPLfpLqqLDeAzOnMgQ7bQ=
X-Gm-Gg: AR+sD104i49dXNx36i60osLIAK3soAx8ujkSVgv7HfTQGqMrPfwJG6YxyGvG1tbb5NB
	pnPU3UA9dIsId6o+WRubx326lhZu9TAoFPc5F8fjA6qpaTSKLjYvuCwCaCHBD3+6O7UGNtJB1D0
	6qDpV1SknVSO23A8NoLnVsTFCEIGUD8B9xFO7x2bXtOC4wKFuJLvml+rqsrWnDdr9tdk5BSqq7i
	DnNxz9+zvOvvTfPpNyG2Zzym03FqdoSZRQaYMuI6tUfNq1BDG9D3tB/bLRQM1cGiklbr/i5iB8p
	rMjb68CeIGlzP2cgLO/bUL9+Cu5/gvbqEtgspcYwsSBsQL7Vlv8kM5/JcB+84NIHmBW9sD+n1no
	fXP7LlEKZ7XuHYPoGMU9TUNKk9pdSESxCg+viUluPpAF5py/Bx7yzoAQJCkqLNlM=
X-Received: by 2002:a05:6402:324c:b0:69a:9c4a:3d63 with SMTP id 4fb4d7f45d1cf-69e652995cfmr5743320a12.17.1784723398316;
        Wed, 22 Jul 2026 05:29:58 -0700 (PDT)
Received: from DW927H4LGF ([2a09:bac6:37e6:1e5a::306:2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34f1b867sm835007a12.14.2026.07.22.05.29.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jul 2026 05:29:57 -0700 (PDT)
From: Oxana Kharitonova <oxana@cloudflare.com>
To: mic@digikod.net,
	gnoack@google.com
Cc: paul@paul-moore.com,
	jmorris@namei.or,
	serge@hallyn.com,
	wangyan01@kylinos.cn,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	landlock@lists.linux.dev,
	oxana@cloudflare.com,
	webprosto@gmail.com
Subject: [PATCH 0/6] landlock: Add POSIX message queue scoping
Date: Wed, 22 Jul 2026 13:29:36 +0100
Message-ID: <20260722122952.42149-1-oxana@cloudflare.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series adds landlock support for scoping POSIX message queuesi [1].
 
Landlock already supports scoped IPC restrictions for signals and abstract
UNIX sockets. These restrictions make it possible to prevent a sandboxed
task from interacting with IPC objects outside of its Landlock domain,
while still allowing communication within the same domain or with nested
domains.
 
This series extends the same model to POSIX message queues with a new
LANDLOCK_SCOPE_POSIX_MSG_QUEUE scope. When this scope is enforced, a task
can only open POSIX message queues that were created by a task in the same
landlock domain or in a nested domain.
 
The implementation tags mqueuefs inodes at creation time with the creator's
landlock domain. This domain is kept alive for the lifetime of the inode
and is checked when the queue is opened.
 
The series also exposes the mqueuefs magic number through the shared UAPI
magic header, bumps the Landlock ABI, updates documentation, adds sandboxer
support, and adds selftests.
 
The new behavior is:
 
- a task restricted with LANDLOCK_SCOPE_POSIX_MSG_QUEUE cannot open a queue
  created outside of its Landlock scope;
- a task can still open a queue created within its own Landlock domain;
- queues created outside of any Landlock domain are treated as outside the
  scope for a scoped opener.

[1] https://man7.org/linux/man-pages/man7/mq_overview.7.html

Oxana Kharitonova (6):
  ipc: Move mqueue fs magic to uapi magic header
  landlock: Scope POSIX message queue opens
  landlock: Bump ABI for LANDLOCK_SCOPE_POSIX_MSG_QUEUE
  selftests/landlock: Test POSIX message queue scoping
  samples/landlock: Support POSIX message queue scoping
  landlock: Document POSIX message queue scoping

 Documentation/admin-guide/LSM/landlock.rst    |   6 +-
 Documentation/userspace-api/landlock.rst      |  11 +-
 include/uapi/linux/landlock.h                 |   7 +-
 include/uapi/linux/magic.h                    |   2 +
 ipc/mqueue.c                                  |   2 +-
 samples/landlock/sandboxer.c                  |  16 +-
 security/landlock/audit.c                     |   9 +
 security/landlock/audit.h                     |   1 +
 security/landlock/fs.c                        |  35 +++
 security/landlock/fs.h                        |  15 ++
 security/landlock/limits.h                    |   2 +-
 security/landlock/ruleset.c                   |   1 -
 security/landlock/syscalls.c                  |   2 +-
 security/landlock/task.c                      |  43 ++++
 security/landlock/task.h                      |   4 +
 tools/testing/selftests/landlock/base_test.c  |   2 +-
 .../landlock/scoped_posix_msg_queue_test.c    | 223 ++++++++++++++++++
 .../testing/selftests/landlock/scoped_test.c  |   2 +-
 18 files changed, 371 insertions(+), 12 deletions(-)
 create mode 100644 tools/testing/selftests/landlock/scoped_posix_msg_queue_test.c

-- 
2.50.1 (Apple Git-155)


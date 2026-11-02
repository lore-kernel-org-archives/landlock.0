Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630854;
	b=1ksOaSyPWSU6iZu2fMamFREW/Y4wQljUiB2RsNTKSFDfkpGfwNEx8456RNnirmZFt7aW
	 HG8GXiUeDM9weE6ZOTZCxz5vNJk+rkSJjdkLbWatzo/E1Qhch6+9xmiu+SwKjMgLTp37H
	 PT0Cf7Scareb8EM9JdwwvpEYalIVhXUbrTY60eyoTGXiIPnVPjG6RIbpPZqm0K6+bihzE
	 H5Ohy5UcJEoJxX6Z4LEF2Y2kMSmDfmr9Uca2EYrMVBwWyYwnFpK7dsITfyBWJ8nNZBqwd
	 ZS6zMG6tilLAYRIfG/izPcd6P2Xb4IEzsGScJ7BbdBvov6xsCRf/kK19ubN0WadGHWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pXy5GHogXvLHlpIU9w8T5R2VSIYiM1bQSKyxxyzdROQ=;
	b=IJyfAbZ0YBEWS7ZrIRhJFUJi26HkC/Jh3Fu2xxc6rh74h93Gn4yygGiyiCuIw1ciGzxY
	 ghL7oOlGZBw+Qtr5D0yvGaPC7/FadY4GHPpSzQG8KhtvGF3BH/R5G+kw0BrqC7A5GzTiI
	 3ZLxX1WHi8bs2CzY5uRt9EG+BHcHCVrWpRoZ9pDrdrn+bor/4EreU3w5TGReTMTT5dfqv
	 ssLm//INmhlKuAllPyrL4ZrGOvo66s0h1pLXN3aSuqJr4ZJje9qJ2eR+Dn0Cj7w48kPyh
	 TRY2aIKmmrHsM5pf9zKRWNuzSq4NtrNKdNvWpXqonNvIh9C2JSGNGeOpNQcseFSGQCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEjc2rJw;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066E9606A906
	for <landlock@lists.linux.dev>; Mon,  2 Nov 2026 14:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 066E9606A906
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UEjc2rJw
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so19861155e9.2
        for <landlock@lists.linux.dev>; Mon, 02 Nov 2026 06:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630852; x=1794235652; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXy5GHogXvLHlpIU9w8T5R2VSIYiM1bQSKyxxyzdROQ=;
        b=UEjc2rJwMr7if87Siq2s4ETGMK9gg2kVMHyz3w9LudD860PKAsQVb/UwnPwahCD1kz
         t2oPYd9xnEwbnnt4J9+EPfXeJyCktQeflcFppZncm7DbxDY/lgQg9BlBB3Ge4o/etoRk
         ydW2AxVgiB2pmbksp3nvfq/dGUfXpya4bBc+H66Idsk2gNrNIGvwWzv+LKv/R64Qk1ZW
         yJFI8Sy+9QZzm5GZ5C4vtSdS8aRL6ozoR+surGT10GbFDFuzNiHFknPEayihqvrwjBoc
         4RjddjYqVgSc+Ue96cOJr4FICNpnWR1rmz/evHwXczMIXBFEPE8RGtWKDLExshxxZRTF
         R0gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630852; x=1794235652;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pXy5GHogXvLHlpIU9w8T5R2VSIYiM1bQSKyxxyzdROQ=;
        b=Bgog1HAoCK6Tj7oyDykOnNd/Ylh8v3ZPUs2BRATwrgpnku8bB5iKSfoGaO50HGfDB8
         aU85sHs0XaOL61dbO5peenZj/rIR1oSAHJd0KR3io8vvlShdN88LSkUicLhqs7FKCGpB
         YtSpQHsupaYwB5TF5yntZUMYgd0bAHcBTpewDt8e9l1Wirx6+VRjNw+QrE76pKXxoCOE
         DVBDcbmgewgZpDUUkmyNw0CrmJ890IY+V0Xa5L1m00FRYO1+/tJg9Eb5FYSmrfd+8RV9
         1LMs78CibI3cCCBiePz9f3NUVnslcn+c79OprqSTmvLQ24FPofs+ytLEoW2yEcM9VM/x
         H15w==
X-Forwarded-Encrypted: i=1; AKwUvBzhH1XFotCeIxEz61MkGI/N/+Q5O9+Ntyej9k4/LSRMkPrS2U8DhP5y2IdTePO0dNR8L0YLuMoJ9Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYJWrruyErXrJ7hzVolT77AgrmTCFMzNGCpfMP+RJ4AVC058EFy7
	WZeQpYwsjU+NcUtyIpxdfA1X2Pc3oO0BP/sbD0eWN/myofg4dJ6AZE2f
X-Gm-Gg: AYBFou2nBUlFrTfgBDlF2ZdpM242ebqS6V7n7Vpe+uR3SMwlBQlk1EB6ZI/MndmiNxW
	w5n6v9m8EfSEOZqYrO4slN1ahspb5vr2XHaeY/MVvtniNf8wruMS30/eFm7+R0DAw6aUVkw6CTk
	oWVuZZmT4WMGgxy4zfTS49gJ22SzU1iIRiU3lFmCcZoubjXe5442QcGGzUP7KvYn/gf5wUr3Q2u
	aEAJijE2qtptWbD/E705hWGZR346JEYHYWP+fYK5NzkdsSFVFvcyKeHhqT9VYDsnpwOz7QZCxnp
	yZuibcIFvc+qOtirXlfr2qyV4UctCxTuDMdQzLhxzpmdUz3DbvB4H+98vbOrCGPzutkLu68EEx4
	iTyzrRUwSk0QvjOiVgyq4YCQeIoOH2f+MUqTPk6En2PxyYJOex5IzHnoYNDn9nTROr0GK0MXKm9
	QV7UQ2nPI8H0XNVtpGp4npJ5BQ8aKDlYCiC9grk2jXwUtrmjThJoj/rBVRr0OD8pdi2aw19QwB5
	wIZ0/Qae5yBb5MDfqlUJRpvaW5AwH7O8ro+DwL706+5OWZ1LWRcmAL6pzygIir2BBvPWfXcXZ0g
	peWR8puxBN2f8BlgTk8hj0har6JsSMLar9lNfw8/f0FFfSH9bQps3tjNmwXkSg==
X-Received: by 2002:a05:600c:b8a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4ac182dca8emr228763095e9.23.1793630852206;
        Mon, 02 Nov 2026 06:47:32 -0800 (PST)
Received: from penguin-ubuntu.lan ([2a00:23c6:6410:5d01:8464:9a6f:2d42:8827])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7700c3bsm254289965e9.0.2026.11.02.06.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:47:31 -0800 (PST)
From: Oxana Kharitonova <webprosto@gmail.com>
To: mic@digikod.net,
	brauner@kernel.org,
	viro@zeniv.linux.org.uk,
	gnoack@google.com,
	utilityemal77@gmail.com
Cc: linux-security-module@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	webprosto@gmail.com,
	landlock@lists.linux.dev
Subject: [PATCH v2 0/4] Landlock: Restrict POSIX message queue creation and access
Date: Mon,  2 Nov 2026 14:45:56 +0000
Message-ID: <20261102144708.920232-1-webprosto@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Post: <mailto:landlock@lists.linux.dev>
List-Help: <mailto:landlock+help@lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
List-Owner: <mailto:landlock+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Christian and Al, could you please review the mqueue-specific changes,
particularly the shared MQUEUE_MAGIC definition in patch 1?

Mickaël, Günther, and Justin, thank you for your feedback. I have revised
the changes and split the series into two parts: patches 1 and 2 enforce
the existing MAKE_REG permission, while patches 3 and 4 introduce and
expose the new scope. The first two patches can be applied without the
latter two.

The new scope adds control based on the queue creator's Landlock domain,
allowing sandboxes with shared filesystem access to isolate their queues.
However, I am unsure how useful this additional isolation would be in
practice.

The scope cannot replace the existing filesystem permission checks
without changing behavior, because applications may already rely on
them to restrict queue access. Both mechanisms therefore remain in
place. When READ_FILE is handled and queue scoping is enabled, the
checks combine as follows for opening an existing queue read-only,
assuming other access controls permit the operation:

Filesystem read access | Queue scope | Expected result
-----------------------+-------------+----------------
Denied                 | Allowed     | EACCES
Denied                 | Denied      | EPERM
Allowed                | Allowed     | Success
Allowed                | Denied      | EPERM

Selftests cover all four combinations.

I would welcome feedback on whether this domain-based isolation provides
enough practical value to justify the additional logic needed to track
creator domains and manage their lifetimes.

Queue creation
==============

POSIX message queues are represented by files in the mqueue filesystem.
Landlock's existing READ_FILE and WRITE_FILE restrictions can deny
mq_open(), but these checks occur after queue creation. Consequently,
mq_open() with O_CREAT may create a queue before access is denied,
leaving the queue behind despite the failed call.

Patch 2 adds an inode_create hook to enforce MAKE_REG before queue
creation. When this right is handled, creation requires an applicable
rule allowing MAKE_REG on the queue's parent directory. Opening an
existing queue does not require MAKE_REG.

Queue scoping
=============

Patch 3 adds LANDLOCK_SCOPE_POSIX_MSG_QUEUE through Landlock ABI 13.
It restricts opening queues to those created within the domain enabling
the scope or its descendants.

The restriction applies to mq_open() and opens through a mounted mqueue
filesystem. Existing, inherited, and passed descriptors remain usable.
Filesystem read/write restrictions continue to apply alongside the
scope.

The implementation includes audit logging, audit quieting, and a
dedicated denial trace event. Patch 4 exposes the scope and quieting
options through the sandboxer sample.

Unlink and queue lifetime
========================

A queue's lifetime is independent of its creator. While its IPC
namespace exists, the queue remains until its name is unlinked and all
open descriptors are closed.

The scope leaves mq_unlink() unrestricted, subject to other access
controls, so that an application can clean up stale queues from previous
runs.

A process permitted to unlink and recreate a queue can replace its name,
including from another Landlock domain. Existing descriptors continue
to refer to the original queue, while subsequent opens refer to the
replacement and undergo its scope check. The scope therefore does not
guarantee the identity or availability of queues by name. These
limitations are documented.

Changes since v1
================

- Separate MAKE_REG enforcement from the proposed queue scope.
- Store the creator-domain reference in landlock_object rather than
  directly in landlock_inode_security.
- Add an inode_create hook to enforce MAKE_REG before queue creation.
- Expand documentation of filesystem permissions, scoping, descriptor
  reuse, and unlink/name-replacement limitations.
- Extend selftest coverage, including audit logging and quieting,
  path-based opens, inherited descriptors, and descriptor passing.
- Enable CONFIG_POSIX_MQUEUE=y in the Landlock selftest configuration.

Oxana Kharitonova (4):
  ipc: Move MQUEUE_MAGIC to a shared header
  Landlock: Enforce MAKE_REG for POSIX message queue creation
  Landlock: Add POSIX message queue scoping
  samples/landlock: Add POSIX message queue scoping to sandboxer

 Documentation/trace/events-landlock.rst       |   1 +
 Documentation/userspace-api/landlock.rst      |  80 +-
 include/linux/ipc_namespace.h                 |   2 +
 include/linux/landlock.h                      |   3 +-
 include/trace/events/landlock.h               |  46 +
 include/uapi/linux/landlock.h                 |   5 +
 ipc/mqueue.c                                  |   1 -
 samples/landlock/sandboxer.c                  |  26 +-
 security/landlock/audit.c                     |   5 +
 security/landlock/fs.c                        | 133 ++-
 security/landlock/fs.h                        |  12 +
 security/landlock/limits.h                    |   2 +-
 security/landlock/log.c                       |   4 +
 security/landlock/log.h                       |   1 +
 security/landlock/object.c                    |   2 +
 security/landlock/object.h                    |   7 +
 security/landlock/syscalls.c                  |   2 +-
 security/landlock/task.c                      |  66 ++
 security/landlock/task.h                      |   4 +
 security/landlock/trace.c                     |   7 +
 tools/testing/selftests/landlock/Makefile     |   4 +-
 tools/testing/selftests/landlock/audit_test.c | 114 +++
 tools/testing/selftests/landlock/base_test.c  |  40 +-
 tools/testing/selftests/landlock/config       |   1 +
 .../selftests/landlock/posix_mqueue_test.c    | 233 +++++
 .../landlock/scoped_posix_msg_queue_test.c    | 846 ++++++++++++++++++
 .../testing/selftests/landlock/scoped_test.c  |   2 +-
 27 files changed, 1634 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/landlock/posix_mqueue_test.c
 create mode 100644 tools/testing/selftests/landlock/scoped_posix_msg_queue_test.c

-- 
2.43.0


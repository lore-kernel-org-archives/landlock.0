Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9049830DD00
	for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 12:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723409; cv=none; b=NJvkZgytxt8sANAhiXqExAP5AA7v6TwSbPpDo7A2D1iBQKjbVfO5sAaVNmhYux4YmnexjmRyGqoFmrznqFtwwKWBe43oouGm1haduIOwGZdPL+n9HZejsZ906E1hMWcHfsroGHxM3/iClt5mrvxJqfAD1lOSpF3EluJkMNsXS9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723409; c=relaxed/simple;
	bh=JAKHu8YyBELteSv8ooj1Pp3j9g6YVHHeCe1BMryEs6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6WSn8mPd3tt46wNREYN1Fo1SqjiO/k/jAWh+M/52yiDUzaHOftZqmWe0LJka67uPG8NCmz1vqGhRqdtWPEtpMtjGVkXdH/lVkLphtNmWRrwKT+p0vAlMBNm5Uzy4G/gh1uLsw+8vEOO+ZJ0BD8PQVdta6fedJkuBwDMB3rI40Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=UTLr8qcG; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="UTLr8qcG"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15cd3fd760so1406181466b.2
        for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 05:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1784723406; x=1785328206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbtWhBehxkVPlnfWLUPZXxKYcYCTq6s9Hilnw7lNtrM=;
        b=UTLr8qcGzYmRFvbSfbYH8lGXonT7JStnXoCkceklTSNMF6RBJsAudnaf9N5gItk9sX
         p71BttXgf5m8vVaoE6FbOYp/wuCeYPh54g0WhMx3cydzhjTiLquthR9mTNLFMqoyNp9G
         ID3/W4FItZnZMrSruYCMBguYOvjsO5IoI50uUS6nJuKC2jUcSwPa7ShWTZt7vbc0mxkc
         pnHXQu05qclSLdKawHLrENc4TSfdPUVWrZ/Ei2gJuC6FZz7wEqW1H0j9KuB3om6Dv3ov
         bpMWojmlIgIkCmZ1YdGimvIOGDKpux0ZbmTQjd8eD5dgp4Iyc4hNqRmLnoF7AzY39jLA
         ivYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723406; x=1785328206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zbtWhBehxkVPlnfWLUPZXxKYcYCTq6s9Hilnw7lNtrM=;
        b=SLWCmh+t1TtJJNQ/Uq0LXYhvhsG+q6xhsYhjRhVGEB2DNaFIwy1DjhecUXeWtGxaOJ
         rUNq2qCKnFCXZgAaIwV5IZgIjfazj/EaE7QpPzTlBRxICe599a28RqBmzORQDDYiuqkY
         gkzUgT4HvMxWvhGD0e+z6kRvT1TLefkFyzFPdvZjz18wKsuBKvycNJ4Z6vsqN7x/abcK
         WbuWz6fM0BLD4yR8hpFRZxbAwTQ4fTNSvA8EdQH1OjLS6cLLXCkKdGVzcOni4m3wO+CE
         h+HJYckZESHOdDpmE2zZFIgyjveyJIBQlY44Z96moZBWAaJO7nBUIXORasXomLtkGrU6
         trtg==
X-Forwarded-Encrypted: i=1; AHgh+RrDn+hhB9LwXITkP1t+1bEJtawqNvmMKewmxa8Cgww+zspgrYqIbcP21PLHzr0XraeAlnNE+Fa8CQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlbvYOnxiXxfEkgoWQBR3/KnlQeN/cctn/Jt6l+nb0YvXfMgd/
	YKBT8R3vMldCB+I8VwzXUzOZUl100a8VM5vLJkYaUPJQSWvtM+Sp0xmVp9XHQmz/YRk=
X-Gm-Gg: AR+sD10Bxu4CjZXbtB+u26DmdNG194S2pwbd1PhWCiOnpBqffRdVUNAKThsPy2f5+t4
	JjjQGx3MtEs9MtM67IS/VZ6PU5bRD11MaOypmhFFRlkWlmOVQ1xuyPlAXIhGyvmmU8qmTeKH9Xo
	le9fh28Xex7crk7P5gMFhhYucRVLpVyinsS8st6Q7zi1FzlA20st7ziKs8mW3o5wdz7+Eg8NVC3
	VP8KcG6J+cVC/1UEPZYrgmiGdZ6F3VV1CnNXRkFqs4b54g7PEh6Xu34KJnMfcDLyGjkKKkn3MPJ
	oWz90hqw3Uy7Ci4Q+9dEeOVht8dDKdQUJ7c5fc+ZdqTq8oZ5u5nNkMMW8IEqYe9N/NQWHG7UQ5D
	6NJBoWJ0hgilbKiSbe0Od3fV5fP1o/HbJP0y3JwrqUAb1EZJZJOOeqTZFWyr/6es=
X-Received: by 2002:a17:907:980a:b0:c16:2f5d:6153 with SMTP id a640c23a62f3a-c16b46d2c3dmr987958966b.20.1784723405581;
        Wed, 22 Jul 2026 05:30:05 -0700 (PDT)
Received: from DW927H4LGF ([2a09:bac6:37e6:1e5a::306:2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34f1b867sm835007a12.14.2026.07.22.05.30.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jul 2026 05:30:04 -0700 (PDT)
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
Subject: [PATCH 3/6] landlock: Bump ABI for LANDLOCK_SCOPE_POSIX_MSG_QUEUE
Date: Wed, 22 Jul 2026 13:29:39 +0100
Message-ID: <20260722122952.42149-4-oxana@cloudflare.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260722122952.42149-1-oxana@cloudflare.com>
References: <20260722122952.42149-1-oxana@cloudflare.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase the landlock ABI version so userspace can detect support for
LANDLOCK_SCOPE_POSIX_MSG_QUEUE.

Signed-off-by: Oxana Kharitonova <oxana@cloudflare.com>
---
 security/landlock/syscalls.c                 | 2 +-
 tools/testing/selftests/landlock/base_test.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/landlock/syscalls.c b/security/landlock/syscalls.c
index 36b02892c62f..84521a31bf75 100644
--- a/security/landlock/syscalls.c
+++ b/security/landlock/syscalls.c
@@ -169,7 +169,7 @@ static const struct file_operations ruleset_fops = {
  * If the change involves a fix that requires userspace awareness, also update
  * the errata documentation in Documentation/userspace-api/landlock.rst .
  */
-const int landlock_abi_version = 10;
+const int landlock_abi_version = 11;
 
 /**
  * sys_landlock_create_ruleset - Create a new ruleset
diff --git a/tools/testing/selftests/landlock/base_test.c b/tools/testing/selftests/landlock/base_test.c
index cbd3c1669951..b8b5fa1042ba 100644
--- a/tools/testing/selftests/landlock/base_test.c
+++ b/tools/testing/selftests/landlock/base_test.c
@@ -76,7 +76,7 @@ TEST(abi_version)
 	const struct landlock_ruleset_attr ruleset_attr = {
 		.handled_access_fs = LANDLOCK_ACCESS_FS_READ_FILE,
 	};
-	ASSERT_EQ(10, landlock_create_ruleset(NULL, 0,
+	ASSERT_EQ(11, landlock_create_ruleset(NULL, 0,
 					      LANDLOCK_CREATE_RULESET_VERSION));
 
 	ASSERT_EQ(-1, landlock_create_ruleset(&ruleset_attr, 0,
-- 
2.50.1 (Apple Git-155)


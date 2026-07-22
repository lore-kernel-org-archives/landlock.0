Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FEA284693
	for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723414; cv=none; b=E7DScQLUZs5C5KiI3BR0Iot3Ex0WbQLkCf0ZBCQjezJssO8pH8FCE2tJ9wKFIeWUBgNGTBceZaPYH/bZZWpIGM3Ah7th0OXatYkfYE47MEl4g7QFKdEY55K8muvhDdSYYmxvHF870Ta3WmiUzN/0oaYSie0VyBo+RRSHIvunYLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723414; c=relaxed/simple;
	bh=BH9Q/nb1SHbVfJKmzTYY61p3CrQmGn4nLgNrkig4qI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyp/C2RbtFwYDf3OsjSmESqCD6PagrjgWf3/CAXL/A0fW07e1+dUcbkiLLqshbtbeSpc37o0hvSJvAw6/ZMyjxUigPVBb8sAHc2GyWYajnEGziqQazrwjAtJYiMftzWfTZ9vr2mdgDM1MQ7M9F0OWLJau7JXUtUsZx0Irwtd64M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=QEIKkpXt; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="QEIKkpXt"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso6562130a12.1
        for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1784723409; x=1785328209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10OEZDPHkj5hzFYDRyfra44GxaMnslQ2JStk6ORVQZA=;
        b=QEIKkpXt2pgZLTQA1XCsd5YFXW4l9RVDlgJjAhAhxJyeljsw4XSn682czN/qE7oOt4
         bSJmMaHWl6IYW8T6fT2CyYBlnJzfBTyu6UyyqLixjn7X7kMlis5uEDsdJAmHCVYOdYWR
         ogen2DO66U7I+o21rUj7gAW5oSTMUThDSPAgRQAs+PlzHGVDiHKHbgkUCkXbqk0ZxzJa
         Aqpo5OoFm/am6kbw0/WfhifPYBy9jEUgF3v0FUmbkFatyuRB08yLwsJ5EgWdPR6gyctF
         5CcadpLrX+pNwfv6emGHdpFr8A9VkQS5U8yRKejSWwoxLgW2QrTpKA0mFTohV57RD/FM
         loLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723409; x=1785328209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=10OEZDPHkj5hzFYDRyfra44GxaMnslQ2JStk6ORVQZA=;
        b=j7INFH60fKLYZ0cCfhpiv40c39GCAF6rGUL8T58dOQp/u67qKGb3yCYaakg9yiHaBD
         wodS4sCKN1Nki7JLhNXUT9LQvfYmWLzcVYxfmNobi+KYhr1schdtBf3hZ9PSFsnEBd8/
         LXuvpJGABaIXmZV8z0tJ25wNq84vVshPnlt3J5zRfiVLq5mrqnkYO04DRahXITwp96qr
         ljgSmvZp/e+nCHkMg+Pcp93Ri5m5OeLj63awWf2oJ1Fpm+BaR8prrWUcCxSGxQyNskp/
         O17BWjj4McvbKkS61SUY4gbtxcpK1Tz7R2FCFzc+DXfJgh7N6ciTg7I9YxgQYcZL6q0h
         +v5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqDZxiSgl5LmGjmg1qXhV1QRznnxey8FesVw5yBLM8t2VEwJ+Y/sGLHz0OT7KuzYQtoxnto57qrxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVVVPcHYEyE1DQhly7ce4iCR0RYpxhfZztSd2FcniIycRwuhso
	Nb6019jCvDXIYcsSLthfvxANSEYu39uFkYEbNJSE814/y4rLoWtlkmt9s+UHn0HoPAw=
X-Gm-Gg: AR+sD11LgcKU1H0tqzPUl8lWIp3FQtc/bWOM6/fgrZR36qyYL6sTjlsrsXhlbLLZ5NE
	5Iwp8NKWPMeJLFlWvEEqiy5H65+y/nuOWYyHG7V9fTJvSVxxA6r+zkZM/Y/+qfdSV0egUIe63fh
	iJXb0V4S9naZp4ccpuiHqSNiqJAib3NY01XUG7iCgcr2qFYNpJL2B0BctzM++e+0VGIBePEEhTP
	7QXJztInpXPD9uI/AsgKoCfI69Vs8acHJcXlPrxPqowIPO3C1q3cfXDRNyb/LdYVRxqo8gOpYjm
	JjqErI1bEfzI2WshrguTPRiRArkMHMz6nQ3xuKroQ33NVTJh8b5jNc7tvtfUIuxu0cAQwNofFee
	+m9WE8DZcu9Y2whir+ge5XSTUQGJK7rXETl5tKficY6d/b+eAyqr2I9UajP+dVpA=
X-Received: by 2002:a05:6402:5054:b0:69a:2ee6:4c95 with SMTP id 4fb4d7f45d1cf-69e65163b60mr7350547a12.0.1784723409282;
        Wed, 22 Jul 2026 05:30:09 -0700 (PDT)
Received: from DW927H4LGF ([2a09:bac6:37e6:1e5a::306:2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34f1b867sm835007a12.14.2026.07.22.05.30.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jul 2026 05:30:08 -0700 (PDT)
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
Subject: [PATCH 5/6] samples/landlock: Support POSIX message queue scoping
Date: Wed, 22 Jul 2026 13:29:41 +0100
Message-ID: <20260722122952.42149-6-oxana@cloudflare.com>
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

Teach the sandboxer sample to request LANDLOCK_SCOPE_POSIX_MSG_QUEUE
through LL_SCOPED.

Add the "q" scope selector for POSIX message queues and document it in
the sample help text. Also allow POSIX message queue denials to be
quieted with "posix_msg_queue" through LL_QUIET_ACCESS.

Signed-off-by: Oxana Kharitonova <oxana@cloudflare.com>
---
 samples/landlock/sandboxer.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/samples/landlock/sandboxer.c b/samples/landlock/sandboxer.c
index ac71019e6212..59024ca53398 100644
--- a/samples/landlock/sandboxer.c
+++ b/samples/landlock/sandboxer.c
@@ -240,10 +240,12 @@ static bool check_ruleset_scope(const char *const env_var,
 	bool error = false;
 	bool abstract_scoping = false;
 	bool signal_scoping = false;
+	bool posix_mqueue_scoping = false;
 
 	/* Scoping is not supported by Landlock ABI */
 	if (!(ruleset_attr->scoped &
-	      (LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET | LANDLOCK_SCOPE_SIGNAL)))
+	      (LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET | LANDLOCK_SCOPE_SIGNAL |
+	       LANDLOCK_SCOPE_POSIX_MSG_QUEUE)))
 		goto out_unset;
 
 	env_type_scope = getenv(env_var);
@@ -260,6 +262,9 @@ static bool check_ruleset_scope(const char *const env_var,
 		} else if (strcmp("s", ipc_scoping_name) == 0 &&
 			   !signal_scoping) {
 			signal_scoping = true;
+		} else if (strcmp("q", ipc_scoping_name) == 0 &&
+			   !posix_mqueue_scoping) {
+			posix_mqueue_scoping = true;
 		} else {
 			fprintf(stderr, "Unknown or duplicate scope \"%s\"\n",
 				ipc_scoping_name);
@@ -276,6 +281,8 @@ static bool check_ruleset_scope(const char *const env_var,
 		ruleset_attr->scoped &= ~LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET;
 	if (!signal_scoping)
 		ruleset_attr->scoped &= ~LANDLOCK_SCOPE_SIGNAL;
+	if (!posix_mqueue_scoping)
+		ruleset_attr->scoped &= ~LANDLOCK_SCOPE_POSIX_MSG_QUEUE;
 
 	unsetenv(env_var);
 	return error;
@@ -354,6 +361,9 @@ static int add_quiet_access(const char *const env_var,
 				LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET;
 		else if (strcmp(str_access, "signal") == 0)
 			ruleset_attr->quiet_scoped |= LANDLOCK_SCOPE_SIGNAL;
+		else if (strcmp(str_access, "posix_msg_queue") == 0)
+			ruleset_attr->quiet_scoped |=
+				LANDLOCK_SCOPE_POSIX_MSG_QUEUE;
 		else {
 			fprintf(stderr, "Unknown quiet access \"%s\"\n",
 				str_access);
@@ -400,6 +410,7 @@ static const char help[] =
 	"* " ENV_SCOPED_NAME ": actions denied on the outside of the landlock domain\n"
 	"  - \"a\" to restrict opening abstract unix sockets\n"
 	"  - \"s\" to restrict sending signals\n"
+	"  - \"q\" to restrict opening POSIX message queues\n"
 	"\n"
 	"A sandboxer should not log denied access requests to avoid spamming logs, "
 	"but to test audit we can set " ENV_FORCE_LOG_NAME "=1\n"
@@ -416,6 +427,7 @@ static const char help[] =
 	"  - \"udp_connect\" to quiet udp connect / send denials\n"
 	"  - \"abstract_unix_socket\" to quiet abstract unix socket denials\n"
 	"  - \"signal\" to quiet signal denials\n"
+	"  - \"posix_msg_queue\" to quiet POSIX message queue denials\n"
 	"\n"
 	"Example:\n"
 	ENV_FS_RO_NAME "=\"${PATH}:/lib:/usr:/proc:/etc:/dev/urandom\" "
@@ -423,7 +435,7 @@ static const char help[] =
 	ENV_TCP_BIND_NAME "=\"9418\" "
 	ENV_TCP_CONNECT_NAME "=\"80:443\" "
 	ENV_UDP_CONNECT_SEND_NAME "=\"53\" "
-	ENV_SCOPED_NAME "=\"a:s\" "
+	ENV_SCOPED_NAME "=\"a:s:q\" "
 	"%1$s bash -i\n"
 	"\n"
 	"This sandboxer can use Landlock features up to ABI version "
-- 
2.50.1 (Apple Git-155)


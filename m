Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630858;
	b=CsCImSVRoH6qDTareSIAnozPJwh0eeYjf+El5PS1QOpFmifDyRGKtWdXjy6uLlWTuI5v
	 ognuY5AuZY0nVr0ppxj98MrF6VTx0UoytBiJX4eyzjQR55H8QUn6Jiq4RiM2qqouxhPIk
	 rZXc0ywUs+XTOr4q75doWcUqG7Mr2QjApDpsPgbye/PF6n/n52ENdpvd8n8ZobRdO+Yl6
	 HF5gyUN9Mr/Y79Oj7jsJ1VKasfmu4PNG3VaSjn6INVseaGl0GgCjRwWNELvCxxCClivbd
	 axjLZCuvE8dKvUB5zYOkJobQllp4Esxvs07Vtfz2NU9Z7xI8H784rf1bQBj12mlsxaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=897VUR1Y0AyL3m5LEwhgtHzM2U8GbpmCKC8JwdXi/Bg=;
	b=LHkBee1wwcKIMQ+Fnl7307qYnd6N4XWR+XR2kO/PfA4zF/NQVkAuKPbyYO52br15VOcK
	 4vJY+Q8lnGDciik3y9LWOs+utPFXG6tQtw0YqKw+tVN6mu3TDhsY5JcUYoZbq+otMOwW4
	 m5eYYxSfl3dAkkB8F64jfcDyRcmKRTrMtkV28zojjlSJcI4e0rTA3r8k72YT+GnOf6Equ
	 llbnSRBK2eJHOGmXoAhJJb4kyJGwP4as0yh+3JlpceSiOKeSznUtlUtC3l9d7i3oSS/kJ
	 BSckzOY9zERw3eXr/4FTa92PNrFw/mGboyPAs96Z9ClbxNdK5WPuki27CjqdaB+q/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTJerXCy;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB06083635
	for <landlock@lists.linux.dev>; Mon,  2 Nov 2026 14:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1FB06083635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTJerXCy
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so23823795e9.2
        for <landlock@lists.linux.dev>; Mon, 02 Nov 2026 06:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630856; x=1794235656; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=897VUR1Y0AyL3m5LEwhgtHzM2U8GbpmCKC8JwdXi/Bg=;
        b=OTJerXCyEUvnLOMBoixi2gjzEKIFfyc0M73xGjtj4UQgMrM8vdcl652TrEg8lI1UYo
         ZMQSyuq8A32+VtjxdHgbj2URPCxCc+4vUaxDd2FzNNcbG0CTTexYnPsMylQPN84x9Vrh
         K24njGwUoOtV107/kdbtBNy2LzqurhBGMBVykDcb3ANUSo2Mopf7uW12dPk6o3OrsTJ3
         ZhTJNURT/JtHFResvIcfi3KkIPyTMwSOjWpPurUlLpQGOtqP9yNLsKzbhpeM/WLiaTJP
         NsTYGYmHkOFKqhRBd2uJXEFoexSqh9niJ7EkI2cdwnuYUGZ5+orixvH7wTuAVJYufkJx
         zxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630856; x=1794235656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=897VUR1Y0AyL3m5LEwhgtHzM2U8GbpmCKC8JwdXi/Bg=;
        b=KSL3McuoRFlqK94kwUZyeGt3MaKalKBYPWQXeQ6Lguv+Mde+y3Y9qSWS+6dnJ4HFje
         SpZbEhmFCa50flORlopgkps7+1/OYTSA3m7XpCfH7iJ0FjW8g412lwIH/wBH7LctgI/t
         JcP53og/iJle4nhtKOgF+FloBuG8MHlhBjVqWspMEz+7uHC1Kwn9wB6EgE45kKvPSqv9
         iGgiE8e2u5bCcLNMzzpvQyJeUnSafLtyXW7kQWY8MjfFho8R97vy42oYCw3mEwIw8Dli
         7y1uL6ypmPyneAfr6+uTDMzql2r6w3eTuCBkEuYpLofmnrZBMkotDbFrJRgWHIdlJknb
         /LlA==
X-Forwarded-Encrypted: i=1; AKwUvBz8bxKtwOv6VzfBU/SFiSXXF8keLtyKzmlw4dX83zOURMv4+cmApl7WoSMMWhD8P7camrwKALe4FA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ+2WDw4/17LQBshBZ8/v9hqWZjOfniHFplZ7Whc7dMGj9aB2Gk
	C8Llix3fI3N3yAOp3M2gTxZ6yQjnWxV2mDZgJbnn3VUmiGrdBYtXyG/C
X-Gm-Gg: AYBFou0kG+F1/Vo88fx12RKZRuQ0BuEoQPw+oyf2TBRq9iIQ56yrLwC0qQcGPrBScvk
	td6bHPnauKc6BdyGGD1pW00BdyKE+wgaqnTXNvGAwkFprmbwK/neoPYEDKvuhaxJZgRMcoU74fe
	OAQIAe+lCLNAp7sGr77O0F9uQeZdTVTX7jJIU/GhQgjId5zSYgo1Z4YqJw3uMZD1Fw5K1RGsBvf
	jZLNabQ955RlGvr22M44aTNSAToo8PSOxH9GO6BdnHtYeTpYpqLCKaC4cG/QPlr5R0jmmsMDV3L
	LzmMWZK/ACtu8zQD8+P6W3w12y0kEGOxIGtDs/VcW9CDt8vsf/5MkIO1i/zkaH0pThiejDjV0XR
	/OAWsHa3JCPd+JAvVlGV8EvIR1ofY0eRW4SlRXlCoQaYIqhjv2lIkN9lecyDLnFrXjV11kPuQ8x
	KpAeod+b35R7Qg1pvhLncMGPy1tjC531Fkm53qYqWuXXf4qSgF09v6a80CXixxyLy4fMMj53D8a
	czVcLXItF6a/MRbAZq2iPsriuS2AJ9nAE1kz/OZzWYV/itWM4xt2TKJ8xDiWN0veOxm4SqWxnVq
	m5ado30FKI2/zNnxwGA7rmJ0GBmpkKC8RWZfqtri
X-Received: by 2002:a05:600c:6087:b0:4a1:fe26:24f0 with SMTP id 5b1f17b1804b1-4ac1765ce52mr228070005e9.20.1793630856168;
        Mon, 02 Nov 2026 06:47:36 -0800 (PST)
Received: from penguin-ubuntu.lan ([2a00:23c6:6410:5d01:8464:9a6f:2d42:8827])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7700c3bsm254289965e9.0.2026.11.02.06.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:47:35 -0800 (PST)
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
Subject: [PATCH v2 4/4] samples/landlock: Add POSIX message queue scoping to sandboxer
Date: Mon,  2 Nov 2026 14:46:00 +0000
Message-ID: <20261102144708.920232-5-webprosto@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102144708.920232-1-webprosto@gmail.com>
References: <20261102144708.920232-1-webprosto@gmail.com>
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Post: <mailto:landlock@lists.linux.dev>
List-Help: <mailto:landlock+help@lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
List-Owner: <mailto:landlock+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "q" to LL_SCOPED to enable LANDLOCK_SCOPE_POSIX_MSG_QUEUE
and "posix_msg_queue" to LL_QUIET_ACCESS to quiet related audit
denials. Update the supported ABI version to 13 and disable the
new scope when running on older kernels.

For example, on a kernel supporting Landlock ABI 13:

  LL_FS_RO="/" LL_FS_RW="" LL_SCOPED="q" \
    ./samples/landlock/sandboxer /bin/sh

The resulting shell and its children cannot open POSIX message
queues created outside their Landlock domain. They can create
queues and open queues created within that domain.

Signed-off-by: Oxana Kharitonova <webprosto@gmail.com>
---
 samples/landlock/sandboxer.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/samples/landlock/sandboxer.c b/samples/landlock/sandboxer.c
index 1362f08ff14b..e8e05c4d6f63 100644
--- a/samples/landlock/sandboxer.c
+++ b/samples/landlock/sandboxer.c
@@ -441,10 +441,12 @@ static bool check_ruleset_scope(const char *const env_var,
 	bool error = false;
 	bool abstract_scoping = false;
 	bool signal_scoping = false;
+	bool posix_msg_queue_scoping = false;
 
 	/* Scoping is not supported by Landlock ABI */
 	if (!(ruleset_attr->scoped &
-	      (LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET | LANDLOCK_SCOPE_SIGNAL)))
+	      (LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET | LANDLOCK_SCOPE_SIGNAL |
+	       LANDLOCK_SCOPE_POSIX_MSG_QUEUE)))
 		goto out_unset;
 
 	env_type_scope = getenv(env_var);
@@ -461,6 +463,9 @@ static bool check_ruleset_scope(const char *const env_var,
 		} else if (strcmp("s", ipc_scoping_name) == 0 &&
 			   !signal_scoping) {
 			signal_scoping = true;
+		} else if (strcmp("q", ipc_scoping_name) == 0 &&
+			   !posix_msg_queue_scoping) {
+			posix_msg_queue_scoping = true;
 		} else {
 			fprintf(stderr, "Unknown or duplicate scope \"%s\"\n",
 				ipc_scoping_name);
@@ -477,6 +482,8 @@ static bool check_ruleset_scope(const char *const env_var,
 		ruleset_attr->scoped &= ~LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET;
 	if (!signal_scoping)
 		ruleset_attr->scoped &= ~LANDLOCK_SCOPE_SIGNAL;
+	if (!posix_msg_queue_scoping)
+		ruleset_attr->scoped &= ~LANDLOCK_SCOPE_POSIX_MSG_QUEUE;
 
 	unsetenv(env_var);
 	return error;
@@ -555,6 +562,9 @@ static int add_quiet_access(const char *const env_var,
 				LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET;
 		else if (strcmp(str_access, "signal") == 0)
 			ruleset_attr->quiet_scoped |= LANDLOCK_SCOPE_SIGNAL;
+		else if (strcmp(str_access, "posix_msg_queue") == 0)
+			ruleset_attr->quiet_scoped |=
+				LANDLOCK_SCOPE_POSIX_MSG_QUEUE;
 		else {
 			fprintf(stderr, "Unknown quiet access \"%s\"\n",
 				str_access);
@@ -570,7 +580,7 @@ static int add_quiet_access(const char *const env_var,
 	return 0;
 }
 
-#define LANDLOCK_ABI_LAST 12
+#define LANDLOCK_ABI_LAST 13
 
 #define XSTR(s) #s
 #define STR(s) XSTR(s)
@@ -618,6 +628,7 @@ static const char help[] =
 	"* " ENV_SCOPED_NAME ": actions denied on the outside of the landlock domain\n"
 	"  - \"a\" to restrict opening abstract unix sockets\n"
 	"  - \"s\" to restrict sending signals\n"
+	"  - \"q\" to restrict opening POSIX message queues\n"
 	"\n"
 	"A sandboxer should not log denied access requests to avoid spamming logs, "
 	"but to test audit we can set " ENV_FORCE_LOG_NAME "=1\n"
@@ -634,6 +645,7 @@ static const char help[] =
 	"  - \"udp_connect\" to quiet udp connect / send denials\n"
 	"  - \"abstract_unix_socket\" to quiet abstract unix socket denials\n"
 	"  - \"signal\" to quiet signal denials\n"
+	"  - \"posix_msg_queue\" to quiet POSIX message queue denials\n"
 	"\n"
 	"Example:\n"
 	ENV_FS_RO_NAME "=\"${PATH}:/lib:/usr:/proc:/etc:/dev/urandom\" "
@@ -643,7 +655,7 @@ static const char help[] =
 	ENV_UDP_CONNECT_SEND_NAME "=\"53\" "
 	ENV_NS_NAME "=\"user:uts:net\" "
 	ENV_CAP_NAME "=\"" CAP_VALUE_EXAMPLE "\" "
-	ENV_SCOPED_NAME "=\"a:s\" "
+	ENV_SCOPED_NAME "=\"a:s:q\" "
 	"%1$s bash -i\n"
 	"\n"
 	"This sandboxer can use Landlock features up to ABI version "
@@ -667,7 +679,8 @@ int main(const int argc, char *const argv[], char *const *const envp)
 				      LANDLOCK_ACCESS_NET_BIND_UDP |
 				      LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP,
 		.scoped = LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET |
-			  LANDLOCK_SCOPE_SIGNAL,
+			  LANDLOCK_SCOPE_SIGNAL |
+			  LANDLOCK_SCOPE_POSIX_MSG_QUEUE,
 		.quiet_access_fs = 0,
 		.quiet_access_net = 0,
 		.quiet_scoped = 0,
@@ -780,6 +793,11 @@ int main(const int argc, char *const argv[], char *const *const envp)
 		ruleset_attr.handled_permissions &=
 			~(LANDLOCK_PERMISSION_NAMESPACE_USE |
 			  LANDLOCK_PERMISSION_CAPABILITY_USE);
+		__attribute__((fallthrough));
+	case 12:
+		/* Removes POSIX message queue scoping for ABI < 13 */
+		ruleset_attr.scoped &= ~LANDLOCK_SCOPE_POSIX_MSG_QUEUE;
+
 		/* Must be printed for any ABI < LANDLOCK_ABI_LAST. */
 		fprintf(stderr,
 			"Hint: You should update the running kernel "
-- 
2.43.0


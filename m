Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A10371895
	for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 12:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723415; cv=none; b=b9aBagNM6HpLI9XHpTDUr00cKvX0T+2uvViB+cCkaWalHHgIiI+64CMD3A+YObVFbsEZL+RCWyLGkdatsyxIxaSHeG0HsEhrForF8y1JzCpl7diX1mmjUfEIcrGWMK/gOuIKyTYevdSALN4y0rZSut5i8D0vwaV7A3a9NOM9P5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723415; c=relaxed/simple;
	bh=XXP6So6EytIRNbavWUyVFlypJEjg8u4P/XJmPMsD3mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHyS03eJgEHr2HilL7NqVNrUqCJ6J4Kl8foJkUJQoxih1UyO69ieaoFLu3RjObGx3DH2s9Og05hmt6G+VOpTELkFD0p5iA/W5p7sE0lr4X5jLUoMD5fe6arnKelXVvsSQrnCqmzJlUs7O5GikpY5ld0Uau7USmo474hIAAEF2tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=JkGQSUSe; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="JkGQSUSe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso22872054a12.3
        for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 05:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1784723411; x=1785328211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P42HCFpkq11qC2COB01ikocfGvftDj76wdm0yvbU3UM=;
        b=JkGQSUSeGb9yrLpON2qtX2MTnhvXA3yh3OHAW3XirknUGfKr9fK0vlHOmR9DSLLNiR
         2KBzYKHGf/HRSUjqO/KasLvFf51iPPeJ9B468+61UAUB5QY0fTSAlgFTNfNMc1Z69bvv
         216oFzvZtrFTrtFhrwuMIZGCtTYW/6I3eiUX/ZQMoZCQA/92h4A6+A+dSXHHBjsbjj00
         12rkDafiWM9BmM7kipKzvFyo+oy/zgIt0Y3LomY89oX4nKYySDtLX5K8OnTMK+scCOUX
         u8EF4/Ph+b+KeWWRBvtrK5a7KaCIZPK41OM9pXv4LrdaHM4QPhiy30z0eSxXwB6SuFhX
         8ScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723411; x=1785328211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P42HCFpkq11qC2COB01ikocfGvftDj76wdm0yvbU3UM=;
        b=UQoJHeWOJPyovouXtLFBUfexZfgeglQo2n856X/57MMWFS469XGkhHC3SHcJXEJqvx
         LnrBUrvEwFOcJxpPgr5K/I4Cb1knmQ1hnd957d0VZArV7khxB82CcaydCEj09pl3/tWd
         1FQbliXQfkKOzV1EVZVp7LSn5qfzRsVsBQc0NqIS0TOq0kBNBZxa+abj1lzhaCrwqkf2
         w3StS1Dz4b7pdo3VKEpa1zIXtRCudwsDVoSB20kEpAvFoSyrW5K0W6tB6xr/RFKeGDUY
         NaYaOfKWHTKhkJCamdPPhsX8eFcDAuP20/+e7FGwIvCxkQko2ALuD+/s3K5FK3g+Q4r7
         Y/Bw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3Tsn3ctAWwTg7U5RKoyMSLPIFwTy/YKRcLDrT0E4FnGwxboCt0uZVgEq/Zc/+0k6c25+/s6ugFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDaeQ6VtIQ/tWb/xeenLP4wVZz5aHaUMSkunUMGdzkhRFs5ehS
	FP5pLV/Q3oEXPB0qZ+nUZtknfIoHMmR4LfNDIOb6BQrBGNMc+i7iVBciAQEK+Et4oH8=
X-Gm-Gg: AR+sD13xGSMz0mxta/yY3fyuthJtd/2K7f6K9y9C7ufuGMOtKwLx61rvYqtPZRCQvAK
	X282eaYvRLgkSRGYjmczDxxfO9v6sWvWE+J4Hld+NZjyIbwdY5osrNRcfYw7wT3PVXRp2YJNZbu
	sG2iLX6mggGJXWos5xZBC5pM48Z4LkEEqdEe7t+nwh3EAdwBBPtGgH0nViK8OGlpmOyxz4cJ8GV
	vj6EVEVnWASwsrgpK8e4V8C99zeItkqVh9/+jlgJvHDreQ48an8NiL2SWjCNJVbiyP8qfERge71
	kt8Sm9O9ScEztN3rlJEQbws4t7g4mPMZ9Lu8yEGrAaUs+BztLUrtdopUXIz5vS6Na3GJJc/eA9a
	X40X6HoermWrF65lBeXXXt1m7u1uJEmlhNJCVv/CGBIH1NhqnjuLSDYgN8U0b1mANuBFSz3lT6w
	==
X-Received: by 2002:a05:6402:4402:b0:69c:9197:4413 with SMTP id 4fb4d7f45d1cf-69e652dfccemr9233139a12.36.1784723410993;
        Wed, 22 Jul 2026 05:30:10 -0700 (PDT)
Received: from DW927H4LGF ([2a09:bac6:37e6:1e5a::306:2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34f1b867sm835007a12.14.2026.07.22.05.30.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jul 2026 05:30:10 -0700 (PDT)
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
Subject: [PATCH 6/6] landlock: Document POSIX message queue scoping
Date: Wed, 22 Jul 2026 13:29:42 +0100
Message-ID: <20260722122952.42149-7-oxana@cloudflare.com>
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

Document LANDLOCK_SCOPE_POSIX_MSG_QUEUE in the userspace API and UAPI
kernel-doc.

Signed-off-by: Oxana Kharitonova <oxana@cloudflare.com>
---
 Documentation/admin-guide/LSM/landlock.rst |  6 ++++--
 Documentation/userspace-api/landlock.rst   | 11 ++++++++++-
 include/uapi/linux/landlock.h              |  6 +++++-
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/LSM/landlock.rst b/Documentation/admin-guide/LSM/landlock.rst
index 8eb85c9381ff..1ecb2017271b 100644
--- a/Documentation/admin-guide/LSM/landlock.rst
+++ b/Documentation/admin-guide/LSM/landlock.rst
@@ -60,9 +60,11 @@ AUDIT_LANDLOCK_ACCESS
         - net.bind_udp - UDP port binding was denied
         - net.connect_send_udp - UDP connection and send was denied
 
-    **scope.*** - IPC scoping restrictions (ABI 6+):
+    **scope.*** - IPC scoping restrictions:
         - scope.abstract_unix_socket - Abstract UNIX socket connection denied
-        - scope.signal - Signal sending denied
+          (ABI 6+)
+        - scope.signal - Signal sending denied (ABI 6+)
+        - scope.posix_msg_queue - POSIX message queue opening denied (ABI 11+)
 
     Multiple blockers can appear in a single event (comma-separated) when
     multiple access rights are missing. For example, creating a regular file
diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
index 5a63d4476c1c..c4fa84e6d281 100644
--- a/Documentation/userspace-api/landlock.rst
+++ b/Documentation/userspace-api/landlock.rst
@@ -86,7 +86,8 @@ to be explicit about the denied-by-default access rights.
             LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP,
         .scoped =
             LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET |
-            LANDLOCK_SCOPE_SIGNAL,
+            LANDLOCK_SCOPE_SIGNAL |
+            LANDLOCK_SCOPE_POSIX_MSG_QUEUE,
     };
 
 Because we may not know which kernel version an application will be executed
@@ -140,6 +141,10 @@ version, and only use the available subset of access rights:
         ruleset_attr.handled_access_net &=
             ~(LANDLOCK_ACCESS_NET_BIND_UDP |
               LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP);
+        __attribute__((fallthrough));
+    case 10:
+        /* Removes LANDLOCK_SCOPE_POSIX_MSG_QUEUE for ABI < 11 */
+        ruleset_attr.scoped &= ~LANDLOCK_SCOPE_POSIX_MSG_QUEUE;
     }
 
 This enables the creation of an inclusive ruleset that will contain our rules.
@@ -420,6 +425,10 @@ The operations which can be scoped are:
     A :manpage:`sendto(2)` on a socket which was previously connected will not
     be restricted.  This works for both datagram and stream sockets.
 
+``LANDLOCK_SCOPE_POSIX_MSG_QUEUE``
+    This limits opening POSIX message queues to queues created by a process in
+    the same or a nested Landlock domain.
+
 IPC scoping does not support exceptions via :manpage:`landlock_add_rule(2)`.
 If an operation is scoped within a domain, no rules can be added to allow access
 to resources or processes outside of the scope.
diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
index 96d0c3b423ac..21ba31ad4d4b 100644
--- a/include/uapi/linux/landlock.h
+++ b/include/uapi/linux/landlock.h
@@ -478,7 +478,9 @@ struct landlock_net_port_attr {
  * Setting a flag for a ruleset will isolate the Landlock domain to forbid
  * connections to resources outside the domain.
  *
- * This is supported since Landlock ABI version 6.
+ * This is supported since Landlock ABI version 6.  The
+ * %LANDLOCK_SCOPE_POSIX_MSG_QUEUE scope is supported since Landlock ABI version
+ * 11.
  *
  * Scopes:
  *
@@ -487,6 +489,8 @@ struct landlock_net_port_attr {
  *   related Landlock domain (e.g., a parent domain or a non-sandboxed process).
  * - %LANDLOCK_SCOPE_SIGNAL: Restrict a sandboxed process from sending a signal
  *   to another process outside the domain.
+ * - %LANDLOCK_SCOPE_POSIX_MSG_QUEUE: Restrict a sandboxed process from opening
+ *   a POSIX message queue created outside the domain.
  */
 /* clang-format off */
 #define LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET		(1ULL << 0)
-- 
2.50.1 (Apple Git-155)


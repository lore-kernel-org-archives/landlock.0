Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3A51A6806
	for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723404; cv=none; b=Zxq/OyAks7Ksse8BaR0Txe0CayRP7SbxZ+WkBMPHz9R9L+awqQJXwTwS7hzKQfl+pUA+vhvgmVybs1JVfFF/nBVsgoTKLOXwbHxAXMl9Jcgf655ZTBQVtQamTdLtIzdaXR8V9E94t1nFtSsazutpoJdRBtSqMG0OX99QlBTIiAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723404; c=relaxed/simple;
	bh=DcewT6Rnluc335PT2aXE0Wv72BuQ8CQjZHSyv3sDep0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uc5Z8TOnEf6m4q/VTRhiaJxKlCSt0nOYDjaAHPHzkcES8v0YzQtB934hlMRB/5im0REnBYcuYLNqi8RzMLXXlGx4ZClv2F32jgm/bpQVlH7XjWoPRjXD6KEteSWmI/MPGM5uTADys9fNrYeah3+EnPrdLu0dfRtA977MiAhKYwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=N6GrXgMH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="N6GrXgMH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c7ab350e9so16305892a12.0
        for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 05:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1784723401; x=1785328201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlYJYH6aD7SifBzyICcO1b3gqicM14HLRDoAfRS7bAs=;
        b=N6GrXgMHpImmmH4H9TkO0+HbwCbqWhVYeXayTbVLv6qfzaP+8RmM6MFlc5DU5lORkX
         4CbL7rlarxyZpCveO1I6NlKYBgTKpYilZ8Bke//CxDF1ygfeX68xMoICOCMaElOln2Zx
         z6DnHJ+5PjcCdaSWYANQcovE+oj7BdAcwrhgpt6WgRML5Hw7q6YloUsW8n5eVJE5qo9P
         Oux8OKiF38+wVDqHWBYvB0SIs8N0081gLIPNqI2aD+fi8DJDVIQCrA0up/Get+guvZXI
         OfFUkuXKFBvIgiNuDiWsUgNooVwK7wro6lzEbVhivq0O9sANkkRFIgN0HsU3wCSD+wfL
         tVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723401; x=1785328201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XlYJYH6aD7SifBzyICcO1b3gqicM14HLRDoAfRS7bAs=;
        b=sS1mVJFXQfdBfhibAus7nlr2/WWeN3OdpDJxHUE1SlnwHgPx4TjRGZ1hYn5os0zJ5H
         3/+TgTym6mH0PeMhAI0EHvYDyhST5bffJ5QZTyj3zfhP9nxKdJWZKM8+ecbTv5snm/4G
         J7jTXLI6u+0E4zAGpFh0mv8GfPU9hAOLb/rb6XN5ewNufq1z9s0rngqDtHpceu8xFInE
         1SDKJR2WwrBVWINNAwVptIju82TrAU8/tY7fpLSEnp4LdxKSqyDgjVg2qEEs5fBwS3Vn
         EakAJKeaatW2wtUkTMTjJRLuB364yQnJsE5SwxlXiYvJfnH+5CDDqHeI/q0nyLICIvRI
         MJFw==
X-Forwarded-Encrypted: i=1; AHgh+RoTsLmOvLiYHbHHelNpAtAvL2sbKTS+TUh8Fc/8pgl+/7G0bMEbJsd2kC8PHIlPxbLXiJhJzmRzRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzC4zeu00X6t/nSJR3izAq7sg4m17+2VfzigTbgJHVTb33QZ0jG
	B//lcI1AoEdNEnje/hQKxc58XXflxhbcXJY+xIqQO/SALxzuAFwdSwDbIRSNxV10Pp4=
X-Gm-Gg: AR+sD10KT/3dVePxdcgxWHTsz5b6w7Qno6P8t9hzqSm3BxEiiKye4UWTjj+0L1Sb3wd
	TDYEzNHQH5cSdb94nMC9iH0VwWwu/0YuVH0CGXpALHCygx6Iv+k3tKaf5ARD+dc2r1Vb6cXIRaB
	+o+oPd4hnexCDXOsuVCeRWiQ+6OLIB1ChPIpvifMrR00WB28zpa0K1RhRrEgf1mSOh7cdK/XcKl
	MYx0otG8GjAgX85rlwVJZjrjfzMEa89C7LgnhhI3ozaMIMoA990RMrIGh0kA5AgEhvvh3HnxVTk
	oAHtYFujVPREhSfpHz6BKef4Hzzqdfp/XHDxTiTqnyTMki9es8WP6JsbhhjB9/laMYAY1fKJsK+
	pvJtht9wTQ+ElFsx+z/mF4QaRZnrYFxHTbxOaU9ci199WWAqXAcmuq9QmNRHxWZ8=
X-Received: by 2002:a17:907:c012:b0:c11:ff2c:4f33 with SMTP id a640c23a62f3a-c16b47c7127mr818780066b.45.1784723400878;
        Wed, 22 Jul 2026 05:30:00 -0700 (PDT)
Received: from DW927H4LGF ([2a09:bac6:37e6:1e5a::306:2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34f1b867sm835007a12.14.2026.07.22.05.29.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jul 2026 05:29:59 -0700 (PDT)
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
Subject: [PATCH 1/6] ipc: Move mqueue fs magic to uapi magic header
Date: Wed, 22 Jul 2026 13:29:37 +0100
Message-ID: <20260722122952.42149-2-oxana@cloudflare.com>
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

Move MQUEUE_MAGIC from ipc/mqueue.c to include/uapi/linux/magic.h so
it can be shared by code outside of ipc/mqueue.c without duplicating
the constant.

Signed-off-by: Oxana Kharitonova <oxana@cloudflare.com>
---
 include/uapi/linux/magic.h | 2 ++
 ipc/mqueue.c               | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
index 4f2da935a76c..8e5d33bb1453 100644
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@ -78,6 +78,8 @@
 
 #define V9FS_MAGIC		0x01021997
 
+#define MQUEUE_MAGIC		0x19800202
+
 #define BDEVFS_MAGIC            0x62646576
 #define DAXFS_MAGIC             0x64646178
 #define BINFMTFS_MAGIC          0x42494e4d
diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 4798b375972b..9515597d45ce 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -22,6 +22,7 @@
 #include <linux/sysctl.h>
 #include <linux/poll.h>
 #include <linux/mqueue.h>
+#include <linux/magic.h>
 #include <linux/msg.h>
 #include <linux/skbuff.h>
 #include <linux/vmalloc.h>
@@ -47,7 +48,6 @@ struct mqueue_fs_context {
 	bool			 newns;	/* Set if newly created ipc namespace */
 };
 
-#define MQUEUE_MAGIC	0x19800202
 #define DIRENT_SIZE	20
 #define FILENT_SIZE	80
 
-- 
2.50.1 (Apple Git-155)


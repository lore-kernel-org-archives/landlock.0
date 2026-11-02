Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630855;
	b=jsQkpUw1K3g76MMmO4gU15eLLY6NoSYFg02EKTModCbIh9NnZCGHY90C6uVMgNFcA10m
	 Xxv0gbfDMFnicSkq6oHXx/CnSMNrGyGpd9KiOISNQLeY62nqDGRmbFjnDEtFgLneZFKxo
	 vsz4YT7hut3vFoBEkxenRwKlADuzo1SdPxTbQLTiiUz5xGy+lsn44P+ExjovSLNCI6bN4
	 sr1zAKrfYKJrL1Ytt6bLo9DtfwQAJtZOrN5wTNDMkNm2cZxPisz0u6YE2FwDdih/vh7oA
	 GxxJY4K5a7g3x6EXNknoUJ8MJvYlMLic6KLAuWOINJN5Th3oIvrgyPaDvAtALp9O7og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oT4Jbe6Fru25zhLhLEJ1T9RC7Hvj88zj5H1iBQsA278=;
	b=wNa6orek0jLxp9w3ta5Zqchf/BgMQMCVOWxoBV/+f27PcHSyfurkLN9KPglRyApiHIEE
	 oz2hYfMNlCYC8CnV94Q9ZTUHoKhhpHtDCtXaUbZ/K70NxfDrMumsKlbgAI/LTTqM6ZZf1
	 SyrNO9/f/VDWVbI9M2x0Y38Ks8Tz7x/64rL3N6fcjvzw5oUFpO01AwgXYwA8ZUWod4THe
	 6iEhoSy6HoytOnvM93QB4XsSTTtOA0hxrkt6mcUeBEym/mWPmU5YV5CMJZabE6kpaBYk8
	 3GZlDVaEKgYSYVR4+Q7IbaJvTEScd7QXf6JtPhgDhmo4fMMov+ZpdADfPMuSIYj3ixw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJ65kPf6;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48DA606A906
	for <landlock@lists.linux.dev>; Mon,  2 Nov 2026 14:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C48DA606A906
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lJ65kPf6
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso25772735e9.1
        for <landlock@lists.linux.dev>; Mon, 02 Nov 2026 06:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630853; x=1794235653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oT4Jbe6Fru25zhLhLEJ1T9RC7Hvj88zj5H1iBQsA278=;
        b=lJ65kPf6nR4Ywtuza9J8MmzO8lh/kiq7pbh5qtj3V5Z54rl7FlNhEbtCmtyOSEIoK7
         ITmrv7pE/5h+FvcfE0OUtuozyz4TMcoyw9eR/KJ6vMh9a/m/xrGi8Wa0EWz1753JnweJ
         ekCZmBc6hE3WjV3DebAkosR8Y6BFgol95QRADuqp4cb7FgbDzGwhl+J+CVRKxTDssdd3
         DwqcGR+DaS/8dnlPiIUHQUqdn/99TAItm70g9yedlPbaRq9pm+K+krH4HGe+8G2TGA8K
         JuiRX06+Mg0/GWul7Iy6Gze80F0NtdINMg6M+lKgLrn4FzPkB8zau7JiPTCEcFwFUz+2
         nuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630853; x=1794235653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oT4Jbe6Fru25zhLhLEJ1T9RC7Hvj88zj5H1iBQsA278=;
        b=nGPlzQt4p2v1E7vW5e/ug9XNa+9ZqpH9UXgYiryhJjQPRZG5pIR7hFaXcAzpQLAWOu
         z1MooTBBHR3DbTVOB2o2YMPo/cX8KeVftqZa8kvyTApS4uOMDAPWLPVuOdL1RgK3Arps
         SL+RB1dPcUH6ZDppiWyxOUcrnhOwufOTo9LQHd1Aslmp9g4LaqGqBMUyI/YhuyfTsahW
         udLpteHWm14M25E6FVt6SBRiSN7pGltm5oZ2GTjChurkP5kylZgAgiFMdSLd8FHwfWXn
         kTt+SSmdk3r1KU/XPRA5+aTGfNKj8kNuhfR9uW0rn5itKKjYnsbu/mXxCOFTdzhAczOg
         yMMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBC47oF+Z6K2HKzW6Og6ENAOqnkQOFe12hDaPeewcaBh/U9A7w9iwzPZhMmx/+sIaq8Taxu+9iJw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLRCmzlSybGxx+6IJouIR9E2GyQhPSSMDAOwdytD1OHqUJl7Xba
	HtSIrFDsTh4//5Lqi/CBiytprWiCX8r5SSteYSXjONNqBVl5ab/qnyQuOFhwlZx7
X-Gm-Gg: AYBFou0R45a89O7Wl+kmoRxTPf+BSiqe8XsknkuSuIf+ZNSRRP9EBvUyiG+/6nIpszl
	9LC2pwRCEt50jb39schSK3D45urk8a8NP5tyVULsGrcLn4TsN7cpRIKx6URnIuWxgRNwEIZnT9u
	cModEXBslgRLOU81PmrKDmYPjRdaLo12PL5VLKp08zOLrYwqJVEXttMFoZKqHnE9XlIPon3jy4i
	hXMjVCG4B06B+KHaY4tGP8FBoNbNjHX6ezhoN7yukN9MIUdz/gqkCtcNOOlqTBMeMSzjqpbznfZ
	5aq91ha2BOO6BG5wBcvZuSq2eTbZYVr7EKC+vQ5CmDOSxtwaKpNRskawYbLJ1cwr7y9LqZe2Tk8
	oOh/0+yn2VWPsobIJG1JaLs2f5pkdpEJeZfEnIzWB500EgGip7Bi9VLmuIOBEkdWQOij+chYPN0
	5bU6stIFq6urdWaUQ8t7tYLw38JktySiQkh0MS0qg7do7jBF+VhYzbYHRBKIh1f8WbJmRtMX1mU
	XhSuYo7DGQuUDCV4Z/kzQLW2vCsuYSHklgNFDcb+T8Go6ai4piFuZpgseIaPmAxP+WxLfd0lRfQ
	bpA0yQjinIFa3zZa1fgMgljmxyuBmCPho2X2hpoM
X-Received: by 2002:a05:600c:1387:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4ac1793fa6bmr245939905e9.13.1793630853040;
        Mon, 02 Nov 2026 06:47:33 -0800 (PST)
Received: from penguin-ubuntu.lan ([2a00:23c6:6410:5d01:8464:9a6f:2d42:8827])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7700c3bsm254289965e9.0.2026.11.02.06.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:47:32 -0800 (PST)
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
Subject: [PATCH v2 1/4] ipc: Move MQUEUE_MAGIC to a shared header
Date: Mon,  2 Nov 2026 14:45:57 +0000
Message-ID: <20261102144708.920232-2-webprosto@gmail.com>
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

Move MQUEUE_MAGIC from ipc/mqueue.c to include/linux/ipc_namespace.h so
it can be shared by code outside of ipc/mqueue.c without duplicating
the constant.

Signed-off-by: Oxana Kharitonova <webprosto@gmail.com>
---
 include/linux/ipc_namespace.h | 2 ++
 ipc/mqueue.c                  | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/ipc_namespace.h b/include/linux/ipc_namespace.h
index 12faca29bbb9..8a15ffe38e9a 100644
--- a/include/linux/ipc_namespace.h
+++ b/include/linux/ipc_namespace.h
@@ -15,6 +15,8 @@
 
 struct user_namespace;
 
+#define MQUEUE_MAGIC 0x19800202
+
 struct ipc_ids {
 	int in_use;
 	unsigned short seq;
diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index d1dd36a651b0..0f00e4efcb60 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -47,7 +47,6 @@ struct mqueue_fs_context {
 	bool			 newns;	/* Set if newly created ipc namespace */
 };
 
-#define MQUEUE_MAGIC	0x19800202
 #define DIRENT_SIZE	20
 #define FILENT_SIZE	80
 
-- 
2.43.0


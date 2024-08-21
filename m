Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58541D130A
	for <landlock@lists.linux.dev>; Wed, 21 Aug 2024 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724241877; cv=none; b=n4/0whSRVhJtFt3Ibwnr7Fi+/KPVIfuqaOW9BLy6F9rbU3XcmVQgFV45L1qWooNa7H8mAec6qFDSFnyNapaFv79IreWeTuy3ymVS1BQR+6tYiom4iq16WcOGauhTdS1/lTzAdwwMzMQ3Oeqg0keRLUr7R9RxvFv148uNFcjTzRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724241877; c=relaxed/simple;
	bh=/3jp7Ht4qZlX92CtNw1gA6NIY5nwHGhLVanTCUpaomY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJB3lOx8AKvubz+b2QywRcXcRe9IBIaz+dQkO1O1IlBoDcAbaNQ4LyVU0NcR+fGStwzd2AM9j9kL7Wmv3RRV2XWgAJ55x4nfvRPEPKtXEHvb53ppLyTUqwmNMI0UMzU3U3Z4SrI/U7Encc8lh9WlSBYl76lQqNVxyLW7M+VFbR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RoJvAILb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DRBacF1o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RoJvAILb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DRBacF1o; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RoJvAILb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DRBacF1o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RoJvAILb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DRBacF1o"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B04BC22294;
	Wed, 21 Aug 2024 12:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724241873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dA4BEeeUftVXSpbsiPUBjyLUg87e0LI4C2DVqSlbXvw=;
	b=RoJvAILbeK+lVEHx4Dg+nmiz5Ch9XhYIR0mlhdA0wpXi5MvTvK0SpQxAbn83ryMCwYqRkm
	8+J87Ni+s55WOADvcqPq5OfPcu7vjIOrfG+ZG6/voQ6DWDpSp1mwP8ZAtqdG8tJKzXzNb0
	ddIHyFyfSnY0L43iUy7pp0XJFnG2F8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724241873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dA4BEeeUftVXSpbsiPUBjyLUg87e0LI4C2DVqSlbXvw=;
	b=DRBacF1oXkFWRsedalrkshKDKCOAV1cLxSoNfoVZyxjMk3fhueOXvENq8uL0bx7uAgpTVU
	JEmZT+nPlOOv/cAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724241873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dA4BEeeUftVXSpbsiPUBjyLUg87e0LI4C2DVqSlbXvw=;
	b=RoJvAILbeK+lVEHx4Dg+nmiz5Ch9XhYIR0mlhdA0wpXi5MvTvK0SpQxAbn83ryMCwYqRkm
	8+J87Ni+s55WOADvcqPq5OfPcu7vjIOrfG+ZG6/voQ6DWDpSp1mwP8ZAtqdG8tJKzXzNb0
	ddIHyFyfSnY0L43iUy7pp0XJFnG2F8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724241873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dA4BEeeUftVXSpbsiPUBjyLUg87e0LI4C2DVqSlbXvw=;
	b=DRBacF1oXkFWRsedalrkshKDKCOAV1cLxSoNfoVZyxjMk3fhueOXvENq8uL0bx7uAgpTVU
	JEmZT+nPlOOv/cAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EE1113B18;
	Wed, 21 Aug 2024 12:04:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iOYCINHXxWaTBgAAD6G6ig
	(envelope-from <andrea.cervesato@suse.de>); Wed, 21 Aug 2024 12:04:33 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Wed, 21 Aug 2024 14:04:25 +0200
Subject: [PATCH v2 1/2] Add SAFE_KEYCTL macro
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240821-landlock_houdini-v2-1-b46211ca64f9@suse.com>
References: <20240821-landlock_houdini-v2-0-b46211ca64f9@suse.com>
In-Reply-To: <20240821-landlock_houdini-v2-0-b46211ca64f9@suse.com>
To: ltp@lists.linux.it
Cc: landlock@lists.linux.dev
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724241873; l=1476;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=53f36AT63ZuOEcz/vP635qWXG7aJiAN6532Itdv391Y=;
 b=JN9IXY7QPgjqo2zkLFRGhVY5a8+4FXKi6YWbpqQ2izotiIR9+lvJYwNtYlqwn2CufwqRG1EJX
 8smvjJaj3KQAUBXnDlObVHPvgAAdgMHjuRUZWk4LZP32KZyskHYTIbJ
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.cz:email]
X-Spam-Flag: NO
X-Spam-Level: 

From: Andrea Cervesato <andrea.cervesato@suse.com>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 include/lapi/keyctl.h | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/lapi/keyctl.h b/include/lapi/keyctl.h
index 3be782494..e11f62282 100644
--- a/include/lapi/keyctl.h
+++ b/include/lapi/keyctl.h
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Copyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
+ * Ccmdyright (c) 2017 Cyril Hrubis <chrubis@suse.cz>
  */
 
 #ifndef LAPI_KEYCTL_H__
@@ -179,4 +179,28 @@ static inline key_serial_t keyctl_join_session_keyring(const char *name) {
 # define KEY_OTH_ALL     0x0000003f
 #endif /* !KEY_POS_VIEW */
 
+static inline long safe_keyctl(const char *file, const int lineno,
+	int cmd, unsigned long arg2, unsigned long arg3,
+	unsigned long arg4, unsigned long arg5) 
+{
+	long rval;
+
+	rval = keyctl(cmd, arg2, arg3, arg4, arg5);
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"keyctl(%d, %lu, %lu, %lu, %lu)",
+			cmd, arg2, arg3, arg4, arg5);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid keyctl(%d, %lu, %lu, %lu, %lu) "
+			"return value %ld",
+			cmd, arg2, arg3, arg4, arg5, rval);
+	}
+
+	return rval;
+}
+#define SAFE_KEYCTL(cmd, arg2, arg3, arg4, arg5) \
+	safe_keyctl(__FILE__, __LINE__, \
+	     (cmd), (arg2), (arg3), (arg4), (arg5))
+
 #endif	/* LAPI_KEYCTL_H__ */

-- 
2.43.0


Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7099E3F9C5
	for <landlock@lists.linux.dev>; Wed, 21 Aug 2024 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724241877; cv=none; b=dJMwqGtyVKIFz6nHRRFrMUi6m4RUgv/kKxkVIRJBkQEwsKt7yrESXw5izT+Op7B2MRJRVCajmRnXs6qVmzsJksmcvU/MyQlSgjDz8Grg5Jvy00QQnp8mLfU8nbYkWrIxDxPK3v8AwAKfaVgXsbBgMRHOzfgy7maWwDWX0G9jIlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724241877; c=relaxed/simple;
	bh=G4sAW2IMgEBA54U81GyIUcqqlRJfUo5l5jbUjqBEZf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LhxOpOWiyQTrCbFwpPO4wVsOzRS+024e3qSol9ZQd/GpgGixZhUsZkLCiQ3D2/WAb/qhUyqJCl9kead38oow51uaODkLqETPCADyaJ9WFQyCY9FDr7cTlziozir+77qwsLF7VJKVyl+D8opvYlmhfKXC5T2mxwF1xIVm4BPBSQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tlj2X5L3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qw4L1B+c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tlj2X5L3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qw4L1B+c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tlj2X5L3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qw4L1B+c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tlj2X5L3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qw4L1B+c"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 805CD22290;
	Wed, 21 Aug 2024 12:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724241873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o5GkRdaCbK6AU7b5UPus/8FaTCN2tTjBesaxaeFDlD4=;
	b=Tlj2X5L3KvzcyRZaXN7ger7TSwnOMrsrFj+1GD2Q6YzB6/qRGsajdfSl/spxOVMgT5VUFF
	77QXCoJou11jlVqSBR6n4THBAZZv7f6nQoylK9MkEfogWszc/PjQ8bjj8DgLAhcSX4cCwf
	rfcvNIbcCzPd8oIb21Qauw82Vp2lxv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724241873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o5GkRdaCbK6AU7b5UPus/8FaTCN2tTjBesaxaeFDlD4=;
	b=Qw4L1B+c6ypxEKSEtEGOgsE36adfHaHKiql0XaEPh1H+Nuc1OGyu25MUJK4DFqaQyQRLVB
	fDoukkXDsKyk+jAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724241873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o5GkRdaCbK6AU7b5UPus/8FaTCN2tTjBesaxaeFDlD4=;
	b=Tlj2X5L3KvzcyRZaXN7ger7TSwnOMrsrFj+1GD2Q6YzB6/qRGsajdfSl/spxOVMgT5VUFF
	77QXCoJou11jlVqSBR6n4THBAZZv7f6nQoylK9MkEfogWszc/PjQ8bjj8DgLAhcSX4cCwf
	rfcvNIbcCzPd8oIb21Qauw82Vp2lxv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724241873;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o5GkRdaCbK6AU7b5UPus/8FaTCN2tTjBesaxaeFDlD4=;
	b=Qw4L1B+c6ypxEKSEtEGOgsE36adfHaHKiql0XaEPh1H+Nuc1OGyu25MUJK4DFqaQyQRLVB
	fDoukkXDsKyk+jAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6251A139C2;
	Wed, 21 Aug 2024 12:04:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Gxz7FdHXxWaTBgAAD6G6ig
	(envelope-from <andrea.cervesato@suse.de>); Wed, 21 Aug 2024 12:04:33 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Subject: [PATCH v2 0/2] Reproducer for the landlock houdini bug
Date: Wed, 21 Aug 2024 14:04:24 +0200
Message-Id: <20240821-landlock_houdini-v2-0-b46211ca64f9@suse.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMjXxWYC/32NQQ7CIBBFr9LMWgylGKsr72EagzBjJ1YwYImm4
 e5iD+DyveS/v0DCyJjg2CwQMXPi4CuoTQN2NP6Ggl1lUFJp2SspJuPdFOz9MobZsWdBSmvaKez
 3toM6e0Ykfq/J81B55PQK8bM+5PZn/8RyK1pB1F2J7KFDY05pTri14QFDKeULT1YLpq8AAAA=
To: ltp@lists.linux.it
Cc: landlock@lists.linux.dev
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724241873; l=913;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=G4sAW2IMgEBA54U81GyIUcqqlRJfUo5l5jbUjqBEZf4=;
 b=j5M3rk4YMKrkoUqBqFebr9KPGaXDf1Y57+66iSiqlezjY1u3Bl6RmI0To4dxuTiuo9tiBo3hB
 +orIgLvdnddDdsraHutBMojEkrLyVN1H9DDnh7jZj35Pq/DOuxjjwFg
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid]
X-Spam-Score: -4.30
X-Spam-Flag: NO

More information at:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-42318

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
Changes in v2:
- add SAFE_KEYCTL macro
- verify in setup that landlock is activated
- Link to v1: https://lore.kernel.org/r/20240820-landlock_houdini-v1-1-ff3bffc93eaa@suse.com

---
Andrea Cervesato (2):
      Add SAFE_KEYCTL macro
      Add landlock07 test

 include/lapi/keyctl.h                           |  26 +++++-
 runtest/syscalls                                |   1 +
 testcases/kernel/syscalls/landlock/.gitignore   |   1 +
 testcases/kernel/syscalls/landlock/landlock07.c | 109 ++++++++++++++++++++++++
 4 files changed, 136 insertions(+), 1 deletion(-)
---
base-commit: edc79222abdcf32a344c806275a30a5c7cbf1ef3
change-id: 20240820-landlock_houdini-f244f52e87c3

Best regards,
-- 
Andrea Cervesato <andrea.cervesato@suse.com>


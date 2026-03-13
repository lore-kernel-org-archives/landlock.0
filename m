Received: from neosafemail.com (neosafemail.com [104.234.123.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23244391518
	for <landlock@lists.linux.dev>; Fri, 13 Mar 2026 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.234.123.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410857; cv=none; b=DLpkL1KiFPfnaxLFpx9bpV0ke4q4wr+kx9MKSQAmln4IujgGHZjEvce5Wc9n7JYLLNeV15y1QBhzRXaHo6ZZA2FoIw5HNd5gg/bziPE+JdRdkKpM4J0mprlJT5Qgh3iYp+9lXW2cKPcHZZzpkRpKY0OQXoFEdFWM8DSVX1a00gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410857; c=relaxed/simple;
	bh=B4be7XmiM3bwM0V06OTzEuIW2Q2aRyJYntMcVUCg5EQ=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=MiEm/D0Kd/hPj5pabfo166EGss5NpC+7u68SP0ib1dXzQKJkqZwbnCtKZry/TrQndt8rBXrCoCPqCp2SLHhp/M4HzAxfAuI+GImpQ3GEjC7cSQYpuUdKakTIlayf+mgdYf7YaJpKn62smCrzDcYNnhWq94jsCeoAVrOO8LWn82I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joinpond.fyi; spf=pass smtp.mailfrom=bounce.joinpond.fyi; dkim=pass (1024-bit key) header.d=joinpond.fyi header.i=@joinpond.fyi header.b=WTwf5Vin; arc=none smtp.client-ip=104.234.123.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=joinpond.fyi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.joinpond.fyi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=joinpond.fyi header.i=@joinpond.fyi header.b="WTwf5Vin"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=joinpond.fyi;
	s=mi-DXIBNR; t=1773410519;
	bh=B4be7XmiM3bwM0V06OTzEuIW2Q2aRyJYntMcVUCg5EQ=;
	h=date:from:to:message-id:subject:mime-version:content-type:content-transfer-encoding;
	b=WTwf5Vin7hVxTFZ4CfQ5ZE77xlWsIN3ytKDANK8VoPoSdwopDTz2BlJwiVjHuvBu4OSysXgA
	oVHD/DXwyuKgcFGyLVINeaEPxfHFiAonA7M3Dngndy9qrjVtQp4tKJIy3Cm3yh7FtYPo31PJ
	AV2dl+LdTY2AMguQMfk46gax5ME=
X-MI-Unique: 0Y3CoaFhLGiR6FT0
Received: from api by platinum.obmengine.com with HTTP; Fri, 13 Mar 2026 14:01:58 +0000
Date: Fri, 13 Mar 2026 14:01:58 +0000
From: Dylan Zhang <dylan@joinpond.fyi>
To: landlock@lists.linux.dev
Message-ID: <019ce781-00d7-7634-86c8-db8e05889b3e@joinpond.fyi>
Subject: Podcast Invite for Landlock-Lsm + 1000 users competing for you
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hey Landlock

I'm Dylan, founder of Pond backed by the co-author of Attention Is All Yo=
u Need (the paper behind GPT) and Tier 1 VCs Archetype and Coinbase Ventu=
res.

Is this something you're dealing with as a founder? You run ads, get user=
s who churn. You ask for feedback, get polite lies. You post on Reddit, t=
he spike dies in 48 hours. None of it compounds. Are you spending too muc=
h time finding video editors and talking to them one-on-one?

We built Pond Bounties to break that loop. Post a task to 100,000+ users =
who compete to deliver the top work. You only pay for what's useful.

=E2=80=A2 Ethereum Foundation crowdsourced ML models with a bounty. Massi=
vely oversubscribed.
=E2=80=A2 GPTZero turned a feedback task into an enterprise lead pipeline=
. Built itself.
=E2=80=A2 PhotoBase got 60+ authentic user videos in a week. The kind no =
budget can fake.

Every campaign has more than 2,000 participants and hit 3x its target. Yo=
u can see how it works here: https://drive.google.com/file/d/1St4hRqXCF4f=
6ht0y-mrqa5U3S8TT4QxN/view?usp=3Dsharing

I looked at Landlock-Lsm and think there's something here. Would you mind=
 sharing what challenges you're facing right now? I'd be happy to hop on =
a call to discuss this further if you're interested!

Consider joining us on our podcast (13k+ views per episode on X) if you d=
ecide to post a bounty! Happy to explain more!=C2=A0

Best,
Dylan
Founder and CEO
Pond: https://joinpond.ai


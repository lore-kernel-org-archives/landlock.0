Received: from wfhigh5-smtp.messagingengine.com (wfhigh5-smtp.messagingengine.com [64.147.123.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667216BB50
	for <landlock@lists.linux.dev>; Thu,  4 Apr 2024 08:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712217862; cv=none; b=UbMkNZFl0tNu1+xXsLpOZFWq7N6hs/I8V+g4EKeyWSmig8OWyJM+n37hMUinOzSdz69RNp+wxVV6mVM9Zcbs+GBBWHSSb+iPp8sTzXVAtcu7N+AuDMX717dVQVP3JlxQrElETWBiSup/Q9egTzAkD+15WDm9c4RzApBFfWfRk+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712217862; c=relaxed/simple;
	bh=S5fSTUeKo8DYNl8WUFVRCdNukQNI+l4L+Sdnog4lHRg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=a3X2wolx1oLvSPMJOGghvTvPzV/vnmvqt1V/3j87l//b54i3muFVOfuGYEK5+glZo0I1D0gU7WqBDLnPg1b6wyYHbdds0JHRzV7YxBhqeKc0Hc2XOYa5G7ZCcl4tIghU7VKndnmMdIo1iHADsuM4mhSvUU955KkIOSpmV5vwwnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=supakeen.com; spf=pass smtp.mailfrom=supakeen.com; dkim=pass (2048-bit key) header.d=supakeen.com header.i=@supakeen.com header.b=O6lkFlwT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=txyx1sYI; arc=none smtp.client-ip=64.147.123.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=supakeen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=supakeen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=supakeen.com header.i=@supakeen.com header.b="O6lkFlwT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="txyx1sYI"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 21CA118000B0;
	Thu,  4 Apr 2024 04:04:19 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute1.internal (MEProxy); Thu, 04 Apr 2024 04:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=supakeen.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1712217858;
	 x=1712304258; bh=S5fSTUeKo8DYNl8WUFVRCdNukQNI+l4L+Sdnog4lHRg=; b=
	O6lkFlwT3Pwt/fnFPnxhvLJegfoTV6cxAyRrE0us5FdvZRzq56fR2Hqfir7rtmkx
	FRn4+Zh1Rb+NGI6OuX9qkqOTmrhHonwJyFwcvb65iRtCIM6EIFphGXQuUKFKuJrd
	c6R3Iv7/PPsl9VQ9YowagVeGmOtSjVxewibUTkID+wIYiUKYxnTwUaUX9isqCg6H
	SuafAOk/M8V0/nTfYoOagDQFiA3zP8MlVZNfM7aatt3NZ4HI7E6N0Zx3PpilF+vX
	bZC4UQgJ8mLkKh81surnTOdJw0PRZT8zlyJC28TrqsgyAlsGK4Gdd3CY+BmMHdoX
	p+7QqC06p5cL5Khe4WdrEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1712217858; x=
	1712304258; bh=S5fSTUeKo8DYNl8WUFVRCdNukQNI+l4L+Sdnog4lHRg=; b=t
	xyx1sYIQ/ETNsTRXalE5/T3kbIEOawHatlhIYR1lbuhNqxE+gIgBnQcoq9HMdMwa
	/370xgplWrfAp3OW+zl9fUNZgbJGN3Ay5ZI31i02roXXtx17NunJk+VEbdILP4s0
	/mxuHkFPod/9Y3yoxKtzx+HlfGkzt06HDkTnQhDRTWWYm/WTmJ3L1MpeKoBgaYOK
	WOfLJUvfIFHDgbriJnuYMEZsVNH0nSe/65QZCWpXGWom5NWD5q/HgyHeg/RmtVk9
	lcABTeI12OydXPH13tgSld9CYJIyiJ6HZaTyQuNESQ67iR+bEYqrv6BiltC4W18f
	K8aCRU1zwejGDh+pucUAg==
X-ME-Sender: <xms:Al8OZkpg2Xgth50DzUY4W7IP1hz1uoLtNaVkvpc-i8S9zcFnrdqeWw>
    <xme:Al8OZqqXPvmAqlttS3Woo-OGRzLXsPg_Sk5YjNnbnUzoctyOxri_hgeoYtq48ms_S
    P8KGVL57bB-P1yvfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefkecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvfevufgtgfesthhqre
    dtreerjeenucfhrhhomhepfdfuihhmohhnucguvgcugghlihgvghgvrhdfuceotghmughr
    sehsuhhprghkvggvnhdrtghomheqnecuggftrfgrthhtvghrnhepkefhhfejgeefvdegue
    evkeevuefgleduiefgveelhfejhfffffeukedvueeitdeknecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghmughrsehsuhhprghkvggvnhdrtg
    homh
X-ME-Proxy: <xmx:Al8OZpOnAZDzxWGLtLf8LaiRquE1teNgR7v3W3O4oxlJmIpU8v6ERA>
    <xmx:Al8OZr7XqQeUR7MSuLaorAG0IAgs0i4KxfGUJyhvIBisA3EKUn8uYw>
    <xmx:Al8OZj5Ukb6aa9W8Tc7Zcz8SUnfgnbj-8UbMhgpZ9Lu7muVRwz52Ww>
    <xmx:Al8OZrgun6O_YdvizIMNuBqDmkZL_p5qwEcJx4aVJAyMeHkfk9Y7-A>
    <xmx:Al8OZlmzyeNCdEKEX9K658nLxBhuHOAjiMAig1gsaNNxNaMxSfHLyaOh>
Feedback-ID: i11d94492:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1620D36A0079; Thu,  4 Apr 2024 04:04:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <b48e2839-cfa9-4a42-a54f-2f5f03687fc6@app.fastmail.com>
In-Reply-To: <20240403152043.fc5gpqu2ghlahyyj@altlinux.org>
References: <20240401160614.32py2wrijdp5yots@altlinux.org>
 <20240402.quaQuieyohd9@digikod.net>
 <20240403152043.fc5gpqu2ghlahyyj@altlinux.org>
Date: Thu, 04 Apr 2024 10:03:57 +0200
From: "Simon de Vlieger" <cmdr@supakeen.com>
To: "Vitaly Chikunov" <vt@altlinux.org>,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: landlock@lists.linux.dev
Subject: Re: R/O protection for lower level dirs
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Vitaly,

On Wed, Apr 3, 2024, at 5:20 PM, Vitaly Chikunov wrote:

> To add more detail, what I tried to achieve: rpmbuild installs into so
> called 'buildroot', which is (for ALT) '/usr/src/tmp/name-buildroot'
> directory inside of '/usr/src/tmp' TMPDIR (and '/usr/src' is a HONE). =
When
> %check section is performed some scripts may inadvertently modify
> buildroot content which I thought to block. But because TMPDIR should =
be
> unrestricted (and / and HOME are not need to be restricted) it is not
> possible by any means to restrict buildroot.

As Micka=C3=ABl mentions this can be achieved by re-arranging the direct=
ory
structure. However I'd like to point out a second option (which doesn't
directly involve landlock) and that is to create a new overlay between
`%build` and `%check` which you throw away again before `%install`.

Any inadvertent changes during `%check` would then be irrelevant for the
`%install` section.

Regards,

Simon

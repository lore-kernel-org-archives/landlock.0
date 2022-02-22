Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5812581
	for <landlock@lists.linux.dev>; Tue, 22 Feb 2022 21:33:49 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sm2n.ca; s=key1;
	t=1645565301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5tZgiOqotPydlBgPKCX6eV3QdSi79553KR1tVFphK4o=;
	b=h8vRk3Svownb1lk84hXLf8cLizGXrDAkWfi2P+nZHt16J0Yk+zodb4y4VDFqzcOYqn/6oz
	LAh7yfEd8ARxVOJLMAsIfWCGkDA9iWL5vQUGRdTaaDcPBo6s/ET6ZnaxufgG/zmK9ZKCDw
	pBud5OE9IsygRdXXdigUAk4W2wO7jB3ADshrINcqJ/iIeqry/32gTBIJNdM5tnBHqdrH4n
	mr8l756BFt8DLgwNfWyqFJbDhP7ls7x8bZVKJwjZVV+jD05rmOvksG9gLFmF+OQqBY38aI
	1zs1YXEOSoFevcARE99jYRoZ0dlQuxuN+CLPMNw1y0rLrFJL1fqBeUIVZnA8uQ==
From: S.M Mukarram Nainar <theone@sm2n.ca>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 landlock@lists.linux.dev
Cc: TaylorPhebillo@gmail.com
Subject: Re: Landlock and O_PATH
In-Reply-To: <115f32a0-fb96-3598-a52a-48c1f1346d76@digikod.net>
References: <87v8x83rhz.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
 <155b9df6-8557-cd3e-1a59-6a852340a3d7@digikod.net>
 <87sfsb4ya5.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
 <115f32a0-fb96-3598-a52a-48c1f1346d76@digikod.net>
Date: Tue, 22 Feb 2022 16:28:17 -0500
Message-ID: <87pmne4mmm.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: sm2n.ca

> Landlock is designed to be backward and forward compatible just to avoid 
> this kind of issue. An application being restricted with a set of access 
> right will not automatically get new ones with a newer kernel: action 
> handling is explicit (see ruleset's handled_access_fs). I'm extending 
> the documentation with this specific subject: 
> https://lore.kernel.org/r/20220221212522.320243-10-mic@digikod.net

Yeah, I understand that. Thanks for clarifying the documentation. But I
guess my question is then: Can it be assumed that the behavior of any
given flag will never change? I think that earlier I was assuming that
O_PATH would go under FS_READ_DIR in the future, but I guess that is not
the case?

Thanks,
Mukarram

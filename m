Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D6B7E
	for <landlock@lists.linux.dev>; Mon, 21 Feb 2022 23:04:27 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sm2n.ca; s=key1;
	t=1645484660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Haa1tW3Su/VemQLMJqpYDFsNcQQe2KzS/YZcYYyKAN8=;
	b=kQXBcdtJc+el1aKuS81H5sfohMIbBQQMlM6sxUDGWalBK3+SKyPqk7mUMgohDKjiqvlZtQ
	Y847aHdumNUgcL3DoVHyFCwP6Xrd+TLmBnGQHJRPVBl0qa8OBgntoW13kyvgxXgztqEY0Y
	lHLpLe5I6288VvIZ1273zHjdmEyB8kcgaMdhRbsztpEpuLWJyhgPH3dcIL60z9u0r6FAXY
	yrj6EdoKcrCaBeVA1WMbwphzWZTRlzYWPQB6zub3826Obo2My0vDaPnYpTEUTLwTaF2oUj
	voC9APASsDJETWcFvlnIa2Uus+VWlqWSxXZVhM7QJ3eVJsntM+a/94RDe5zsVw==
From: S.M Mukarram Nainar <theone@sm2n.ca>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 landlock@lists.linux.dev
Cc: TaylorPhebillo@gmail.com
Subject: Re: Landlock and O_PATH
In-Reply-To: <155b9df6-8557-cd3e-1a59-6a852340a3d7@digikod.net>
References: <87v8x83rhz.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
 <155b9df6-8557-cd3e-1a59-6a852340a3d7@digikod.net>
Date: Mon, 21 Feb 2022 18:04:18 -0500
Message-ID: <87sfsb4ya5.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: sm2n.ca

> That is correct, the current Landlock implementation relies on the LSM 
> path hooks, and some filesystem actions are not handled. See the warning 
> section in 
> https://docs.kernel.org/userspace-api/landlock.html#filesystem-flags
> Opening a file or a directory with O_PATH cannot currently be denied 
> with Landlock and it is the same with AppArmor and Tomoyo. It may sound 
> scary but a file descriptor opened with O_PATH can only be used to refer 
> to a path (with *at syscalls), it does not give access to the underlying 
> file or directory content.
>
> You're right that it may be used as an oracle to find file or 
> directories, and this can also be done with syscalls such as chdir, 
> access or stat. The current goal of Landlock is to protect access to 
> data, which are in files, but it would be nice to also protect metadata 
> such as path existence.

Right, I see. That makes sense.

> I plan to fill this gap with new versions of Landlock, but I'll have to 
> patch the existing LSM framework.

Looking forward to this! I think it may be useful (considering Hyrum's
law) to document what is planned to be blocked in the future so that
application developers can use landlock safely now without worrying
about incompatibilities. It would kind of suck if applications would
break on newer kernels. That's my two cents anyway, I know you must
already be very busy.

Thanks,
Mukarram

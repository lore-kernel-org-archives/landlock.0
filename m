Received: from mail.omarpolo.com (mail.omarpolo.com [144.91.116.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351629CA
	for <landlock@lists.linux.dev>; Thu, 10 Feb 2022 22:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=omarpolo.com;
	s=20200327; t=1644530442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKMtawaCEB7xpZlbN6Zixdg90YTi2ujgup1idjvuTD8=;
	b=yH6nMz74d8tRRWMrgmT7evJTarinz8P1+cvlPDB9FTSO6LXZrAZlIGC9Uhg8ILUMf3cr8I
	Zt5vf2KcYpKUinIh1HHoGB8uAWYKl+JLti4jg2uPUjS1L9j88GCTIYBSn6KWbkvbrS2vWc
	iM8fbcxNu82KLOmT6Def5XuCSWQjURU=
Received: from localhost (host-79-25-234-113.retail.telecomitalia.it [79.25.234.113])
	by mail.omarpolo.com (OpenSMTPD) with ESMTPSA id 8342e3a8 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Thu, 10 Feb 2022 23:00:42 +0100 (CET)
Received: from venera (localhost [127.0.0.1])
	by localhost (OpenSMTPD) with ESMTP id 434e8b95;
	Thu, 10 Feb 2022 23:00:40 +0100 (CET)
References: <1dd9e03e-0f04-4722-0874-fb3b1757b7bb@digikod.net>
User-agent: mu4e 1.6.10; emacs 29.0.50
From: Omar Polo <op@omarpolo.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: gameoftrees@openbsd.org, Thomas Adam <thomas@xteddy.org>,
 landlock@lists.linux.dev
Subject: Re: GoT Landlock fixes
Date: Thu, 10 Feb 2022 22:52:05 +0100
In-reply-to: <1dd9e03e-0f04-4722-0874-fb3b1757b7bb@digikod.net>
Message-ID: <87k0e28jqv.fsf@omarpolo.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> writes:

> Hi,
>
> I noticed Omar Polo added support for Landlock to the Linux version of
> Game Of Trees [1]. This is great! However, the handled filesystem
> access is only LANDLOCK_ACCESS_FS_READ_FILE, and it will still be
> allowed to do multiple filesystem-related actions (e.g. write to
> files, remove files=E2=80=A6). I don't know much about Game Of Trees but,
> according to the commit message, I think you would like to revoke any
> (currently supported) filesystem access. You should then add the 12
> remaining access rights [2]. There is also a typo in the errno check,
> it should be EOPNOTSUPP (not ENOTSUP). You'll find a small patch
> attached. Let me know if I can help.
>
> In a nutshell, the ruleset's handled_access_fs is required for
> backward and forward compatibility (i.e. the kernel and user space may
> not know each other's supported restrictions), hence the need to be
> explicit about the denied-by-default access rights.

Yes, the original diff had all the actions, but when I picked that up
again before it got committed I got confused and dropped the others (I
was sure the checks not listed there were dropped by default.)  I humbly
apologies to everyone for the incredibly stupid mistake, I don't have
any excuse.

Regarding the ENOTSUP/EOPNOTSUPP mistake, I thought that on linux the
two errno were defined to the same value, but I agree on the change
obviously (this point was raised by Brian too recently.)

Thanks a lot for reviewing the diff and fixing my mistake!

> Regards,
>  Micka=C3=ABl
>
>
> [1]
> https://git.gameoftrees.org/gitweb/?p=3Dgot-portable.git;a=3Dcommit;h=3D9=
7799ccd4b67a81f97039305d4fdd66588da9962
> [2] https://docs.kernel.org/userspace-api/landlock.html#filesystem-flags
>
> [2. text/x-patch; 0001-portable-extend-support-for-Landlock-and-fix-error=
-h.patch]...


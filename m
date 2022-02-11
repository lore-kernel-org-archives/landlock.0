Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6512F26
	for <landlock@lists.linux.dev>; Fri, 11 Feb 2022 10:49:07 +0000 (UTC)
X-Envelope-From: stsp@stsp.name
Received: from authenticated.user (localhost [127.0.0.1]) by einhorn.in-berlin.de  with ESMTPSA id 21BAd9AT030738
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Feb 2022 11:39:10 +0100
Received: from localhost (benson.stsp.name [local])
	by benson.stsp.name (OpenSMTPD) with ESMTPA id 72ebbcd7;
	Fri, 11 Feb 2022 11:39:09 +0100 (CET)
Date: Fri, 11 Feb 2022 11:39:09 +0100
From: Stefan Sperling <stsp@stsp.name>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: gameoftrees@openbsd.org, Omar Polo <op@openbsd.org>,
        Thomas Adam <thomas@xteddy.org>, landlock@lists.linux.dev
Subject: Re: GoT Landlock fixes
Message-ID: <YgY8zTm7sqrDL6xK@benson.stsp.name>
Mail-Followup-To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	gameoftrees@openbsd.org, Omar Polo <op@openbsd.org>,
	Thomas Adam <thomas@xteddy.org>, landlock@lists.linux.dev
References: <1dd9e03e-0f04-4722-0874-fb3b1757b7bb@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1dd9e03e-0f04-4722-0874-fb3b1757b7bb@digikod.net>

On Thu, Feb 10, 2022 at 06:34:54PM +0100, Mickaël Salaün wrote:
> Hi,
> 
> I noticed Omar Polo added support for Landlock to the Linux version of Game
> Of Trees [1]. This is great! However, the handled filesystem access is only
> LANDLOCK_ACCESS_FS_READ_FILE, and it will still be allowed to do multiple
> filesystem-related actions (e.g. write to files, remove files…). I don't
> know much about Game Of Trees but, according to the commit message, I think
> you would like to revoke any (currently supported) filesystem access. You
> should then add the 12 remaining access rights [2]. There is also a typo in
> the errno check, it should be EOPNOTSUPP (not ENOTSUP). You'll find a small
> patch attached. Let me know if I can help.

Thank you for looking at this Mickaël, it helps us a great deal!
 
> In a nutshell, the ruleset's handled_access_fs is required for backward and
> forward compatibility (i.e. the kernel and user space may not know each
> other's supported restrictions), hence the need to be explicit about the
> denied-by-default access rights.

I suspect Omar trimmed down the list of fs flags was in response to
a question I asked during code review. The code initially followed
the example given in your docs, but we ended up diverging from it.

If the point you made above was explained in your docs it would be
much easier to understand why there is a long list of access rules
in struct rndlock_ruleset_attr, many of which may not seem relevant
to the application's purposes. Character or block devices will rarely
be needed by applications, for example. The name "handled_access_fs"
does not immediately bring to mind that this could be a default deny list.

Cheers,
Stefan

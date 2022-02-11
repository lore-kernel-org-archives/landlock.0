Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de [192.109.42.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B999E7E
	for <landlock@lists.linux.dev>; Fri, 11 Feb 2022 20:11:57 +0000 (UTC)
X-Envelope-From: stsp@stsp.name
Received: from authenticated.user (localhost [127.0.0.1]) by einhorn.in-berlin.de  with ESMTPSA id 21BKBqrE005127
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Feb 2022 21:11:52 +0100
Received: from localhost (benson.stsp.name [local])
	by benson.stsp.name (OpenSMTPD) with ESMTPA id f56b2f64;
	Fri, 11 Feb 2022 21:11:51 +0100 (CET)
Date: Fri, 11 Feb 2022 21:11:51 +0100
From: Stefan Sperling <stsp@stsp.name>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: gameoftrees@openbsd.org, Omar Polo <op@openbsd.org>,
        Thomas Adam <thomas@xteddy.org>, landlock@lists.linux.dev,
        "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Subject: Re: GoT Landlock fixes
Message-ID: <YgbDB5AqY4rwWcro@benson.stsp.name>
Mail-Followup-To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	gameoftrees@openbsd.org, Omar Polo <op@openbsd.org>,
	Thomas Adam <thomas@xteddy.org>, landlock@lists.linux.dev,
	"Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
References: <1dd9e03e-0f04-4722-0874-fb3b1757b7bb@digikod.net>
 <YgY8zTm7sqrDL6xK@benson.stsp.name>
 <317fef23-b5b1-3a6d-d851-60669daa03fe@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <317fef23-b5b1-3a6d-d851-60669daa03fe@digikod.net>

On Fri, Feb 11, 2022 at 06:15:43PM +0100, Mickaël Salaün wrote:
> The documentation about handled_access_fs says: "Bitmask of actions (cf.
> Filesystem flags) that is handled by this ruleset and should then be
> forbidden if no rule explicitly allow them. This is needed for backward
> compatibility reasons."
> 
> I guess it is too succinct. What do you think about that:
> 
> "[...] if no rule explicitly allow them: it is a deny-by-default list that
> should contain as much Landlock access rights as possible. Indeed, all
> Landlock filesystem access rights that are not part of handled_access_fs are
> allowed. This is needed for [...]"
> 
> And before that, in the example, after "The ruleset then needs to handle
> both of these kind of actions", I can add "This is required for backward and
> forward compatibility (i.e. the kernel and user space may not know each
> other's supported restrictions), hence the need to be explicit about the
> denied-by-default access rights."
 
Yes, this would make the docs a lot clearer.

I suppose developers using landlock are supposed to keep their applications
up-to-date and expand their bitmask definition whenever new flags are
added to the landlock API?

If so, it might be worth pointing this out in the documentation, to ensure
readers understand that writing this list in their code is not a one-time
action, and their attention will be required when new flags are added.
Something like:
"Future versions of landlock may define additional filesystem flags,
which applications must add to handled_access_fs if a deny-by-default
policy is desired."

Which makes me wonder if applications which prefer to always fail closed
could simply set all the bits. Would this break anything?

struct landlock_ruleset_attr ruleset_attr = {
    .handled_access_fs = 0xffffffffffffffff;
};

Otherwise, how about providing a macro which programs like Got could
use to initialize this mask to all currently known filesystem flags?

#define LANDLOCK_ACCESS_FS_POLICY_DENY_ALL \
	(LANDLOCK_ACCESS_FS_EXECUTE | \
	LANDLOCK_ACCESS_FS_WRITE_FILE | \
	... etc.)
	

struct landlock_ruleset_attr ruleset_attr = {
    .handled_access_fs = LANDLOCK_ACCESS_FS_POLICY_DENY_ALL;
};

With this, only one copy of a default-deny mask would need to be maintained.
Applications could stay in sync and keep failing closed by recompiling them
against new landlock header files. Would this work?

Cheers,
Stefan

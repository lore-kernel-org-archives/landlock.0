Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300CC79C3
	for <landlock@lists.linux.dev>; Mon, 21 Nov 2022 20:07:07 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4NGDpf1th7zMpnnQ;
	Mon, 21 Nov 2022 18:27:06 +0100 (CET)
Received: from [127.0.0.1] (unknown [10.92.202.72])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4NGDpd6jqMz3h;
	Mon, 21 Nov 2022 18:27:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1669051626;
	bh=JRtem3nl4Tot+ZBeqZYR0KHMIYbwc9mX6It3SmEaSPY=;
	h=Date:Subject:From:Reply-To:To:Cc:References:In-Reply-To:From;
	b=pzinOX0TEZxQoS0KHCf+r/nHkKRZj+d3IhSdSLuG1xa+B8DihMv+l3rAd6/q+NE3M
	 bqReqdA2YisyhDMDdh2fTIgGaJXVE4Gjn8MG8fvtcqVvVxPtaDGR6nRi6BpftaJlo6
	 812aZEUXMF1zVs8cMrUWeAIZGjfFWJaSNg4wEyvg=
Message-ID: <9d3b5bd7dff1aa638b616bbd978d4761@mail.infomaniak.com>
Date: Mon, 21 Nov 2022 18:27:05 +0100
Subject: Re: questions about ruleset and rule
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Reply-To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Anquan Wu <leiqi96@hotmail.com>
Cc: "landlock@lists.linux.dev" <landlock@lists.linux.dev>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-WS-User-Origin: eyJpdiI6IndsTjRtbTRwZi80ZUhCcVFWR1BIekE9PSIsInZhbHVlIjoidWhWc3N1VnJrdU9zREpGNm00UExadz09IiwibWFjIjoiODViYzkzOWQ3NzQ5OWI4YTZiNjQ3NjdjNzdjYTJhN2M2NzU3YWYxZjdhYjIzNWMzNzIxOWMxNWE0MjNkMWRmMCIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6Ild0cXB1bVZwOXI3QlluY1B0YWpqMnc9PSIsInZhbHVlIjoiZ3hMY2gwN3pMaEMwcFJtcEZuZk9qUT09IiwibWFjIjoiNjhmZTE5ZmQ1NGJmY2UwMDZiMDMyYTBlNzc4NmRhNGZjMmM4MzhiNWEyYTY3ZjMzNmRlMmZmMTJiMDY3NWY0NiIsInRhZyI6IiJ9
X-WS-Location: eJxzKUpMKykGAAfpAmU-
X-Mailer: Infomaniak Workspace (1.3.400)
References: <OSZP286MB1725B55A57C254DEFA0F6F9CB80A9@OSZP286MB1725.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <OSZP286MB1725B55A57C254DEFA0F6F9CB80A9@OSZP286MB1725.JPNP286.PROD.OUTLOOK.COM>

On 2022-11-21T02:41:00.000+01:00, Anquan Wu <leiqi96@hotmail.com> wrote:
>  hello, I have some questions about ruleset and rule, Can anyone help me=
=EF=BC=9F
>=20
>=20
>=20
> 1. From website https://www.kernel.org/doc/html/latest/userspace-api/land=
lock.html,
>=20
> it said that "We first need to define the ruleset that will contain our r=
ules. For this example, the ruleset will contain rules that only allow read=
 actions, but write actions will be denied. The ruleset then needs to handl=
e both of these kind of actions. This is required for backward and forward =
compatibility (i.e. the kernel and user space may not know each other=
=E2=80=99s supported restrictions), hence the need to be explicit about the=
 denied-by-default access rights.".
>=20
> Can I interpret this sentence in this way?
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------
> the fs_access_masks of ruleset is the default allow action=EF=BC=8Cthe ru=
le is the fine-grained rules.

The ruleset_attr.handled_access_fs is the set of actions that may be denied=
 by the ruleset. Without any rule added to this ruleset, the ruleset will d=
eny all these actions.

The rules tied to a ruleset describe exceptions for which an action may be =
allowed. Because rulesets can be nested/stacked, a rule allowing access to =
a specific file may not be enough because a parent ruleset may already deny=
 such actions: we can only add more restrictions with nested rulesets

>=20
> when a process opens a file, landlock enforces the fine-grained rules. If=
 there are no rules to match in the fine-grained rules=EF=BC=8C the default=
 police(fs_access_masks of ruleset) is executed.

This is correct, but by default all handled accesses are denied.


> _________________________________________________________________________=
___________________________________________________________________________=
_______________________
>=20
> If the above is right=EF=BC=8Cis the below LANDLOCK_ACCESS_FS_WRITE_FILE =
of ruleset_attr to be removed.
>=20
> struct landlock_ruleset_attr ruleset_attr =3D {
>     .handled_access_fs =3D
>         LANDLOCK_ACCESS_FS_EXECUTE |
>         LANDLOCK_ACCESS_FS_WRITE_FILE |    // here
>         LANDLOCK_ACCESS_FS_READ_FILE |
>         LANDLOCK_ACCESS_FS_READ_DIR |
>         LANDLOCK_ACCESS_FS_REMOVE_DIR |
>         LANDLOCK_ACCESS_FS_REMOVE_FILE |
>         LANDLOCK_ACCESS_FS_MAKE_CHAR |
>         LANDLOCK_ACCESS_FS_MAKE_DIR |
>         LANDLOCK_ACCESS_FS_MAKE_REG |
>         LANDLOCK_ACCESS_FS_MAKE_SOCK |
>         LANDLOCK_ACCESS_FS_MAKE_FIFO |
>         LANDLOCK_ACCESS_FS_MAKE_BLOCK |
>         LANDLOCK_ACCESS_FS_MAKE_SYM |
>         LANDLOCK_ACCESS_FS_REFER,
> };
> If not, How to understand the fs_access_masks of ruleset and rule?

The documentation example creates rules with LANDLOCK_ACCESS_FS_EXECUTE | L=
ANDLOCK_ACCESS_FS_READ_FILE | LANDLOCK_ACCESS_FS_READ_DIR, which means that=
 LANDLOCK_ACCESS_FS_WRITE_FILE is never allowed, and then denied.

>=20
> 2. If there are no rules in the ruleset=EF=BC=8Cwhat actions for a proces=
s with the ruleset will landlock perform.

Without exception (i.e. rule), all ruleset's handled actions are denied.

>=20
> 3.=20
> If a rule ("/home/a.txt" , "rw") is for process P1 and P2 is a child proc=
ess of P1,
>=20
> Can P2 set a new rule("/home/a.txt", "ro")

Yes, P2 can set any rule, but this can only lead to a more restricted sandb=
ox (i.e. it cannot bypass its parent ruleset).
In this case, /home/a.txt is allowed to be read and written thanks to P1's =
ruleset, and P2's ruleset explicitly removes write access.

>=20
> If a rule ("/home/a.txt" , "ro") is for process P1 and P2 is a child proc=
ess of P1,
> Can P2 set a new rule("/home/a.txt", "rw")

P2 can set this rule (which will not create any error when calling landlock=
_add_rule), but the write permission will be ignored because P1's ruleset d=
enies this access.

>=20
> thanks.

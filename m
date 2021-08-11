Received: from port70.net (port70.net [81.7.13.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6A570
	for <landlock@lists.linux.dev>; Wed, 11 Aug 2021 15:02:20 +0000 (UTC)
Received: by port70.net (Postfix, from userid 1002)
	id AC3DFABEC0C2; Wed, 11 Aug 2021 16:56:54 +0200 (CEST)
Date: Wed, 11 Aug 2021 16:56:54 +0200
From: Szabolcs Nagy <nsz@port70.net>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: musl@lists.openwall.com, Rich Felker <dalias@aerifal.cx>,
	landlock@lists.linux.dev,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>
Subject: Re: [musl] [PATCH v1] bits/syscall.h: add landlock_* from linux v5.13
Message-ID: <20210811145654.GD37904@port70.net>
Mail-Followup-To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	musl@lists.openwall.com, Rich Felker <dalias@aerifal.cx>,
	landlock@lists.linux.dev,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>
References: <20210810155406.2772584-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210810155406.2772584-1-mic@digikod.net>

* Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> [2021-08-10 17:54:06 +0200]:
> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
>=20
> Add three system calls for all architectures:
> * landlock_create_ruleset
> * landlock_add_rule
> * landlock_restrict_self
>=20
> They enable creating unprivileged security sandboxes, see
>=20
>   linux commit a49f4f81cb48925e8d7cbd9e59068f516e984144
>   arch: Wire up Landlock syscalls
>=20
> https://www.kernel.org/doc/html/latest/userspace-api/landlock.html
>=20
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> Link: https://lore.kernel.org/r/20210810155406.2772584-1-mic@digikod.net

thanks,

note i have outstanding patches to update musl to linux 5.13

https://www.openwall.com/lists/musl/2021/07/10/12


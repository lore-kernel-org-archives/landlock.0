Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60EB2C81
	for <landlock@lists.linux.dev>; Fri, 12 Nov 2021 12:41:33 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 0A242DF99FB
	for <landlock@lists.linux.dev>; Fri, 12 Nov 2021 13:35:00 +0100 (CET)
Received: from mail.corsac.net (unknown [IPv6:2a01:e0a:2ff:c170::5])
	by smtp1-g21.free.fr (Postfix) with ESMTPS id 225A2B0057C
	for <landlock@lists.linux.dev>; Fri, 12 Nov 2021 13:34:53 +0100 (CET)
Received: from scapa.corsac.net (unknown [IPv6:2a01:e0a:2ff:c170:6af7:28ff:fe8d:2119])
	by mail.corsac.net (Postfix) with ESMTPS id 0467F98
	for <landlock@lists.linux.dev>; Fri, 12 Nov 2021 13:34:44 +0100 (CET)
Received: from corsac (uid 1000)
	(envelope-from corsac@debian.org)
	id a021c
	by scapa.corsac.net (DragonFly Mail Agent v0.13);
	Fri, 12 Nov 2021 13:34:43 +0100
Message-ID: <ede7244df6992f6b3a2d3647b8511a50551c3ce5.camel@debian.org>
Subject: Re: Bug#999551: Support Landlock by default in Debian kernels
From: Yves-Alexis Perez <corsac@debian.org>
To: =?ISO-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, 
	999551@bugs.debian.org
Cc: landlock@lists.linux.dev
Date: Fri, 12 Nov 2021 13:34:38 +0100
In-Reply-To: <5fe178a1-19d5-90b5-c111-57b095848f57@digikod.net>
References: <5fe178a1-19d5-90b5-c111-57b095848f57@digikod.net>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1-1 
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hey Micka=C3=ABl, kernel team,

On Fri, 2021-11-12 at 12:23 +0100, Micka=C3=ABl Sala=C3=BCn wrote:
> -
> CONFIG_LSM=3D"lockdown,yama,loadpin,safesetid,integrity,apparmor,selinux,=
smack
> ,to
> moyo"
> +CONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,apparmo=
r,sel
> in
> ux,smack,tomoyo"
> =C2=A0=C2=A0
At first sight the change looks reasonable, but just to check: right now th=
ere
is there is no userland stuff using Landlock LSM packaged in Debian? So
nothing is currently broken by not having the above, it's just more practic=
al
when testing or using the feature?

(not saying we shouldn't enable it, it's just so we know what exactly we ga=
in
or not).

Regards,
- --=20
Yves-Alexis
-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE8vi34Qgfo83x35gF3rYcyPpXRFsFAmGOX14ACgkQ3rYcyPpX
RFuWRQf7B96Z1IoKkm7qbHswja4TmPuM2cJcBzXJLX0t591MO2D/GdAS08w+/kTL
ALUJSXKiDvcC9AmzKD4tFszs13NJwSXlhUB4sflqLk2TBltDEhSdlVSwAw2UGHxx
/NJRqH7nMWvMeghO/SLkaoXDEOAIQUR75cyQs1/oQIcfmYx+A68cr0DarEJKWUM8
SrLWTvY90IKKyBwKEY3hT/qFtb+YhPRp76tykT0J25b55EmkPO/f3p5vz+uUBG+N
WaKS+KKI1D4XubcmOOfa09XMh1OnZ1u3Jd6WZopcB7G2I18j/ejDXiz1pPDC7BrF
7nh/V2L7YRv0r4ppP5QwglLgRF5SOQ=3D=3D
=3DxSao
-----END PGP SIGNATURE-----

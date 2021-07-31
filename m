Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30E672
	for <landlock@lists.linux.dev>; Sat, 31 Jul 2021 13:48:30 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id c16so14421876plh.7
        for <landlock@lists.linux.dev>; Sat, 31 Jul 2021 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EqkRIfqcQJGV/a7apNcDDonI4CJx0b/8577c4c/LeCo=;
        b=IVCfpbm9R9DSrG7R8vEj/MQfH70iHx63QcONL8BdsweSzocMNqrS1f0/NtzX0QnSjM
         eCH0StH7XrDqQGkYkn2EOIUNDRrFk67e91qTO4z/aFRwEEtPlOL2p29MKUpl2KMFZDfO
         D0bOPNuqQSbmbcGzALaKukw7h8oEgOTThZPRLG3u/c19ugZ/XPJnbBEtlvkAiubgcTcQ
         45GkXW3TF4Ctn5MnZ1aKgNsoAx1wt/agQHb5XrBj1hz9KGhR4EV+aFStfoG5jB7tIKz5
         UDymtpo2CVWxmO7/tWhgnwQJJrNzVRZzOeHtimOTDCrlYusLTs/zti1PxXrFJOifgkIw
         oq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EqkRIfqcQJGV/a7apNcDDonI4CJx0b/8577c4c/LeCo=;
        b=h2SfiIKHcOCUT1kFJnVNZ4RxJQbYoK+zWEGqABn9h7Yff92+crKsKf5Buf0HKsemVH
         QRHNSMjQl2h/HvrMUOsXn3V4cq3+ht4FMNbMyNJlp9kGpU0FiSh8JaaTfkyMswDOCq5N
         Il6LQmQAYt0+UZx9McZPHGNmSQpnJukBVBSk2qv80G9YntisaZlpWeaPtrLPcE8+W/Cg
         dZInVY8Jb831sWoQkGkd7/8gxUm+sG5Jmiyu+kQXxKtLmEXT5PkxIbcArPDkWCfGr6dq
         4xm9pCb4A3aphZJJtvpzGk7jcc7/udHcQgMVGfy1f2+63H0oPWMQD479jqDDhP+RrZz4
         bALw==
X-Gm-Message-State: AOAM533jbjQnGDWRSF4DaxNCFkI28WzMgSoHQOcQwBsU/qh+BEM+RZeq
	HX00O/+bj+1Fb0j50LIjEMg=
X-Google-Smtp-Source: ABdhPJy/VTS6AjiYxmMZ7MS9aGfgfE4djuM3A1MQy0SphUeowzaLSchkOkjfcWgqUHL6MwCSCGu1Sw==
X-Received: by 2002:a17:90a:c7d7:: with SMTP id gf23mr8510414pjb.38.1627739310435;
        Sat, 31 Jul 2021 06:48:30 -0700 (PDT)
Received: from localhost.localdomain ([1.145.37.91])
        by smtp.gmail.com with ESMTPSA id w11sm5495163pjr.44.2021.07.31.06.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 06:48:29 -0700 (PDT)
Date: Sat, 31 Jul 2021 23:48:23 +1000
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Cc: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <keescook@chromium.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Vincent Dagonneau <vincent.dagonneau@ssi.gouv.fr>,
	landlock@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-man@vger.kernel.org, linux-security-module@vger.kernel.org,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
	Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: [PATCH v2 1/4] landlock.7: Add a new page to introduce Landlock
Message-ID: <20210731134821.qh5ol3wenvb73cjw@localhost.localdomain>
References: <20210712155745.831580-1-mic@digikod.net>
 <20210712155745.831580-2-mic@digikod.net>
 <3f1b943b-2477-2c4e-c835-d6616888176c@gmail.com>
 <c5036c5c-37a1-57d2-e5dc-1f41a5ed0d31@digikod.net>
 <20210730233931.lbtq67esmeuo4o6d@localhost.localdomain>
 <e88fe0d9-1330-3de4-53e1-4b72360ce7d3@gmail.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yvkdh4iyhs7gp6a2"
Content-Disposition: inline
In-Reply-To: <e88fe0d9-1330-3de4-53e1-4b72360ce7d3@gmail.com>
User-Agent: NeoMutt/20180716


--yvkdh4iyhs7gp6a2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, Alex,

[man, that CC list makes me cringe--this is all style issues and groff
release history, skip freely]

At 2021-07-31T12:51:30+0200, Alejandro Colomar (man-pages) wrote:
> Hi Branden, Micka=EBl,
> > One of the things I did after the groff 1.22.4 release (December
> > 2018) was to split groff_man(7) into two pages.  The one you've
> > linked is the terser reference for seasoned (perhaps salty) man page
> > writers.  Near the top of it you'll find this.
[...]
> Hmmmm, I can't find that text on my Debian Sid (with a bit of experimenta=
l)
> groff_man(7).  Not even in the SEE ALSO.

That's because Debian is still shipping groff 1.22.4, even in unstable.
That's not shocking; I think Colin Watson was hesitant to ship a release
candidate and that was all the groff team had ready at the time.  (I'm
the most active developer but not the project lead or release manager;
I've shied away from those responsibilities.)

> Re-reading this, we've been doing it wrong (as you pointed out in
> another thread) with macro names with variable part.

I do think it is wise to have a markup distinction between constant and
variable parts of C (or C preprocessor) symbol names.  Admittedly, font
style distinctions can get lost in terminal copy-and-paste, but we can't
solve everything in plain text alone.

> I wasn't very convinced by the current usage of the man pages, but it
> was already current, so I just followed it :/
>=20
> I'll try to follow this from now.

The man-pages project has some style rules for visible output that are
not in alignment with what groff does, but the only one that comes to
mind is the style used for man page names (man-pages: bold; groff:
italics).  I have a plan for resolving that on the rendering end[1].

> Ahh, I missed this text, as it was neither under .I nor .IR, and only
> had a fast read of the page.  The 3rd paragraph hints that you should
> only use .IR when really needed, and use .I otherwise.  But someone
> new to man-pages, who probably did never read this page (or read some
> specific paragraphs of it when needed), and found the extensive (and
> somewhat incorrect) usage of .IR in place of .I in the current man
> pages, might be confused by all of that inconsistency and hard-to-find
> (except by those who already know where it is (reference to Pirates of
> the Caribbean intended :) )) information.

Yes, it would really help if we (groff) could do a release.  :-/

> > I'd appreciate feedback from anyone on how I can improve the above.
>=20
> I think it's great.  But unless one reads the page with some time (and
> not only the bullets), one might think that the man page is
> incomplete.  Maybe groff_man_style(7) is better suited for newbies,
> but I can't tell...  I couldn't find it.

It's in groff Git and in the man-pages curated collection,
<https://man7.org/linux/man-pages/man7/groff_man_style.7.html>.

Michael apparently re-pulls from groff Git HEAD every time he does a
man-pages release, which makes the groff man pages massively more up to
date (by 2.5 years and counting) than what most distributions have.

> I'm not sure, but maybe (I always get confused by these things)?:
>=20
> [
> each _of the_ OverlayFS layers and merge hierarchies _is_ standalone and
> _contains_
> _its_ own set of files and directories,
> which is different from bind mounts.
> ]
>=20
> And still I'm not sure about the last "mounts".

Yes, I think that's an improvement, and "bind mounts" could be made
singular: "a bind mount".

Regards,
Branden

[1] https://lists.gnu.org/archive/html/groff/2020-08/msg00068.html

--yvkdh4iyhs7gp6a2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmEFVJ0ACgkQ0Z6cfXEm
bc5OoQ/+LkkfwPqKsKTBC9pSv0R0T+p4tpy1y6TmhcKm4rkm57gUR9qTit20cn3V
gvgFaBkmG1yDFFcWrf6bl1MzvuccCkUuDAY1z7bszmqCrGLison9mtwt+YVAzrFp
E+0W78llMoKmJWXyBrcqEllzWKboxxsOoORv2rgnXitVkPDHcPgNiuCiZL9qedX4
xYMpamr2beKytc7jmhHcAxsilJZbW611YuPTMgNEcuSQ0ykPEYpVvjyqA+m84hXZ
M9Mf/7MUISL+n5aJzimOhfJxFwrFgRM0XJ82RuiwpZw7P6dsC21HkqjC4NTlL6D5
hFhehboou1yx9jzV1bNkpktsnGH2Gx3zgHMqJNkj6gA1gqKz/7vAH1s5jzZMjAhL
CquPq3bUAcatoMdYe4TXKHjSP4X/KzY2d65dhl5FaQH5jPn6/IrquWSk+SMis4RT
zSqdCnLTDVWcD8K2qFusFDXD9L9Ndrq+FDkEEoj1fPdIOmzUkXitjIiM9W9qp9cn
WrugNd0d/wX6B3srh4fpEbr3IpsoUk0XPo6ZDczKN+EkihJLLPpzbEFA89fUUNxs
ET1mJ1hzTTbEfUv52eWh11fEDP7gUnp2F2PD0wJAVWHqQDfM1GI2hLpbQMJfxJEL
1tSdYGbRrpk6qwzxoe7/VU/tt8E/Pe6PMrZH7nf0WHmw6EdzEhU=
=ijqd
-----END PGP SIGNATURE-----

--yvkdh4iyhs7gp6a2--

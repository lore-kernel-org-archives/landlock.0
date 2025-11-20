Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6398213A3F7
	for <landlock@lists.linux.dev>; Thu, 20 Nov 2025 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763671539; cv=none; b=c+IvtIoeezftVK5QV/eNej6Qo/yqb/MyfvrgrwLL9MnF0Tr6gCnmB0c3qprJ6cK5gcUgdZCnA+p2i5bB/ene2Q3BppH39fHrSsIgOc269q7qXQ1swPwBKwLbZjJO1kqbwoVggiC/EOyta1znXr2jrtfGIxrcihtc5h00mLHg7xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763671539; c=relaxed/simple;
	bh=huCppskp8preQLSl9RLmlblTEwrlfBAW8THuA+7gXuo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c6aDA1ZW6gF6heKRXYZtH/wp+OMo/wWdzxQyTRk/PF05uOq+yWeGQiUDuNy8INuMPm3ocXJsv6IujRjSOCV4uHHSCCpQhC95+5zCRiP5XZfRN2XRuQ77ZKx1MHg2u6Y8HUCMi9F7E+vatYt2Sp/MyXcjOvo17n4f7ejVwhwzzBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=mk16.de; spf=none smtp.mailfrom=mk16.de; dkim=pass (2048-bit key) header.d=mk16.de header.i=@mk16.de header.b=bys+x/+I; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=mk16.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mk16.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mk16.de header.i=@mk16.de header.b="bys+x/+I"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4dC9CJ4VG7z4Crl;
	Thu, 20 Nov 2025 21:37:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mk16.de; s=key2;
	t=1763671068; bh=huCppskp8preQLSl9RLmlblTEwrlfBAW8THuA+7gXuo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bys+x/+Ii3GdfFCRzW3PB2lSvaOk+9VwqW+8ii8aWGTLLeR3bfhzQ5uSysc7QHmlD
	 xIyAnJ15wVD2cVqbsQHw9YCoLizC8W0GTX2IV4AOwi4wnutUXy8rPBzr3j41JJuVK8
	 mkh4IpAULY43SPzDdXpLR45KxKBV2gOA7orCH6H7Zk6hGcuKrm7Rc849IIarDqDAz2
	 JbhKiVyrP3jqwVyvRYXUbPmALipybQJFMMHdmcvJTgqfAgnwk2w13j0MVixL4cPej5
	 8aHCGauThQutxyvA2l+ruCjKb1uBDGNLRALnYr+l0gmYpClafojj2+c0FFG8EBAeTj
	 1oq0V0yW816dQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4dC9CJ3l1zz45yM;
	Thu, 20 Nov 2025 21:37:48 +0100 (CET)
Received: from mxe87b.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4dC9CJ1RPdz8svG;
	Thu, 20 Nov 2025 21:37:48 +0100 (CET)
Received: from ciel (dynamic-2a02-3100-7d22-b601-bd92-1111-75cb-18e9.310.pool.telefonica.de [IPv6:2a02:3100:7d22:b601:bd92:1111:75cb:18e9])
	by mxe87b.netcup.net (Postfix) with ESMTPSA id CBE681C0087;
	Thu, 20 Nov 2025 21:37:46 +0100 (CET)
Authentication-Results: mxe87b;
	spf=pass (sender IP is 2a02:3100:7d22:b601:bd92:1111:75cb:18e9) smtp.mailfrom=m.k@mk16.de smtp.helo=ciel
Received-SPF: pass (mxe87b: connection is authenticated)
Date: Thu, 20 Nov 2025 20:37:45 +0000
From: Marek =?UTF-8?B?S8O8dGhl?= <m.k@mk16.de>
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: landlock@lists.linux.dev
Subject: Re: Question about using Landlock
Message-ID: <20251120203745.32463645@ciel>
In-Reply-To: <20251120.aeC5eePhof6e@digikod.net>
References: <20251119211937.52cd76a3@ciel>
	<20251120.aeC5eePhof6e@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eeeeyaCyLpTj=GruAm/cyn1";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-PPP-Message-ID: 
 <176367106708.3915784.14373721515981210664@mxe87b.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: CBE681C0087
X-NC-CID: ZFmDjW8MbjmybtaC7VI6LTCJjC39MfEFyFeT

--Sig_/eeeeyaCyLpTj=GruAm/cyn1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 20 Nov 2025 18:36:50 +0100
Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> wrote:

> On Wed, Nov 19, 2025 at 09:19:37PM +0000, Marek K=C3=BCthe wrote:
> > Hello, =20
>=20
> Hi!

Thanks for your answers! That answered many of my questions.

> > When accessing the file system, I'm supposed to specify the fd of the
> > file, but then I already have that file open. And that's exactly what
> > Lockland is supposed to control. =20
>=20
> The goal of a file descriptor is to identify a file or another kernel
> resource, without race condition, and in an absolute way.  It doesn't
> mean it gives access to the underlying resource (but that's the case
> most of the time).  With Landlock, it is encouraged to open files with
> O_PATH (see the sandboxer.c example) to avoid leaking opened
> files/access.
>=20
> Using file paths for kernel interfaces should be avoided.

Could you give an example? I think you mean fd's that don't refer to
anything in the file system?

> Creating files before sandboxing itself can make sense wrt to the threat
> model (i.e. if the potential attacker cannot interact with the process
> at this time).  However, you should try to open the tap device before
> the sandboxing and keep the related file descriptor open.  This way you
> don't need to bother with the file path of the tap device and you avoid
> other potential issues.

Thanks for the clarification. I'm new to developing "secure programs"
and still need to learn how to create (useful) threat models.

> > 3. Lockland introduces scoped access control starting with ABI 6. To
> > avoid getting warnings from the compiler (and linter), I need to know
> > whether the struct landlock_ruleset_attr has scoped access control or
> > not when programming. Since I only want to support the case where this
> > is true, I would like to check the ABI version at compile time and
> > generate a more meaningful error. How can I check the ABI version at
> > compile time? Is there a macro for this? =20
>=20
> Checking the ABI version at build time is not recommended because it
> doesn't give any guarantee about the ABI version at run time.  That's
> why the ABI should be a dynamic check.

But I would like to have a build-time guarantee that certain data
structures are available in a certain form or that certain macros
exist. Hence my question about build-time checking.

> > Currently, I am using a check to see if the compiler can compile the
> > struct with `scoped`. [5] However, I don't think this is very elegant. =
=20
>=20
> If the scoped field is defined, then you should use it and update it at
> runtime according to the current Landlock ABI.  See the sandboxer.c
> example for such case.

But that assumes that the field exists at build time, and that's
exactly what I want to check.

If I try to initialize a non-existent field, there should be an error
from the compiler (so I want to catch that beforehand). And if I don't
initialize an existing field, clang-tidy complains.

As far as I can tell, sandboxer.c always assumes at build time that it
has been compiled with a new version. Or am I overlooking something?

--=20
Marek K=C3=BCthe
m.k@mk16.de
er/ihm he/him

--Sig_/eeeeyaCyLpTj=GruAm/cyn1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEmqKBWfzrPNg7whIBfoaRRmmRCMcFAmkffBkACgkQfoaRRmmR
CMdTtw//Rx76J7rhN29Mp8ptokaoe+yTAIEX3Gs9EDkUtyQPTNxD0ATonj+H3wmp
DF2aCZW+RVP5hqgILDuvVHcIpAPMbOk1EqGyH7uZDKgiU31Dq7ECthhZT2KMCXJf
g/tUuyZ9UUe5Ep/iVe5zqLOCVARQk5vZ/fFiOflS9fjc2xv089b9lxyMnexK6+A+
eV5LwWd5293VKx6ITeSArX/ziAO/wAwUm2ZkwZyGDSIMAQ0xbsa/DZSy30OCCTAf
Le8WpL0sBR2CQxxm2WqYPXdI4vNAjEeNm1l2stLqKmlxj12m7j6tj0YKTBZxRjv7
GUQkhKA23qCI7erLipMREx7Vw6ffVVtDpfebn2+2KWfhHXNoSxZ+0M2Zs74C6qSU
RBcY1nwnaLJa+Lg1dtb0Jg2wcq03mHPuX59Jyfln6LYURXnvcmXJBk3R7ddw+dK3
h7tqSajK5Y8Wx7w2M2+zeKB2qtxtZECcvjANyVgKGJ4UJKTSPtx2Uz6LZWCeIfs1
ympgCCWuiOOSH4/qQ3j/HDaCKAhmNUXsI5T8iGQHG7fGMDuc6hK9OjTQJyp6sH0s
gxcsRQtsrm1ItvNW6O5puXu3RAGpGQWRRhcfuvJA3BkzPg+P+KgwM5JO5T3SIsFT
l0U48J5QEC3iIjxlLstrljZ4cEqVMMwTGIrZjaDSiT2ZjhGOmac=
=Rw+h
-----END PGP SIGNATURE-----

--Sig_/eeeeyaCyLpTj=GruAm/cyn1--

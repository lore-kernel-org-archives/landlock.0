Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFFE296BBB
	for <landlock@lists.linux.dev>; Wed, 19 Nov 2025 21:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763587191; cv=none; b=Sa1ZIZ8Z+blgOfOnyE9rxL/WbcQGCA0CZjExPfw7cNDYOjm2dzNXXfndNTqTiKJJyNHFvytOIh+N3A7yl97GZKqtvuz3w4FjpOk71lZ/F1L/fE/02U1tld65EQtACWrl4884THfxOog0pQ2MlfFNkqHhwEXSzQI4fObvOo+4Zy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763587191; c=relaxed/simple;
	bh=l/CJ0rPr/nn40uDYN2Y+Sh5UrW9PvXMM9FXWJTnPYKI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=OBApuY0wjWqYnsQBkPBtyRGVk3ZSMpQpy0FhEWT4iTUTjiOd8yMV7+AEWEOCv0SIYJLpEe5SZJ4FAEJMowLD3BGtSQ+AGY+7qiuGvcwwHbgVhGqTiXkllsnlRmXr1Ogbpppx7MktKhmdpCKR+U5lbSb0TGNRzYvBg75oUbitzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=mk16.de; spf=none smtp.mailfrom=mk16.de; dkim=pass (2048-bit key) header.d=mk16.de header.i=@mk16.de header.b=KcNeJxas; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=mk16.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mk16.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mk16.de header.i=@mk16.de header.b="KcNeJxas"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4dBZB35M6kz4C3t
	for <landlock@lists.linux.dev>; Wed, 19 Nov 2025 22:19:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mk16.de; s=key2;
	t=1763587179; bh=l/CJ0rPr/nn40uDYN2Y+Sh5UrW9PvXMM9FXWJTnPYKI=;
	h=Date:From:To:Subject:From;
	b=KcNeJxasY4NenB/cB27K336CggzssvDX0eBj1Q2SaJeOs6D85yd2mQV7+2AGAzsUL
	 h1Zq7foUpiecMgo4jEdr2D+HTMY7vxiSJ4xcSSf1giugxX4H95gsHsJTORsv0B1Zfm
	 AtfSbpe0Noul8eY0g+mesj15zeQW3dtVGKAU8A4GoQz/f0+gnOdOVdjLYfe1NhfUD2
	 pCEZM6Je9urceijvabQe0rKsNII6pE13IsyUKl7GX/Lai9t8q3oACeb9KiLakisGyz
	 DHrbc9Yy67egmI+Q+23Ex3r9YEnYrDYxMry2uJpnAbALqkY0n5k9EZzrHIbi+y+RMn
	 vLDco53whyasg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4dBZB34fSXz4C1l
	for <landlock@lists.linux.dev>; Wed, 19 Nov 2025 22:19:39 +0100 (CET)
Received: from mxe87b.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4dBZB327vJz8scM
	for <landlock@lists.linux.dev>; Wed, 19 Nov 2025 22:19:39 +0100 (CET)
Received: from ciel (dynamic-2a02-3100-814b-9a01-1524-a8a9-acba-e96e.310.pool.telefonica.de [IPv6:2a02:3100:814b:9a01:1524:a8a9:acba:e96e])
	by mxe87b.netcup.net (Postfix) with ESMTPSA id 20EE11C0048;
	Wed, 19 Nov 2025 22:19:38 +0100 (CET)
Authentication-Results: mxe87b;
        spf=pass (sender IP is 2a02:3100:814b:9a01:1524:a8a9:acba:e96e) smtp.mailfrom=m.k@mk16.de smtp.helo=ciel
Received-SPF: pass (mxe87b: connection is authenticated)
Date: Wed, 19 Nov 2025 21:19:37 +0000
From: Marek =?UTF-8?B?S8O8dGhl?= <m.k@mk16.de>
To: landlock@lists.linux.dev
Subject: Question about using Landlock
Message-ID: <20251119211937.52cd76a3@ciel>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/othNkk7hQ9GIp7C7o8luXcX";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-PPP-Message-ID: 
 <176358717842.1374998.14817458035712674824@mxe87b.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 20EE11C0048
X-NC-CID: e+vVkuRHDmPADM1nAUaZFiRnafvJ+Tbby7PF

--Sig_/othNkk7hQ9GIp7C7o8luXcX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to use Landlock in my program to improve security under
Linux. I have a few questions about this:

1. The documentation uses the Landlock functions without syscall. [1]
For example, `landlock_create_ruleset` instead of `int
syscall(SYS_landlock_create_ruleset, ...)`. In which header file are
these landlock_* functions declared? My compiler says it cannot find
them. As a workaround, I currently check whether these functions exist
when configuring the project [2], and if not, I create them [3].
However, this workaround also has problems: syscall returns a long and
the Landlock functions return int, which means I have to perform a
conversion, but there is a possible loss of information from long to
int.

2. I don't quite understand how to add rules to Lockland's rule set.
When accessing the file system, I'm supposed to specify the fd of the
file, but then I already have that file open. And that's exactly what
Lockland is supposed to control. Another problem is that I work with
several libraries: for example, `yaml-cpp` to read my configuration
file, `libtuntap` to create a TAP device, and boost.asio to read and
write from this TAP device. These libraries create files without me
controlling this with my own syscall. How could I integrate Lockland
there?

For example, I create the TAP device (before Lockland controls it) and
then try to restrict access with Lockland. [4] However, I am unsure
whether I am using Lockland correctly.
```
tun_tap dev(config.get_device_name(), tun_tap_mode::tap);
[...]
landlock_ruleset_loop.add_path_beneath_rule(LANDLOCK_ACCESS_FS_WRITE_FILE
| LANDLOCK_ACCESS_FS_READ_FILE | LANDLOCK_ACCESS_FS_IOCTL_DEV,
dev.native_handler());
landlock_ruleset_loop.restrict_self();
[...]
const Crazytrace ct(io.get_executor(), ::dup(dev.native_handler()),
nodecontainer);
io.run();
```

3. Lockland introduces scoped access control starting with ABI 6. To
avoid getting warnings from the compiler (and linter), I need to know
whether the struct landlock_ruleset_attr has scoped access control or
not when programming. Since I only want to support the case where this
is true, I would like to check the ABI version at compile time and
generate a more meaningful error. How can I check the ABI version at
compile time? Is there a macro for this?
Currently, I am using a check to see if the compiler can compile the
struct with `scoped`. [5] However, I don't think this is very elegant.

I hope it's okay for me, as a landlocked newbie, to ask questions like
this here. In any case, I would really appreciate any answers!

Best regards,
Marek K=C3=BCthe

[1] https://docs.kernel.org/userspace-api/landlock.html
[2]
https://codeberg.org/mark22k/crazytrace/src/commit/c9b3a0e51fadece1228f1f92=
522dccf0115df84d/meson.build#L101
[3]
https://codeberg.org/mark22k/crazytrace/src/commit/c9b3a0e51fadece1228f1f92=
522dccf0115df84d/src/landlock.hpp#L14
[4]
https://codeberg.org/mark22k/crazytrace/src/commit/c9b3a0e51fadece1228f1f92=
522dccf0115df84d/src/main.cpp#L163
[5]
https://codeberg.org/mark22k/crazytrace/src/commit/2580137d0d57b7261bd0e22e=
11853e9e75c2c2a7/meson.build#L122

--=20
Marek K=C3=BCthe
m.k@mk16.de
er/ihm he/him

--Sig_/othNkk7hQ9GIp7C7o8luXcX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEmqKBWfzrPNg7whIBfoaRRmmRCMcFAmkeNGkACgkQfoaRRmmR
CMcqZg/+LopRDXWziRPm8iPFgdkgFjs+/i/RRMazqX27QLIuidt06NO0Xogjmus+
HExfw+IWetMjbmCROQme4qj7LFLu7meYWZLnyMflqjqu7Xe1o6W53Xt0xQ9uP/Li
VTKWTMK7BfEWTd0LWL6stykJrwyRiHXBXQSQFKp+u9r3LqcIdFGIfAPSaoT0xxh0
Kzxo0QRv9jdh3KTdHx5dwl1/idLgAKgwrHHL1xS6lE60Vc1VA/GSn6/AhzSTYnRz
KLfqNEwHjy4nlP0tekLg/4Uh/y8VU52NyaD5QSsLvDcuCmgm43Th0KNncz/hBdC4
CUN2wxoMzNsXbHkxcg4yjC5rJHgtzGsNWqF3o/igo+yH6m6+Q8iEM6ocNx271I7l
ImR/Et+Rn59a8Fx46c57aOEuuBuO38K8MW534vP0pVr6R1T3zeW989S+Ydlp0D4O
y3XJykx9K3l84EybsNWdnAh6xoBBRA4KXCrWFEFJNIYX8TK8o4b8pmRAOKW+dB9V
2perdiMxTJ09PKSGWRPq5l2cJCPhPJPbH2ZE4rri9qzzqtzNnRBDWhQwkUXFFo6L
jo5ecFVRcQRW1bVcqF/0TjD0+ZR92ulziDwjjvq2cw7nlaFSo6uGNPs4OsIggW7g
HqLos2c7pkXSOtJWqC3bjVNwEhr8K39VpWly9MOIXZj8vyyPVn8=
=T3fZ
-----END PGP SIGNATURE-----

--Sig_/othNkk7hQ9GIp7C7o8luXcX--

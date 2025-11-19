Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E722425C6EE
	for <landlock@lists.linux.dev>; Wed, 19 Nov 2025 21:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763587633; cv=none; b=gKkkskm145b9YANOUKdYM0ilvAl5SldcdLqcjxzDcz83vRbqPqZ0hKJ1hEFczQ72yHjt0kRyWwVHA45BOy3YkImi9m2lxYiZrJVXCP2ODmdIJWTtedJP9Fx9e5pS11xRNVWXmnwxmJo66gDd2YhrX+gIHDC8wf00iFFWeahdva0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763587633; c=relaxed/simple;
	bh=CgvQ6fU5/fvjvGIQm6Hl4wfKFomlAY0of/dmUXV3ZTU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=mEZHHhtShb26yU9MIuLHXE5oPcePyNO8ieOhNXv/9UvRDiki3I3VTOu3kHHY4X4KeWBRhbBnQbvwWfEyKv3tHe0bT6EVmQRFvpAW9lISC83AUaLLQ8ZgwUhxcf74r3dFhRxSIxfTL4KkQti20ZVA+6GNBEoV8GObAFBcuipNKE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=permerror header.from=mk16.de; spf=none smtp.mailfrom=mk16.de; dkim=pass (2048-bit key) header.d=mk16.de header.i=@mk16.de header.b=azja8FCC; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=mk16.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mk16.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mk16.de header.i=@mk16.de header.b="azja8FCC"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4dBZLj3RtMz4BXS
	for <landlock@lists.linux.dev>; Wed, 19 Nov 2025 22:27:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mk16.de; s=key2;
	t=1763587629; bh=CgvQ6fU5/fvjvGIQm6Hl4wfKFomlAY0of/dmUXV3ZTU=;
	h=Date:From:To:Subject:From;
	b=azja8FCC0mYtBiX6QkbL006KZxlNer+9jWmgUf0f3gbuMVhlHgT5mqI/7fVW4l6hf
	 Kc5qii+5u5wM2vysCjnyke5h96N/nzuIBydFTWu4ZLfGvXzGsPff2f4U3bnvWj8Yli
	 oI4aTkhuDjSh1w1ZBVFwjY0VfyhepAJyymI0JIdNQiGutYwZx12CCXRZXQM7/9GqXj
	 96Z/z4bvsk/sjSMd0EmGAgekcDgAyIWflWTmProZErUuwdTIvqDRlTKZmxjxzToac1
	 z44w98vEJT/ejk+cXhabiLO2gjmzJCQPbk/lN1TN2vUWNKKaGSxOiAMGkryJN40KZz
	 dVjysygf1tN/Q==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4dBZLj2lW3z3xTN
	for <landlock@lists.linux.dev>; Wed, 19 Nov 2025 22:27:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe87b.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4dBZLh5CZ3z8sX7
	for <landlock@lists.linux.dev>; Wed, 19 Nov 2025 22:27:08 +0100 (CET)
Received: from ciel (dynamic-2a02-3100-814b-9a01-1524-a8a9-acba-e96e.310.pool.telefonica.de [IPv6:2a02:3100:814b:9a01:1524:a8a9:acba:e96e])
	by mxe87b.netcup.net (Postfix) with ESMTPSA id 11ECC1C0048;
	Wed, 19 Nov 2025 22:27:08 +0100 (CET)
Authentication-Results: mxe87b;
        spf=pass (sender IP is 2a02:3100:814b:9a01:1524:a8a9:acba:e96e) smtp.mailfrom=m-k-mailling-list@mk16.de smtp.helo=ciel
Received-SPF: pass (mxe87b: connection is authenticated)
Date: Wed, 19 Nov 2025 21:27:07 +0000
From: Marek =?UTF-8?B?S8O8dGhl?= <m-k-mailling-list@mk16.de>
To: landlock@lists.linux.dev
Subject: Question about using Landlock
Message-ID: <20251119212707.71275873@ciel>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mzhwyBeOwpCCngJRl2Ur4bK";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-PPP-Message-ID: 
 <176358762834.1375869.14680462565367161704@mxe87b.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 11ECC1C0048
X-NC-CID: bPwln9kdHu0Ho1kCH77uJfgBvwgDmWT9qmfjFrMfSJAz70RvYHZFfLE=

--Sig_/mzhwyBeOwpCCngJRl2Ur4bK
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

--Sig_/mzhwyBeOwpCCngJRl2Ur4bK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEmqKBWfzrPNg7whIBfoaRRmmRCMcFAmkeNisACgkQfoaRRmmR
CMd8lw//Z0hf6IR/FlsCWs1IthbhlaH6emTze4x1S900cUceOaEmmNFkp352Y/YF
qs2Q5I4yLr+99UyM9Aw6UVG2u6dFHR06e+VZ8NG1Vpfbrl4u10R6sHof73UOm675
bXvFrK6Kg6DdsGmRu+6eqISvZsKFJ+5rOFyWkpfvJfcYUBNvP6O7B+TbYw6y4MSD
HhF7CS/V1ULL/EugRwhijP/w9cszI+S8gyI7K4vUNZWTQkjVU9vwByTw5TAjnfcV
1FiFvF78HJRjZqycnCn46IBbzWtArA+AIdaTg/2vvpAToTyKIBNfsx2yhAr3nHkg
1w3h/V6+lIEBg7nSROjmuruil2vt1Je0wzm11O4c+cbvWCJo7GXl5E0EYjKos1xz
HoYUbNa0ngm57EAREOksbQD9uhfW7ltJJHaBpuoY1y8nF6q5QgF7MBrO1O2SNxgM
U+7Gh2KNHdzkm15DKZqF+yEgNac6tZm+ify4THgn0vjqDF+4tpcAlDbGmUVQHIwv
Fb33Hr+TY5MKwmqlkMM/hEUfLZeiaMBUW56EYTtBipq3SeRswaItgH3ZrK9EyoC/
lcejJ5A0CsuFdcfer0XI555pJldwtNrPEmTIaDE73I5HrTp1n5S57no/teL/0WRU
J4kY0YH7IYn4nmgCOtTqRuEx8tOvVa8eyG2TZxAlNFyv30mB/eI=
=pb9e
-----END PGP SIGNATURE-----

--Sig_/mzhwyBeOwpCCngJRl2Ur4bK--

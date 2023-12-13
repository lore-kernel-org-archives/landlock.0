Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBECA22EE2
	for <landlock@lists.linux.dev>; Wed, 13 Dec 2023 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DneSKocc"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-a0c510419caso150983166b.1
        for <landlock@lists.linux.dev>; Wed, 13 Dec 2023 02:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702464550; x=1703069350; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3urx9slzcD/Knuc1nKGk8/e4AJd7p5xva/nD5OK99sk=;
        b=DneSKoccFHbBLS0yI8grJfUnFMsv7kWo8xgkIwNwpeeLtXhy+K1iB18nGnLXjrxHGc
         PiQz9mYxTp8Ym7NiepfL+jESCsJc8W4SZYdFYUJH01ZmAQ1VE6nHrKZQcRTfiiFipM96
         Fk68xTskXtrRkMmK0B+CIJMlVT9GGRbeunUJTXne5W4Gv5VduLWRB67SxTCl+gxWXEfm
         eC14q4EETShEW7JFSmQXO2r1SP9NNqBkWp+O8Z2l1tX99MwDZ5wn+l1/nEeQEh0FlVq/
         NjRDKqJKgQQXs13LpmFJZgqbp12RjmHixm6Kp2+zybmnPrXludFrdiHKpBAhlM/PX1EU
         mQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702464550; x=1703069350;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3urx9slzcD/Knuc1nKGk8/e4AJd7p5xva/nD5OK99sk=;
        b=sncfzjaOLLY48h9+CqsfnkHz+teT2OelMM/K9sZ7RMxUI8QNsesjcXNDUELA7rTsPM
         TvbaaEjeXx+7N574sN6vEDd21+dn1NXrxMOdk/ousDPWrI7GebIvb8UGlYExinl97E9J
         UGEgDcC3mbyJF3LPnTNGcsSRRkOmqCg5X7TArPmDkIcZxT+o4VqewJ6rn7Czq1kzxD/I
         /nnvZxCfmOA5VmezgPGbNqPSq4BvQLkLgyI2RkcNzmzEBl9bSc89LC0FEcNcGIoryPJ0
         ubkQX6UdQr9xHhLBSUCeTEC/VYsT6EYzj9WYOMVqcW0nAQQlSzJ+UaU8Ach8dJ+KdqWi
         8t3w==
X-Gm-Message-State: AOJu0YwhYwpxZsHi4hYMuFbDz3Zucm8KycJIZ4jqL9B/tJ+8oLNHE6/c
	LX5lRMfWcGIDTLbFxPoqLqwNcVC/7w8=
X-Google-Smtp-Source: AGHT+IEw6VaFle9FwKFpdvMMX4LdrQ9gw0opLLgoInBZlJ9yw0WPOXRpnlxjUvJq/+D84pBAogqYfM6+Mso=
X-Received: from sport.zrh.corp.google.com ([2a00:79e0:9d:4:fb3d:e0ca:728:73f9])
 (user=gnoack job=sendgmr) by 2002:a17:907:76f9:b0:a1d:577d:eb1d with SMTP id
 kg25-20020a17090776f900b00a1d577deb1dmr34850ejc.2.1702464549858; Wed, 13 Dec
 2023 02:49:09 -0800 (PST)
Date: Wed, 13 Dec 2023 11:49:01 +0100
In-Reply-To: <6cebaa86-f2ad-423d-a189-e3cf7ee5f4d4@t-8ch.de>
Message-Id: <ZXmMHfxlnK4AVvOA@google.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <6cebaa86-f2ad-423d-a189-e3cf7ee5f4d4@t-8ch.de>
Subject: Re: Landlock support in setpriv(1)
From: "=?iso-8859-1?Q?G=FCnther?= Noack" <gnoack@google.com>
To: "Thomas =?iso-8859-1?Q?Wei=DFschuh?=" <thomas@t-8ch.de>
Cc: landlock@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thank you Thomas!  I am excited to see this :)

On Sat, Dec 09, 2023 at 10:18:50AM +0100, Thomas Wei=C3=9Fschuh wrote:
> Hi everybody,
>=20
> For your information:
>=20
> There is a proposal to add landlock support to setpriv(1) from
> util-linux.
> While landlock is meant for self-sandboxing it can also be used to
> sandbox third party executables which makes it a nice fit for setpriv.
>=20
> If you have any remarks let me know.
>=20
> Link to the PR:
> https://github.com/util-linux/util-linux/pull/2628

For inspiration, here are some other existing tools which have a similar in=
terface:

* landlock-restrict (example tool for go-landlock):
  https://github.com/landlock-lsm/go-landlock/blob/main/cmd/landlock-restri=
ct/main.go
  (This one was written by me)

* sandboxer.c (sample tool from the kernel tree):
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/s=
amples/landlock/sandboxer.c

* sandboxer.rs (example tool for rust-landlock):
  https://github.com/landlock-lsm/rust-landlock/blob/main/examples/sandboxe=
r.rs

In my personal opinion, when I was sandboxing a few programs "from the outs=
ide"
with the Go tool, I often found that I would start out with a more coarse
ruleset that uses the predefined "convenience" groups of access rights, whi=
ch
are called "ROFiles", "RWFiles", "RODirs" and "RWDirs" in that tool, and wh=
ich
subsume all rights except for the "Refer" right, which is a bit more specia=
l.

I think there is some value in having a mechanism that let you use such
abbreviations for larger sets of rights, to make these tools more approacha=
ble
and less verbose for simple (coarse-grained) use cases.

Another main concern to take into account is the question of backwards
compatibility across different kernels: When a user attempts to sandbox a
program on a kernel that does not support that specific set of access right=
s
yet, what is the fallback strategy?  For the Go and Rust libraries, we have
found that it might often be advisable to fall back to a "best effort" mode
where we restrict as much as we can of what the user asked for, instead of
failing altogether.  But it depends on the use case.  I imagine that an
installation of util-linux will need to work with older kernels as well and=
 does
not have a strict dependency that ensures that it'll only run on new kernel=
s.

Backwards compatibility is also discussed in the landlock(7) man page,
specifically under VERSIONS and EXAMPLE.  I have also talked about it on my
personal weblog at https://blog.gnoack.org/post/landlock-best-effort/ in th=
e
past.  Specifically double check that you are getting it right for the "ref=
er"
right, because that one has unusual semantics compared to the other rights.

Thanks,
=E2=80=94G=C3=BCnther


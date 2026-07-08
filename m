Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BEE3F8706
	for <landlock@lists.linux.dev>; Wed,  8 Jul 2026 21:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547330; cv=pass; b=or59i3WFuA0hoH2RYSTdys/pWFldAH0rJBeqTD171Y1bLuWyzYcPvYjIXzc/JO5kfrqBkhbKNQRV+9CB/owo5Wd6BWloFvIBiVPBM5DHzgPGLd66r9GxD/4tv4zI/f/p9saDBxm7WbwOj1rudXHa9DXLEaOBLGDEPAYD4NM4jOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547330; c=relaxed/simple;
	bh=NLMDF7I6FstMAQAeirtdi6wuSf+np5zuq01Umjpc8ow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obVHnW8/YoH+dxL1jf6KavFcS9Gq4t/z0OQIZ0pwA+7f8hchXlGQ2S+KNePlG9VlRvwPwp4g52t8BfAyMUWZNxSILs7UsTjlewS3GEOUZ2CgWS4uZaxDRl8GKqONiW6mmFrw+1uyL543w3Nof5Fdc3HMxLS4Q5LF7eIYv8dnSos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wcn+V662; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wcn+V662"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-698411099d6so4153a12.0
        for <landlock@lists.linux.dev>; Wed, 08 Jul 2026 14:48:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783547327; cv=none;
        d=google.com; s=arc-20260327;
        b=sy3cs59ex6M33xTqJWGnrdpfuJ+GLO06yP4ehiN/9P3tVbu4eAamXIgzYrTWiyS6hs
         Y82WhQ9g8DkB6cJwBfxNC8SHmYqidcdFrN/i1Xanlnf7RxvTBJPMDfSai/gX2JHTdhTl
         bJhT78kxvo50zdKuQYbAO/B4NfFBT3htVU0AL0hN73IuO0uXXePJwyXMtCuAQFuNaCgU
         lv05pZ9EfSk341W3RIrF5eOqyVyFvMBBlWIh4Y4RRHC9BjtkCSkwlKkqC+kLyfRAEBvH
         0Ll/Vd8Ksy4lpJYW9crzIM94QPgJs+3MPlNU43JODf2lzUp3RRgAVXGl3R+vIVLMX03O
         06xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DKUZ0lFg17Mh7sHmvQEAtUOIrfiiXO1vlZnioYWzL2U=;
        fh=zDYU1OGP7IpOB0pDThJg5lkZNSCxmtYpeHHIoeMX67Y=;
        b=PYwwMCMBX5NllhlR2JHrAM7CrWvfHwDsdhxDgZzYGG/3gbWSUpJc7hPGg2IzP/muE9
         BIrL/T2x60YfnHFgsRsfOVzKb0QXVwNspvBXSJZsY/GLwvfEqyDOJq8lo3OLp3IRzwxZ
         /rP1BuL2oilOIZWcYZd6zPWpiwKlBmgACNL2zXt3kXywblJkWmtnq/LkVoZNL8NXXjDg
         8Ll00snnMI1KoEqL/QQpv21TBpoTI9XWE71NeYNqOUljaXWMpugB56z+o/EWF/XSFvB4
         a0SazCIek1nvW8MShFYKrcfjmRX15vKrTpooOBIwhTnGVl0OPPV+m9jxUaglFz5rBaJw
         x7sQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783547327; x=1784152127; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DKUZ0lFg17Mh7sHmvQEAtUOIrfiiXO1vlZnioYWzL2U=;
        b=wcn+V662eMIlvXMjCikyoZeQXSWd0bjcUmNM1ufTBE6R3mnMtdEHB1EaHFyaMWuOs/
         svcdD9Tt26vXRXm8U7VbW/IZtprrF2DMrqL2aWZrleaIjOIQgjUd7I01PKI2Bn6tmafX
         L4vy9SW3DHGVoOpet6/0z8OGsnfdmb1TmgOvOEbK6LPVEG4LKXbty871V5vT15OyySns
         BTuR8d/T6fHNotknXCtzMLdNnOEoHz7IP2/vlUhJEtC6tASjtblp8IZlbArb17f0bkmh
         rA0q76Y0S+5MiHLhz6zTVOAcGJ6GsgyEOPJwPVdLhq9/yzDWL840tdU9x3j0pYYw4/7m
         OL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783547327; x=1784152127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKUZ0lFg17Mh7sHmvQEAtUOIrfiiXO1vlZnioYWzL2U=;
        b=ZcKOR5e6pKosuemcaWqOi+UFnyA/JDIBwBosik0Xxa+U6towIqe4nFF4MPKAghJcOh
         CAG+FpGyee87PSD4UBjDqiin8yX8tI9JbN23O60Mnfjo3/ip4ETVTG6EdAdnbUC71IF2
         1WGMNcK1U5t/dVBa/U1bXFD2IUuAY2p5ruFKQ0l4+l94CJO0vhcX3jaVjRHVCgEftVg7
         bebQEyN/vb8lMj+R5ziVoUbU3/uTWXFnyjIeuUuEwtWg7UCFmXjo+yz2jku8YG8kx4aT
         xG2jOKrt9yovxOn1DIKwiYPAglS03omo4uRltAYkQ2uJWChjxDxZ+HXnTgOKtYYPKyPV
         CsZA==
X-Forwarded-Encrypted: i=1; AHgh+Rrj6MBrhyG0DYHnPgw3biGaz5TNpENqb9I5c1GARln2OiPaBbbpQKkw2zAT+Rh5vZnH17R+0xq3Yg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCxjhla3abJ2IoZrU1cQzia8pIUswzXr3dr6+KlUsjZuwjuxZD
	IWaEtJU5i1Y6wtPurgVD0Rmj56KK2ODE+ZIo0nmzYtmRLN50zTfLKd/o3TN6TrimlkR1GZeCn07
	O8kedfgmvxdooBqoHAS/PYBhvdTc5JeM0mQ3Sjk35
X-Gm-Gg: AfdE7cm9tklUCXKlaREGEeVT2OUL2T7w0puuhVev7sk71/zWJYvKMCCdpvbYvtL5V4W
	r0jHI/PCitf+fTIRDOC7VWCYyilk25hWnlCIF5+kCqwe9jDQ+P66WrTjNliZEi8GlbkygHIrDK+
	d+BnToYmoSnxaUpseOJDcquADioTPYZ/VLHIWLbHncMsdueqAufsXX6iMGE0h7/EfNR2xgwmPBl
	zS4ip752tWVMfmmWQLipLnTiXoG4mMlxcLB6IL90q21M+bvg1lxyZ03z3Ld9R2X+QsfidNqvCJQ
	ZK45YteHHBSdLXdF2fOl4nDze6nuQT6qhsvrRaItBANkqVvc4ePX7XBWpX6cUkePOOQH
X-Received: by 2002:a05:6402:2053:b0:69a:fb2d:e84b with SMTP id
 4fb4d7f45d1cf-69bff1b2bacmr4833a12.9.1783547326726; Wed, 08 Jul 2026 14:48:46
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707210336.2060040-1-mic@digikod.net>
In-Reply-To: <20260707210336.2060040-1-mic@digikod.net>
From: Jann Horn <jannh@google.com>
Date: Wed, 8 Jul 2026 23:48:09 +0200
X-Gm-Features: AVVi8Cd70VXTPmi6Yd7YJ6QWdP__iVuKDOVFxgYsM6z5t2MksbTZvyWjknkN4Wk
Message-ID: <CAG48ez3ywK8FZ-TZFzp1GwiW6Wb+DeO3OFt3Ys4QAeGTS0jv6g@mail.gmail.com>
Subject: Re: [PATCH v1] landlock: Document the threat model
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc: =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Bryam Vargas <hexlabsecurity@proton.me>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>, Justin Suess <utilityemal77@gmail.com>, 
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, Leon Romanovsky <leon@kernel.org>, 
	Matthieu Buffet <matthieu@buffet.re>, Mikhail Ivanov <ivanov.mikhail1@huawei-partners.com>, 
	Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, Paul Moore <paul@paul-moore.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tingmao Wang <m@maowtm.org>, 
	Ubisectech Sirius <bugreport@ubisectech.com>, Willy Tarreau <w@1wt.eu>, 
	Yuxian Mao <maoyuxian@cqsoftware.com.cn>, kernel-team@cloudflare.com, 
	landlock@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 11:03=E2=80=AFPM Micka=C3=ABl Sala=C3=BCn <mic@digik=
od.net> wrote:
> +Sandboxing is layered
> +---------------------
> +
> +Landlock is the access-control layer of a sandbox, not the whole sandbox=
.  A
> +robust sandbox also needs steps that are the program's responsibility: s=
witching
> +to an unprivileged user, dropping capabilities, setting ``PR_SET_NO_NEW_=
PRIVS``,
> +and confining all threads of the process with the same domain.  A
> +single-threaded process gets the latter for free; a multithreaded one ca=
n
> +enforce a ruleset atomically on all its threads, or must otherwise synch=
ronize
> +them before any untrusted work.  Landlock is typically applied last, to =
tighten
> +access and make the domain identifiable and auditable.
> +
> +Stronger isolation can come from combining Landlock with other mechanism=
s in a
> +defense-in-depth approach, notably seccomp-bpf (see
> +Documentation/userspace-api/seccomp_filter.rst) for what Landlock does n=
ot yet
> +cover.  A long-term goal of Landlock is to control access to any kind of=
 kernel
> +resource in a way suited to sandboxing.

I think this part is something that should go near the top of the
document, and should have a title like "How to securely use landlock"
- most of the document is focused on telling kernel developers or
security researchers what the boundaries of the threat model are, but
I think it is also important (and maybe even more important) to
present this from the perspective of "if I want to design a sandbox
using landlock, what do I need to pay attention to".

I think it would also make sense to give more specific guidance on
which sets of syscalls, with what argument restrictions, can be
permitted in a seccomp policy because landlock covers any accesses
that these syscalls can perform to objects to which the process
doesn't already hold file descriptors or such.
I think it would be helpful to have instructions like "you can safely
allow socket operations if you ensure that socket creation (socket())
only works for AF_UNIX, and that the process has no existing socket
file descriptors for non-covered socket types, and you have fs_access
rules, and the kernel is sufficiently recent".

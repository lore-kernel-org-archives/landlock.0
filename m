Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2697024BBEE
	for <landlock@lists.linux.dev>; Mon, 15 Dec 2025 08:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765786847; cv=none; b=kduE/8OIp6QvYn+XtbrKp3pcejbMhzC/VD6x/WxQQAk9A39aw+kCuHvFAKfWJwyDbyxM44umty2K9oEd727TeG+QZSCJEN99yaZvuhJQyJfj4LL7zEQlt7lk3OA7UDHjLPTTwu0P+667IHSbCMaue5w4Lk07XfXvid7tcT2XupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765786847; c=relaxed/simple;
	bh=rcU4d97lWtMf3DEfiltXTFZdIqm9tsRAbfAUfedHLa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQ/92S825Gc74Im/QJ4VaIAjfTRto7gKvfdPt5yuE56MVaQpkhwwqD8W6+tSNk1v64LzJ0eq137WxAbRR5NtUq8hAZ579OKOmWoeBAqCbcc7pb/U6XrNsepABGCobupRt41WFflachWWzd/N+jdC+fUcEsdcmq8G913qXmBHyhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4zf93Fh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4zf93Fh"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so534076766b.2
        for <landlock@lists.linux.dev>; Mon, 15 Dec 2025 00:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765786843; x=1766391643; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MgAwxLQKS49ovdUATm1n2L7redIdsOV7iEU7UKKm5tI=;
        b=T4zf93FhJysrhVsqDhxXRn/hc2X6P7sr6zn5bmnL4JUnVUHONZqNrVUsuMJIT8unJf
         93FGUsJwEBxHEugS12DTxGWxk8oWz5junSfNHvYaUWiLK7J/3ZN4hsz2RS7Aqomp3Ybv
         c9/SogvKBQPjAiZudrg5rIV9iBKtQPlv4QWMOumB/BV4WIiDo+J/tFETTke4H8/4MqSW
         tRW8L0zjm0XdKvLcZ09jSYqEkneuODFCJH638K01uIueSp0My+z9HMXfUF0le2CIno3W
         sHFT3YqO0Hq9fDcQavuioUHmR+Zq1Xe00MmkuCx4MgndkckKWiMxV9hWIiBDWtGmdzlf
         pk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765786843; x=1766391643;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MgAwxLQKS49ovdUATm1n2L7redIdsOV7iEU7UKKm5tI=;
        b=Z3OhI7PPpm9KQQuLw5hJHJ66zLKDLviU/+k4bFMmaj4drVzvKC8RNan7KH4pNP9sCM
         Z24FXDy6DBk4JFfBlr+PzBmfb5h0mwp9q+Z+5nYc0Tt6XzGw4mSuykYmwj8Eer1VkgRC
         FRVXbxw3dTgSFLVJEI+DemFGykBer4e+EL4Iw/ykLPDd5Btktfvy0l564JmasxR8r8Oe
         bpa3B+djnVQtEDQCMHtsYitN8aB8aVa1qJ+L8RrI3xAwuZ2wj9+rBEZ8O/ATjrFIbIr7
         KksLdsRqn6SlMgKhKm2iy/Hppv7CmJqDE2h85tv2/oXsSxfaUUux6Qhhyl9n1hdifpL9
         tWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWNBMGg90IopkR3XYhisGdZk77bXkGH1ZYwxaxo497PfhTzSxsi4qNEVMKOQKenfzlyt/KgOuEXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOc4y0/t5Vf4SyNL0+YgY0FeAu63Moh0YtepRW2VIKn8RnESbW
	mWXx2EFcc6Y9h9TSmfkpJ97/kTE43NjDLk/8KeWK/Z7s8IDih2qOIWHVzCbIDg==
X-Gm-Gg: AY/fxX7BDiupEpiUofKsJCQFoREUyuPH/1DiquOcM6ZpJC2UXWCs9MRR4esN589oaBp
	B/HHlzLYVv3vtIwCgCnJtmniwuF0VFtkssVRgGw5P0VF4HvfzSJzrnf7++iIa3I69mxVQ/Vt5ez
	JesctVF3CdL4FTmTFbEkVweRQdqVQNuQoyao8A35rxLb+TpzbrdyPYf14vOU57dxCekgHarNNbZ
	/bsyyCJBqN/rhtL7jhyNuEcINDtDC5Gc9E7B1j2xlJ14bfDnhZg3+t8ThP9VU9NTA7VsxuunQDU
	YphzgXFKc6z3Wnh6tUB66iGv9H0rSg0zigrdYmv0cI8pp71Hpou30AZk1zjJATpPlyBCZBOdCik
	2J55qsEkoKeWD0tEduD5qIgnmETYAa3QXHgrKAk4IvSePM6VFlMa2GP8nnTrGnzg8DkG1G8M92a
	tPkzH85hIT7BvCfqXNfzR6pGKFanTkVvkB0+HM
X-Google-Smtp-Source: AGHT+IHZJmaQaHIyZu23aY20L8OEhXcH95sjK+OBTRsa2WtJe6DENa+J+EPR/hVV2ccdKAytzQEetA==
X-Received: by 2002:a17:907:8694:b0:b73:1e09:7377 with SMTP id a640c23a62f3a-b7d23aa5631mr1096802166b.58.1765786843063;
        Mon, 15 Dec 2025 00:20:43 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51754dsm1360553966b.42.2025.12.15.00.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:20:42 -0800 (PST)
Date: Mon, 15 Dec 2025 09:20:37 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, Alyssa Ross <hi@alyssa.is>,
	Spectrum OS Development <devel@spectrum-os.org>,
	linux-security-module@vger.kernel.org, landlock@lists.linux.dev,
	"Ryan B. Sullivan" <ryanbakersullivan@gmail.com>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>
Subject: Re: [PATCH] host/roots: Sandbox xdg-desktop-portal-spectrum-host
Message-ID: <20251215.5d7e473daa34@gnoack.org>
References: <20251212-sandbox-dbus-portal-v1-1-522705202482@gmail.com>
 <87o6o25h6y.fsf@alyssa.is>
 <cfab1f24-65ad-40ed-b4a6-17f0aad8dc60@gmail.com>
 <87ikea5a8x.fsf@alyssa.is>
 <00256266-26db-40cf-8f5b-f7c7064084c2@gmail.com>
 <87bjk16dvv.fsf@alyssa.is>
 <515ff0f4-2ab3-46de-8d1e-5c66a93c6ede@gmail.com>
 <20251214.aiW5oc2izaxa@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251214.aiW5oc2izaxa@digikod.net>

On Sun, Dec 14, 2025 at 08:50:45PM +0100, Mickaël Salaün wrote:
> On Sat, Dec 13, 2025 at 11:49:11PM -0500, Demi Marie Obenour wrote:
> > On 12/13/25 20:39, Alyssa Ross wrote:
> > > Demi Marie Obenour <demiobenour@gmail.com> writes:
> > > 
> > >> On 12/13/25 16:42, Alyssa Ross wrote:
> > >>> Demi Marie Obenour <demiobenour@gmail.com> writes:
> > >>>
> > >>>> On 12/13/25 14:12, Alyssa Ross wrote:
> > >>>>> Demi Marie Obenour <demiobenour@gmail.com> writes:
> > >>>>>
> > >>>>>> It is quite possible that these Landlock rules are unnecessarily
> > >>>>>> permissive, but all of the paths to which read and execute access is
> > >>>>>> granted are part of the root filesystem and therefore assumed to be
> > >>>>>> public knowledge.  Removing access from any of them would only increase
> > >>>>>> the risk of accidental breakage in the future, and would not provide any
> > >>>>>> security improvements.  seccomp *could* provide some improvements, but
> > >>>>>> the effort needed is too high for now.
> > >>>>>>
> > >>>>>> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
> > >>>>>> ---
> > >>>>>>  .../template/data/service/xdg-desktop-portal-spectrum-host/run    | 8 ++++++++
> > >>>>>>  1 file changed, 8 insertions(+)
> > >>>>>
> > >>>>> Are you sure this is working as intended?  There's no rule allowing
> > >>>>> access to Cloud Hypervisor's VSOCK socket, and yet it still seems to be
> > >>>>> able to access that.  Don't you need to set a rule that *restricts*
> > >>>>> filesystem access and then add holes?  Did you ever see this deny
> > >>>>> anything?
> > >>>>
> > >>>> 'man 1 setpriv' states that '--landlock-access fs' blocks all
> > >>>> filesystem access unless a subsequent --landlock-rule permits it.
> > >>>> I tried running with no --landlock-rule flags and the execve of
> > >>>> xdg-desktop-portal-spectrum-host failed as expected.
> > >>>>
> > >>>> The socket is passed over stdin, and I'm pretty sure Landlock
> > >>>> doesn't restrict using an already-open file descriptor.
> > >>>> xdg-desktop-portal-spectrum-host does need to find the path to the
> > >>>> socket, but I don't think it ever accesses that path.
> > >>>
> > >>> I've been looking into this a bit myself, and from what I can tell
> > >>> Landlock just doesn't restrict connecting to sockets at all, even if
> > >>> they're inside directories that would otherwise be inaccessible.  It's
> > >>> able to connect to both Cloud Hypervisor's VSOCK socket and the D-Bus
> > >>> socket even with a maximally restrictive landlock rule.  So you were
> > >>> right after all, sorry!
> > >>
> > >> That's not good at all!  It's a trivial sandbox escape in so many cases.
> > >> For instance, with access to D-Bus I can just call `systemd-run`.
> > >>
> > >> I'm CCing the Landlock and LSM mailing lists because if you are
> > >> correct, then this is a bad security hole.
> > > 
> > > I don't find it that surprising given the way landlock works.  "connect"
> > > (to a non-abstract AF_UNIX socket) is not an operation there's a
> > > landlock action for, and it's not like the other actions care about
> > > access to parent directories and the like — I was able to execute a
> > > program via a symlink after only giving access to the symlink's target,
> > > without any access to the directory containing the symlink or the
> > > symlink itself, for example.  Landlock, as I understand it, is intended
> > > to block a specified set of operations (on particular file hierarchies),
> > > rather than to completely prevent access to those hierarchies like
> > > permissions or mount namespaces could, so the lack of a way to block
> > > connecting to a socket is more of a missing feature than a security
> > > hole.
> > 
> > 'man 7 unix' states:
> > 
> > On  Linux,  connecting to a stream socket object requires write
> > permission on that socket; sending a datagram to a datagram socket
> > likewise requires write permission on that socket.
> > 
> > Landlock is definitely being inconsistent with DAC here.  Also, this
> > allows real-world sandbox breakouts.  On systemd systems, the simplest
> > way to escape is to use systemd-run to execute arbitrary commands.
> 
> The Linux kernel is complex and the link between the VFS and named UNIX
> sockets is "special" (see the linked GitHub issue).  Landlock doesn't
> handle named UNIX sockets yet for the same reason it doesn't handle some
> other kind of kernel resources or access rights: someone needs to
> implement it (including tests, doc...).  There is definitely interest to
> add this feature, it has been discussed for some time, but it's not
> trivial.  It is a work in progress though:
> https://github.com/landlock-lsm/linux/issues/36

Agreed, this would be the change that would let us restrict connect()
on AF_UNIX sockets.

Additionally, *in the case that you do not actually need* Unix
sockets, the other patch set that would be of interest is the one for
restricting the creation of new socket FDs:
https://github.com/landlock-lsm/linux/issues/6

In this talk in 2014, I explained my mental model around the
network-related restrictions:
https://youtu.be/K2onopkMhuM?si=LCObEX6HhGdzPnks&t=2030

The discussed socket control feature continues to be a central missing
piece, as the TCP port restrictions do not make much sense as long as
you can still create sockets for other protocol types.

Issue #6 that should fix this is still under active development -- an
updated version of the patch was posted just last month.

To bridge the gap, the same thing can also be emulated with seccomp,
but as you noted above as well in this thread, this is harder.

–Günther

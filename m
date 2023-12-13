Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE67A7E562
	for <landlock@lists.linux.dev>; Wed, 13 Dec 2023 21:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="GBb95kiN"
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Sr3PD4TRLzMq2gh;
	Wed, 13 Dec 2023 18:08:00 +0000 (UTC)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Sr3PC6ZZPz3X;
	Wed, 13 Dec 2023 19:07:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1702490880;
	bh=8xkzLJLE+mZdJachvL38idqrcM2nE1c0jV/CmrWawT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBb95kiNaWckq/Kl0cptgyc3/XP5HhalDWLMu9ZWCrI12IJ+t4wsNljjNobaxIGHE
	 29G9ARWcm6mJALsjowMeEwccBHWuBh6kjSEeAqtgZGXimppTvxG5er0VQnsiCw8tdl
	 oVK5RrcVAWIpWjs3os4dEJK0ozgEio3ZJO5Fc2ZQ=
Date: Wed, 13 Dec 2023 19:07:59 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
	landlock@lists.linux.dev
Subject: Re: Landlock support in setpriv(1)
Message-ID: <20231213.xu7Zeiquoh0i@digikod.net>
References: <6cebaa86-f2ad-423d-a189-e3cf7ee5f4d4@t-8ch.de>
 <ZXmMHfxlnK4AVvOA@google.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZXmMHfxlnK4AVvOA@google.com>
X-Infomaniak-Routing: alpha

Nice work Thomas!

I agree with Günther and I just added some similar comments to the PR
before reading this email. My main concern is about compatibility, which
is not an easy topic. I tried to explain the related issues (for the
Rust library) here:
https://archive.fosdem.org/2023/schedule/event/rust_backward_and_forward_compatibility_for_security_features/

Regards,
 Mickaël

On Wed, Dec 13, 2023 at 11:49:01AM +0100, Günther Noack wrote:
> Thank you Thomas!  I am excited to see this :)
> 
> On Sat, Dec 09, 2023 at 10:18:50AM +0100, Thomas Weißschuh wrote:
> > Hi everybody,
> > 
> > For your information:
> > 
> > There is a proposal to add landlock support to setpriv(1) from
> > util-linux.
> > While landlock is meant for self-sandboxing it can also be used to
> > sandbox third party executables which makes it a nice fit for setpriv.
> > 
> > If you have any remarks let me know.
> > 
> > Link to the PR:
> > https://github.com/util-linux/util-linux/pull/2628
> 
> For inspiration, here are some other existing tools which have a similar interface:
> 
> * landlock-restrict (example tool for go-landlock):
>   https://github.com/landlock-lsm/go-landlock/blob/main/cmd/landlock-restrict/main.go
>   (This one was written by me)
> 
> * sandboxer.c (sample tool from the kernel tree):
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/landlock/sandboxer.c
> 
> * sandboxer.rs (example tool for rust-landlock):
>   https://github.com/landlock-lsm/rust-landlock/blob/main/examples/sandboxer.rs
> 
> In my personal opinion, when I was sandboxing a few programs "from the outside"
> with the Go tool, I often found that I would start out with a more coarse
> ruleset that uses the predefined "convenience" groups of access rights, which
> are called "ROFiles", "RWFiles", "RODirs" and "RWDirs" in that tool, and which
> subsume all rights except for the "Refer" right, which is a bit more special.
> 
> I think there is some value in having a mechanism that let you use such
> abbreviations for larger sets of rights, to make these tools more approachable
> and less verbose for simple (coarse-grained) use cases.
> 
> Another main concern to take into account is the question of backwards
> compatibility across different kernels: When a user attempts to sandbox a
> program on a kernel that does not support that specific set of access rights
> yet, what is the fallback strategy?  For the Go and Rust libraries, we have
> found that it might often be advisable to fall back to a "best effort" mode
> where we restrict as much as we can of what the user asked for, instead of
> failing altogether.  But it depends on the use case.  I imagine that an
> installation of util-linux will need to work with older kernels as well and does
> not have a strict dependency that ensures that it'll only run on new kernels.
> 
> Backwards compatibility is also discussed in the landlock(7) man page,
> specifically under VERSIONS and EXAMPLE.  I have also talked about it on my
> personal weblog at https://blog.gnoack.org/post/landlock-best-effort/ in the
> past.  Specifically double check that you are getting it right for the "refer"
> right, because that one has unusual semantics compared to the other rights.
> 
> Thanks,
> —Günther
> 
> 

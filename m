Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B83C9EF5
	for <landlock@lists.linux.dev>; Fri, 20 Mar 2026 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774020185; cv=none; b=WJQk1YxaWJnicj7hHiQHlHeRhAqDPjAQfPWZOA1hj9jJDJdqR6mi9lWiW2UApbWk8o71bxH/qnIHT8ksetDgQp5EHxSi4kJCYy7ixIgK7cP+CM52HcoUscXabT2gvaBwTJn05Boah12tcGZckmRJGFrYJYThdV5hA7007tEGfVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774020185; c=relaxed/simple;
	bh=CK8J5UyFnoqV3XEHyUwpKx8JKjDL+N99u8bvwARIqqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTBdt45xaYIa0kz3UGo9vG3fT3LgHCk7zYdjMDNC9CCURPEoEHSwRWJbmQ10tAf37JZC+ruFnbswUnorDTZdP51J9zfTxa14R7IdTloI/gTOn+X+g6BJ8PpiZgOXX0yf+1IBeKYMm/AtvDKVuz075IOqHI7T6ogk7D580w8V1rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=qer++6ZP; arc=none smtp.client-ip=83.166.143.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="qer++6ZP"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fcmXY3wBLzqcW;
	Fri, 20 Mar 2026 16:22:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1774020173;
	bh=KosjLAk7bsnZWU9PECUUdphs/nRiyFytYQQnnUluyY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qer++6ZPi7cYtSaH4mz4R/AIImBLghqS6kRScJo+hoRYZzYGNyo8iARwwdtA9jb6g
	 T5fUEwB2K6e2U7RqWh2uXqPm/O8vgQwY4SN8ea/oauZW0Hjs4ZasZVituQlxrz5FBs
	 65ROvClbU0Nrp67o3q2XRrno+VHbweVRLG8pmRQI=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4fcmXY0Z2pztV4;
	Fri, 20 Mar 2026 16:22:53 +0100 (CET)
Date: Fri, 20 Mar 2026 16:22:48 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Gerhard de Clercq <gerharddeclercq@outlook.com>
Cc: "landlock@lists.linux.dev" <landlock@lists.linux.dev>
Subject: Re: Landlock for sandboxing containers
Message-ID: <20260320.fiayeH8wio0i@digikod.net>
References: <MM0P280MB0897D3124F7B068D6DAF459CB88CA@MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM>
 <20260116.id9queiK8oeM@digikod.net>
 <GVZP280MB0902FE3AB14C39026CFC67A0B88DA@GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM>
 <20260119.eiphie8iNgu2@digikod.net>
 <GVZP280MB09026DA2823C512F46499945B895A@GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GVZP280MB09026DA2823C512F46499945B895A@GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM>
X-Infomaniak-Routing: alpha

On Thu, Mar 12, 2026 at 07:03:38PM +0000, Gerhard de Clercq wrote:
> Thanks for the clarification Mickaël!
> 
> I've now finally managed to start integrating Landlock into Litterbox at https://github.com/Gerharddc/litterbox/blob/landlock/litterbox/src/sandbox.rs. Until recently, I did not have a good place for this integration, but now the Litterbox architecture changed so that a specific binary is always run as the "entrypoint" for a session inside a container. Hence, I can now simply sandbox that binary upon entry.
> 
> This seems to work well, but it has broken the ability to run sudo inside the container. To be clear, Litterbox always uses "rootless" containers so this is not the true root user, but it is still nice to have a "virtual" root user inside the container for added security. What I run into now is the following error:
> 
> user@lbx-ubu ~ [SIGSEGV]> sudo apt update
> sudo: The "no new privileges" flag is set, which prevents sudo from running as root.
> sudo: If sudo is running in a container, you may need to adjust the container configuration to disable the flag.
> 
> Is there any way around this or is this a fundamental limitation with Landlock?

If the process has CAP_SYS_ADMIN it can call landlock_restrict_self()
without no_new_privileges.  This is the exact same check as seccomp
does.  The goal is to avoid privilege escalation via SUID binaries (e.g.
confused deputy attacks).  SUID binaries should not be
available/required in a sandboxed/secured environment because this
mechanism is not consistent with the principle of least privilege.  The
best alternative, if the required feature is really needed, is to rely
on dedicated and secure services (e.g. checking the peer identity)
available through UNIX sockets.

> 
> The only workaround I can currently think of would require users to enter a new session explicitly as the root user when needed. This would be very awkward compared to just using sudo in an existing session though.

sudo, which is a SUID binary, is also dangerous if reachable by
untrusted processes (see related security vulnerabilities).

Another approach would be to have different execution environments, one
which is not sandboxed (an admin-like environment), and the others which
are properly sandboxed.

We can also think about using things such as SSH but of course this
could also be a way to escape the sandbox.

> 
> Kind regards,
> Gerhard
> ________________________________________
> From: Mickaël Salaün <mic@digikod.net>
> Sent: Monday, January 19, 2026 12:12
> To: Gerhard de Clercq <gerharddeclercq@outlook.com>
> Cc: landlock@lists.linux.dev <landlock@lists.linux.dev>
> Subject: Re: Landlock for sandboxing containers
> 
> On Fri, Jan 16, 2026 at 10:16:28PM +0000, Gerhard de Clercq wrote:
> > Thanks Mickaël! Your feedback is much appreciated and should hopefully be enough to get me going now.
> >
> > Just another quick question: how much value do you imagine this combination (i.e. mount namespaces + Landlock) adds over regular containers (i.e. just mount namespaces)? Your paper mentions that namespaces are "designed to create views of the kernel resources, but not to enforce access control policies". As a non-expert, it is not obvious to me how namespaces can fail in the enforcement aspect and it would be great if you could elaborate a bit more on this.
> 
> Namespaces are tools used to build containers.  An access control
> doesn't change files layout but it (just) controls access to all
> potential files.  For instance, with only namespaces, a process in a
> container can still access files outside its mount namespaces e.g., with
> passed file descriptors or unexpected (recursive) bind mounts.  It's not
> the role of namespaces to prevent that, it's the role of access control
> systems such as Landlock.  Another thing is that mount points can only
> restrict broad operations (i.e. write and execution), not all kind of
> operations that can be handled by access control systems (e.g., IOCTL,
> file type creation, connection to UNIX socket...).
> 
> Namespaces are more complex, require more memory and resources compared
> to Landlock domains/sandboxes.  Landlock is designed to be used by any
> process, even nested in other sandboxes, and malicious processes, which
> is not the case for namespaces.  And because file layout remain the
> same, it's much easier to know what files we are dealing with.
> 
> In a nutshell both are complementary, but if you're looking for security
> restrictions, you're looking for an access control system.
> 
> >
> > Thanks again for your support and for the awesome project!
> 
> Thanks!
> 
> >
> > Kind regards,
> > Gerhard
> > ________________________________________
> > From: Mickaël Salaün <mic@digikod.net>
> > Sent: Friday, January 16, 2026 15:34
> > To: Gerhard de Clercq <gerharddeclercq@outlook.com>
> > Cc: landlock@lists.linux.dev <landlock@lists.linux.dev>
> > Subject: Re: Landlock for sandboxing containers
> >
> > On Thu, Jan 15, 2026 at 09:39:49PM +0000, Gerhard de Clercq wrote:
> > > Good day,
> >
> > Hi!
> >
> > >
> > > I am investigating the feasibility of integrating Landlock into a container sandboxing utility that I am developing (https://github.com/Gerharddc/litterbox). Essentially Litterbox just makes it easier to setup sandboxed containers for use as reproducible development environments. The idea here is to shield a host system from anything malicious that might show up inside a development environment.
> > >
> > > Since Litterbox is built on Podman, my original plan was to use it's built-in support for SELinux policies in conjunction with Udica for policy generation. However, since learning about Landlock, it seems that it would be much easier to integrate and also more cross-platform (given that SELinux support is rare amongst distros).
> > >
> > > After reading https://landlock.io/talks/2024-06-06_landlock-article.pdf, Landlock seems very well suited for this purpose. The only thing I am still struggling to wrap my head around is how Landlock integrates with mount namespaces and the implication of that for containers. If I understand correctly, it is currently not possible to enter a mount namespace after entering a sandbox.
> >
> > If the sandboxed process has the required capabilities (see setns(2)),
> > it should be allowed to enter an existing namespace, but not to create
> > new mounts.  Of course, such capabilities should be dropped as soon as
> > they are not required.
> >
> >
> > > Hence, I would somehow enter the sandbox only after entering the container.
> >
> > This is indeed the best option: setup the namespaces/cgroups and then
> > sandbox with Landlock (and seccomp for a more complete isolation).
> >
> > > Is this understanding correct? If so, I suspect I would need to extend Podman itself to do so properly since relying on code inside the container to enter the sandbox on startup seems like something that could easily be attacked.
> >
> > I would suggest to first wrap the build command with a sandboxer tool
> > (Island or others, see https://landlock.io/integrations/) and make
> > Podman launch this wrapper (directly or through an init service).  That
> > would allow you to quickly iterate and validate that it works as
> > expected.  If this sandboxer tool and the related configuration cannot
> > be tampered from within the container, it should be good.
> >
> > A cleaner but more complex approach would be to patch Podman to do it
> > more generically and without a wrapper.
> >
> > >
> > > Any additional thoughts or suggestions on this endeavour would be greatly appreciated!
> > >
> > > Kind regards,
> > > Gerhard de Clercq
> >
> 

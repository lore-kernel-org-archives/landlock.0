Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA262E88BD
	for <landlock@lists.linux.dev>; Mon, 19 Jan 2026 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821652; cv=none; b=WNIu71En3iJDVkdvmh+wtW+Ovl3KfiBV4cWT8ev+2qMtcP57UDHoldD5jZuuK2h8zufLu18SQK7suu8u33K4FQe9mzo7McRx0kWrj/Eneh/fVwmasPO24lutRTCxxW6RRLDwgBpnCKIqy83A/zPLP0Lx5QN2XC+VT1/LhnyxnS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821652; c=relaxed/simple;
	bh=AAg2p8RUe+pdmN31J/eP62wqcaDZYANLZEkG9ue2Ztw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/IQ5pIY7m0N6aGT6FtzXUWqC4nxfJkpMa5pz0JrKDHVFJ7TWL90gmrv3NqRzYIxBrbAgTThe8yPPakqr3G8wY9pIQQMAL0YaxxsJd+t1oFCTJNfrSfyCfquV+rWlgTOcT8udfXwN7auA2e2H7sg5eeNhyZnpzdgNOjX9bVe5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=etZGAlRM; arc=none smtp.client-ip=83.166.143.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="etZGAlRM"
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dvnqx2GjqzxDS;
	Mon, 19 Jan 2026 12:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1768821181;
	bh=xUjQhb2NcIv3ao6WY1Rmg1i9YUoyQyae8IPDdk+8hXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etZGAlRMF7grK8td7hp8BvlayDTpVpSw+RHKPRyE/V08QXq/+Tvh+c6f75EeRqxSk
	 1CbJgVK97yKEz5uCKm6JPfanjBqpIc1WObTOtc06l97wucYuwDjIPRurM0LO7VJHwc
	 pQeoae0lcA9/FsogTcGoJ2Fa6c9HU6fyLcr/KnKg=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dvnqw46Dxz86v;
	Mon, 19 Jan 2026 12:13:00 +0100 (CET)
Date: Mon, 19 Jan 2026 12:12:56 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Gerhard de Clercq <gerharddeclercq@outlook.com>
Cc: "landlock@lists.linux.dev" <landlock@lists.linux.dev>
Subject: Re: Landlock for sandboxing containers
Message-ID: <20260119.eiphie8iNgu2@digikod.net>
References: <MM0P280MB0897D3124F7B068D6DAF459CB88CA@MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM>
 <20260116.id9queiK8oeM@digikod.net>
 <GVZP280MB0902FE3AB14C39026CFC67A0B88DA@GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GVZP280MB0902FE3AB14C39026CFC67A0B88DA@GVZP280MB0902.SWEP280.PROD.OUTLOOK.COM>
X-Infomaniak-Routing: alpha

On Fri, Jan 16, 2026 at 10:16:28PM +0000, Gerhard de Clercq wrote:
> Thanks Mickaël! Your feedback is much appreciated and should hopefully be enough to get me going now.
> 
> Just another quick question: how much value do you imagine this combination (i.e. mount namespaces + Landlock) adds over regular containers (i.e. just mount namespaces)? Your paper mentions that namespaces are "designed to create views of the kernel resources, but not to enforce access control policies". As a non-expert, it is not obvious to me how namespaces can fail in the enforcement aspect and it would be great if you could elaborate a bit more on this.

Namespaces are tools used to build containers.  An access control
doesn't change files layout but it (just) controls access to all
potential files.  For instance, with only namespaces, a process in a
container can still access files outside its mount namespaces e.g., with
passed file descriptors or unexpected (recursive) bind mounts.  It's not
the role of namespaces to prevent that, it's the role of access control
systems such as Landlock.  Another thing is that mount points can only
restrict broad operations (i.e. write and execution), not all kind of
operations that can be handled by access control systems (e.g., IOCTL,
file type creation, connection to UNIX socket...).

Namespaces are more complex, require more memory and resources compared
to Landlock domains/sandboxes.  Landlock is designed to be used by any
process, even nested in other sandboxes, and malicious processes, which
is not the case for namespaces.  And because file layout remain the
same, it's much easier to know what files we are dealing with.

In a nutshell both are complementary, but if you're looking for security
restrictions, you're looking for an access control system.

> 
> Thanks again for your support and for the awesome project!

Thanks!

> 
> Kind regards,
> Gerhard
> ________________________________________
> From: Mickaël Salaün <mic@digikod.net>
> Sent: Friday, January 16, 2026 15:34
> To: Gerhard de Clercq <gerharddeclercq@outlook.com>
> Cc: landlock@lists.linux.dev <landlock@lists.linux.dev>
> Subject: Re: Landlock for sandboxing containers
> 
> On Thu, Jan 15, 2026 at 09:39:49PM +0000, Gerhard de Clercq wrote:
> > Good day,
> 
> Hi!
> 
> >
> > I am investigating the feasibility of integrating Landlock into a container sandboxing utility that I am developing (https://github.com/Gerharddc/litterbox). Essentially Litterbox just makes it easier to setup sandboxed containers for use as reproducible development environments. The idea here is to shield a host system from anything malicious that might show up inside a development environment.
> >
> > Since Litterbox is built on Podman, my original plan was to use it's built-in support for SELinux policies in conjunction with Udica for policy generation. However, since learning about Landlock, it seems that it would be much easier to integrate and also more cross-platform (given that SELinux support is rare amongst distros).
> >
> > After reading https://landlock.io/talks/2024-06-06_landlock-article.pdf, Landlock seems very well suited for this purpose. The only thing I am still struggling to wrap my head around is how Landlock integrates with mount namespaces and the implication of that for containers. If I understand correctly, it is currently not possible to enter a mount namespace after entering a sandbox.
> 
> If the sandboxed process has the required capabilities (see setns(2)),
> it should be allowed to enter an existing namespace, but not to create
> new mounts.  Of course, such capabilities should be dropped as soon as
> they are not required.
> 
> 
> > Hence, I would somehow enter the sandbox only after entering the container.
> 
> This is indeed the best option: setup the namespaces/cgroups and then
> sandbox with Landlock (and seccomp for a more complete isolation).
> 
> > Is this understanding correct? If so, I suspect I would need to extend Podman itself to do so properly since relying on code inside the container to enter the sandbox on startup seems like something that could easily be attacked.
> 
> I would suggest to first wrap the build command with a sandboxer tool
> (Island or others, see https://landlock.io/integrations/) and make
> Podman launch this wrapper (directly or through an init service).  That
> would allow you to quickly iterate and validate that it works as
> expected.  If this sandboxer tool and the related configuration cannot
> be tampered from within the container, it should be good.
> 
> A cleaner but more complex approach would be to patch Podman to do it
> more generically and without a wrapper.
> 
> >
> > Any additional thoughts or suggestions on this endeavour would be greatly appreciated!
> >
> > Kind regards,
> > Gerhard de Clercq
> 

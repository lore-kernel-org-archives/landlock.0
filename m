Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BAE3375A6
	for <landlock@lists.linux.dev>; Fri, 16 Jan 2026 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768574053; cv=none; b=q9s+ifK4Q0Pa/zfQrhEpUXPvSAQ6G9TPvOao1ylX3/Q5Fvn3jrMDVC5QasiZHWxqjDy0XrdzC+2a2IWsMjImLGufT8BJKZZWrVPWWtYChrJRFSBS+GxW0R8uKRgUWcvtfwVNk0ctjcZvxyQ3QQtPSE4cltat2m26NYadSVrXIqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768574053; c=relaxed/simple;
	bh=mokgcRUTdl+V+lubOR9nIwjDBLIYH9ZzZ8PZAYrgmIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIwg46cE+xVmTIvrwvUh7wGkmTR3r56ZkaXZr9PLRgcLkqO6KvNv039YSA+5LBXeeVggv9zqlECePgVCLkjk080DRC6YcoEUcMhUeLkQRWBXYR+39CPCrfKLkoOJBuM1NeyBVMv3/wSbDBl2MKDS3qrRyDjV3yrzDIW6eL7Rjls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=Cd+YkvPG; arc=none smtp.client-ip=185.125.25.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="Cd+YkvPG"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dt2RN0gzSz17ZB;
	Fri, 16 Jan 2026 15:34:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1768574047;
	bh=7xqapQLujaC+kNhp2OnGkjrtgZACjJa/Cud1+CqHQtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cd+YkvPGRD2FIxQtXnkwiADrzrjPdb+yo72dpoWXCDtTL5Az2LeFeH3D4KznZkTLJ
	 TF8a3DWewuWQjW59IhHYwh6ngh3aq2mJaBJrAlX7d9m7iCIfRyyH9unsmaw4tD0QrG
	 eKaNRPlRCW5x+bjvU1E+zMjx5QeHm3HXwZ61kqTw=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4dt2RM3PfJzsL2;
	Fri, 16 Jan 2026 15:34:07 +0100 (CET)
Date: Fri, 16 Jan 2026 15:34:02 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Gerhard de Clercq <gerharddeclercq@outlook.com>
Cc: "landlock@lists.linux.dev" <landlock@lists.linux.dev>
Subject: Re: Landlock for sandboxing containers
Message-ID: <20260116.id9queiK8oeM@digikod.net>
References: <MM0P280MB0897D3124F7B068D6DAF459CB88CA@MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MM0P280MB0897D3124F7B068D6DAF459CB88CA@MM0P280MB0897.SWEP280.PROD.OUTLOOK.COM>
X-Infomaniak-Routing: alpha

On Thu, Jan 15, 2026 at 09:39:49PM +0000, Gerhard de Clercq wrote:
> Good day,

Hi!

> 
> I am investigating the feasibility of integrating Landlock into a container sandboxing utility that I am developing (https://github.com/Gerharddc/litterbox). Essentially Litterbox just makes it easier to setup sandboxed containers for use as reproducible development environments. The idea here is to shield a host system from anything malicious that might show up inside a development environment.
> 
> Since Litterbox is built on Podman, my original plan was to use it's built-in support for SELinux policies in conjunction with Udica for policy generation. However, since learning about Landlock, it seems that it would be much easier to integrate and also more cross-platform (given that SELinux support is rare amongst distros).  
> 
> After reading https://landlock.io/talks/2024-06-06_landlock-article.pdf, Landlock seems very well suited for this purpose. The only thing I am still struggling to wrap my head around is how Landlock integrates with mount namespaces and the implication of that for containers. If I understand correctly, it is currently not possible to enter a mount namespace after entering a sandbox.

If the sandboxed process has the required capabilities (see setns(2)),
it should be allowed to enter an existing namespace, but not to create
new mounts.  Of course, such capabilities should be dropped as soon as
they are not required.


> Hence, I would somehow enter the sandbox only after entering the container.

This is indeed the best option: setup the namespaces/cgroups and then
sandbox with Landlock (and seccomp for a more complete isolation).

> Is this understanding correct? If so, I suspect I would need to extend Podman itself to do so properly since relying on code inside the container to enter the sandbox on startup seems like something that could easily be attacked.

I would suggest to first wrap the build command with a sandboxer tool
(Island or others, see https://landlock.io/integrations/) and make
Podman launch this wrapper (directly or through an init service).  That
would allow you to quickly iterate and validate that it works as
expected.  If this sandboxer tool and the related configuration cannot
be tampered from within the container, it should be good.

A cleaner but more complex approach would be to patch Podman to do it
more generically and without a wrapper.

> 
> Any additional thoughts or suggestions on this endeavour would be greatly appreciated!
> 
> Kind regards,
> Gerhard de Clercq

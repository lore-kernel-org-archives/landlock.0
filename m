Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7D387347
	for <landlock@lists.linux.dev>; Mon,  8 Jun 2026 06:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899887; cv=none; b=n+sBDuSroinWq+gm4rx9MkE/Qh42UfRUY6ccqEgCSnMtesohZedw829Ed6QS93tdXEOimOjOj47OmG16kI+nZJpY/EYXlb/izA/1gN0KXa3qCJ7Fa1IG5odd5lu02ORpqVf7WEuuazp2NnfPZLv80JDPzo24LUb9cVtWyrUgjFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899887; c=relaxed/simple;
	bh=bHjO53gQ3auBg0DnzJ20e4RUQAdYB3fanjTyPv5tYak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=baTBzGMGJBUKSIJT9oDi53voghc6YzC05WHvIfhyW9erT3zGaJFrqmZCIp+Ko2bz0WtllX+csVlUf9RNU6tCqkjBtoktvwmqfXJH/b7ccSOuQJwU+v3Jt2o3BLZMVA3NLbscGm895sYyDEArZGhWtS+Rqz9fpQwN3SgNvwTZYuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSYjZmCi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSYjZmCi"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B96731F00893;
	Mon,  8 Jun 2026 06:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780899885;
	bh=g6XD8192wUVzZZVdpKiJSlsqN2n9XmUHhn1kxaYe//g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bSYjZmCiEvbU6rEImLg8Z1KC2gbfQHwdx96Z2aGaS2da6WWM4hK2GX9ZL9sAH3RqU
	 ingIh1ZiWsghBE+a9dNjTDcUkfFZPwDdalIyXcGuw5skUWE/wNRmpo41qc8/S+I5nt
	 7kU0aTF0LWApKQrmiIlq9XBYuZI/jcWCpD1K15yOuWa2Ez1b+Pgm4yEMsROW0qU4ff
	 JjH08Jr9cxa9L94mGgZofsvL3eZNAVu0WoYYg8Ad+uKgntEl08ArvHIFLXavFhgqr3
	 lA0fwUrX7Ei5O1pWUNFvKrEnO3qgkHgGxjv4L/aetNqBUzjt4KP02xoIWGIX/xBeAs
	 T9QVudYNVzksg==
Date: Mon, 8 Jun 2026 09:24:41 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Justin Suess <utilityemal77@gmail.com>
Cc: landlock@lists.linux.dev
Subject: Re: Landstrip
Message-ID: <aiZgKQWLjWwvyMEe@kernel.org>
References: <ah41G3F850HLeiBQ@kernel.org>
 <aiMegwnNp515dmWB@zenbox>
 <aiYooyQewuHgXUZ0@kernel.org>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiYooyQewuHgXUZ0@kernel.org>

On Mon, Jun 08, 2026 at 05:28:39AM +0300, Jarkko Sakkinen wrote:
> On Fri, Jun 05, 2026 at 03:19:09PM -0400, Justin Suess wrote:
> > On Tue, Jun 02, 2026 at 04:42:51AM +0300, Jarkko Sakkinen wrote:
> > > I played with an idea could Landlock LSM be used to do conceptually a
> > > better fit sandbox for programs such as Anthropic Sandbox Runtime [1].
> > > 
> > > After some missteps at first I got it pulled together quite well:
> > > 
> > > https://crates.io/crates/landstrip
> > > 
> > > To see it in action I also have a fork of pi-hashline-readmap plugin,
> > > which was a cherry-picked test case I wanted to try out given it already
> > > hooks the bash tool command for compressed output.
> > > 
> > > I just thought that this might interest some as Landlock is not really
> > > over-used kernel feature in "application sense".
> > > 
> > > This is a more lower barrier and more failure tolerant to deploy than
> > > Bubblewrap based container for this use and purpose in my opinion
> > > at least.
> > > 
> > Very cool! Landlock is great for this usecase of application driven
> > sandboxing.
> > 
> > (just a quick note, the linux-security-module/linux-integrity
> > mailing lists mostly for kernel development patches, the
> > landlock.lists.linux.dev list is more for
> > userspace Landlock topics like this. so I removed the cc for
> > linux-security-module/linux-integrity and added that list)
> > 
> > I notice there is a seccomp policy for unix sockets in this application.
> > Although it might not be in your kernel yet, support for sandboxing
> > named unix sockets with Landlock was recently merged. :)
> > 
> > https://lore.kernel.org/linux-security-module/20260327164838.38231-1-gnoack3000@gmail.com/
> 
> Thanks for the pointer. My focus has been more in the wiring than inner
> shenanigans but soon might be a good time to revisit :-)
> 
> I have also Seatbelt FFI and Windows AppContainer profiles are whatever
> they call them through Win32 API.

I migrated to direct syscalls with Landlock in order to keep in faster
phase.

I'll implement ACCESS_FS_RESOLVE_UNIX support, and run-time detection to
know whether to fall back to a seccomp policy (which is needed still
few years to come).

One LSM I'm not really familiar of and it bothers me a bit is the eBPF
LSM. I'm not exactly sure would it do anything useful/valuable for
me in this project.

And I think Anthropic's app security policy is actually quite nice
and practical. I plan to use this myself when I do find+xargs type
of risky operations :-) It's great with scripts, which kind of
makes sense.

JSON is quite horrible tho so without breaking backwards compatibility
I'll add --format json|yml. In yml-version there won't be bucket
lists for each rule. Instead it will have singular "allowRead" etc.
statements. This is more to use cases where I find it useful :-)

BR, Jarkko

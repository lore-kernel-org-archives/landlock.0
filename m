Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A573DFC9C
	for <landlock@lists.linux.dev>; Tue,  9 Jun 2026 18:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781029522; cv=none; b=VtLBNbcbll9MvHUAlm9c3G/NaGzEDk49WhRMscnKW232uNThqo91Moxhu3m8iCRQ2FmnPAhVQu8tWX8l4zMNyX/+giGNzfLAaywlJFMfwMY1YoZDhj0/InzE/qEoDcq0NOQwuyObtb+apYbWdTFeY/I0oa5siQ0UqfePXoGAHMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781029522; c=relaxed/simple;
	bh=NnXhcGQ2qLnHyHrk27kxYI+KavxFxwzrnz5PrRxjJs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbXDkcqyKbAUbiqWo9XyrZVwd9quzpnj+myyTU0TjlBApalVEx0n0Go+Ucy8n4Mpn//5XB/be+IMWr/DSILchkY29abt86ExOlQDn2tLjxgf6Iki4NUuzbFUhpZZ/Y9q39feY7OoC28iyCZHr2tyY19T8tRecjzBFH1uioXIjHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=PHw52aPc; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="PHw52aPc"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gZclb52hgzTmG;
	Tue,  9 Jun 2026 20:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1781029515;
	bh=bTCP+e9LJWFxm7jC9mQ0tGpUQ1zJZixS0BSKu/GwaqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PHw52aPc0eU2VyeD2y7hvKX6CiHntZwP/NWvR22sTg1vdo08LPuDxiuDZxMntLHih
	 21J6GfreUsTVFcky7MpC45sEfw2BR63AZwAMlafrA6FQt1O9+0/zR0PTl1E5EW/r6h
	 z3GTXdgUO4cBZI666PWPMd8kccD41BcNN207+uPw=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gZclZ70HQzXcl;
	Tue,  9 Jun 2026 20:25:14 +0200 (CEST)
Date: Tue, 9 Jun 2026 20:25:08 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Justin Suess <utilityemal77@gmail.com>, landlock@lists.linux.dev
Subject: Re: Landstrip
Message-ID: <20260609.ooNe7wi9Vai3@digikod.net>
References: <ah41G3F850HLeiBQ@kernel.org>
 <aiMegwnNp515dmWB@zenbox>
 <aiYooyQewuHgXUZ0@kernel.org>
 <aiZgKQWLjWwvyMEe@kernel.org>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiZgKQWLjWwvyMEe@kernel.org>
X-Infomaniak-Routing: alpha

On Mon, Jun 08, 2026 at 09:24:41AM +0300, Jarkko Sakkinen wrote:
> On Mon, Jun 08, 2026 at 05:28:39AM +0300, Jarkko Sakkinen wrote:
> > On Fri, Jun 05, 2026 at 03:19:09PM -0400, Justin Suess wrote:
> > > On Tue, Jun 02, 2026 at 04:42:51AM +0300, Jarkko Sakkinen wrote:
> > > > I played with an idea could Landlock LSM be used to do conceptually a
> > > > better fit sandbox for programs such as Anthropic Sandbox Runtime [1].
> > > > 
> > > > After some missteps at first I got it pulled together quite well:
> > > > 
> > > > https://crates.io/crates/landstrip

Interesting!  FYI, here is a list of other sandboxers using Landlock
too: https://landlock.io/integrations/

Some new ones are missings, including Landstrip, Nono, and Sandlock.
Feel free to open a PR.

> > > > 
> > > > To see it in action I also have a fork of pi-hashline-readmap plugin,
> > > > which was a cherry-picked test case I wanted to try out given it already
> > > > hooks the bash tool command for compressed output.
> > > > 
> > > > I just thought that this might interest some as Landlock is not really
> > > > over-used kernel feature in "application sense".

I'm not sure what you mean by "application sense", there are a few
sandboxers and also apps with built-in sandboxing, but it would be nice
to have more.  This list is not complete:
https://landlock.io/integrations/

> > > > 
> > > > This is a more lower barrier and more failure tolerant to deploy than
> > > > Bubblewrap based container for this use and purpose in my opinion
> > > > at least.

Indeed!

> > > > 
> > > Very cool! Landlock is great for this usecase of application driven
> > > sandboxing.
> > > 
> > > (just a quick note, the linux-security-module/linux-integrity
> > > mailing lists mostly for kernel development patches, the
> > > landlock.lists.linux.dev list is more for
> > > userspace Landlock topics like this. so I removed the cc for
> > > linux-security-module/linux-integrity and added that list)
> > > 
> > > I notice there is a seccomp policy for unix sockets in this application.
> > > Although it might not be in your kernel yet, support for sandboxing
> > > named unix sockets with Landlock was recently merged. :)
> > > 
> > > https://lore.kernel.org/linux-security-module/20260327164838.38231-1-gnoack3000@gmail.com/
> > 
> > Thanks for the pointer. My focus has been more in the wiring than inner
> > shenanigans but soon might be a good time to revisit :-)
> > 
> > I have also Seatbelt FFI and Windows AppContainer profiles are whatever
> > they call them through Win32 API.
> 
> I migrated to direct syscalls with Landlock in order to keep in faster
> phase.

While it's easy to ask an agent to rewrite/fork (part of) such crate,
it's not a good idea for a few reasons, especially the best-effort
approach, backward compatibility, tests...  Anyway, I plan to update the
crate with the latest features this week.  Still, feel free to open an
issue.

> 
> I'll implement ACCESS_FS_RESOLVE_UNIX support, and run-time detection to
> know whether to fall back to a seccomp policy (which is needed still
> few years to come).

You're welcome to contribute to this crate, at least to open an issue
and explain your requirements.  BTW, this crate is designed with
backward compatibility in mind so it already does run-time detection (in
a safe way), you don't need to reimplement it. ;)

> 
> One LSM I'm not really familiar of and it bothers me a bit is the eBPF
> LSM. I'm not exactly sure would it do anything useful/valuable for
> me in this project.

Not sure, but it would requires privileges anyway.

> 
> And I think Anthropic's app security policy is actually quite nice
> and practical. I plan to use this myself when I do find+xargs type
> of risky operations :-) It's great with scripts, which kind of
> makes sense.

Could you please explain this approach?

> 
> JSON is quite horrible tho so without breaking backwards compatibility
> I'll add --format json|yml. In yml-version there won't be bucket
> lists for each rule. Instead it will have singular "allowRead" etc.
> statements. This is more to use cases where I find it useful :-)

FYI, there is a stable/future-proof/flexible format and related crate
(WIP) that supports both JSON and TOML:
https://github.com/landlock-lsm/landlockconfig

> 
> BR, Jarkko
> 

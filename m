Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46F032FA14
	for <landlock@lists.linux.dev>; Wed, 10 Jun 2026 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084465; cv=none; b=vBOf4C+RR2/+t+1ea/nl8gkGjC0fpyP+qXAv6YUZxNhRw/B2ZF5bk9pWmD1BJnvFHjIVCZjT5NiWe/mWswGkIPve4aOALcs5alosNs4aCBXrVhf2BmzPrUa0rmrBlzsxmtiuXDaxUd2xC14oEtf/uMWo5nxPhhprpauZSYAPhh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084465; c=relaxed/simple;
	bh=iBXYxGNWKX5NPfmRGkwGopIWl60kwv2nmhMzRo+C3Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLeD/l/EKPH7aAkaZA2qAEcu6d14H/axjq+NBNjI/JWXZ8J5EU654VCnjUf4JzVGgPOQQvMZTww7a+vy/T9B5rxlfvyBEi2f2h5p+oMjvS5C8kmWS7cZsDT+O/wxC/2698DTdutm2QlBc7E6XzgRbuhC6SqO1IkuRdQgqzqZwg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpihseE6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpihseE6"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 198CA1F00893;
	Wed, 10 Jun 2026 09:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781084463;
	bh=gpJTDmok0OVk6FgpCi9GiH1rvD/C+lJ6V3AEAk/VLGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EpihseE64MBWbghQiOrWLj67fDSFEWe6O/PK1knkjHxW7amx/WpO9YMOsB/zYtrcb
	 4/SUNejjMepM6MtPSngck8bXsdj61mfE7SfDNas1Ae9bvCf5EDEJsG7EPGRajD5yWs
	 oLZzWAQuZRpi8/m2mSjJsGp6jZUiiNf4QNNhepYKeNASeXbmqEcS6cSOfX/Ls9kM5E
	 uupBONJMjr9fyyEyYo2UCHRtxqhCh8t37RbBTwfD+J+QQ3hZUF+0P3BNxCb4sQQeZW
	 ilFwE1HtLaYZT1bWXF2P+X58gljp3MhmyPECCER+/DErkAIqu2z8ooOs5aa8VhopB+
	 6TBQAzgro5/dQ==
Date: Wed, 10 Jun 2026 12:40:59 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Justin Suess <utilityemal77@gmail.com>, landlock@lists.linux.dev
Subject: Re: Landstrip
Message-ID: <aikxK37vyUmv1yLm@kernel.org>
References: <ah41G3F850HLeiBQ@kernel.org>
 <aiMegwnNp515dmWB@zenbox>
 <aiYooyQewuHgXUZ0@kernel.org>
 <aiZgKQWLjWwvyMEe@kernel.org>
 <20260609.ooNe7wi9Vai3@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609.ooNe7wi9Vai3@digikod.net>

On Tue, Jun 09, 2026 at 08:25:08PM +0200, Mickaël Salaün wrote:
> On Mon, Jun 08, 2026 at 09:24:41AM +0300, Jarkko Sakkinen wrote:
> > On Mon, Jun 08, 2026 at 05:28:39AM +0300, Jarkko Sakkinen wrote:
> > > On Fri, Jun 05, 2026 at 03:19:09PM -0400, Justin Suess wrote:
> > > > On Tue, Jun 02, 2026 at 04:42:51AM +0300, Jarkko Sakkinen wrote:
> > > > > I played with an idea could Landlock LSM be used to do conceptually a
> > > > > better fit sandbox for programs such as Anthropic Sandbox Runtime [1].
> > > > > 
> > > > > After some missteps at first I got it pulled together quite well:
> > > > > 
> > > > > https://crates.io/crates/landstrip
> 
> Interesting!  FYI, here is a list of other sandboxers using Landlock
> too: https://landlock.io/integrations/
> 
> Some new ones are missings, including Landstrip, Nono, and Sandlock.
> Feel free to open a PR.

Sure. Landstrip also maps Anthropic's policies also to Seatbel and
Windows AppContainer ACLs i.e., Landlock is the Linux equivalent.

> 
> > > > > 
> > > > > To see it in action I also have a fork of pi-hashline-readmap plugin,
> > > > > which was a cherry-picked test case I wanted to try out given it already
> > > > > hooks the bash tool command for compressed output.
> > > > > 
> > > > > I just thought that this might interest some as Landlock is not really
> > > > > over-used kernel feature in "application sense".
> 
> I'm not sure what you mean by "application sense", there are a few
> sandboxers and also apps with built-in sandboxing, but it would be nice
> to have more.  This list is not complete:
> https://landlock.io/integrations/

It might be just my ignorance, I'm truly sorry :-) I usually get
interested on topic when I have first hand need on it and Landlock was
just size-fit for mapping ASR style JSON policies.

> 
> > > > > 
> > > > > This is a more lower barrier and more failure tolerant to deploy than
> > > > > Bubblewrap based container for this use and purpose in my opinion
> > > > > at least.
> 
> Indeed!
> 
> > > > > 
> > > > Very cool! Landlock is great for this usecase of application driven
> > > > sandboxing.
> > > > 
> > > > (just a quick note, the linux-security-module/linux-integrity
> > > > mailing lists mostly for kernel development patches, the
> > > > landlock.lists.linux.dev list is more for
> > > > userspace Landlock topics like this. so I removed the cc for
> > > > linux-security-module/linux-integrity and added that list)
> > > > 
> > > > I notice there is a seccomp policy for unix sockets in this application.
> > > > Although it might not be in your kernel yet, support for sandboxing
> > > > named unix sockets with Landlock was recently merged. :)
> > > > 
> > > > https://lore.kernel.org/linux-security-module/20260327164838.38231-1-gnoack3000@gmail.com/
> > > 
> > > Thanks for the pointer. My focus has been more in the wiring than inner
> > > shenanigans but soon might be a good time to revisit :-)
> > > 
> > > I have also Seatbelt FFI and Windows AppContainer profiles are whatever
> > > they call them through Win32 API.
> > 
> > I migrated to direct syscalls with Landlock in order to keep in faster
> > phase.
> 
> While it's easy to ask an agent to rewrite/fork (part of) such crate,
> it's not a good idea for a few reasons, especially the best-effort
> approach, backward compatibility, tests...  Anyway, I plan to update the
> crate with the latest features this week.  Still, feel free to open an
> issue.

I'm not sure if I fully understand this.

I modified my client to temporarily use syscalls with the plan to return
back using it as soon as it has all the features.

It is only small portion of the implementation so it really is not a big
deal. There's also Window and macOS.

I.e. it is internal code for the client not a sloppy fork and I can
do git revert  + integration once there is the feature available.

I have direct FFI also on macOS and Win32.

> 
> > 
> > I'll implement ACCESS_FS_RESOLVE_UNIX support, and run-time detection to
> > know whether to fall back to a seccomp policy (which is needed still
> > few years to come).
> 
> You're welcome to contribute to this crate, at least to open an issue
> and explain your requirements.  BTW, this crate is designed with
> backward compatibility in mind so it already does run-time detection (in
> a safe way), you don't need to reimplement it. ;)

I can contribute the ACCESS_FS_RESOLVE_UNIX unless it is on your queue.

> 
> > 
> > One LSM I'm not really familiar of and it bothers me a bit is the eBPF
> > LSM. I'm not exactly sure would it do anything useful/valuable for
> > me in this project.
> 
> Not sure, but it would requires privileges anyway.
> 
> > 
> > And I think Anthropic's app security policy is actually quite nice
> > and practical. I plan to use this myself when I do find+xargs type
> > of risky operations :-) It's great with scripts, which kind of
> > makes sense.
> 
> Could you please explain this approach?

How I use Landlock or how ASR policy works? I initialize Landlock with
a recursive traverse to get a policy that snapshots nicely the current
state of directory tree.

> 
> > 
> > JSON is quite horrible tho so without breaking backwards compatibility
> > I'll add --format json|yml. In yml-version there won't be bucket
> > lists for each rule. Instead it will have singular "allowRead" etc.
> > statements. This is more to use cases where I find it useful :-)
> 
> FYI, there is a stable/future-proof/flexible format and related crate
> (WIP) that supports both JSON and TOML:
> https://github.com/landlock-lsm/landlockconfig

I'm specifically doing cross-platform implementation to substute ASR
with a better run-time.

> 
> > 
> > BR, Jarkko
> > 

BR, Jarkko

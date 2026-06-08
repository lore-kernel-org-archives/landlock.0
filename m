Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2240A30F547
	for <landlock@lists.linux.dev>; Mon,  8 Jun 2026 02:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780885725; cv=none; b=lfqqAnFk/lYTva44MJx/GOFtQtGxECvE0hS1MgHxrkocZtOducMjQ3z9XK1T6DQzro5/w2JKQWvaw4tw6dYyEXPMbNDCbwf4fUzZeQ9UUnHz7nGxjxvkEP0WRsPMhRthbPSsmMogVh3cDIBrXt9zyDl3+XQJSYDHvFvLRXx1FGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780885725; c=relaxed/simple;
	bh=YFxKjMfVcl+Va7PSUOk/MoAfphZqHvpQkedOgbKYbuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q424HFQzNKV7t2ECMwLYFJxav0uQPWaN01NH/ddqY+rDYiZqTbHHM4bnSoQXVEvWee3ASCXK+OvoEJxCtiS/wZudvsRzg5hOwjfGdP2QKPxfIxJVmZ6Dj00MgSLiCoXU6iYy2t4bYrsH7bnLam8LlJHWu80xbAiar07o4X3VK0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5adL4Ja; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5adL4Ja"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 375D61F00893;
	Mon,  8 Jun 2026 02:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780885723;
	bh=nbnTyc035RFKqd4bX/qpoJUuk96QwNXoRuXicqU00rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D5adL4JaTd4bIg7logfXaNerF2f7VcZBx/meeKtBWkvzj6vRMg/sBVthB7Jf692y0
	 0AwR9xnnCnENLMRlMlPo982l8ynQI4vSdJ/BCJFNUpvoQ3WFjc08S3uqGSmW9HjhOF
	 2O1USAcsZ1n1KHVBCSEvHzXCUDzyYLfwAzYg9Vf9y08JT2nkDpPQ+hLipGGBywiapH
	 Wfm5QydzrWj8XpZ+hDyhBdnaCgzyiciHm+4MHOsGMg1wWBGQU2e+j0NorQpq1K6QzV
	 3ug5HpcENqqVM2P/wk5ft6blhSLEahC2JtYZXWYeh0UB176vlFOtituNm89oneBqk2
	 jzsN6NRvvBFdQ==
Date: Mon, 8 Jun 2026 05:28:39 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Justin Suess <utilityemal77@gmail.com>
Cc: landlock@lists.linux.dev
Subject: Re: Landstrip
Message-ID: <aiYooyQewuHgXUZ0@kernel.org>
References: <ah41G3F850HLeiBQ@kernel.org>
 <aiMegwnNp515dmWB@zenbox>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiMegwnNp515dmWB@zenbox>

On Fri, Jun 05, 2026 at 03:19:09PM -0400, Justin Suess wrote:
> On Tue, Jun 02, 2026 at 04:42:51AM +0300, Jarkko Sakkinen wrote:
> > I played with an idea could Landlock LSM be used to do conceptually a
> > better fit sandbox for programs such as Anthropic Sandbox Runtime [1].
> > 
> > After some missteps at first I got it pulled together quite well:
> > 
> > https://crates.io/crates/landstrip
> > 
> > To see it in action I also have a fork of pi-hashline-readmap plugin,
> > which was a cherry-picked test case I wanted to try out given it already
> > hooks the bash tool command for compressed output.
> > 
> > I just thought that this might interest some as Landlock is not really
> > over-used kernel feature in "application sense".
> > 
> > This is a more lower barrier and more failure tolerant to deploy than
> > Bubblewrap based container for this use and purpose in my opinion
> > at least.
> > 
> Very cool! Landlock is great for this usecase of application driven
> sandboxing.
> 
> (just a quick note, the linux-security-module/linux-integrity
> mailing lists mostly for kernel development patches, the
> landlock.lists.linux.dev list is more for
> userspace Landlock topics like this. so I removed the cc for
> linux-security-module/linux-integrity and added that list)
> 
> I notice there is a seccomp policy for unix sockets in this application.
> Although it might not be in your kernel yet, support for sandboxing
> named unix sockets with Landlock was recently merged. :)
> 
> https://lore.kernel.org/linux-security-module/20260327164838.38231-1-gnoack3000@gmail.com/

Thanks for the pointer. My focus has been more in the wiring than inner
shenanigans but soon might be a good time to revisit :-)

I have also Seatbelt FFI and Windows AppContainer profiles are whatever
they call them through Win32 API.

BR, Jarkko

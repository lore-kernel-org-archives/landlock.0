Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2CB3E866B
	for <landlock@lists.linux.dev>; Wed, 10 Jun 2026 09:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084809; cv=none; b=CHyo3UEjOhrPPmqeZqvvCsaE4fi+RZdTVAAZOMzoY9DaC8Dd/wQcwiZB0LzHm2bw4/2dAWKKLzao0DOtWvDoFzFJz15wOhCddi67XWdZl8UzXLyJvtcWGz5r/M9728dSa5ogUzTmq0w3eGwR9n23DKRlJYAo38ursl10qrg2tgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084809; c=relaxed/simple;
	bh=yOLoQXjj5OAu/Dy35aOWT7uNkt/CArDNv5OIrHWepmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ibefrxpHyUKSdTZnY/uEt32Z05DYfStd1tMGkvNG/ENQDSd+9uuIcUK+tO37+QqA82J2xMfLZ0MLXuyrjdWUJTCzIAwO3/vGlfJ3c9FAWHyHv+szQsUPs7LodredeOQt2pW5X/gJ9BM0PKg3V3CKUiYkINrMX7MAVDRgFFQi2ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHx7qUG3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHx7qUG3"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8B71D1F00893;
	Wed, 10 Jun 2026 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781084808;
	bh=zIyZDjRQQFqhUJ0DHIk27shGgcQDfXONxpVqtOHqGDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fHx7qUG3WqcXYqt2a0eTVqfevinPyI44N1PgQHxAT8Jh+rZFKENG5X1q9dJksw4sl
	 6tbscp3cXagGRjjyvZz5T7FneQ3z0ZECFAmUD5EYia4h6Iio4kXC2qf8xWymUYnaSa
	 65sVO/dM8VzYyrvsuxtYxuGKEOO7HodvWra57RIz3nvrs4MsPaUVY0i1vQr436Wun5
	 U2H+y7GMMGUz+uBuwt+MflZrjRhU5J0AJLc/vGQGlaGNxaFKfqGexXBgZTqfvF7TeO
	 hDAdnHVu8hgoPtoMqxhxyHzc0zW8OPLBHn/GY4DAs5YXeFSZi5TDZ0Qf8RmfZbrl+y
	 d5laV0dA8dLsw==
Date: Wed, 10 Jun 2026 12:46:44 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: Justin Suess <utilityemal77@gmail.com>, landlock@lists.linux.dev
Subject: Re: Landstrip
Message-ID: <aikyhKl829s_digC@kernel.org>
References: <ah41G3F850HLeiBQ@kernel.org>
 <aiMegwnNp515dmWB@zenbox>
 <aiYooyQewuHgXUZ0@kernel.org>
 <aiZgKQWLjWwvyMEe@kernel.org>
 <20260609.ooNe7wi9Vai3@digikod.net>
 <aikxK37vyUmv1yLm@kernel.org>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aikxK37vyUmv1yLm@kernel.org>

On Wed, Jun 10, 2026 at 12:41:03PM +0300, Jarkko Sakkinen wrote:
 I'm not sure if I fully understand this.
> 
> I modified my client to temporarily use syscalls with the plan to return
> back using it as soon as it has all the features.
> 
> It is only small portion of the implementation so it really is not a big
> deal. There's also Window and macOS.
> 
> I.e. it is internal code for the client not a sloppy fork and I can
> do git revert  + integration once there is the feature available.
> 
> I have direct FFI also on macOS and Win32.

And I'm obviously returning back to your crate in future. No intention
to maintain syscall wrappers in long-term  but right now just for
testing stuff it was useful temporal solution.

For the spec I'm mapping against see:

https://github.com/anthropic-experimental/sandbox-runtime

I saw the code and realized that it does not have anything for Windows
and Seatbelt and Bubblewrap do not pair too well so I decided to make
a fully parametrized version of it so that it could be swapped as
internals for ASR.

I don't have Claude Code installed on any of my machines but since that
policy has high spread it seemed like worth of focusing into as an app
sandboxing policy. I.e. probably could be used in most of coding agents.

So.. I don't think there's any problem here really.

BR, Jarkko

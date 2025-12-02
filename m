Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E17204F93
	for <landlock@lists.linux.dev>; Tue,  2 Dec 2025 19:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764702147; cv=none; b=grzS9YNr2LdG7y+Jn47E+DN7VUXb2EnoVBe3docDer5RttzBZuwu9l9uclMM0/EhDwOKzefYG89Hg7+zqVgg8L2QgePM7kr3jEWk0NNEo+PrkMbDDs/jZwQ7JLwOyo6vcU4CbtG+ESdmn1f5AiSdA3ZFCykL57tL6vMOhKjo8ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764702147; c=relaxed/simple;
	bh=EgU2pB7CqW+o/ELIX/Coo+tDj1bri/KQAL7JY2nGlWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GWZ7Fc/J0QZwUn7X0czlSe+DvEMOB+gKrlQjEpuL/pEc8HQ9wN96e8+tJd9lkXMHZ9yGCo/CkvZY0hvFep7rYDkQAYODFbaMDIOoCwpHCKweCU5wdYND/wAlk6QLlyzAOOBWYDHIhwPRdz//HwUy8tB+hBPa8YBL16pK1ei9Ke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=MH+RUUsI; arc=none smtp.client-ip=185.125.25.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="MH+RUUsI"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4dLVWR6S8TzHP5;
	Tue,  2 Dec 2025 20:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1764702131;
	bh=1iPJwre5xtF1W+TRRN8GOvD0kMftQ86HhUUqxCmF9wE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MH+RUUsIZD8rOM4UTNefLgO9C0VlOr3xAhPXg8VQ7JZ33jUKneS3NowuweJpvD+Is
	 0IIaXyYTrHVZHR1s0RegKOOhmfrvdrvArxKqjXSlbJ/UyiNk0HZX21Rp/rsgpr0fSn
	 WwuStG/ZVRKoAchhBuHfROdrX8/iVKb7P8P7vJpw=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4dLVWR0k1Gzk9y;
	Tue,  2 Dec 2025 20:02:11 +0100 (CET)
Date: Tue, 2 Dec 2025 20:02:08 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Max <max.lists@mxzero.net>
Cc: Marek =?utf-8?B?S8O8dGhl?= <m.k@mk16.de>, landlock@lists.linux.dev
Subject: Re: Question about using Landlock
Message-ID: <20251202.Iphie5shoov9@digikod.net>
References: <20251119211937.52cd76a3@ciel>
 <20251120.aeC5eePhof6e@digikod.net>
 <cjfmz2jynazcxgu7bckxty7n4ndoaev2hsamehyp7c7b2qmnep@dltjwu4j5yt4>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cjfmz2jynazcxgu7bckxty7n4ndoaev2hsamehyp7c7b2qmnep@dltjwu4j5yt4>
X-Infomaniak-Routing: alpha

On Fri, Nov 21, 2025 at 04:06:16PM +0100, Max wrote:
> Hi,
> 
> On 2025 Nov 20 18:36, Mickaël Salaün wrote:
> [... snip ]
> > 
> > Please keep us updated about new sandboxed programs.
> > 
> 
> Do you maintain a list of programs that use landlock?
> I'm only aware of zathura [0] that uses landlock (and/or libseccomp) to
> implement a sandbox.
> I briefly looked at https://landlock.io/ but couldn't find anything there.

There were no comprehensive list of sandboxed programs but only
the Landlock newsletters and talks mentioning new ones.

I wrote a new page to help with that and it's now online:
https://landlock.io/integrations/

Feel free to send pull requests to add new projects.

 Mickaël

> 
> [0] https://github.com/pwmt/zathura
> 
> -Max
> 

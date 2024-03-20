Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B9D41C7A
	for <landlock@lists.linux.dev>; Wed, 20 Mar 2024 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710943514; cv=none; b=EdZH2UuE1vRfqagOfTSbbWYy63wMkaW67exlUgC1hTRKwUgzPfxhG4rBMvwW1+fs/si/G+i8dfPWu27ql96iX4Z/22eRTH6UvQ2nMqZAzMeMOVVB1HTcvTcRujymmaI1GZrXKdb5fC0fN+svu5AGkPQnFv9FZ5n0ptIbtyTxgCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710943514; c=relaxed/simple;
	bh=n/5Dg88p3dDYt6WmzFmHWthMgG48LKjtQG53a0D5t20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2ppmygHv6+uJeB3MKxUvNjAe+ItrRBlGdKdxKckHAe+4zGQbQEFVAYf8cVV9JsYjdAcd1NODkjiD/ggO5FamLERSZZzY+GeRcBUlPZ/JJqIErswcoy7N3cNkdFSqLSyTVdbEJ/yKEjZtlukjIl6wAiDpOZDEIOFYyBbWhPTsvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=KH2QkHct; arc=none smtp.client-ip=83.166.143.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="KH2QkHct"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4V09Md23lfzHql;
	Wed, 20 Mar 2024 15:05:01 +0100 (CET)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4V09Mc5R2qzNZL;
	Wed, 20 Mar 2024 15:05:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1710943501;
	bh=n/5Dg88p3dDYt6WmzFmHWthMgG48LKjtQG53a0D5t20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KH2QkHctwp8Y46Im3z47y+uI9+k6R5T72wc/Ax0kFNrd9xZEbJPZd2G7bB1p9cDUF
	 cUgMy8t5sv9N/ZkP99MOwedBlu9bbc7ArzatiSupOZfFIWdYAR66bnzg5C4mTCbAPh
	 bJnQcNFEkIFMZpp2wXOQ4On5H1KFs3RQvnMYSCog=
Date: Wed, 20 Mar 2024 15:05:00 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Yves Rutschle <landlock@rutschle.net>
Cc: landlock@lists.linux.dev
Subject: Re: Landlock support in sslh
Message-ID: <20240320.dahthi7ooCh8@digikod.net>
References: <Zfq6f30spnYCx_9Y@rutschle.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zfq6f30spnYCx_9Y@rutschle.net>
X-Infomaniak-Routing: alpha

On Wed, Mar 20, 2024 at 10:29:19AM +0000, Yves Rutschle wrote:
> Hello all,

Hi Yves,

> 
> FYI, Landlock has been (finally) added in sslh 2.1.0,
> released just now:
> https://www.rutschle.net/tech/sslh/download.html

Excellent! Thanks for letting us know.

> 
> Compared to two years ago when I tried, Landlock is now
> perfectly integrated in Debian and no trouble at all to use.
> 
> Cheers,
> Y.
> 

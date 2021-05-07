Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3F272
	for <landlock@lists.linux.dev>; Fri,  7 May 2021 07:58:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix, from userid 1101)
	id 9F27F61431; Fri,  7 May 2021 07:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620374318;
	bh=ln0DNkj3AbJCDVRKLELuj2WhxuHA++rvY3c36umBl3U=;
	h=Date:To:Subject:From:From;
	b=axgae30Q73hL7Umt06M3+cOfyVG5Sf/eui57LL9575dhXR4aHXxCgka+xgeulR9Je
	 cLI1S7j5K+0AWH48Ak5KvPl3mTFaAE00nvYA3fU98hXZs7Y6YmUZv2YADIY1lX/EPP
	 LnKx2BMByBDhPEz+MH+6tYeoDePiryw3ng90mh+RTekW30N52azIG0NRMJVwiGrvBp
	 C7CRZWAq9sLCd9W91Y734YQfAUfaMxHNwpyjhYQ8FTQBBZnxmb1RVhrlbg42KCsSSr
	 Z4EuJJKEtCx+j9iac0VpOEAd+1k5IZPiMKqH+TWNrvRBWPF5g0bM7BWmXm7ldw+hJP
	 HpblE8IwmfW5g==
Date: Fri, 07 May 2021 07:58:38 +0000
To: landlock@lists.linux.dev
Subject: test mail
User-Agent: Heirloom mailx 12.5 7/5/10
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20210507075838.9F27F61431@mail.kernel.org>
From: skachukattu <skachukattu@kernel.org>

Test mail

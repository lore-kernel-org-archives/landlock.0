Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617843A48D5
	for <landlock@lists.linux.dev>; Tue, 28 Jul 2026 11:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785236655; cv=none; b=R6N74DmhxTff7CHlbxVk42qIWxUSTnB/D6+jbJSU189XVZxPz4ZWKsuez1uLPHZ62od08bTUVErE9q4CJP6E1m5f5QUxjvKosUI3a/zim60beWnJqusmdCB8Vd8K8JvCsjXvpbisQZ1roBBI1BH7HcFyaivfckqidYwO1HVwt8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785236655; c=relaxed/simple;
	bh=nvZpyrphfo73Lx0mykWDWIEGL7gX0bhWA2m7kfRC3Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzyr88zejdDt/Ui8V1wtpMrLxdae71lA+q22/lCFeOAXYMOYQApjMzXNxNhoYujblfj8gYedjH1V22oSP6yjJzt9cw6SJ7S5VlGTyxssxES247895XuuL8VUPiRqLSiD8l4Q5isidEPcDjCMXaH31Ns6aaiNMIPmHk8a6VCIbEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=aLWWTbcZ; arc=none smtp.client-ip=84.16.66.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="aLWWTbcZ"
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4h8Xf43Hf2zZmh;
	Tue, 28 Jul 2026 13:04:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1785236652;
	bh=khhT3E39BwcNM7t6uvGqakR/jIEOKCsoSW1GBz4M1Mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLWWTbcZ9vGqMOjTH/OpJyI2PcKLQmP5C5a6DoHMcF3KbNtj+ozzfVzGGwt/6sCAz
	 n8xdL6AlHSP+bHE9MDmuTUh39MD5CWN0WAmSomwlCTRgRV5JjLs0r+Z1Ym2d4yxy+1
	 ++p+rcR+hGkUTHQ42pskknG1uxizasqdYrZD9YSI=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4h8Xf331bbztWL;
	Tue, 28 Jul 2026 13:04:11 +0200 (CEST)
Date: Tue, 28 Jul 2026 13:04:10 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Oxana Kharitonova <oxana@cloudflare.com>
Cc: gnoack@google.com, paul@paul-moore.com, serge@hallyn.com, 
	wangyan01@kylinos.cn, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, landlock@lists.linux.dev, webprosto@gmail.com
Subject: Re: [PATCH 4/6] selftests/landlock: Test POSIX message queue scoping
Message-ID: <20260728.Apei4yai1ea9@digikod.net>
References: <20260722122952.42149-1-oxana@cloudflare.com>
 <20260722122952.42149-5-oxana@cloudflare.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722122952.42149-5-oxana@cloudflare.com>
X-Infomaniak-Routing: alpha

These tests are good, but related audit (and quiet) tests are missing.

A test should check the mqueue unlink.

A test should check that once the sandboxed process that created an
mqueue file exits, a new sibling or child sandboxed process cannot
access this (stale) mqueue, but a parent sandboxed process should still
be allowed to do so as well as for an unsandboxed process.

On Wed, Jul 22, 2026 at 01:29:40PM +0100, Oxana Kharitonova wrote:
> Add tests for LANDLOCK_SCOPE_POSIX_MSG_QUEUE.
> 
> Verify that opening a queue created outside the current scoped domain is
> denied, and that opening a queue created within the same domain remains
> allowed.
> 
> Signed-off-by: Oxana Kharitonova <oxana@cloudflare.com>
> ---
>  .../landlock/scoped_posix_msg_queue_test.c    | 223 ++++++++++++++++++
>  .../testing/selftests/landlock/scoped_test.c  |   2 +-
>  2 files changed, 224 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/landlock/scoped_posix_msg_queue_test.c
> 
> diff --git a/tools/testing/selftests/landlock/scoped_posix_msg_queue_test.c b/tools/testing/selftests/landlock/scoped_posix_msg_queue_test.c
> new file mode 100644
> index 000000000000..602ba5c7a83d
> --- /dev/null
> +++ b/tools/testing/selftests/landlock/scoped_posix_msg_queue_test.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Landlock tests - POSIX message queue scoping
> + *
> + * Copyright © 2024-2026 Microsoft Corporation

You need to update that.

Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8E32562E
	for <landlock@lists.linux.dev>; Mon,  1 Jul 2024 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846997; cv=none; b=ixg+BN+RwVwlJJFziOzVoNeze1ggdwIc5L7nj5r22fLmm9/gNnz+3jCXVwcm2hrM403TW4iO4EFypgqZ6HpSOTAjvMJI4WxTEPSfir1nciH0MvpMMWYdiSnuOA8eyVtpPUUriEMBtsZn8zQlwTWWJTvOn+q4DdzhnGc5g+p9SVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846997; c=relaxed/simple;
	bh=ZdyMdd9QhP4sl3dhhLVqWMIfvOsnTeNW+/ALCEwSR6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgLrxvKTqL6Rc5Yvd5GY9TYrhlmbZqedL6/e/MU1RmWuF8zpeC06BiwFmj8RWuRr+uy+5VZNeZKxWrG2XxybKTyg2WQv+ZiQGTYEMwF1J3SRJpSw5q24N/JIOCOb3K/A5owy3443tv87KQvg6HbwndBmUpGrDBfQqF0YrKT/YEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=mkR6iQ02; arc=none smtp.client-ip=185.125.25.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="mkR6iQ02"
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WCV4P6Q7Bz5y5;
	Mon,  1 Jul 2024 17:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1719846981;
	bh=Y+7UNMZU7NLv97FtsbISJiIPOrMR4H6E+nTtwJMS9/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkR6iQ02r8msl92zX5U/2Q0xjcixqDnIq2h8NnNMunEChgQ9eM2ZuzddQW8/6GDmp
	 ZFRzcGCOZgz73ASPzwFLo8bJdH6ti5N+JDt6Fxi+htJwSGBVDC3YbnFGaqiPYoet11
	 rApjk26/Nme94e6NdwLzsxoRNa5DDhPhZcx/zLtU=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4WCV4P2sW8zFRr;
	Mon,  1 Jul 2024 17:16:21 +0200 (CEST)
Date: Mon, 1 Jul 2024 17:16:19 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Cc: landlock@lists.linux.dev
Subject: Re: Help with LANDLOCK_ACCESS_FS_EXECUTE
Message-ID: <20240701.Pe4zeeph4epo@digikod.net>
References: <5dcec431-4089-4c73-93c6-eda0e0616ebc@suse.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5dcec431-4089-4c73-93c6-eda0e0616ebc@suse.com>
X-Infomaniak-Routing: alpha

Hi Andrea,

On Mon, Jul 01, 2024 at 04:25:53PM +0200, Andrea Cervesato wrote:
> Hi all,
> 
> I'm actually writing a test for LANDLOCK_ACCESS_FS_EXECUTE flag in LTP [1].
> The test is really simple: it applies the EXECUTE landlock rule inside a
> folder and it verifies that a binary inside it can be executed.
> A similar test applies the rule only to the specific binary and check again
> its execution.

Good to know you're working on that!

> 
> But while I was writing the test, I encountered an issue with the specific
> rule setup, since EACCES is raised unexpectedly during binary execution.
> So I wrote a reproducer, assuming that LTP might be the issue, but it's not.
> The reproducer actually shows that binary can't be executed after applying
> the EXECUTE rule.
> 
> I will attach the source code to this email. Can you please tell me if
> there's something wrong with it?

I guess the binary you're trying to execute is dynamically linked, which
means that the kernel needs to open the related .so files on behalf of
the calling (sandboxed) process, which means that
LANDLOCK_ACCESS_FS_READ_FILE needs to be allowed on these files.  You
can use a static binary to avoid this kind of issue, or just not handle
LANDLOCK_ACCESS_FS_READ_FILE.

> 
> Best regards,
> Andrea Cervesato
> 
> 
> [1] https://linux-test-project.readthedocs.io/en/latest/



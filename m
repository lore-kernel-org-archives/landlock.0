Received: from mx.mxzero.net (mx.mxzero.net [185.207.105.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2473A33D6D4
	for <landlock@lists.linux.dev>; Fri, 21 Nov 2025 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.207.105.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763737981; cv=none; b=SQeRy5uSpq9cqMQD0JBa0e99YBjb3D4kQPr7CxZBzh4VJAVJPdHjeb7w1pkgUREjcsbkApWK+rViP88p19vooOLoC+h2y/mxQijA8rB4TLDm0GjV7e/0ir3l4vy9Yg7Wm7tuOzsLdl6rfl3GDWTlp1c6KATnGgOFSoZrZojKL3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763737981; c=relaxed/simple;
	bh=fYkka5wX0SmWz4jgpfKDH6fryH6NKwEnDn+zG0Dl8RU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuNw5W9VHvF3tnfzFW2WqzjvJBLqDDuhA7oT2nc5Z+ZbVJ1e+xPVT8rfgsN722De3oiDVwyPviXiu8DUkYKTF1vfzvIHOQJW5Z+R4h0V9+lnQFgiVE3u7sdKYrs/0tKQiQBErDStbfSHRKYzskn1BAZLr2yQvEAGrOhDav+U6MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mxzero.net; spf=pass smtp.mailfrom=mxzero.net; dkim=pass (1024-bit key) header.d=mxzero.net header.i=@mxzero.net header.b=MOpW5Xq8; arc=none smtp.client-ip=185.207.105.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mxzero.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mxzero.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mxzero.net header.i=@mxzero.net header.b="MOpW5Xq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mxzero.net; s=20230930;
	t=1763737577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wjZvU0tbZtucSX4vuIWZRTaD5rZ4ZcNyZHbDaxiPBP4=;
	b=MOpW5Xq8fkoeMBg/Akjqosw1ceCffQwp0IFrTSlsbsfkiSG3b5zXmND1z4qPycWfohdrwj
	3zFNnGPCj71rfJebwn33Cq652VEz5eGxA0xe9o427cckF6+sWMLfNyIy9YJ1njhUhosXJw
	E9yVg24QAvixxgRni2BrpEGUOjBX3U0=
Received: 
	by mxzero.net (OpenSMTPD) with ESMTPSA id e92a2699 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 21 Nov 2025 16:06:17 +0100 (CET)
Date: Fri, 21 Nov 2025 16:06:16 +0100
From: Max <max.lists@mxzero.net>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Marek =?utf-8?B?S8O8dGhl?= <m.k@mk16.de>, landlock@lists.linux.dev
Subject: Re: Question about using Landlock
Message-ID: <cjfmz2jynazcxgu7bckxty7n4ndoaev2hsamehyp7c7b2qmnep@dltjwu4j5yt4>
Mail-Followup-To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
	Marek =?utf-8?B?S8O8dGhl?= <m.k@mk16.de>, landlock@lists.linux.dev
References: <20251119211937.52cd76a3@ciel>
 <20251120.aeC5eePhof6e@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251120.aeC5eePhof6e@digikod.net>

Hi,

On 2025 Nov 20 18:36, Mickaël Salaün wrote:
[... snip ]
>
>Please keep us updated about new sandboxed programs.
>

Do you maintain a list of programs that use landlock?
I'm only aware of zathura [0] that uses landlock (and/or libseccomp) to 
implement a sandbox.
I briefly looked at https://landlock.io/ but couldn't find anything 
there.

[0] https://github.com/pwmt/zathura

-Max

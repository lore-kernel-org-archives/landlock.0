Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=140.205.208.109
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220140;
	b=M6o9HUt6bIUfCjq/iKAihr4a4ZfEVnnt6Kyhpva/RC0aBsfGNQ7z2/1JwOxNikOwZBC+
	 Ts54btnLxLba9XtuL0l0s8BEA0kUN7jYUaFZUp8hilJM0Kj59gW2wfxW4Y9MUy3Av0YNh
	 COPGrxcdk3dZjN57eFv/kS9rKXJiLgAuSswCsZrRNcFkt5XhbSujnIrqDlnqHpDA6UCCt
	 INALZvc37MptZI0yC0U8dKuSiB8FQBq3id/PTNSKSrLPbOzw9/pu3nfmDL7ZRUrTKD6oL
	 tFdi9ip6GAuZZYG1DW+x4LZYJr4YjZz44m25p0zj/XYseHDV+KVzIeiJXJlEyn6cVpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220140;
	h=DMARC-Filter:X-AliDM-RcptTo:Feedback-ID:Received:X-EnvId:Date:From:
	 Reply-To:To:Message-ID:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=6h4OCnRWYBdbDhq7wtOufDSVXo/Ub7dOrvhMgBzqYV8=;
	b=W1WJb1L+qfvHq8C5UUYMvxQ+LdRF2EyGfKpI3Ej92vDs5aF5h9scNE2QcW9zcbDO068W
	 ey1WAZ6sKRKYtohCWsQPwCEyifKiw6etPhDpBY6xzk5D6u57SOPvxQ0Uua0f+z31u643P
	 baEUFCxAFdZ+4kLGlzkMCuwUJ7kZF5rPW+jj9JBxrRjVIc3bqq8RxUl9Yel+5yD7jRJ0n
	 KixFRS7GRK3Lw2quXdK3jHbGVvjVfVPaKSZGMW2HPc3El/GUwzo7S4rcW+jMmlXHvCum2
	 vxa/6G5k4ZfB9kywfaVYavchrM1a47wQCUoHwPusQIkt7UKICptsV7zNL13uxn6Lvyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mail.wang.market;
	spf=pass smtp.mailfrom=mail.wang.market;
	arc=none smtp.remote-ip=140.205.208.109
Received: from out208-109.dm.aliyun.com (out208-109.dm.aliyun.com [140.205.208.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B5260A2607
	for <landlock@lists.linux.dev>; Sat, 21 Nov 2026 00:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86B5260A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mail.wang.market
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.wang.market
X-AliDM-RcptTo: bGFuZGxvY2tAbGlzdHMubGludXguZGV2
Feedback-ID: default:hezuo@mail.wang.market:alibabak_SmtpBatch:23154
Received: from 677b208b2007(mailfrom:hezuo@mail.wang.market fp:SMTPD_-VHcGa8Xr0H cluster:AY35D)
          by smtpdm.aliyun.com(127.0.0.1);
          Sat, 21 Nov 2026 08:15:34 +0800
X-EnvId: 600000375160795301
Date: Sat, 21 Nov 2026 08:15:34 +0800 (CST)
From: hezuo@mail.wang.market
Reply-To: 921153866@qq.com
To: landlock@lists.linux.dev
Message-ID: <1401749758.1813.1795220134638@677b208b2007>
Subject: The technical value of the Go-Landlock project deserves to be seen
 by more people
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Post: <mailto:landlock@lists.linux.dev>
List-Help: <mailto:landlock+help@lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
List-Owner: <mailto:landlock+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Landlock. I noticed that the Go-Landlock project you maintain has received 374 stars on GitHub. It is currently one of the most complete implementations of the Linux Landlock sandbox mechanism in the Go ecosystem. This design idea is very solid, especially providing a clear technical path for safe and controllable context isolation.

 Our team has been helping open source developers solve a common problem: Even if truly valuable technological achievements are made, it is often difficult to reach the people who really need it. BizBot is an independently operating AI promotion system that can automatically scan the entire network for developers or teams that match your technology stack (Go/Rust/Linux/sandboxing). After identifying potential points of interest, it initiates automated communication to help you push your project to users who may actually use it.

 This tool is completely free and can be used immediately after installation. You can search xnx3/bizbot on GitHub to find the project homepage and try it out at any time. If you're interested, I can send you a quick deployment guide for reference.

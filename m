Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887251373
	for <landlock@lists.linux.dev>; Thu, 24 Feb 2022 21:11:58 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sm2n.ca; s=key1;
	t=1645737109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ArJP8IOO/DrtPzH1YzzcGtziAOVu0momcZTUfpMUrE=;
	b=a2WiCqFeuo+R1/LW6DtaXjLBVKMJtF+NVN2aeMWBCzHSK7e8GN/z0l3nXDJSsLsAWq9uMf
	SyB/H6fEeJOIqKzlgHcMm/9jLkkwm+3iY+dibw2ZJk/FN/0Tb82bEiIK4LuAl7KxbPeuAU
	W3Z5Ng2hJ88vhQAwO7cSLSC724Ujr+d1Hoi0nv+q+vrxi2pVKzBziBU5QNl4GQ1KLBIUDg
	jBkcT5A2CRpJg7oy5u27fO0DEoU7kmilr4WWRv/uPXeBTSN2EPz4T3YxFEupHRVj95Y75b
	jTZcg6u3J+ua1AQOclDzKAVNcTodo9XeBtJ7yYR/boo2bqIFrn7KNUwmylaOWA==
From: S.M Mukarram Nainar <theone@sm2n.ca>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 landlock@lists.linux.dev
Cc: TaylorPhebillo@gmail.com
Subject: Re: Landlock and O_PATH
In-Reply-To: <4951c6da-eaa4-b729-59e3-a2c539ddc1fb@digikod.net>
References: <87v8x83rhz.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
 <155b9df6-8557-cd3e-1a59-6a852340a3d7@digikod.net>
 <87sfsb4ya5.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
 <115f32a0-fb96-3598-a52a-48c1f1346d76@digikod.net>
 <87pmne4mmm.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
 <4951c6da-eaa4-b729-59e3-a2c539ddc1fb@digikod.net>
Date: Thu, 24 Feb 2022 16:11:47 -0500
Message-ID: <87ley03r70.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: sm2n.ca

> Correct, a given Landlock flag/command/attribute will not change 
> behavior over time, as (in theory) all Linux interfaces. If a flag is 
> not enough, extensible structs used by the Landlock syscalls can be 
> used: 
> https://lpc.events/event/7/contributions/657/attachments/639/1159/extensible_syscalls.pdf

That makes sense. One (hopefully) final question: What is Landlock's
policy around future changes in the kernel? Taking the earlier example,
O_PATH was apparently added in Linux 2.6.39. If Landlock had existed
prior to that, and LANDLOCK_ACCESS_FS_WALK as well, would the flag have
been extended to cover that usecase? To be maybe more clear, I'm
wondering if I can trust Landlock policies to always restrict a given
action, irrespective of what new ways to do it may be introduced in
the future?

Thanks,
Mukarram

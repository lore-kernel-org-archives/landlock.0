Received: from smtp-8fae.mail.infomaniak.ch (smtp-8fae.mail.infomaniak.ch [83.166.143.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82D7C8E3
	for <landlock@lists.linux.dev>; Wed, 28 Jun 2023 16:17:26 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QrlGv72cfzMpvPt;
	Wed, 28 Jun 2023 15:04:23 +0000 (UTC)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4QrlGv32G5zMpvTt;
	Wed, 28 Jun 2023 17:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1687964663;
	bh=a69QKWoBWyoYrjsAbXwiDa6OpF9uyM14pSW3rsA3UsQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=l1dkycUAj+tpqLU0yovHHBlbjyUQF//i5e2+wYaGiWLxJVYLFRbzkissilm+XBwQ9
	 SD8HAaduBlN2UfeQfjOBfrcRpd6KBWdUFOqqGCNEAhlv1Hfp26kBChvQkKa4fGqKH+
	 gcjEIlHZNL3u/aHBXxjuEltxnKpNv52pqzUFHwRc=
Message-ID: <f2a1ac61-fc93-50d2-cccd-9485ada0b047@digikod.net>
Date: Wed, 28 Jun 2023 17:04:22 +0200
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Subject: Re: self protect process with landlock to getting killed
Content-Language: en-US
To: Jay Freyensee <why2jjj.linux@gmail.com>, landlock@lists.linux.dev
References: <480a4459-dcfe-e5ce-bce8-6fc59cb89b9e@gmail.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <480a4459-dcfe-e5ce-bce8-6fc59cb89b9e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hi,

On 27/06/2023 18:14, Jay Freyensee wrote:
> Hi I had a question for someone. Is there a way to protect a landlocked
> process from being killed by a non-landlock process?  Does that
> protection include root protection and root not being able to kill that
> landlocked process?

Landlock is sandboxing feature, which means that it restricts a set of 
processes from accessing resources. Because it is opt-in per process 
hierarchy, it doesn't restrict non-landlocked processes from sending 
signal or tracing landlocked processes. However, other Linux security 
mechanisms (e.g., UID) might restrict this kind of interactions.

If you want to restrict a process from tampering with another process 
(i.e. ptrace restriction, not kill restriction), you need to sandbox it 
with Landlock, and the target process need to not be in the same sandbox 
or a nested one.

For now, Landlock doesn't support signal restriction. This should be 
part of a future development.

> 
> What about is there a way to protect the directory the landlock process
> sits in from being tampered/written-to by a non-landlock process?

The same principle applies: this is not possible with Landlock itself. 
The potential malicious processes should be sandboxed.


> 
> I came up with the question from reading this comment in the kernel docs:
> 
> "Once a thread is landlocked, there is no way to remove its security
> policy; only adding more restrictions is allowed."
> 
> I believe you can get this protection through SELinux I was just curious
> if the landlocked gave you that as well; SELinux can be confusing to
> work with.

SELinux enables to restrict the whole system, so it is like if every 
processes were sandboxed.

> 
> 
> Thank you,
> 
> Jay
> 
> 

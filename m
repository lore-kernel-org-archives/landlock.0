Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072F12294
	for <landlock@lists.linux.dev>; Mon,  7 Nov 2022 18:18:48 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4N5fFT2kv4zMqFs2;
	Mon,  7 Nov 2022 19:02:05 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4N5fFT02CSzMpqCL;
	Mon,  7 Nov 2022 19:02:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1667844125;
	bh=l6k9jAWitik5JzcWX/y/UTdJHmijLCFs+adrJVM96ls=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=Lt421u4nOvZ/LwUEurhM4W1v5p9Hn7vpWHDqTDSsd7b4rYxasLZRqlyln4cCzLv8c
	 ug94Q9knO4PwBsHgV3XyEKoCj28/sQruD5EHu8oHTrPuJ2Q07healX8fOhbjPFKtIp
	 o1lReapMlzmiIJq8pAj75VO+Xm6m0akcQ6t+Czq0=
Message-ID: <78f7af34-cbd7-eb25-60fb-64385d118d90@digikod.net>
Date: Mon, 7 Nov 2022 19:02:04 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Subject: Re: Landlock setup
Content-Language: en-US
To: Yves Rutschle <landlock@rutschle.net>
References: <20221107172216.GA10688@rutschle.net>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Cc: landlock@lists.linux.dev
In-Reply-To: <20221107172216.GA10688@rutschle.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Yves,

On 07/11/2022 18:22, Yves Rutschle wrote:
> Hello everyone,
> 
> Following Mickael's presentation of Landlock at
> Pass-the-Salt 2022, I intend to add support for it to sslh.
> 
> I'm starting from the beginning: compiling and running the
> example, which so far complains the LSM is not loaded, when
> the kernel tells me it is...
> 
> I'm running a stock Debian where I manually add landlock to
> the command line:
> 
> [    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.18.0-3-amd64 root=UUID=79c3bdf6-4be2-46d6-b006-bb17170247b1 ro quiet lsm=landlock

This is correct, but you may also want to enable other LSMs if you are 
using them (e.g. Yama). You should probably stick to the new default 
Debian Sid cmdline: 
https://salsa.debian.org/kernel-team/linux/-/commit/1ef40f40e593a5dc223e9ce171fa8f2cd5aba198

> 
> the kernel indicates the LSM is started:
> 
> [    0.076550] LSM: Security Framework initializing
> [    0.076559] landlock: Up and running.
> 
> 
> Yet running the example fails:
> 
> # LL_FS_RO="/bin:/lib:/usr:/proc:/etc:/dev/urandom" LL_FS_RW="/dev/null:/dev/full:/dev/zero:/dev/pts:/tmp" ./lock bash -i
> Failed to check Landlock compatibility: Function not implemented
> Hint: Landlock is not supported by the current kernel. To support it, build the kernel with CONFIG_SECURITY_LANDLOCK=y and prepend "landlock," to the content of CONFIG_LSM.
> 
> 
> 
> What would I be doing wrong?

Your setup is good and it should work. You can debug a bit more with an 
up-to-date strace (which will print the Landlock syscalls). I guess you 
are running this sample in a strict seccomp environment that denies 
Landlock syscalls. This may be the result of using an old container 
runtime (Docker, Podman and runc are now patched but the related fix may 
not be backported).

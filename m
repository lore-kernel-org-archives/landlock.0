Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EDD8BE7
	for <landlock@lists.linux.dev>; Tue,  8 Nov 2022 16:18:50 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4N697S1L8JzMqLbh;
	Tue,  8 Nov 2022 15:13:40 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4N697R5XK2zMppY1;
	Tue,  8 Nov 2022 15:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1667916820;
	bh=HjrShD1stpCLCcFKkZ3ItyG2ZaS+8ugorr/dPSwHLMY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=g0M1aBsybDw5LGwDSefsWfINye6jT+NCLBUaC+Y3sVoVOOGGku24nSKtI/y/qNI2p
	 7oA+nn9bJsGrayB0g8J3u4GJ7/bxEL/fiV3lJxrFTxBdYFj4dQos6zeOYj+KGfvmWv
	 qjGhjnQJGNanIATEI45Bl5rtsGbMWXZlmPR5jl/Y=
Message-ID: <f0b57f51-e7c8-41f6-28eb-5dcb11686cc2@digikod.net>
Date: Tue, 8 Nov 2022 15:13:39 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Subject: Re: Landlock setup
Content-Language: en-US
To: Yves Rutschle <landlock@rutschle.net>, landlock@lists.linux.dev
References: <20221107172216.GA10688@rutschle.net>
 <78f7af34-cbd7-eb25-60fb-64385d118d90@digikod.net>
 <20221108112722.GB10688@rutschle.net>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <20221108112722.GB10688@rutschle.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/11/2022 12:27, Yves Rutschle wrote:
> On Mon, Nov 07, 2022 at 07:02:04PM +0100, Mickaël Salaün wrote:
>> This is correct, but you may also want to enable other LSMs if you are using
>> them (e.g. Yama). You should probably stick to the new default Debian Sid
>> cmdline: https://salsa.debian.org/kernel-team/linux/-/commit/1ef40f40e593a5dc223e9ce171fa8f2cd5aba198
> 
> I'm on Debian 11 on this PC, which enables... nothing.

Right, but it doesn't hurt to stick to the future default. :)

> 
>> Your setup is good and it should work. You can debug a bit more with an
>> up-to-date strace (which will print the Landlock syscalls). I guess you are
>> running this sample in a strict seccomp environment that denies Landlock
>> syscalls. This may be the result of using an old container runtime (Docker,
>> Podman and runc are now patched but the related fix may not be backported).
> 
> strace:
> 
> [...]
> mprotect(0x7f5189b04000, 16384, PROT_READ) = 0
> mprotect(0x558557b7c000, 4096, PROT_READ) = 0
> mprotect(0x7f5189b5c000, 8192, PROT_READ) = 0
> munmap(0x7f5189b15000, 94575)           = 0
> [ Process PID=3958 runs in x32 mode. ]
> syscall_0x400001bc(0, 0, 0x1, 0, 0x7f5189b3d2b0, 0x40) = -1 ENOSYS (Function not implemented)
> [ Process PID=3958 runs in 64 bit mode. ]
> dup(2)                                  = 3
> [...]
> 
> => I guess strace is not up to date. I dont think I have
> seccomp enabled either, and I think it would interrupt (as
> in kill) the syscall rather than return ENOSYS. I am not
> running from a docker either.

If you see "landlock: Up and running." in the running kernel log, I 
don't see any reason why the kernel would return ENOSYS for the Landlock 
syscalls.

The default kernel for Debian 11 is Linux 5.10, which doesn't support 
Landlock. I tested with linux-image-5.18.0-0.deb11.4-amd64 and 
linux-image-6.0.0-0.deb11.2-amd64-unsigned and it works fine.

On which architecture are you?

> 
> 
> Ok, so I guess I'll look into upgrading the kernel and
> strace, or compiling it myself.

No need to update strace to debug this issue, it will just not print the 
syscall names and not format their arguments.

> 
> Cheers,
> Y.
> 

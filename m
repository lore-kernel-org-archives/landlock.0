Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB996138
	for <landlock@lists.linux.dev>; Mon, 19 Sep 2022 16:48:28 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MWTHM5KlFzMqD5R;
	Mon, 19 Sep 2022 17:34:07 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4MWTHM39hNzMpnPk;
	Mon, 19 Sep 2022 17:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1663601647;
	bh=Pd2VuXr5ds0+NRsTO+f70K5ZOHlRHEt2BDzcvPfaJ6s=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
	b=G87WrBA0p4NZF7X3HFMv0ZfMBctNMNmSPAwS/xSKMCX1shVRCX3M7FN3A4CFoKp5w
	 Brw20pyETliN4L4EtlJ3VgACq36q9HYFwOIpxb01vz1B9Q64RIXamyBErB2Gf6WDvc
	 NR6at/woU4ujCEtWJJGh5tOrZh5akTF/6hHxRlU4=
Message-ID: <cca35af9-97c0-1226-6d80-05ad2d23f278@digikod.net>
Date: Mon, 19 Sep 2022 17:34:06 +0200
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Subject: Re: Example code instructions
Content-Language: en-US
To: devnull <devnull771992@proton.me>
References: <-9ppKooZaoDsv4FW6d6Q5iiA4mC4yyqc-i-bNOKZ-Mflu5OXpqP2ZaSw3awBrLxeQPNljs4FDzhYbXxzQ7iSbwnWjBV7Vxjr3VI4qaBNOfA=@proton.me>
Cc: landlock@lists.linux.dev
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <-9ppKooZaoDsv4FW6d6Q5iiA4mC4yyqc-i-bNOKZ-Mflu5OXpqP2ZaSw3awBrLxeQPNljs4FDzhYbXxzQ7iSbwnWjBV7Vxjr3VI4qaBNOfA=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 19/09/2022 16:44, devnull wrote:
> I am trying to figure out how to use landlock to implement into userspace applications and came across this example code
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/samples/landlock/sandboxer.c
> 
> However, I find myself unable to successfully build the example code

The simple solution to build this sample is to run `make 
samples/landlock/` in the Linux source directory or simply `make` in the 
sample directory. You need to download the whole kernel source though.

> 
> Perhaps this is an obvious issue for any full time C developer, but it would help increase the use of landlock if there is an example code with step by step instruction on how to actually build it.

Two external C header files are needed:
- an up-to-date unistd.h with the appropriate __NR_landlock_* declarations;
- an up-to-date linux/landlock.h with all the LANDLOCK_ACCESS_* 
declarations.

These files should be in sync with the kernel provided by your distro. 
If it is not the case, you should report this issue.

Otherwise, you can still use your own header files, preferably provided 
by a dedicated package (e.g. linux-libc-dev_*.deb or 
kernel-headers-*.rpm). These files are in the include/uapi/ directory 
from the kernel source.

> 
> So far, any attempt to compile the example "sandboxer.c" (using clang or gcc) will result in the following error:
> 
> sandboxer.c:163:9: error: ‘LANDLOCK_ACCESS_FS_REFER’ undeclared (first use in this function)

This means that the landlock.h file used by the compiler doesn't have 
this declaration, which was added with Linux 5.19 .

> 
> 
> The affected system is running linux 5.19.8 with landlock enabled.

Are you using a custom kernel or one provided by your distro? You may be 
missing a related header/dev package.

> 
> There may just be a missing compile flag to get it working but I have not found any documentation about it.
> Any hints would be appreciated, thank you
> 

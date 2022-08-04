Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D437C
	for <landlock@lists.linux.dev>; Thu,  4 Aug 2022 16:44:06 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4LzDsZ3pBPzMqcvn;
	Thu,  4 Aug 2022 18:37:22 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4LzDsZ1S60zlrKcP;
	Thu,  4 Aug 2022 18:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1659631042;
	bh=paK+u+Qk82NPN0pok2X73YPbTh6sKilMpqPZTMg68n0=;
	h=Date:To:References:Cc:From:Subject:In-Reply-To:From;
	b=ULAYQXsLhkvbM6cVxyJnkfPLv1NIJz2bBE044MEHL7uNRKTMlCZT/qQ1l1SX1i3U4
	 HwfEp2V/gdPbv2ze6Q5bQWk08iVanZ5tJsbKpA4sFVSi6x4FSTS+O/ZuJD67HqkgH+
	 NU9/bV+xVNGTO0yEEk2UT+XlSKgKghfWSoz/l3WM=
Message-ID: <40247c34-3f38-6b6c-ba72-7522596b7801@digikod.net>
Date: Thu, 4 Aug 2022 18:37:21 +0200
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: Eric Leblond <el@stamus-networks.com>
References: <CAGW2j+54_09ij9x2CUtYaWKz=k6ckHLY5un72=VVmeXuJxJoMQ@mail.gmail.com>
Cc: landlock@lists.linux.dev
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: Adding landlock support to Suricata
In-Reply-To: <CAGW2j+54_09ij9x2CUtYaWKz=k6ckHLY5un72=VVmeXuJxJoMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 03/08/2022 15:29, Eric Leblond wrote:
> Hello,

Hi!

> 
> I worked on implementing support for landlock in Suricata. Suricata is
> an open source network threat
> detection engine that reads packets from the network or files and
> outputs analysis in other files.
> As such it is a good candidate for Landlock sandboxing.

Indeed!

> 
> The MR on Suricata is here and feedbacks and reviews are welcome:
> https://github.com/OISF/suricata/pull/7688
> 
> With regards to the usage of Landlock API, it was overall really fine
> and it did not took me long to obtain something working.
> I did although struggle with a few things (yes I'm a newbie here):
> - I looked at first if I had to add a library to the build system
> before realizing that up to date headers were enough

There is no C library. I don't plan to write one but if someone wants to 
get on that boat I'd be please to help. We're focusing on a Go and Rust 
library (WIP) for now.


> - The examples and documentation I found don't cover multiple calls to
> setup a policy and it got me confused a bit:
>    - I had to test to verify that the logic is create ruleset/add
> multiple rules/enforce ruleset

Hmm, the doc example [1] only explains how to add one rule indeed. The 
sandboxer example [2] should help though. I'll update the doc to deal 
with an array of paths.

[1] https://docs.kernel.org/userspace-api/landlock.html
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/samples/landlock/sandboxer.c

> - I did struggle a bit on the ruleset scope flags (handled_access_fs)
> as it was not clear to me this was a choice of the sandbox software
> implementation

Was it about the fact that we need to populate handled_access_fs or that 
we need to mask some bits?

Which modification could have helped you here? 
https://docs.kernel.org/userspace-api/landlock.html#defining-and-enforcing-a-security-policy

> 
> It is just small things that are easy to fix in documentation, for the
> rest it was really easy to implement (if you know the software you are
> adding support to).
> 
> Thanks a lot for Landlock, this is a great feature that is easy to implement.

Thanks for the feedback, it's valuable to improve documentation and help 
others.

> 
> Best regards,

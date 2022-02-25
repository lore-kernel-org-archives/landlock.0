Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4407A
	for <landlock@lists.linux.dev>; Fri, 25 Feb 2022 09:22:22 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4K4knL3zC5zMqYRg;
	Fri, 25 Feb 2022 10:22:14 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4K4knL1FK5zljTgd;
	Fri, 25 Feb 2022 10:22:14 +0100 (CET)
Message-ID: <2dfeb951-8630-60e4-644b-6f621e4b3f24@digikod.net>
Date: Fri, 25 Feb 2022 10:22:19 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: "S.M Mukarram Nainar" <theone@sm2n.ca>, landlock@lists.linux.dev
Cc: TaylorPhebillo@gmail.com
References: <87v8x83rhz.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
 <155b9df6-8557-cd3e-1a59-6a852340a3d7@digikod.net>
 <87sfsb4ya5.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
 <115f32a0-fb96-3598-a52a-48c1f1346d76@digikod.net>
 <87pmne4mmm.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
 <4951c6da-eaa4-b729-59e3-a2c539ddc1fb@digikod.net>
 <87ley03r70.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: Landlock and O_PATH
In-Reply-To: <87ley03r70.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24/02/2022 22:11, S.M Mukarram Nainar wrote:
>> Correct, a given Landlock flag/command/attribute will not change
>> behavior over time, as (in theory) all Linux interfaces. If a flag is
>> not enough, extensible structs used by the Landlock syscalls can be
>> used:
>> https://lpc.events/event/7/contributions/657/attachments/639/1159/extensible_syscalls.pdf
> 
> That makes sense. One (hopefully) final question: What is Landlock's
> policy around future changes in the kernel? Taking the earlier example,
> O_PATH was apparently added in Linux 2.6.39. If Landlock had existed
> prior to that, and LANDLOCK_ACCESS_FS_WALK as well, would the flag have
> been extended to cover that usecase? To be maybe more clear, I'm
> wondering if I can trust Landlock policies to always restrict a given
> action, irrespective of what new ways to do it may be introduced in
> the future?

Landlock uses the LSM framework, which defines a set of hooks according 
to access semantic. O_PATH and chdir is not currently supported for 
path-based LSMs but it is handled for inode-based LSMs such as SELinux 
and Smack. The underlying idea of these LSM hooks is that they should be 
used for every new Linux interfaces doing similar things, so that LSMs 
don't have to be updated specifically for new UAPI change. So yes, you 
can trust Landlock policies to always restrict a given action. If, for 
whatever reason, it happens that a new Linux interface is added without 
the appropriate LSM hook or if Landlock doesn't support it somehow, then 
we can define a new Landlock access right defining this new action. 
There is a bunch of tests covering the several actions (handled or not) 
and they must pass for every kernel releases: 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/tools/testing/selftests/landlock

Regards,
  Mickaël

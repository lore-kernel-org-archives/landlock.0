Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831887A
	for <landlock@lists.linux.dev>; Wed, 23 Feb 2022 07:38:16 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4K3SZ76yz0zMprnT;
	Wed, 23 Feb 2022 08:38:07 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4K3SZ74Fv5zlhMBt;
	Wed, 23 Feb 2022 08:38:07 +0100 (CET)
Message-ID: <4951c6da-eaa4-b729-59e3-a2c539ddc1fb@digikod.net>
Date: Wed, 23 Feb 2022 08:48:26 +0100
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
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: Landlock and O_PATH
In-Reply-To: <87pmne4mmm.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 22/02/2022 22:28, S.M Mukarram Nainar wrote:
>> Landlock is designed to be backward and forward compatible just to avoid
>> this kind of issue. An application being restricted with a set of access
>> right will not automatically get new ones with a newer kernel: action
>> handling is explicit (see ruleset's handled_access_fs). I'm extending
>> the documentation with this specific subject:
>> https://lore.kernel.org/r/20220221212522.320243-10-mic@digikod.net
> 
> Yeah, I understand that. Thanks for clarifying the documentation. But I
> guess my question is then: Can it be assumed that the behavior of any
> given flag will never change? I think that earlier I was assuming that
> O_PATH would go under FS_READ_DIR in the future, but I guess that is not
> the case?

Correct, a given Landlock flag/command/attribute will not change 
behavior over time, as (in theory) all Linux interfaces. If a flag is 
not enough, extensible structs used by the Landlock syscalls can be 
used: 
https://lpc.events/event/7/contributions/657/attachments/639/1159/extensible_syscalls.pdf

For instance, I'm adding a LANDLOCK_ACCESS_FS_REFER to get rid of the 
rename and link limitations. The current behavior (i.e. a ruleset not 
handling this new access right) doesn't change. Taking the O_PATH 
example, I think a new access right like LANDLOCK_ACCESS_FS_WALK could 
be created to cover O_PATH, chdir and other ways to do path traversals.

Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99097636E
	for <landlock@lists.linux.dev>; Tue, 22 Feb 2022 10:57:52 +0000 (UTC)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4K2vT43q1KzMqLH8;
	Tue, 22 Feb 2022 10:46:48 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4K2vT414JnzljsV0;
	Tue, 22 Feb 2022 10:46:47 +0100 (CET)
Message-ID: <115f32a0-fb96-3598-a52a-48c1f1346d76@digikod.net>
Date: Tue, 22 Feb 2022 10:57:04 +0100
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
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: Landlock and O_PATH
In-Reply-To: <87sfsb4ya5.fsf@bentou.i-did-not-set--mail-host-address--so-tickle-me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 22/02/2022 00:04, S.M Mukarram Nainar wrote:
>> That is correct, the current Landlock implementation relies on the LSM
>> path hooks, and some filesystem actions are not handled. See the warning
>> section in
>> https://docs.kernel.org/userspace-api/landlock.html#filesystem-flags
>> Opening a file or a directory with O_PATH cannot currently be denied
>> with Landlock and it is the same with AppArmor and Tomoyo. It may sound
>> scary but a file descriptor opened with O_PATH can only be used to refer
>> to a path (with *at syscalls), it does not give access to the underlying
>> file or directory content.
>>
>> You're right that it may be used as an oracle to find file or
>> directories, and this can also be done with syscalls such as chdir,
>> access or stat. The current goal of Landlock is to protect access to
>> data, which are in files, but it would be nice to also protect metadata
>> such as path existence.
> 
> Right, I see. That makes sense.
> 
>> I plan to fill this gap with new versions of Landlock, but I'll have to
>> patch the existing LSM framework.
> 
> Looking forward to this! I think it may be useful (considering Hyrum's
> law) to document what is planned to be blocked in the future so that
> application developers can use landlock safely now without worrying
> about incompatibilities. It would kind of suck if applications would
> break on newer kernels. That's my two cents anyway, I know you must
> already be very busy.

Landlock is designed to be backward and forward compatible just to avoid 
this kind of issue. An application being restricted with a set of access 
right will not automatically get new ones with a newer kernel: action 
handling is explicit (see ruleset's handled_access_fs). I'm extending 
the documentation with this specific subject: 
https://lore.kernel.org/r/20220221212522.320243-10-mic@digikod.net

> 
> Thanks,
> Mukarram

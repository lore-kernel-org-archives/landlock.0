Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch [45.157.188.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EA87C
	for <landlock@lists.linux.dev>; Mon, 14 Feb 2022 11:22:09 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Jy1yf3jtyzMpt3h;
	Mon, 14 Feb 2022 12:22:02 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Jy1yf0GMbzljTgK;
	Mon, 14 Feb 2022 12:22:01 +0100 (CET)
Message-ID: <7f9ce8aa-8dae-9f83-6182-16589f441ea1@digikod.net>
Date: Mon, 14 Feb 2022 12:23:16 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: gameoftrees@openbsd.org, Omar Polo <op@openbsd.org>,
 Thomas Adam <thomas@xteddy.org>, landlock@lists.linux.dev,
 "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
References: <1dd9e03e-0f04-4722-0874-fb3b1757b7bb@digikod.net>
 <YgY8zTm7sqrDL6xK@benson.stsp.name>
 <317fef23-b5b1-3a6d-d851-60669daa03fe@digikod.net>
 <YgbDB5AqY4rwWcro@benson.stsp.name>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: GoT Landlock fixes
In-Reply-To: <YgbDB5AqY4rwWcro@benson.stsp.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/02/2022 21:11, Stefan Sperling wrote:
> On Fri, Feb 11, 2022 at 06:15:43PM +0100, Mickaël Salaün wrote:
>> The documentation about handled_access_fs says: "Bitmask of actions (cf.
>> Filesystem flags) that is handled by this ruleset and should then be
>> forbidden if no rule explicitly allow them. This is needed for backward
>> compatibility reasons."
>>
>> I guess it is too succinct. What do you think about that:

(applied to https://docs.kernel.org/userspace-api/landlock.html)

>>
>> "[...] if no rule explicitly allow them: it is a deny-by-default list that
>> should contain as much Landlock access rights as possible. Indeed, all
>> Landlock filesystem access rights that are not part of handled_access_fs are
>> allowed. This is needed for [...]"
>>
>> And before that, in the example, after "The ruleset then needs to handle
>> both of these kind of actions", I can add "This is required for backward and
>> forward compatibility (i.e. the kernel and user space may not know each
>> other's supported restrictions), hence the need to be explicit about the
>> denied-by-default access rights."
>   
> Yes, this would make the docs a lot clearer.
> 
> I suppose developers using landlock are supposed to keep their applications
> up-to-date and expand their bitmask definition whenever new flags are
> added to the landlock API?
> 
> If so, it might be worth pointing this out in the documentation, to ensure
> readers understand that writing this list in their code is not a one-time
> action, and their attention will be required when new flags are added.
> Something like:
> "Future versions of landlock may define additional filesystem flags,
> which applications must add to handled_access_fs if a deny-by-default
> policy is desired."

Right, I'll improve the documentation in this area.

> 
> Which makes me wonder if applications which prefer to always fail closed
> could simply set all the bits. Would this break anything?
> 
> struct landlock_ruleset_attr ruleset_attr = {
>      .handled_access_fs = 0xffffffffffffffff;
> };
> 
> Otherwise, how about providing a macro which programs like Got could
> use to initialize this mask to all currently known filesystem flags?
> 
> #define LANDLOCK_ACCESS_FS_POLICY_DENY_ALL \
> 	(LANDLOCK_ACCESS_FS_EXECUTE | \
> 	LANDLOCK_ACCESS_FS_WRITE_FILE | \
> 	... etc.)
> 	
> 
> struct landlock_ruleset_attr ruleset_attr = {
>      .handled_access_fs = LANDLOCK_ACCESS_FS_POLICY_DENY_ALL;
> };
> 
> With this, only one copy of a default-deny mask would need to be maintained.
> Applications could stay in sync and keep failing closed by recompiling them
> against new landlock header files. Would this work?

The issue with these approaches is that we don't know the future and new 
Landlock accesses could break an application. I don't want this to be 
silent: the same (application) code should produce the same restrictions 
(which would not be the true if an included variable change over time). 
I agree that there is a use case to block all filesystem-related actions 
(even if the frontier with other subsystems might be blurry, e.g. UNIX 
socket), but I think it would be too bug-prone for applications to rely 
on that. As a kernel developer, I cannot assure that applications using 
this API would not suddenly break if built with a new set of 
(kernel-provided) headers. In this case, a conservative approach seems 
better for users but also for (the sanity of) most developers. ;)

One of the goal of the landlock@lists.linux.dev [1] mailing list is for 
developers to keep an eye on Landlock evolution.

[1] https://subspace.kernel.org/lists.linux.dev.html

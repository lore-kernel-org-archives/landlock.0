Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7D37A
	for <landlock@lists.linux.dev>; Fri, 11 Feb 2022 17:14:49 +0000 (UTC)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4JwKx32VXRzMqlrN;
	Fri, 11 Feb 2022 18:14:47 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4JwKx24kpNzlhSMC;
	Fri, 11 Feb 2022 18:14:46 +0100 (CET)
Message-ID: <317fef23-b5b1-3a6d-d851-60669daa03fe@digikod.net>
Date: Fri, 11 Feb 2022 18:15:43 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: gameoftrees@openbsd.org, Omar Polo <op@openbsd.org>,
 Thomas Adam <thomas@xteddy.org>
References: <1dd9e03e-0f04-4722-0874-fb3b1757b7bb@digikod.net>
 <YgY8zTm7sqrDL6xK@benson.stsp.name>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Cc: landlock@lists.linux.dev,
 "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Subject: Re: GoT Landlock fixes
In-Reply-To: <YgY8zTm7sqrDL6xK@benson.stsp.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/02/2022 11:39, Stefan Sperling wrote:
> On Thu, Feb 10, 2022 at 06:34:54PM +0100, Mickaël Salaün wrote:
>> Hi,
>>
>> I noticed Omar Polo added support for Landlock to the Linux version of Game
>> Of Trees [1]. This is great! However, the handled filesystem access is only
>> LANDLOCK_ACCESS_FS_READ_FILE, and it will still be allowed to do multiple
>> filesystem-related actions (e.g. write to files, remove files…). I don't
>> know much about Game Of Trees but, according to the commit message, I think
>> you would like to revoke any (currently supported) filesystem access. You
>> should then add the 12 remaining access rights [2]. There is also a typo in
>> the errno check, it should be EOPNOTSUPP (not ENOTSUP). You'll find a small
>> patch attached. Let me know if I can help.
> 
> Thank you for looking at this Mickaël, it helps us a great deal!

You're welcome. Omar did the hardest part, thanks to him!

>   
>> In a nutshell, the ruleset's handled_access_fs is required for backward and
>> forward compatibility (i.e. the kernel and user space may not know each
>> other's supported restrictions), hence the need to be explicit about the
>> denied-by-default access rights.
> 
> I suspect Omar trimmed down the list of fs flags was in response to
> a question I asked during code review. The code initially followed
> the example given in your docs, but we ended up diverging from it.
> 
> If the point you made above was explained in your docs it would be
> much easier to understand why there is a long list of access rules
> in struct rndlock_ruleset_attr, many of which may not seem relevant
> to the application's purposes. Character or block devices will rarely
> be needed by applications, for example. The name "handled_access_fs"
> does not immediately bring to mind that this could be a default deny list.

The documentation about handled_access_fs says: "Bitmask of actions (cf. 
Filesystem flags) that is handled by this ruleset and should then be 
forbidden if no rule explicitly allow them. This is needed for backward 
compatibility reasons."

I guess it is too succinct. What do you think about that:

"[...] if no rule explicitly allow them: it is a deny-by-default list 
that should contain as much Landlock access rights as possible. Indeed, 
all Landlock filesystem access rights that are not part of 
handled_access_fs are allowed. This is needed for [...]"

And before that, in the example, after "The ruleset then needs to handle 
both of these kind of actions", I can add "This is required for backward 
and forward compatibility (i.e. the kernel and user space may not know 
each other's supported restrictions), hence the need to be explicit 
about the denied-by-default access rights."

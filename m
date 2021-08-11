Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch [185.125.25.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F27870
	for <landlock@lists.linux.dev>; Wed, 11 Aug 2021 16:17:00 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4GlCjy5pWVzMqHRF;
	Wed, 11 Aug 2021 17:03:02 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4GlCjx2zdHzlh8Tk;
	Wed, 11 Aug 2021 17:03:01 +0200 (CEST)
Subject: Re: [musl] [PATCH v1] bits/syscall.h: add landlock_* from linux v5.13
To: musl@lists.openwall.com, Rich Felker <dalias@aerifal.cx>,
 landlock@lists.linux.dev, Szabolcs Nagy <nsz@port70.net>
References: <20210810155406.2772584-1-mic@digikod.net>
 <20210811145654.GD37904@port70.net>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <31389618-9260-382b-841c-e6cd11505f21@digikod.net>
Date: Wed, 11 Aug 2021 17:05:51 +0200
User-Agent:
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210811145654.GD37904@port70.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit


On 11/08/2021 16:56, Szabolcs Nagy wrote:
> * Mickaël Salaün <mic@digikod.net> [2021-08-10 17:54:06 +0200]:
>> From: Mickaël Salaün <mic@linux.microsoft.com>
>>
>> Add three system calls for all architectures:
>> * landlock_create_ruleset
>> * landlock_add_rule
>> * landlock_restrict_self
>>
>> They enable creating unprivileged security sandboxes, see
>>
>>   linux commit a49f4f81cb48925e8d7cbd9e59068f516e984144
>>   arch: Wire up Landlock syscalls
>>
>> https://www.kernel.org/doc/html/latest/userspace-api/landlock.html
>>
>> Signed-off-by: Mickaël Salaün <mic@linux.microsoft.com>
>> Link: https://lore.kernel.org/r/20210810155406.2772584-1-mic@digikod.net
> 
> thanks,
> 
> note i have outstanding patches to update musl to linux 5.13
> 
> https://www.openwall.com/lists/musl/2021/07/10/12
> 

OK, cool!

BTW, what is the policy to add syscall APIs (e.g. the
landlock_create_ruleset function)?

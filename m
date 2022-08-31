Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740B14A2B
	for <landlock@lists.linux.dev>; Wed, 31 Aug 2022 17:29:06 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4MHr9y024VzMprmY;
	Wed, 31 Aug 2022 19:04:06 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4MHr9x37C6zMpnPl;
	Wed, 31 Aug 2022 19:04:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1661965445;
	bh=Wj24NrbD1hJZR0Ys57o8agQHln/5/C31kPGTLhL1IU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g+mRwIF/RGdna3Sc5T8ZAyfr6vLDS+AWWwRP0yYhsvm255XW3CVtoSRMldN83qXn6
	 WbF5X8+UmWj0S1qkniO8VlQLUhOS9CrBDusL+wXUDajCt0MGZlPCTd6JWEwIA2w8TC
	 4kRw2a0G4r7DT0sbzUmg06YOqT1UTvxczYWf73lY=
Message-ID: <f080f12f-4a51-d47c-83bd-a72d755f999f@digikod.net>
Date: Wed, 31 Aug 2022 19:04:04 +0200
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Subject: Re: current landlock limitations and what it means for sandboxer
Content-Language: en-US
To: Jay Freyensee <why2jjj.linux@gmail.com>, Jeff Xu <jeffxu@chromium.org>,
 landlock@lists.linux.dev
Cc: Jorge Lucangeli Obes <jorgelo@chromium.org>
References: <CABi2SkXXshnGiV7Tm3C-kvRn5+z26LPFdrmjT=GT39QmHSbHEw@mail.gmail.com>
 <2801fc80-f946-4124-7b16-cb1095ab6b5f@digikod.net>
 <97130959-6f3e-b155-9acc-943025374cdf@gmail.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <97130959-6f3e-b155-9acc-943025374cdf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 31/08/2022 17:48, Jay Freyensee wrote:
> 
> On 8/31/22 6:31 AM, Mickaël Salaün wrote:
>>
>> On 31/08/2022 02:22, Jeff Xu wrote:
>>> Hello, Mickaël
>>
>> Hello Jeff,
>>
>> Thanks for these interesting questions.
>>
>>>
>>> I would like to dig into the limitation of landlock, to understand
>>> more about the design approach of using landlock for sandboxing user
>>> space applications.
> 
> 
> This has spurred a long standing curiosity with meon landlock.  Can
> landlock quarrantine a bad-acting binary discovered during machine
> operation?  The way I've understood landlock is it can be used to
> restrict a set of unprivileged processes to sandboxes known on say,
> machine boot up.   But what if during normal operation an anti-malware
> program flags a suspect binary running on a system, but it isn't 100%
> sure that binary is malicious?  Could landlock "lock away" and sandbox
> the suspect-binary for analysis by an admin to determine that suspect
> binary is in fact malicious and should be deleted from the system?  And
> if the suspect binary is determined to be harmless can it be
> unsandboxed/put-back?

For now, a process can only sandbox itself, the same way seccomp works. 
Such process is then stuck in the sandbox for its whole lifetime.

I think, being able to dynamically move a process in or out of a 
(dedicated) sandbox could be implemented leveraging cgroups, but there 
is some challenge to make it efficient.

fanotify(7) might be interesting for this anti-malware case though.

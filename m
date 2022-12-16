Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94938813
	for <landlock@lists.linux.dev>; Fri, 16 Dec 2022 11:33:09 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4NYPMg2TtrzMqcgK;
	Fri, 16 Dec 2022 10:44:47 +0100 (CET)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4NYPMf5HVmz2wt;
	Fri, 16 Dec 2022 10:44:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1671183887;
	bh=7/JMDDpRTvEt5yEhS2MjCKlHwKOD1dyObmZEo7OIrb0=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=Jk9fIy1agxiwCI8kI9iyb851f6KYBtj63CSBik83IwjL7g0kWx982jTx6SYZc3PJF
	 pg2+58ZacvjvY6E+sglVQGya4kiYyG5OWSlhi6BFbEe5BKhj3/IT1HQv7F1TCgJgdM
	 yXgpHfzrU36bG4Lz+0HDjJU5mIOUyBRKA7+xJ0Dk=
Message-ID: <fd1007af-0ddf-1fe9-0c5d-e52eec412426@digikod.net>
Date: Fri, 16 Dec 2022 10:44:45 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Subject: Re: Landlock setup
Content-Language: en-US
To: Yves Rutschle <landlock@rutschle.net>
References: <20221107172216.GA10688@rutschle.net>
 <78f7af34-cbd7-eb25-60fb-64385d118d90@digikod.net>
 <20221108112722.GB10688@rutschle.net>
 <f0b57f51-e7c8-41f6-28eb-5dcb11686cc2@digikod.net>
 <20221108171518.GC10688@rutschle.net>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Cc: landlock@lists.linux.dev
In-Reply-To: <20221108171518.GC10688@rutschle.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hi Yves,

How did your investigation to use Landlock go?


On 08/11/2022 18:15, Yves Rutschle wrote:
> On Tue, Nov 08, 2022 at 03:13:39PM +0100, Mickaël Salaün wrote:
>> If you see "landlock: Up and running." in the running kernel log, I don't
>> see any reason why the kernel would return ENOSYS for the Landlock syscalls.
>>
>> The default kernel for Debian 11 is Linux 5.10, which doesn't support
>> Landlock. I tested with linux-image-5.18.0-0.deb11.4-amd64 and
>> linux-image-6.0.0-0.deb11.2-amd64-unsigned and it works fine.
>>
>> On which architecture are you?
> 
> Ah, the mystery thickens, as I have a more recent version:
> 
> Package: linux-image-5.18.0-3-amd64
> Version: 5.18.14-1
> 
> # uname -a
> Linux hallertau 5.18.0-3-amd64 #1 SMP PREEMPT_DYNAMIC Debian 5.18.14-1 (2022-07-23) x86_64 GNU/Linux
> 
> My bad about the version, I guess I upgraded only the kernel
> from Sid at some point.
> 
> Y.
> 
> 

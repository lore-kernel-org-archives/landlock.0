Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0631880E
	for <landlock@lists.linux.dev>; Fri, 16 Dec 2022 10:53:10 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4NYQTb4f4nzMq1Mm;
	Fri, 16 Dec 2022 11:34:59 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4NYQTb1WVNzMptnV;
	Fri, 16 Dec 2022 11:34:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1671186899;
	bh=kjhQxH0e4DKBmJk/pejOK/rz8PUcysU0a9vCmGdou/Q=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=VtDH4uEo6fgcn4PHWEW04ERihZRkx6wG7oebt08mASbEhBYmq04oS1hEfpdeD0hbO
	 QTNMdpX+3FIvtr7kDMm7PRWerFH8wgZ6r8Qid3K81UWrSUZ2UjjcIskLsulRcwe0mN
	 PUd5Ne3851vI9t468gXWAB0Lk8XPdZDQn+rURaIs=
Message-ID: <05321f12-4559-9c79-a35c-8b3b663545b3@digikod.net>
Date: Fri, 16 Dec 2022 11:34:58 +0100
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
 <fd1007af-0ddf-1fe9-0c5d-e52eec412426@digikod.net>
 <20221216095324.GO15113@rutschle.net>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Cc: landlock@lists.linux.dev
In-Reply-To: <20221216095324.GO15113@rutschle.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha


On 16/12/2022 10:53, Yves Rutschle wrote:
> Hi Mickaël,
> 
> On Fri, Dec 16, 2022 at 10:44:45AM +0100, Mickaël Salaün wrote:
>> Hi Yves,
>>
>> How did your investigation to use Landlock go?
> 
> I havent had time to dig much into it. Something I thought
> might be a problem is that I retrieved landlock.h from your
> git, and I wondered it might be different to what is
> required to work with my stock kernel.

You can get any Linux's mainline landlock.h [1] and update them from 
time to time, their API will be backward compatible. You can either use 
a standalone copy of this file or rely on libc's headers with a build 
configuration like AC_CHECK_HEADERS([linux/landlock.h]). See [2] for a 
full standalone example.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/landlock.h
[2] 
https://github.com/OISF/suricata/pull/7853/commits/485d5a4ea46dd90e228b3e4856b95a67a51d348c

Relying on a standalone copy has the advantage of to require a simpler 
code with less static check to make sure a specific feature/type is 
defined in the header file. Indeed, over time, Landlock and this related 
header file will get new fields (e.g. LANDLOCK_ACCESS_FS_REFER, 
LANDLOCK_ACCESS_FS_TRUNCATE) and type definitions.


> 
> I'm hoping to find some time to look at this over the
> holidays...

Feel free to post updates and Cc @l0kod in the related GitHub PR.

Enjoy your holidays!
  Mickaël

> 
> 
> Cheers,
> Y.
> 

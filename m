Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D54C2C81
	for <landlock@lists.linux.dev>; Fri, 12 Nov 2021 14:17:10 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4HrKTJ0LGKzMq4rm;
	Fri, 12 Nov 2021 14:40:04 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4HrKTH592Zzlh8V6;
	Fri, 12 Nov 2021 14:40:03 +0100 (CET)
Subject: Re: Bug#999551: Support Landlock by default in Debian kernels
To: Yves-Alexis Perez <corsac@debian.org>, 999551@bugs.debian.org
Cc: landlock@lists.linux.dev
References: <5fe178a1-19d5-90b5-c111-57b095848f57@digikod.net>
 <ede7244df6992f6b3a2d3647b8511a50551c3ce5.camel@debian.org>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <2f4a8c42-26b5-3e06-7507-56e7a55a35ca@digikod.net>
Date: Fri, 12 Nov 2021 14:40:03 +0100
User-Agent:
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ede7244df6992f6b3a2d3647b8511a50551c3ce5.camel@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit


On 12/11/2021 13:34, Yves-Alexis Perez wrote:
> Hey Mickaël, kernel team,
> 
> On Fri, 2021-11-12 at 12:23 +0100, Mickaël Salaün wrote:
>> -
>> CONFIG_LSM="lockdown,yama,loadpin,safesetid,integrity,apparmor,selinux,smack
>> ,to
>> moyo"
>> +CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,apparmor,sel
>> in
>> ux,smack,tomoyo"
> 
> At first sight the change looks reasonable, but just to check: right now there
> is there is no userland stuff using Landlock LSM packaged in Debian? So
> nothing is currently broken by not having the above, it's just more practical
> when testing or using the feature?
> 
> (not saying we shouldn't enable it, it's just so we know what exactly we gain
> or not).

Applications using Landlock should not break if the feature is not
supported by the running kernel (best-effort security). Whether some
Debian packaged applications are using Landlock or not doesn't seem
important since users can download and run their own applications, right?

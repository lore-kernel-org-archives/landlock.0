Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FAE2C9C
	for <landlock@lists.linux.dev>; Wed, 22 Dec 2021 14:26:41 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4JJsRV6YzvzMpwDW;
	Wed, 22 Dec 2021 13:03:34 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4JJsRV127BzlhRrp;
	Wed, 22 Dec 2021 13:03:33 +0100 (CET)
Message-ID: <5ea7940a-ea59-d930-1e5b-8d839209fb5a@digikod.net>
Date: Wed, 22 Dec 2021 13:06:03 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: Andrea Righi <andrea.righi@canonical.com>
Cc: kernel-team@lists.ubuntu.com, Tyler Hicks <code@tyhicks.com>,
 landlock@lists.linux.dev
References: <20211203185226.1957311-1-mic@digikod.net>
 <YboEZixLVr2BnUX5@arighi-desktop>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: APPLIED[J]: [PATCH v1 0/1] Enable Landlock by default
In-Reply-To: <YboEZixLVr2BnUX5@arighi-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 15/12/2021 16:06, Andrea Righi wrote:
> On Fri, Dec 03, 2021 at 07:52:25PM +0100, Mickaël Salaün wrote:
>> Hi,
>>
>> The Landlock security feature is built in Ubuntu kernel since 5.13 which
>> is great!  However, it is not enough to enable the
>> CONFIG_SECURITY_LANDLOCK option as described in the related help.  The
>> CONFIG_LSM option needs to be prepended by "landlock," to make Landlock
>> system calls available without modifying the kernel boot arguments.
>>
>> Could you please apply the attached patch to make this feature more
>> broadly available?
>>
>> This can be validated with the tests provided by the kernel sources:
>>
>> fakeroot make -C tools/testing/selftests TARGETS=landlock gen_tar
>> tar -xf
>> tools/testing/selftests/kselftest_install/kselftest-packages/kselftest.tar.gz
>> # as root:
>> ./run_kselftest.sh
>>
>> If Yama is enabled, half of the ptrace tests may failed, which is OK.
>>
>> Regards,
>>
>> Mickaël Salaün (1):
>>    UBUNTU: [Config] Enable Landlock by default
> 
> It makes sense to enable this security feature by default to me, it's
> also what upstream is doing.
> 
> Applied to jammy:linux (with an additional change to update CONFIG_LSM
> in debian.master/config/annotations).
> 
> Thanks,
> -Andrea
> 

Thanks Andrea!

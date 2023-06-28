Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44568A23
	for <landlock@lists.linux.dev>; Wed, 28 Jun 2023 20:36:51 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QrphX51CjzMqLxV;
	Wed, 28 Jun 2023 17:38:20 +0000 (UTC)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4QrphX0cW1zMpr3v;
	Wed, 28 Jun 2023 19:38:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1687973900;
	bh=Csn9+wngfyBRvpOzrbdTEYplB8eBFoWBVwMtMojTeIg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Z5a2U860ERSvEdzzNzvAv2LAlcssE2rcbTqHaLcH5k1yfQ6H9VSzVo2gv6UyZXxD7
	 2oFLNga0IezoYIsFK+IGAMiRXzwzawiiEJnp6Fprm80CbxFCPbunuloc7Ln24jHhjD
	 CF5bhkTG4pp7ECFOdLOI8ncgQ0BxUXcwGr1DCJng=
Message-ID: <af7ba3f8-bc6b-e3f0-2a83-f1c68a0d44ea@digikod.net>
Date: Wed, 28 Jun 2023 19:38:19 +0200
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Subject: Re: self protect process with landlock to getting killed
Content-Language: en-US
To: Jay Freyensee <why2jjj.linux@gmail.com>, landlock@lists.linux.dev
References: <480a4459-dcfe-e5ce-bce8-6fc59cb89b9e@gmail.com>
 <f2a1ac61-fc93-50d2-cccd-9485ada0b047@digikod.net>
 <efc094bd-97b3-62fb-09d0-1082b51bfc20@gmail.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <efc094bd-97b3-62fb-09d0-1082b51bfc20@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha


On 28/06/2023 17:20, Jay Freyensee wrote:
> 
> 
>>
>>>
>>> What about is there a way to protect the directory the landlock process
>>> sits in from being tampered/written-to by a non-landlock process?
>>
>> The same principle applies: this is not possible with Landlock itself.
>> The potential malicious processes should be sandboxed.
>>
>>
> Thanks for the response Mickael.  In this case, this would kind of be
> like a zero-day use case, that we wouldn't know all the malicious
> processes tampering with that process's directory up-front, we just know
> that we wouldn't want any non-landlocked process (known and unknown)
> tampering with the directory the landlocked process sits in.

If you cannot sandbox the "other" processes, then I guess all/most 
processes are potentially malicious. In this case you're indeed looking 
to reverse the protection: restrict all/most processes from tampering 
with well-defined resources. You then need to rely on a system-wide 
access control that can be put in place with different UID/GID, or other 
LSMs: SELinux, AppArmor, Smack or Tomoyo.

Regards,
  Mickaël

> 
> Thanks,
> 
> Jay
> 
> 

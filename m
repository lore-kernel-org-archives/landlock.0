Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A2A2C85
	for <landlock@lists.linux.dev>; Wed,  3 Nov 2021 15:02:10 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4HklnQ58mDzMpnfZ;
	Wed,  3 Nov 2021 13:04:42 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4HklnP5N8zzlh8TC;
	Wed,  3 Nov 2021 13:04:41 +0100 (CET)
Subject: Re: [PATCH v4 0/4] Add Landlock man pages
To: Alejandro Colomar <alx.manpages@gmail.com>,
 "G . Branden Robinson" <g.branden.robinson@gmail.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Kees Cook <keescook@chromium.org>, landlock@lists.linux.dev,
 linux-man@vger.kernel.org, linux-security-module@vger.kernel.org,
 =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@linux.microsoft.com>
References: <20210818155931.484070-1-mic@digikod.net>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <5020f3da-1022-d8ee-3e8f-a62920db1c87@digikod.net>
Date: Wed, 3 Nov 2021 13:07:29 +0100
User-Agent:
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210818155931.484070-1-mic@digikod.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Alejandro, is there something more to do or is it OK for you?

On 18/08/2021 17:59, Mickaël Salaün wrote:
> From: Mickaël Salaün <mic@linux.microsoft.com>
> 
> Hi,
> 
> These four documents give a global overview of Landlock and explain each
> system calls.  This is mainly a formatting of the current kernel
> documentation with some new additional details.
> 
> This fourth patch series fixes spelling issues pointed out by Alejandro
> Colomar and Branden Robinson.  I also removed some recipients.
> 
> This patch series can be found in a Git repository:
> https://github.com/landlock-lsm/man-pages/commits/landlock-v4
> 
> Previous version:
> https://lore.kernel.org/landlock/20210730144116.332091-1-mic@digikod.net/
> 
> Regards,
> 
> Mickaël Salaün (4):
>   landlock.7: Add a new page to introduce Landlock
>   landlock_create_ruleset.2: Document new syscall
>   landlock_add_rule.2: Document new syscall
>   landlock_restrict_self.2: Document new syscall
> 
>  man2/landlock_add_rule.2       | 144 +++++++++++++
>  man2/landlock_create_ruleset.2 | 139 +++++++++++++
>  man2/landlock_restrict_self.2  | 133 ++++++++++++
>  man7/landlock.7                | 361 +++++++++++++++++++++++++++++++++
>  4 files changed, 777 insertions(+)
>  create mode 100644 man2/landlock_add_rule.2
>  create mode 100644 man2/landlock_create_ruleset.2
>  create mode 100644 man2/landlock_restrict_self.2
>  create mode 100644 man7/landlock.7
> 
> 
> base-commit: 7127973e0c8ca36fda1f5d2d0adae04d61fa0d01
> 

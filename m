Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A0B2C81
	for <landlock@lists.linux.dev>; Fri, 12 Nov 2021 13:36:04 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4HrKNf368mzMqHtV;
	Fri, 12 Nov 2021 14:36:02 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4HrKNf0Jd5zlh8Tx;
	Fri, 12 Nov 2021 14:36:02 +0100 (CET)
Subject: Re: Bug#999551: Support Landlock by default in Debian kernels
To: Bastian Blank <waldi@debian.org>, 999551@bugs.debian.org,
 landlock@lists.linux.dev, Yves-Alexis Perez <corsac@debian.org>
References: <5fe178a1-19d5-90b5-c111-57b095848f57@digikod.net>
 <20211112124535.GA26920@shell.thinkmo.de>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <9504c781-9aa9-4fdf-d9ff-4e8ba3a18222@digikod.net>
Date: Fri, 12 Nov 2021 14:36:01 +0100
User-Agent:
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211112124535.GA26920@shell.thinkmo.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit


On 12/11/2021 13:45, Bastian Blank wrote:
> Control: tag -1 wontfix
> 
> On Fri, Nov 12, 2021 at 12:23:13PM +0100, Mickaël Salaün wrote:
>> The Landlock security feature is built in Debian kernel since
>> 5.13.12-1~exp1 which is great!  However, it is not enough to enable the
>> CONFIG_SECURITY_LANDLOCK option as described in the related help.  The
>> CONFIG_LSM option needs to be prepended by "landlock," to make Landlock
>> system calls available without modifying the kernel boot arguments.
> 
> It was left out of this list by team decision, as is e.g. bpf.  So not
> right now.

Could we know the reason? FYI, Landlock is enabled by default at least
in Arch and Fedora (and then Gentoo according to selected configuration).

BPF-LSM is very specific and would require privileged services to manage
it. However, Landlock brings new security features (like seccomp) and
would then benefit potentially all Debian applications. It is designed
from the beginning to be safely usable by all users, including
unprivileged ones.

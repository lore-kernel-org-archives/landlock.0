Received: from s1-smtprelay.thinkmo.de (s1n.thinkmo.de [213.239.209.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54A72C81
	for <landlock@lists.linux.dev>; Fri, 12 Nov 2021 12:54:12 +0000 (UTC)
Received: from shell.thinkmo.de (shell.thinkmo.de [IPv6:2a01:4f8:a1:6e:0:22:0:1])
	by s1-smtprelay.thinkmo.de (Postfix) with ESMTPS id 4HrJGT2lYPzGX;
	Fri, 12 Nov 2021 12:45:37 +0000 (UTC)
Received: by shell.thinkmo.de (Postfix, from userid 1000)
	id 4HrJGR51lcz2w; Fri, 12 Nov 2021 13:45:35 +0100 (CET)
Date: Fri, 12 Nov 2021 13:45:35 +0100
From: Bastian Blank <waldi@debian.org>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	999551@bugs.debian.org
Cc: landlock@lists.linux.dev, Yves-Alexis Perez <corsac@debian.org>
Subject: Re: Bug#999551: Support Landlock by default in Debian kernels
Message-ID: <20211112124535.GA26920@shell.thinkmo.de>
Mail-Followup-To: Bastian Blank <waldi@debian.org>,
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	999551@bugs.debian.org, landlock@lists.linux.dev,
	Yves-Alexis Perez <corsac@debian.org>
References: <5fe178a1-19d5-90b5-c111-57b095848f57@digikod.net>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fe178a1-19d5-90b5-c111-57b095848f57@digikod.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

Control: tag -1 wontfix

On Fri, Nov 12, 2021 at 12:23:13PM +0100, Mickaël Salaün wrote:
> The Landlock security feature is built in Debian kernel since
> 5.13.12-1~exp1 which is great!  However, it is not enough to enable the
> CONFIG_SECURITY_LANDLOCK option as described in the related help.  The
> CONFIG_LSM option needs to be prepended by "landlock," to make Landlock
> system calls available without modifying the kernel boot arguments.

It was left out of this list by team decision, as is e.g. bpf.  So not
right now.

Bastian

-- 
Military secrets are the most fleeting of all.
		-- Spock, "The Enterprise Incident", stardate 5027.4
